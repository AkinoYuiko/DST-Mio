local STRINGS = GLOBAL.STRINGS
local strings = {
	CHARACTER_ABOUTME = 
	{
		miotan = "Mio cames from another world, where nightmare is everywhere.",
	},
	CHARACTER_BIOS = 
	{
		miotan =
		{
			{ title = "Birthday", desc = "July 17" },
	    	{ title = "Favorite Food", desc = "None" }
	    }
	},
	CHARACTER_DESCRIPTIONS = 
	{
		miotan = "*World treats her differently.\n*Friend of nightmare.",
	},
	CHARACTER_NAMES = 
	{
		miotan = "Mio",
	},
	CHARACTER_QUOTES = 
	{
		miotan = "\"If I could eat nightmare!\"",
	},
	CHARACTER_TITLES = 
	{
		miotan = "The Nightmare Eater",
	},
	CHARACTERS = 
	{
		MIOTAN = require("speech_miotan")
	},
	NAMES = 
	{
		MIOTAN = "Mio",
	},
	SKIN_DESCRIPTIONS = 
	{
		miotan_classic = "Mio's V1 skin!",
		miotan_none = "Mio cames from another world, where nightmare is everywhere.",
	},
	SKIN_NAMES = 
	{
		lantern_mio = "Camping Lamp",
		miotan_classic = "Classic",
		miotan_none = "Mio",
		yellowamulet_heart = "Glowing Heart"
	},
	CHARACTER_SURVIVABILITY = 
    {
        miotan = STRINGS.CHARACTER_SURVIVABILITY.wortox
    },
}

GlassicAPI.MergeStringsToGLOBAL(require("speech_wortox"), strings.CHARACTERS.MIOTAN, true)
GlassicAPI.MergeStringsToGLOBAL(strings)
GlassicAPI.MergeTranslationFromPO(MODROOT.."languages")

GLOBAL.UpdateMioStrings = function()
    local file, errormsg = GLOBAL.io.open(MODROOT .. "scripts/speech_miotan.lua", "w")
    if not file then print("Can't update " .. MODROOT .. "scripts/speech_miotan.lua", "\n", tostring(errormsg)) return end
    GlassicAPI.MergeSpeechFile(require("speech_miotan"), file, "speech_wortox")
    local file, errormsg = GLOBAL.io.open(MODROOT .. "languages/strings.pot", "w")
    if not file then print("Can't generate " .. MODROOT .. "languages/strings.pot", "\n", tostring(errormsg)) return end
    GlassicAPI.MakePOTFromStrings(file, strings)
end

-- GLOBAL.UpdateMioStrings()
