--[[
	Author: Noya
	Date: 14.01.2015.
	Applies a Lifesteal modifier if the attacked target is not a building and not a mechanical unit
]]
function ModifierApply( keys )
	-- Variables
	local target = keys.unit
	local ability = keys.ability
	local d = ability:GetLevelSpecialValueFor("duration", (ability:GetLevel() -1))

	print("xixixixi1")
	ability:ApplyDataDrivenModifier(target, target, "modifier_last_word_silence", {duration = d})

end