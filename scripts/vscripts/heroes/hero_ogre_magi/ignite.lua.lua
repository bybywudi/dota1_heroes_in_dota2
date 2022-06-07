LinkLuaModifier( "modifier_ignite", "heroes/hero_ogre_magi/ignite.lua.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if ignite == nil then
	ignite = class({})
end
function ignite:GetIntrinsicModifierName()
	return "modifier_ignite"
end
---------------------------------------------------------------------
--Modifiers
if modifier_ignite == nil then
	modifier_ignite = class({})
end
function modifier_ignite:OnCreated(params)
	if IsServer() then
	end
end
function modifier_ignite:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_ignite:OnDestroy()
	if IsServer() then
	end
end
function modifier_ignite:DeclareFunctions()
	return {
	}
end