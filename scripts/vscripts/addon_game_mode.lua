require('timers')

Hero_Selection_Time = 40
Hero_Selection_Penalty_Time = 20
Strategy_Time = 20
PRE_GAME_TIME = 80
Gold_Per_Tick = 1
Gold_Gain_Time = 1.0
-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	
	CAddonTemplateGameMode = self
	mode = GameRules:GetGameModeEntity()        
   
	self.vUserIds = {}
	self.vSteamIds = {}
	self.troll_warlord_berserkers_rage_level = 0
	self.troll_warlord_berserkers_rage_index = 0
	GameRules:SetHeroSelectionTime(Hero_Selection_Time)
	GameRules:SetHeroSelectPenaltyTime(Hero_Selection_Penalty_Time)
	GameRules:SetStrategyTime(Strategy_Time)
	GameRules:SetPreGameTime(PRE_GAME_TIME)
	mode:SetFreeCourierModeEnabled(true)
	mode:SetCustomHeroMaxLevel(25)
	mode:SetUseDefaultDOTARuneSpawnLogic(true)

	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(CAddonTemplateGameMode,"OnGameRulesStateChange"), self)
	ListenToGameEvent('player_connect_full', Dynamic_Wrap(CAddonTemplateGameMode, 'OnConnectFull'), self)
	ListenToGameEvent('dota_player_used_ability', Dynamic_Wrap(CAddonTemplateGameMode, 'OnAbilityUsed'), self)
	ListenToGameEvent('dota_ability_changed', Dynamic_Wrap(CAddonTemplateGameMode, 'OnAbilityChanged'), self)
	ListenToGameEvent('dota_player_learned_ability', Dynamic_Wrap(CAddonTemplateGameMode, 'OnPlayerLearnedAbility'), self)
	print( "Template addon is loaded." )
end

function CAddonTemplateGameMode:OnGameRulesStateChange( keys )
	print("OnGameRulesStateChange")
	DeepPrintTable(keys)    --详细打印传递进来的表

	--获取游戏进度
	local newState = GameRules:State_Get()

	if newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
			print("Player begin select hero")  --玩家处于选择英雄界面

	elseif newState == DOTA_GAMERULES_STATE_STRATEGY_TIME then
			print("Player ready game sta")  --玩家处于游戏准备状态
			for key, value in pairs(self.vUserIds) do      
				print(value)  
				if PlayerResource:HasSelectedHero(value) == false then
					-- PlayerController:MakeRandomHeroSelection()
					print("no hero")
					ply = PlayerResource:GetPlayer(value)
					ply:MakeRandomHeroSelection()
				end
			end   
	elseif newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
			print("Player game begin")  --玩家开始游戏
			-- CAddonTemplateGameMode:OnGameInProgress()
	end
end

function CAddonTemplateGameMode:OnConnectFull(keys)
  print ('OnConnectFull')
  DeepPrintTable(keys)
  
  local entIndex = keys.index
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
  print(playerID)
  
  -- Update the user ID table with this user
  self.vUserIds[keys.userid] = playerID

  -- Update the Steam ID table
  self.vSteamIds[PlayerResource:GetSteamAccountID(playerID)] = ply
  DeepPrintTable(self.vUserIds)
  DeepPrintTable(self.vSteamIds)
end

function CAddonTemplateGameMode:OnGameInProgress()
	print("[BAREBONES] The game has officially begun")
  
	Timers:CreateTimer(1.0, 
	function()
		for key, value in pairs(self.vUserIds) do 
			PlayerResource:ModifyGold(value, 1, true, 1)
		end  
	  return 1.0
	end)
end

function CAddonTemplateGameMode:OnAbilityUsed(keys)
	print('[BAREBONES] AbilityUsed')
	DeepPrintTable(keys)
  
	local player = EntIndexToHScript(keys.PlayerID)
	local abilityname = keys.abilityname
	if abilityname == "troll_warlord_berserkers_rage" then
		print("troll_warlord_berserkers_rage")
		ply = PlayerResource:GetPlayer(keys.PlayerID)
	end
end

function CAddonTemplateGameMode:OnAbilityChanged(keys)
	print('[BAREBONES] OnAbilityChanged')
	DeepPrintTable(keys)
end

function CAddonTemplateGameMode:OnPlayerLearnedAbility(keys)
	print ('[BAREBONES] OnPlayerLearnedAbility')
	DeepPrintTable(keys)
	local player = EntIndexToHScript(keys.player)
	local abilityname = keys.abilityname
	print(abilityname)

	if abilityname == "troll_warlord_berserkers_rage" then
		self.troll_warlord_berserkers_rage_level = self.troll_warlord_berserkers_rage_level + 1
		print("troll_warlord_berserkers_rage")
		ply = PlayerResource:GetPlayer(keys.PlayerID)
		hero = ply:GetAssignedHero()
		if hero:HasAbility("troll_warlord_berserkers_rage_stun_datadriven") == false then
			ab = hero:AddAbility("troll_warlord_berserkers_rage_stun_datadriven")
			self.troll_warlord_berserkers_rage_index = ab:GetAbilityIndex()
		end
		ab = hero:GetAbilityByIndex(self.troll_warlord_berserkers_rage_index)
		ab:SetLevel(self.troll_warlord_berserkers_rage_level)
	end
  
end