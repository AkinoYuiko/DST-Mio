AddPrefabPostInit("crawlinghorror",function(inst)
	if not GLOBAL.TheWorld.ismastersim then return inst end

	local oldOnKilledByOther = inst.components.combat.onkilledbyother
	inst.components.combat.onkilledbyother = function(inst, attacker)
		if attacker and attacker.prefab == "miotan" and attacker.components.sanity then
        	attacker.components.sanity:DoDelta((inst.sanityreward or TUNING.SANITY_SMALL) * 0.5)
        else
        	oldOnKilledByOther(inst, attacker)
        end
    end
end)

AddPrefabPostInit("terrorbeak",function(inst)
	if not GLOBAL.TheWorld.ismastersim then return inst end

	local oldOnKilledByOther = inst.components.combat.onkilledbyother
	inst.components.combat.onkilledbyother = function(inst, attacker)
		if attacker and attacker.prefab == "miotan" and attacker.components.sanity then
        	attacker.components.sanity:DoDelta((inst.sanityreward or TUNING.SANITY_SMALL) * 0.5)
        else
        	oldOnKilledByOther(inst, attacker)
        end
    end
end)

-- if GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795") then
AddPrefabPostInit("swimminghorror",function(inst)
    if not GLOBAL.TheWorld.ismastersim then return inst end

    local oldOnKilledByOther = inst.components.combat.onkilledbyother
    inst.components.combat.onkilledbyother = function(inst, attacker)
        if attacker and attacker.prefab == "miotan" and attacker.components.sanity then
            attacker.components.sanity:DoDelta((inst.sanityreward or TUNING.SANITY_SMALL) * 0.5)
        else
            oldOnKilledByOther(inst, attacker)
        end
    end
end)
-- end