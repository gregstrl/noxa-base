# Solution pour passer des fonctions via exports dans kay_interact

## Le problème

Les exports FiveM ne peuvent pas transférer directement des fonctions dans les tables.
Quand on fait :
```lua
exports.kay_interact:addInteractionPoint({
    onPress = function() ... end  -- ❌ Devient une table vide
})
```

La fonction est sérialisée et devient inutilisable.

## Solutions possibles

### Solution 1 : Système d'événements (Recommandée)

Au lieu de passer une fonction, passer un nom d'événement :

```lua
-- Dans la ressource cliente (nv_cloth)
RegisterNetEvent('nv_cloth:openShop')
AddEventHandler('nv_cloth:openShop', function(shopData)
    openClothShop(shopData.label, shopData.categories)
end)

exports.kay_interact:addInteractionPoint({
    coords = pos,
    dist = 2.0,
    key = "E",
    message = shop.label,
    onPressEvent = 'nv_cloth:openShop',
    eventData = { label = shop.label, categories = shop.categories }
})
```

### Solution 2 : Callbacks registry (Plus complexe)

Stocker les callbacks dans un registry global avant de les passer :

```lua
-- Dans kay_interact
_G.InteractionCallbacks = _G.InteractionCallbacks or {}

local function addInteractionPoint(opts)
    if opts.callbackId then
        opts.onPress = _G.InteractionCallbacks[opts.callbackId]
    end
    -- ...
end
```

### Solution 3 : Garder le système actuel de nv_cloth (Plus simple)

Le système que j'ai créé dans `nv_cloth/client/cl_main.lua` :
- Gère directement les interactions sans passer par exports
- Pas de problème de sérialisation
- Plus de contrôle sur l'affichage

## Recommandation

**Pour nv_cloth** : Garder le système actuel (cl_main.lua avec DrawMarker)
- ✅ Fonctionne parfaitement
- ✅ Pas de dépendances complexes
- ✅ Facile à personnaliser

**Pour kay_interact** : Implémenter la Solution 1 (système d'événements)
- ✅ Compatible avec toutes les ressources
- ✅ Pas de problème de sérialisation
- ✅ Pattern standard FiveM

## Si tu veux quand même réparer kay_interact

Je peux modifier kay_interact pour supporter les événements au lieu des fonctions.
Dis-moi si tu veux que je fasse ça !

