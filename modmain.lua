Assets = {}
PrefabFiles = {
    "miotan",
    "miotan_itemskins",
}

GlassicAPI.InitCharacterAssets("miotan", "FEMALE", Assets)
GlassicAPI.InitMinimapAtlas("miotan_minimap", Assets)
GlassicAPI.RegisterItemAtlas("miotan_inventoryimages", Assets)

local main_files = {
	"eatfuel",
	"fuelactions",
	"prefabskin",
	"sanity_reward",
	"tradefuel"
}

for _,v in pairs(main_files) do modimport("main/"..v) end

-- Custom speech strings and skin
modimport("strings/miotan_init.lua")
modimport("strings/miotan_str"..(table.contains({"zh","chs","cht"}, GLOBAL.LanguageTranslator.defaultlang) and "_chs" or "")..".lua")
