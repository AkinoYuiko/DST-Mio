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
	"tradefuel",
	"strings",
	"tuning",
}

for _, v in ipairs(main_files) do
    modimport("main/"..v)
end
