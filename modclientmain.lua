if GLOBAL.TheNet:GetIsClient() or GLOBAL.TheNet:GetIsServer() then return end

PrefabFiles = {
    "miotan"
}

Assets = {
    Asset( "ATLAS", "bigportraits/miotan.xml" ),
    Asset( "ATLAS", "bigportraits/miotan_none.xml" ),
    Asset( "ATLAS", "bigportraits/miotan_classic.xml" ),
    Asset( "ATLAS", "images/names_miotan.xml" ),
	-- Asset( "ATLAS", "images/map_icons/miotan.xml" ),
    Asset( "ATLAS", "images/avatars/avatar_miotan.xml" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_miotan.xml" ),
    Asset( "ATLAS", "images/avatars/self_inspect_miotan.xml" ),
    Asset( "ATLAS", "images/saveslot_portraits/miotan.xml" ),
}

AddModCharacter("miotan", "FEMALE")

modimport("main/tuning.lua")
modimport("main/strings.lua")

local SkinHandler = require("skinhandler")
SkinHandler.AddModSkins({
    miotan = {
        is_char = true,
        "miotan_none",
        "miotan_classic"
    }
})
