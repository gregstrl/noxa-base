# NOXA BASE

Base **ESX custom** pour serveur FiveM (RP français), reconstruite à partir de l'import « Wise / Koy ».

| | |
|---|---|
| **Version** | `test-0.1` |
| **Dernière session** | 2026-06-03 — *Audit sécurité complet (00h)* |
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
- **Aucun backdoor actif** : pas d'`loadstring`, pas de `load()` exécutant du code distant, pas de chaîne `load(PerformHttpRequest(...))`.
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
