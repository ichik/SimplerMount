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
				if SecureCmdOptionParse("[flyable] t; f") == "t" and ((IsSpellKnown(90267) and (GetCurrentMapContinent()==1 or GetCurrentMapContinent()==2)) or (GetCurrentMapContinent()==4 and IsSpellKnown(54197)) or (GetCurrentMapContinent()==3 and (IsSpellKnown(34090) or IsSpellKnown(90265) or IsSpellKnown(34091))))then
					CastSpellByName(fly)
				elseif GetZoneText() == WINTERGRASP and GetWintergraspWaitTime() and IsSpellKnown(54197) then
					CastSpellByName(fly)
				else
					CastSpellByName(nofly)
				end
			end
		end
	end
end