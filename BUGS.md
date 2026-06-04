# NOXA BASE — Rapport de bugs & erreurs connues

> Ce fichier est lu par chaque agent au démarrage de session.
> Corriger les bugs CRITIQUES en priorité, puis MAJEURS, puis MINEURS.
> Mettre à jour ce fichier après chaque correction (statut ✅ quand résolu).

---

## 🔴 CRITIQUES (empêchent le démarrage / la connexion)

### [BUG-01] Base de données `wise` introuvable
- **Erreur** : `Unable to establish a connection to the database (ER_BAD_DB_ERROR)` / `Error 1049: Unknown database 'wise'`
- **Cause** : `server.cfg` contient encore `mysql://...wise` au lieu de `noxa`
- **Fichier** : `server.cfg` → ligne `mysql_connection_string`
- **Fix** : Remplacer `wise` par `noxa` dans la chaîne de connexion MySQL
- **Statut** : ✅ Corrigé — `database=wise` → `database=noxa` (server.cfg:5)

---

### [BUG-02] ox_lib UI non compilée
- **Erreur** : `Unable to load UI. Build ox_lib or download the latest release.`
- **Ressources impactées** : `ox_lib`, `craftui`, `doorlock`, `object_gizmo`, `ox_target`, `kay_anim`
- **Cause** : Le dossier `resources/[GameMode]/ox_lib/web/build/` est vide — le build React n'est pas présent
- **Fix** : Télécharger la release précompilée et remplacer le dossier `web/` :
  ```
  https://github.com/overextended/ox_lib/releases/latest/download/ox_lib.zip
  ```
  Extraire et remplacer `resources/[GameMode]/ox_lib/`
- **Note** : ox_lib v3.27.0 installé, v3.37.0 disponible — mettre à jour
- **Statut** : ✅ Corrigé — release v3.37.0 déployée. **MAJ 2026-06-04** : `/web/build` était gitignoré → absent en fresh clone. Build officiel v3.37.0 re-déployé et **force-add** dans le repo (persistant). `web/build/index.html` présent

---

### [BUG-03] ox_target échoue (dépend de ox_lib)
- **Erreur** : `attempt to index a nil value (global 'lib')` dans `ox_target/client/main.lua` et `ox_target/server/main.lua`
- **Cause** : ox_lib ne charge pas (BUG-02) → `lib` est nil quand ox_target démarre
- **Fix** : Résoudre BUG-02 en premier — ox_target se corrigera automatiquement
- **Statut** : ✅ Résolu automatiquement via BUG-02 (`lib` charge désormais)

---

### [BUG-04] Erreur de syntaxe Lua — weapon.lua
- **Erreur** : `'end' expected (to close 'function' at line 154) near '='` 
- **Fichier** : `resources/[GameMode]/Gamemode/gameManager/modules/client/utils/weapon.lua:155`
- **Cause** : Accolade ou `end` manquant — une fonction n'est pas fermée correctement à la ligne 154
- **Fix** : Ouvrir le fichier, vérifier la fonction à la ligne 154 et ajouter le `end` manquant
- **Statut** : ✅ Corrigé — `return allowed_bags[bagIndex] = false` (assignation invalide) → `== true` (weapon.lua:155). Validé `luac5.4 -p`

---

### [BUG-05] Erreur de syntaxe Lua — Chat/server/main.lua
- **Erreur** : `<eof> expected near 'end'`
- **Fichier** : `resources/[GameMode]/Chat/server/main.lua:143`
- **Cause** : Un `end` en trop ou une structure if/function mal fermée
- **Fix** : Vérifier et corriger la structure Lua autour de la ligne 143
- **Statut** : ✅ Corrigé — bloc résiduel (copier-coller de `sendDiscordWebhook` : `webhookURL=""`, `data` hors scope, `end` orphelin) supprimé (Chat/server/main.lua). Validé `luac5.4 -p`

---

## 🟠 MAJEURS (fonctionnalités cassées)

### [BUG-06] Ressources dupliquées
- **Warnings** :
  - `ox_target` en double : `[GameMode]/ox_target` ET `[Shyroz]/[Kscript]/ox_target`
  - `httpmanager` en double : `[GameMode]/[vocal]/httpmanager` ET `[Shyroz]/[pmms]/httpmanager`
- **Cause** : Deux copies de la même ressource dans des dossiers différents
- **Fix** : Supprimer les doublons dans `[Shyroz]` (garder ceux dans `[GameMode]`)
- **Statut** : ✅ Corrigé — `[Shyroz]/[Kscript]/ox_target` et `[Shyroz]/[pmms]/httpmanager` supprimés. Vérifié : les copies `[GameMode]` conservées contiennent bien tous les exports requis

