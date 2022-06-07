LinkLuaModifier( "modifier_vampiric_aura", "heroes/hero_skeleton_king/vampiric_aura.lua.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if vampiric_aura == nil then
	vampiric_aura = class({})
end
function vampiric_aura:GetIntrinsicModifierName()
	return "modifier_vampiric_aura"
end
---------------------------------------------------------------------
--Modifiers
if modifier_vampiric_aura == nil then
	modifier_vampiric_aura = class({})
end
function modifier_vampiric_aura:OnCreated(params)
	if IsServer() then
	end
end
function modifier_vampiric_aura:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_vampiric_aura:OnDestroy()
	if IsServer() then
	end
end
function modifier_vampiric_aura:DeclareFunctions()
	return {
	}
end