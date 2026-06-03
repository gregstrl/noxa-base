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
- **Statut** : ❌ À corriger

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
- **Statut** : ❌ À corriger (nécessite action manuelle — téléchargement)

---

### [BUG-03] ox_target échoue (dépend de ox_lib)
- **Erreur** : `attempt to index a nil value (global 'lib')` dans `ox_target/client/main.lua` et `ox_target/server/main.lua`
- **Cause** : ox_lib ne charge pas (BUG-02) → `lib` est nil quand ox_target démarre
- **Fix** : Résoudre BUG-02 en premier — ox_target se corrigera automatiquement
- **Statut** : ❌ Bloqué par BUG-02

---

### [BUG-04] Erreur de syntaxe Lua — weapon.lua
- **Erreur** : `'end' expected (to close 'function' at line 154) near '='` 
- **Fichier** : `resources/[GameMode]/Gamemode/gameManager/modules/client/utils/weapon.lua:155`
- **Cause** : Accolade ou `end` manquant — une fonction n'est pas fermée correctement à la ligne 154
- **Fix** : Ouvrir le fichier, vérifier la fonction à la ligne 154 et ajouter le `end` manquant
- **Statut** : ❌ À corriger

---

### [BUG-05] Erreur de syntaxe Lua — Chat/server/main.lua
- **Erreur** : `<eof> expected near 'end'`
- **Fichier** : `resources/[GameMode]/Chat/server/main.lua:143`
- **Cause** : Un `end` en trop ou une structure if/function mal fermée
- **Fix** : Vérifier et corriger la structure Lua autour de la ligne 143
- **Statut** : ❌ À corriger

---

## 🟠 MAJEURS (fonctionnalités cassées)

### [BUG-06] Ressources dupliquées
- **Warnings** :
  - `ox_target` en double : `[GameMode]/ox_target` ET `[Shyroz]/[Kscript]/ox_target`
  - `httpmanager` en double : `[GameMode]/[vocal]/httpmanager` ET `[Shyroz]/[pmms]/httpmanager`
- **Cause** : Deux copies de la même ressource dans des dossiers différents
- **Fix** : Supprimer les doublons dans `[Shyroz]` (garder ceux dans `[GameMode]`)
- **Statut** : ❌ À corriger

---

### [BUG-07] Faute de frappe dans la config MySQL
- **Erreur** : `Ignoring invalid configuration option passed to Connection: passwork`
- **Cause** : Typo `passwork` au lieu de `password` dans la config oxmysql
- **Fichier** : Chercher `passwork` dans `server.cfg` ou config oxmysql
- **Fix** : Renommer `passwork` → `password`
- **Statut** : ❌ À corriger

---

### [BUG-08] ox_target — exports manquants
- **Erreurs** :
  - `No such export addGlobalVehicle in resource ox_target` (Gamemode/bmx.lua, Gamemode/whellchair.lua, Kays/bennys.lua, Kays/vehicles.lua)
  - `No such export addGlobalPlayer in resource ox_target` (Kays/players.lua)
  - `No such export addModel in resource ox_target` (Kays/props.lua)
- **Cause** : Version ox_target incompatible — ces exports existent dans les anciennes versions (v2.x) mais pas dans la version actuelle
- **Fix** : Vérifier la version ox_target installée et adapter les appels OU downgrader ox_target
- **Statut** : ❌ À corriger (lié à BUG-02 aussi)

---

### [BUG-09] Fichier obfusqué malveillant détecté
- **Erreur** : `Failed to load script @Jetevois/ai_module_fg-obfuscated.js`
- **Fichier** : `resources/.../Jetevois/ai_module_fg-obfuscated.js`
- **Cause** : Code obfusqué non légitime dans la base — potentiellement malveillant
- **Fix** : Localiser et supprimer la ressource `Jetevois` entièrement
  ```bash
  find resources/ -name "ai_module_fg-obfuscated.js"
  ```
- **Statut** : ❌ À supprimer IMMÉDIATEMENT

---

### [BUG-10] object_gizmo — module dataview introuvable
- **Erreur** : `module 'client.dataview' not found` dans `object_gizmo/client/gizmo.lua`
- **Cause** : Dépendance manquante — `dataview` n'est pas dans le chemin de chargement
- **Fix** : Vérifier fxmanifest.lua de object_gizmo et ajouter la dépendance manquante ou mettre à jour la ressource
- **Statut** : ❌ À corriger

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
- **Statut** : ❌ À corriger

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
- **Statut** : ❌ À corriger

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
- **Statut** : ❌ À vérifier

---

### [BUG-19] Fichiers de build JS fantômes dans les ressources
- **Pattern** : Nombreux `Failed to load script @ressource/.../.tsup.config.js`, `.jest.config.js`, `.eslintrc.js`, `.build.js`, etc.
- **Cause** : Artefacts de développement Node.js commités par erreur dans les ressources
- **Impact** : Warnings au démarrage, pas de crash
- **Fix** : Ces fichiers sont ignorés par FiveM — les supprimer lors du nettoyage de code mort
- **Statut** : 🟡 Non critique

---

## ✅ Corrigés

| Bug | Description | Session |
|---|---|---|
| — | — | — |

---

## Instructions pour les agents

À chaque début de session :
1. Lire ce fichier
2. Choisir 2-3 bugs selon la priorité (🔴 en premier)
3. Corriger, tester (grep + lecture du fichier corrigé)
4. Commiter : `fix: [BUG-XX] description courte`
5. Mettre à jour le statut ici : ❌ → ✅ + ajouter au tableau "Corrigés"
