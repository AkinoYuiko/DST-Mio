version = "1.49.6"
name = locale == "zh" and "梦魇少女 澪" or "Mio"
author = locale == "zh" and "丁香女子学校" or "Civi, kengyou_lei, Tony"
description = locale == "zh" and
"[版本: "..version..[[]

更新内容: 
- 修复 InitCharacterAssets 的问题

< 饥饿/精神/生命: 100 >

* 世界待她不一样.

* 梦魇的朋友.
]]
or
"[Version: "..version..[[]

Changelog: 
- Fixed an issue with InitCharacterAssets.

< Hunger/Sanity/Health: 100 >

* World treats her differently.

* Friends of nightmare.]]

priority = 20
mod_dependencies = {
    {
        workshop = "workshop-2521851770",    -- Glassic API
        ["GlassicAPI"] = false,
        ["[API] Glassic API - DEV"] = true
    },
}

api_version = 10
dst_compatible = true
all_clients_require_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {}

folder_name = folder_name or "workshop-"
if not folder_name:find("workshop-") then
	name = name .. " - DEV"
end
