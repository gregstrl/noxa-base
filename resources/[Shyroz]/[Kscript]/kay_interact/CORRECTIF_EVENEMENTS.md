# ✅ Correctif kay_interact - Support des événements

## Problème résolu

Les exports FiveM ne peuvent pas transférer des fonctions dans les tables.
J'ai ajouté le support des **événements** en plus des fonctions callback.

## Nouvelle fonctionnalité

### Avant (ne fonctionnait pas via exports)
```lua
exports.kay_interact:addInteractionPoint({
    coords = vector3(x, y, z),
    key = "E",
    message = "Ouvrir",
    onPress = function()  -- ❌ Devient une table via exports
        -- Code ici
    end
})
```

### Maintenant (fonctionne parfaitement)
```lua
-- 1. Créer un événement dans ta ressource
RegisterNetEvent('ma_ressource:monAction')
AddEventHandler('ma_ressource:monAction', function(param1, param2)
    -- Ton code ici
    print("Action déclenchée avec", param1, param2)
end)

-- 2. Utiliser l'événement avec kay_interact
exports.kay_interact:addInteractionPoint({
    coords = vector3(x, y, z),
    key = "E",
    message = "Ouvrir",
    onPressEvent = 'ma_ressource:monAction',  -- ✅ Nom de l'événement
    eventArgs = {"arg1", "arg2"}              -- ✅ Arguments optionnels
})
```

## Exemple concret (nv_cloth)

```lua
-- Événement pour ouvrir le shop
RegisterNetEvent('nv_cloth:openShopInteraction')
AddEventHandler('nv_cloth:openShopInteraction', function(label, categories)
    if not opened then
        openClothShop(label, categories)
    end
end)

-- Utilisation avec kay_interact
exports.kay_interact:addInteractionPoint({
    coords = vec3(72.658409, -1398.984253, 29.376123),
    dist = 2.0,
    key = "E",
    message = "BINCO",
    icon = "fa-store",
    onPressEvent = 'nv_cloth:openShopInteraction',
    eventArgs = {"BINCO", {"torso", "tshirt", "pants", "shoes"}}
})
```

## Avantages

✅ **Compatible avec les exports** - Les événements passent sans problème
✅ **Rétrocompatible** - Les anciennes fonctions callback marchent toujours (si pas via exports)
✅ **Plus flexible** - Peut passer plusieurs arguments
✅ **Standard FiveM** - Pattern recommandé pour la communication entre ressources

## Migration

Pour migrer ton code existant :

1. **Crée un événement** pour ton action
2. **Remplace `onPress`** par `onPressEvent` et `eventArgs`
3. **Teste** que tout fonctionne

## Nouveaux paramètres

- `onPressEvent` (string, optionnel) : Nom de l'événement à trigger
- `eventArgs` (table, optionnel) : Arguments à passer à l'événement

**Note** : Si `onPressEvent` est fourni, il a la priorité sur `onPress`.

---

Cette solution permet à kay_interact de fonctionner correctement avec toutes les ressources via exports ! 🎉

