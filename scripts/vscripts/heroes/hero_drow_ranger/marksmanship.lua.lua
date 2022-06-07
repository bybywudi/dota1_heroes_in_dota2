LinkLuaModifier( "modifier_marksmanship", "heroes/hero_drow_ranger/marksmanship.lua.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if marksmanship == nil then
	marksmanship = class({})
end
function marksmanship:GetIntrinsicModifierName()
	return "modifier_marksmanship"
end
---------------------------------------------------------------------
--Modifiers
if modifier_marksmanship == nil then
	modifier_marksmanship = class({})
end
function modifier_marksmanship:OnCreated(params)
	if IsServer() then
	end
end
function modifier_marksmanship:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_marksmanship:OnDestroy()
	if IsServer() then
	end
end
function modifier_marksmanship:DeclareFunctions()
	return {
	}
end