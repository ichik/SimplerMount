--local dismissOption = true
local WINTERGRASP
local locale = GetLocale()
if(locale=="ruRU") then
	WINTERGRASP = "Озеро Ледяных Оков"
elseif(locale=="frFR") then
	WINTERGRASP = "Joug-d'hiver"
elseif(locale=="deDE") then
    WINTERGRASP = "Tausendwintersee"
elseif(locale=="esES") then
    WINTERGRASP = "Conquista del Invierno"
else  WINTERGRASP = "Wintergrasp" end
--[[ Template for other locales
elseif(locale=="") then
	WINTERGRASP = ""
""]]--
SLASH_USEMOUNT1 = "/usemount";
SlashCmdList["USEMOUNT"] = function(msg)
	local fly, nofly = string.split(",", msg)
	if fly and nofly then
		fly = string.trim(fly, " ")
		nofly = string.trim(nofly, " ")
		if UnitInVehicle("player") and CanExitVehicle() then 
			VehicleExit() 
	--	elseif UnitExists("pet") and dismissOption then 
	--		PetDismiss()
		else
			if IsMounted() then
				Dismount()
			elseif not InCombatLockdown() then
				if SecureCmdOptionParse("[flyable] t; f") == "t" then
					if GetZoneText() == WINTERGRASP and (not GetWintergraspWaitTime()) then
						CastSpellByName(nofly)
					else
						CastSpellByName(fly)
					end
				else
					CastSpellByName(nofly)
				end
			end
		end
	end
end