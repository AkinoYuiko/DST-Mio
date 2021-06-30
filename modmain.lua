Assets = {}
PrefabFiles = {
    "miotan",
    "miotan_itemskins",
}

GlassicAPI.InitCharacterAssets("miotan", "FEMALE", Assets)
GlassicAPI.InitMinimapAtlas("miotan_minimap", Assets)

GlassicAPI.RegisterItemAtlas("miotan_inventoryimages", Assets)

-- Custom speech strings and skin
modimport("strings/miotan_init.lua")
modimport("scripts/modules/prefabskin.lua")

modimport("strings/miotan_str"..(table.contains({"zh","chs","cht"}, GLOBAL.LanguageTranslator.defaultlang) and "_chs" or "")..".lua")

-- functions --
modimport("scripts/modules/eatfuel.lua")
modimport("scripts/modules/tradefuel.lua")
modimport("scripts/modules/fuelactions.lua")
modimport("scripts/modules/sanity_reward.lua")
