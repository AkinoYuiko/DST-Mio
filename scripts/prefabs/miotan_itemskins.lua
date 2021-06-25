local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("lantern_mio", {
    base_prefab = "lantern",
    type = "item",
    rarity = "Reward",
    build_name_override = "lantern_mio",
    assets = {
        Asset( "ANIM", "anim/lantern_mio.zip" ),
        Asset( "ANIM", "anim/swap_lantern_mio.zip" ),
        Asset( "INV_IMAGE", "lantern_mio_lit" ),
        Asset( "INV_IMAGE", "lantern_mio" ),
    },
    init_fn = function(inst) lantern_mio_init_fn(inst, "lantern_mio") end,
    skin_tags = { "LANTERN" },
    -- prefabs = { "lantern_crystal_fx_held", "lantern_crystal_fx_ground", },
    -- fx_prefab = { "lantern_crystal_fx_held", "lantern_crystal_fx_ground", },
    -- release_group = 95,
}))

table.insert(prefabs, CreatePrefabSkin("yellowamulet_heart", {
	base_prefab = "yellowamulet",
	type = "item",
    rarity = "Glassic",
    build_name_override = "yellowamulet_heart",
    assets = {
        Asset( "ANIM", "anim/yellowamulet_heart.zip" ),
        Asset( "INV_IMAGE", "yellowamulet_heart" ),
    },
    init_fn = function(inst) yellowamulet_init_fn(inst, "yellowamulet_heart") end,
	skin_tags = { "YELLOWAMULET"},
}))

return unpack(prefabs)