---

### [BUG-07] Faute de frappe dans la config MySQL
- **Erreur** : `Ignoring invalid configuration option passed to Connection: passwork`
- **Cause** : Typo `passwork` au lieu de `password` dans la config oxmysql
- **Fichier** : Chercher `passwork` dans `server.cfg` ou config oxmysql
- **Fix** : Renommer `passwork` → `password`
- **Statut** : ✅ Corrigé — `passwork=` → `password=` (server.cfg:5)

---

### [BUG-08] ox_target — exports manquants
- **Erreurs** :
  - `No such export addGlobalVehicle in resource ox_target` (Gamemode/bmx.lua, Gamemode/whellchair.lua, Kays/bennys.lua, Kays/vehicles.lua)
  - `No such export addGlobalPlayer in resource ox_target` (Kays/players.lua)
  - `No such export addModel in resource ox_target` (Kays/props.lua)
- **Cause** : ~~Version ox_target incompatible~~ → **Diagnostic corrigé** : les exports `addGlobalVehicle/addGlobalPlayer/addModel` SONT bien définis dans `client/api.lua`. Le vrai problème = ox_lib non chargé (BUG-02) + conflit de doublon (BUG-06) empêchaient l'enregistrement des exports
- **Fix** : ~~Adapter/downgrader~~ → Résolu en corrigeant BUG-02 + BUG-06
- **Statut** : ✅ Résolu via BUG-02 + BUG-06 (exports s'enregistrent une fois `lib` chargé et le doublon retiré)

---

### [BUG-09] 🚨 BACKDOOR RCE GÉNÉRALISÉE (compromission supply-chain)
- **Erreur** : `Failed to load script @Jetevois/ai_module_fg-obfuscated.js`
- **Ampleur réelle (bien plus grave que décrit)** : la ressource `Jetevois` n'existait pas, mais **67 fichiers `.js` malveillants** étaient disséminés dans la base, déguisés en fichiers de config dev (`.tsup.config.js`, `.swc.config.js`, `.babelrc.js`, `.eslintrc.js`, `.jest.config.js`, `.webpack.config.js`, `.eventHandler.js`, `.gitkeep.js`, `.patcher.js`, `.cache.js`, `.mocks.js`, `.dummyData.js`, `webpack_builder.js`, etc.).
- **Mécanisme** : chaque fichier contenait un décodeur XOR (clé 3) + `globalThis["eval"](payload)`. Payload décodé = `require('https').get(...)` vers un **C2 distant** puis `new Function('global', code)(global)` → **exécution de code arbitraire côté serveur**.
- **Domaines C2 identifiés** : `steaxscripts.com` (`/zXeAHJJGG`, fallback `/cfxre`) et `9ns1.com` (`/zXeAHjj`) — 2 variantes.
- **Vecteurs d'injection** : lignes `shared_script/server_script` ajoutées dans les `fxmanifest.lua` (dont **oxmysql** — chargé partout), masquées par d'énormes runs de whitespace après un commentaire `--[[server.lua]]`. Réf. `@Jetevois/ai_module_fg-obfuscated.js` injectée 2× dans `oxmysql/fxmanifest.lua`.
- **Fix appliqué** :
  - Suppression des **67 fichiers** malveillants (détection par signature `globalThis[x(...)](x(v))` / `charCodeAt()^k`)
  - Nettoyage chirurgical de **60 `fxmanifest.lua`** (retrait des tokens injectés sans casser les entrées légitimes)
  - Vérification finale : 0 signature, 0 réf `@Jetevois`, 0 domaine C2 restant ; tous les manifests revalidés `luac5.4 -p`
- **⚠️ MISE À JOUR (session 2026-06-04)** : la backdoor **n'était PAS entièrement éradiquée**. 4 manifests gardaient des **références injectées vivantes** masquées par whitespace (le `--[[server.lua]]` étant un commentaire *fermé*, l'entrée `.js` suivante était active) :
  - `[Core]/Koy` → `'server/utils/.tsup.config.js'` (dans `server_scripts`)
  - `[GameMode]/doorlock` → `'client/lib/.job_runner.js'`
  - `[Shyroz]/[Kscript]/kay_loading` → `'data/.snapshot.js'` (seule entrée du bloc → 100 % malveillant)
  - `[GameMode]/ox_target` → 3 lignes préfixées injectant `@frame/{client,server}/security/_main.lua` + `event.lua` (dossiers `security/` inexistants dans `Framework`)
  Les fichiers pointés étaient déjà absents (pas d'exécution en cours) mais ré-armables. **Retirés** + footprint `--[[server.lua]]` nettoyé dans les **60 manifests**. Vérif : 0 footprint / 0 réf `.js` backdoor / 0 `@frame/security` / 0 payload C2 sur disque ; manifests revalidés.
- **✅ Résidu `fg_BanPlayer` ARBITRÉ** : `Jetevois` = ressource backdoor C2 (jamais restaurer). `afk/main.lua:489,494` appelait `exports['Jetevois']:fg_BanPlayer(...)` (→ `No such export`, anti-cheat AFK cassé) → remplacé par `DropPlayer(source, "Tentative de CHEAT en zone AFK")`, convention déjà utilisée par le handler voisin `Koy:afk:buyCase`. Intention anti-cheat préservée (éjection du tricheur), dépendance malveillante éliminée.
- **Statut** : ✅ Backdoor + résidus éradiqués (67 fichiers + injections manifests + 4 résidus actifs + appel `fg_BanPlayer`)

---

### [BUG-10] object_gizmo — module dataview introuvable
- **Erreur** : `module 'client.dataview' not found` dans `object_gizmo/client/gizmo.lua`
- **Cause** : Dépendance manquante — `dataview` n'est pas dans le chemin de chargement
- **Fix** : Vérifier fxmanifest.lua de object_gizmo et ajouter la dépendance manquante ou mettre à jour la ressource
- **Statut** : ✅ Résolu via BUG-02 — `client/dataview.lua` existe et est bien déclaré dans `files{}` ; `require 'client.dataview'` (require ox_lib) échouait uniquement parce que `lib` n'était pas chargé

---

### [BUG-11] location/web/script.js — identifiant JS dupliqué
- **Erreur** : `Uncaught SyntaxError: Identifier '_0x3f8090' has already been declared`
- **Fichier** : `resources/.../location/web/script.js`
- **Cause** : Code obfusqué avec variable déclarée deux fois — fichier corrompu ou obfusqué
- **Fix** : Mettre à jour la ressource `location` ou corriger le script.js
- **Statut** : ❌ À corriger

---

### [BUG-12] HUD — JSON parse error
- **Erreur** : `SyntaxError: Unexpected end of JSON input` dans `hud/dist/assets/index-2yCH6P6S.js:610`
- **Cause** : Fichier JS du HUD corrompu ou config JSON mal formée envoyée au NUI
- **Fix** : Vérifier que le HUD reçoit des données JSON valides / rebuild le HUD
- **Statut** : ❌ À investiguer

---

### [BUG-13] mort/script.js — null reference
- **Erreur** : `Uncaught TypeError: Cannot set properties of null (setting 'disabled')` à `mort/script.js:354`
- **Cause** : L'élément DOM ciblé n'existe pas au moment de l'exécution
- **Fix** : Ajouter un null-check avant de modifier la propriété `disabled`
- **Statut** : ✅ Corrigé — `reappearBtn.disabled` enveloppé dans `if (reappearBtn) { ... }` (mort/script.js:354). Validé `node --check`

---

## 🟡 MINEURS (warnings, fonctionnalités partielles)

### [BUG-14] Fichiers manquants dans fxmanifest.lua — Gamemode (28 warnings)
- Modules absents référencés : `PrivateAC/`, `shared/creator/`, `shared/clotheshop/`, `gameManager/modules/client/location/`, `deathui/`, `masque/`, `knockout/`, `property/server/`, `Bjobs/`, `configConcess.lua`, `concess_config.lua`
- **Fix** : Pour chaque fichier manquant — soit créer le dossier/fichier vide, soit retirer l'entrée du fxmanifest.lua
- **Statut** : ❌ À nettoyer

---

### [BUG-15] kay_cam — licence manquante
- **Erreur** : `You lack the required entitlement to use kay_cam`
- **Cause** : Ressource payante/privée nécessitant une licence
- **Fix** : Retirer `kay_cam` du server.cfg si pas de licence, ou acquérir la licence
- **Statut** : ❌ À traiter

---

### [BUG-16] Koyui — init/server.lua manquant
- **Warning** : `could not find server_script 'init/server.lua'`
- **Fix** : Créer un fichier `resources/[GameMode]/Koyui/init/server.lua` vide ou retirer du fxmanifest
- **Statut** : ✅ Corrigé — placeholder `Koyui/init/server.lua` créé (fichier absent du repo ; aucune feature perdue)

---

### [BUG-17] pmms — fichier police manquant
- **Warning** : `could not find file 'ui/chineserocks.ttf'`
- **Fix** : Ajouter la police `chineserocks.ttf` dans `resources/.../pmms/ui/`
- **Statut** : ❌ À corriger

---

### [BUG-18] Ressource ui_notification introuvable
- **Erreur** : `Couldn't find resource ui_notification`
- **Cause** : Ressource référencée dans server.cfg ou dans une dépendance mais non présente
- **Fix** : Supprimer la référence `ensure ui_notification` du server.cfg OU ajouter la ressource
- **Statut** : ✅ Corrigé — `ensure ui_notification` retiré de resources.cfg (ressource absente, aucune référence dans le code Lua)

---

### [BUG-19] Fichiers de build JS fantômes dans les ressources
- **Pattern** : Nombreux `Failed to load script @ressource/.../.tsup.config.js`, `.jest.config.js`, `.eslintrc.js`, `.build.js`, etc.
- **Cause** : ⚠️ **Diagnostic corrigé — ce n'étaient PAS des artefacts inoffensifs.** Une grande partie de ces fichiers `.config.js`/dotfiles étaient en réalité les **payloads de la backdoor RCE** (voir BUG-09). Étiquetés « dev artifacts » pour passer inaperçus.
- **Impact** : 🔴 CRITIQUE (et non « warning ») — exécution de code distant côté serveur
- **Fix** : Traités avec BUG-09 (suppression par signature, pas par nom de fichier)
- **Statut** : ✅ Traité avec BUG-09 — fichiers malveillants supprimés. NB : vérifier tout futur dotfile `.js` par signature, jamais le supposer inoffensif

---

## ✅ Corrigés

| Bug | Description | Session |
|---|---|---|
| BUG-01 | DB `wise` → `noxa` (server.cfg) | QA+Sécurité |
| BUG-02 | ox_lib v3.37.0 déployé (`web/build`) | QA+Sécurité |
| BUG-03 | ox_target `lib` nil → résolu via BUG-02 | QA+Sécurité |
| BUG-04 | weapon.lua:155 `=` → `==` | QA+Sécurité |
| BUG-05 | Chat/server/main.lua bloc résiduel supprimé | QA+Sécurité |
| BUG-06 | Doublons ox_target/httpmanager `[Shyroz]` supprimés | QA+Sécurité |
| BUG-07 | `passwork` → `password` (server.cfg) | QA+Sécurité |
| BUG-08 | Exports ox_target → résolu via BUG-02+06 | QA+Sécurité |
| BUG-09 | 🚨 Backdoor RCE (67 fichiers + injections) éradiquée | QA+Sécurité |
| BUG-10 | object_gizmo dataview → résolu via BUG-02 | QA+Sécurité |
| BUG-13 | mort/script.js null-check ajouté | QA+Sécurité |
| BUG-16 | Koyui `init/server.lua` créé | QA+Sécurité |
| BUG-18 | `ensure ui_notification` retiré | QA+Sécurité |
| BUG-19 | Dotfiles `.js` = backdoor → traité avec BUG-09 | QA+Sécurité |
| BUG-09b | Résidus backdoor actifs (4 manifests) + `fg_BanPlayer` éradiqués | Audit 2026-06-04 |
| BUG-20 | Injection SQL `MysteryCase` (`KoyCase:sendInput`) → requêtes paramétrées | Audit 2026-06-04 |
| BUG-21 | Intégrité SQL : 3 tables manquantes ajoutées à `install.sql` | Audit 2026-06-04 |

> **Non traités cette session** (nécessitent assets/licences/runtime ou décision owner) :
> BUG-11 (location/script.js obfusqué), BUG-12 (HUD JSON — runtime), BUG-14 (28 entrées fxmanifest manquantes — nettoyage volumineux), BUG-15 (kay_cam licence), BUG-17 (police `chineserocks.ttf` manquante — asset). Voir README ## QA & Sécurité.

---

## Instructions pour les agents

À chaque début de session :
1. Lire ce fichier
2. Choisir 2-3 bugs selon la priorité (🔴 en premier)
3. Corriger, tester (grep + lecture du fichier corrigé)
4. Commiter : `fix: [BUG-XX] description courte`
5. Mettre à jour le statut ici : ❌ → ✅ + ajouter au tableau "Corrigés"
