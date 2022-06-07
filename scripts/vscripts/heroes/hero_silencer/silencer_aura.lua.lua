LinkLuaModifier( "modifier_silencer_aura", "heroes/hero_silencer/silencer_aura.lua.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if silencer_aura == nil then
	silencer_aura = class({})
end
function silencer_aura:GetIntrinsicModifierName()
	return "modifier_silencer_aura"
end
---------------------------------------------------------------------
--Modifiers
if modifier_silencer_aura == nil then
	modifier_silencer_aura = class({})
end
function modifier_silencer_aura:OnCreated(params)
	if IsServer() then
	end
end
function modifier_silencer_aura:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_silencer_aura:OnDestroy()
	if IsServer() then
	end
end
function modifier_silencer_aura:DeclareFunctions()
	return {
	}
end