LinkLuaModifier( "modifier_berserkers_rage", "heroes/hero_troll_warlord/berserkers_rage.lua.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if berserkers_rage == nil then
	berserkers_rage = class({})
end
function berserkers_rage:GetIntrinsicModifierName()
	return "modifier_berserkers_rage"
end
---------------------------------------------------------------------
--Modifiers
if modifier_berserkers_rage == nil then
	modifier_berserkers_rage = class({})
end
function modifier_berserkers_rage:OnCreated(params)
	if IsServer() then
	end
end
function modifier_berserkers_rage:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_berserkers_rage:OnDestroy()
	if IsServer() then
	end
end
function modifier_berserkers_rage:DeclareFunctions()
	return {
	}
end