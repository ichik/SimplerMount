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
	--[[ Template for other locales
elseif(locale=="") then
	WINTERGRASP = ""
""]]--
else  WINTERGRASP = "Wintergrasp" end
SLASH_USEMOUNT1 = "/usemount";
SlashCmdList["USEMOUNT"] = function(msg)
	local fly, nofly = string.split(",", msg)
	if fly and nofly then
		fly = string.trim(fly, " ")
		nofly = string.trim(nofly, " ")
		if UnitInVehicle("player") and CanExitVehicle() then 
			VehicleExit() 
		else
			if IsMounted() then
				Dismount()
			elseif not InCombatLockdown() then
				if SecureCmdOptionParse("[flyable] t; f") == "t" then
						CastSpellByName(fly)
				elseif GetZoneText() == WINTERGRASP and GetWintergraspWaitTime() then
						CastSpellByName(fly)
				else
					CastSpellByName(nofly)
				end
			end
		end
	end
end