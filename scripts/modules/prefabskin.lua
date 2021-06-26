GLOBAL.setfenv(1, GLOBAL)

-- fix lantern reskin in inventory
local old_lantern_clear_fn = lantern_clear_fn
lantern_clear_fn = function(inst, ...)
    local rt_lantern_clear = {old_lantern_clear_fn(inst, ...)}
    if inst.components.inventoryitem then
        inst.components.inventoryitem:ChangeImageName()
    end
    return unpack(rt_lantern_clear)
end

local old_lantern_init_fn = lantern_init_fn
lantern_init_fn = function(inst, ...)
    local rt_lantern_init = {old_lantern_init_fn(inst, ...)}
    if inst.components.inventoryitem then
        inst.components.inventoryitem:ChangeImageName(inst:GetSkinName())
    end
    return unpack(rt_lantern_init)
end

-- yellowamulet 
if not rawget(_G, "yellowamulet_clear_fn") then
    yellowamulet_init_fn = function(inst, skin_name, override_build_name)
        if not TheWorld.ismastersim then return end

        local function onequipfn(inst, data)
            data.owner.AnimState:OverrideSymbol("swap_body", (override_build_name or skin_name), "swap_body")
        end

        inst.skinname = skin_name
        inst.AnimState:SetBuild(override_build_name or skin_name)
        if inst.components.inventoryitem then
            inst.components.inventoryitem:ChangeImageName(inst:GetSkinName())
        end
        inst:ListenForEvent("equipped", onequipfn)
        inst.OnSkinChange = function(inst) 
            inst:RemoveEventCallback("equipped", onequipfn)
        end
    end
    yellowamulet_clear_fn = function(inst)
        inst.AnimState:SetBuild("amulets")
        if not TheWorld.ismastersim then return end
        inst.components.inventoryitem:ChangeImageName()
    end
end

-- lantern_mio
lantern_mio_init_fn = function(inst, build)
    local function onequipfn(inst, data)
        local owner = data.owner
        owner.AnimState:OverrideSymbol("swap_object", "swap_"..build, "swap_lantern")
        owner.AnimState:OverrideSymbol("lantern_overlay", "swap_"..build, "lantern_overlay")
    end
    
    local function lantern_on(inst)
        if inst._light then
            inst._light.Light:SetColour(195 / 255, 190 / 255, 120 / 255)
        end
    end
    
    if not TheWorld.ismastersim then return end

    inst.skinname = build
    inst.components.inventoryitem:ChangeImageName(inst:GetSkinName())
    -- inst.components.inventoryitem.atlasname = GetInventoryItemAtlas(inst:GetSkinName())
    inst.AnimState:SetBank(build)
    inst.AnimState:SetBuild(build)

    inst:ListenForEvent("equipped", onequipfn)
    inst:ListenForEvent("stoprowing",onequipfn) -- IA compatible after stopping rowing.
    inst:ListenForEvent("lantern_on", lantern_on)

    inst.OnSkinChange = function(inst)
        inst:RemoveEventCallback("equipped", onequipfn)
        inst:RemoveEventCallback("stoprowing", onequipfn) -- IA compatible after stopping rowing.
        inst:RemoveEventCallback("lantern_on", lantern_on)
    end
end

GlassicAPI.SkinHandler.AddModSkins({
    miotan = {
        is_char = true,
        "miotan_none",
        "miotan_classic"
    },
    lantern = {
        { name = "lantern_mio", test_fn = function(player) return GlassicAPI.SetExclusiveToPlayer(player, "miotan") end }
    },
    yellowamulet = {
        { name = "yellowamulet_heart", test_fn = function(player) return GlassicAPI.SetExclusiveToPlayer(player, "miotan") end }
    }
})