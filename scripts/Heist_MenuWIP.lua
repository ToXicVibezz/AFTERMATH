--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function MPX()
	local PI = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PI == 0 then
		return "MP0_"
	else
		return "MP1_"
	end
end

local function SPX()
	local PI = ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID())
	if PI == joaat("Player_Zero") then
		return "SP0_"
	elseif PI == joaat("Player_One") then
		return "SP1_"
	elseif PI == joaat("Player_Two") then
		return "SP2_"
	else
		return "SP0_"
	end
end

is_player_male = (ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == joaat("mp_m_freemode_01"))

--Required Scripts--

FMC = "fm_mission_controller"
FMC2020 = "fm_mission_controller_2020"
HIP = "heist_island_planning"

--Globals & Locals & Variables--

FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
ACg1 = 1929317 + 1 + 1 -- global apartment player 1 cut global
ACg2 = 1929317 + 1 + 2 -- global apartment player 2 cut global
ACg3 = 1929317 + 1 + 3 -- global apartment player 3 cut global
ACg4 = 1929317 + 1 + 4 -- global apartment player 4 cut global
ACg5 = 1931285 + 3008 + 1 -- local apartment player 1 cut global
AUAJg1 = FMg + 9101 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9106 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9113 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9119 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9125 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 20612 -- apartment instant finish local 1
AIFl4 = 28400 + 1 -- apartment instant finish local 2
AIFl5 = 31656 + 69 -- apartment instant finish local 3
AFHl = 11812 + 24 -- apartment fleeca hack local 
AFDl = 10143 + 11 -- apartment fleeca drill local
DCRBl = 185 -- diamond casino reload board local
DCCg1 = 1965614 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global ("gb_casino_heist_planning")
DCCg2 = 1965614 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
DCCg3 = 1965614 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
DCCg4 = 1965614 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
DCCl = FMg + 28313 -- Casino_Cut_Lester_offset
DCCh = FMg + 28349 - 1 --Casino_Cut_Hacker_offset
DCCd = FMg + 28344 - 1 --Casino_Cut_Driver_offset
DCCgun = FMg + 28339 - 1 --Casino_Cut_Gunman_offset
DCFHl = 53087 -- diamond casino fingerprint hack local
DCKHl = 54153 -- diamond casino keypad hack local
DCDVDl1 = 10143 + 7 -- diamond casino drill vault door local 1 --("DLC_HEIST_MINIGAME_FLEECA_DRILLING_SCENE")
DCDVDl2 = 10143 + 37 -- diamond casino drill vault door local 2
CPCg1 = 1972414 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1972414 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1972414 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1972414 + 831 + 56 + 4 -- cayo perico player 4 cut global
CPFHl = 24986 -- cayo perico fingerprint hack local ("MP_STAT_CR_FINGERPRINT")
CPPCCl = 31049 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds")
CPSTCl = 29810 -- cayo perico drainage pipe cut local ("IntroFinished")
DDSHl = 1292 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1960755 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1960755 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1960755 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1960755 + 812 + 50 + 4 -- doomsday player 4 cut global
IHPB = 52171 --Instant Heist Passed Local Base (Casino And CayoPerico)
IHPL = 52171 + 1776 + 1 --Instant Heist Passed Locals (Casino And CayoPerico)
SNOW = 262145 + 4413
halloweatherAddress = 262145 + 32158
BV = 262145 + 20024
CCBL0 = 262145 + 26535
CCBL1 = 262145 + 26536
BAS1 = 262145 + 29211
PSV = 262145 + 29463
PDIAMOND = 262145 + 29461
BB = 262145 + 29460
RN = 262145 + 29459
TEQUILA = 262145 + 29458

LUA = gui.get_tab("GUI_TAB_LUA_SCRIPTS")

HeistEditor = LUA:add_tab("GUI_TAB_LUA_SCRIPTS")

HeistEditor:add_button("Skip Current Apartment Heist Preps", function()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Reset Current Apartment Heist Preps", function()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", 0)
end)

HeistEditor:add_button("Remove Dax Fooligan CoolDown ", function()
	stats.set_int(MPX() .. "XM22JUGGALOWORKCDTIMER", -1)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Remove VIP/MC Cooldown", function()
	stats.set_int("MPPLY_VIPGAMEPLAYDISABLEDTIMER", 0)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Skip Cayo Cooldown", function()
	-- Solo Skip
	stats.set_int("MP0_H4_TARGET_POSIX", 1659643454)
	stats.set_int("MP0_H4_COOLDOWN", 0)
	stats.set_int("MP0_H4_COOLDOWN_HARD", 0)
	-- Multiplayer Skip
	stats.set_int("MP0_H4_TARGET_POSIX", 1659429119)
	stats.set_int("MP0_H4_COOLDOWN", 0)
	stats.set_int("MP0_H4_COOLDOWN_HARD", 0)
	-- Solo Skip (Second Character)
	stats.set_int("MP1_H4_TARGET_POSIX", 1659643454)
	stats.set_int("MP1_H4_COOLDOWN", 0)
	stats.set_int("MP1_H4_COOLDOWN_HARD", 0)
	-- Multiplayer Skip (Second Character)
	stats.set_int("MP1_H4_TARGET_POSIX", 1659429119)
	stats.set_int("MP1_H4_COOLDOWN", 0)
	stats.set_int("MP1_H4_COOLDOWN_HARD", 0)

	gui.show_message("Cayo Heist", "Skipped Cayo Perico Cooldown for all characters")
	gui.show_message("Cayo Heist", "Go to story mode and come back to apply the reset")
end)


HeistEditor:add_button("Skip Yacht Missions", function()
	stats.set_int(MPX() .. "YACHT_MISSION_PROG", 0)
	stats.set_int(MPX() .. "YACHT_MISSION_FLOW", 21845)
	stats.set_int(MPX() .. "CASINO_DECORATION_GIFT_1", -1)
end)

HeistEditor:add_separator()

HeistEditor:add_text("XXXXXXXXXXXXXXXXXXXXXXXX<!>HOW TO DO THE FLEECA JOB<!>XXXXXXXXXXXXXXXXXXXXXXX")
HeistEditor:add_text(
	'Pay for the preps, start first mission, soon as you`ve completely loaded in, join a Invite-Only session\nGoto planning room, press "Complete Preps" standing in front of heist board, press "E" to start.'
)
HeistEditor:add_text("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX<!>OTHER HEIST<!>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
HeistEditor:add_text(
	'Start mission, skip cutscene, press "Complete Preps" standing in front heist board, press "E" to start.'
)

HeistEditor:add_separator()

HeistEditor:add_button("Unlock All Heists Jobs", function()
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0", globals.get_int(AUAJg1))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1", globals.get_int(AUAJg2))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2", globals.get_int(AUAJg3))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3", globals.get_int(AUAJg4))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3_L", 5)
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4", globals.get_int(AUAJg5))
	stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4_L", 5)
end)

HeistEditor:add_text("Note: After Clicking Unlock All Heist Jobs, restart your game")

HeistEditor:add_separator()

HeistEditor:add_text("These cuts apply to all participants..")

HeistEditor:add_button("Fleeca: 100%", function()
	globals.set_int(ACg1, -200)
	globals.set_int(ACg2, 100)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Casino: 100%", function()
	CutsPresetter(DCCg1, DCCg4, 100)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Cayo: 100%", function()
	CutsPresetter(CPCg1, CPCg4, 100)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Doomsday: 100%", function()
	CutsPresetter(DCg1, DCg4, 100)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Others: 100%", function()
	globals.set_int(ACg1, -300)
	globals.set_int(ACg2, 100)
	globals.set_int(ACg3, 100)
	globals.set_int(ACg4, 100)
end)

local apartCut1 = 0
local apartCut2 = 0
local apartCut3 = 0
local apartCut4 = 0

HeistEditor:add_imgui(function()
	if ImGui.Button("Fix Negative cut to Positive cut") then
		globals.set_int(ACg5, -1 * (-100 + globals.get_int(ACg1)) / 2)
	end
end)

HeistEditor:add_button("Bypass Fleeca Hack", function()
	locals.set_int(FMC, AFHl, 7)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Bypass Fleeca Drill", function()
	locals.set_float(FMC, AFDl, 100)
end)

HeistEditor:add_button("Instant Finish Fleeca", function()
	locals.set_int(FMC, AIFl3, 12)
	locals.set_int(FMC, AIFl4, 99999)
	locals.set_int(FMC, AIFl5, 99999)
	gui.show_message("Fleeca Instant", "Activated")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Instant Finish Casino", function()
	locals.set_int(FMC2020, IHPB, 9)
	locals.set_int(FMC2020, IHPL, 50)
	gui.show_message("Casino Instant", "Activated")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Instant Finish Cayo", function()
	locals.set_int(FMC2020, IHPB, 9)
	locals.set_int(FMC2020, IHPL, 50)
	gui.show_message("Cayo Instant", "Activated")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Instant Finish Doomsday", function()
	locals.set_int(FMC, 19746, 12)
	locals.set_int(FMC, 19746 + 2686, 10000000)
	locals.set_int(FMC, 28400 + 1, 99999)
	locals.set_int(FMC, 31656 + 69, 99999)
	gui.show_message("Instant Heist Passed", "Activated")
end)

HeistEditor:add_text("Casino Heist")

HeistEditor:add_imgui(function()
	if ImGui.Button("Casino Preps All Done") then
		CasinoCompletePreps()
	end
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Remove Casino Fees", function()
	globals.set_int(DCCgun, 0)
	globals.set_int(DCCh, 0)
	globals.set_int(DCCl, 0)
	globals.set_int(DCCd, 0)
end)

HeistEditor:add_button("Casino Silent&Sneaky", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 1)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 127)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 262399)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Casino The Big Con", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 2)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 913623)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Casino Aggressive", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 3)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 1)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 1835223)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

HeistEditor:add_button("Reload Casino Planning Board", function()
	locals.set_int("gb_casino_heist_planning", DCRBl, 2)
end)

HeistEditor:add_button("Bypass Fingerprint Hack", function()
	if locals.get_int(FMC, DCFHl) == 4 then
		locals.set_int(FMC, DCFHl, 5)
	end
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Bypass Keypad Hack", function()
	if locals.get_int(FMC, DCKHl) ~= 4 then
		locals.set_int(FMC, DCKHl, 5)
	end
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Bypass Drill Door", function()
	locals.set_int(FMC, DCDVDl1, locals.get_int(FMC, DCDVDl2))
end)

HeistEditor:add_text("Cayo Heist")

HeistEditor:add_button("Panther/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 5)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Panther Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Diamond/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 3)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Diamond Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

HeistEditor:add_button("Bonds/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 2)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Bonds Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Necklace/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 1)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Necklace Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Tequila/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 0)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Tequila Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

HeistEditor:add_button("Bypass Cayo Drainage", function()
	locals.set_int(FMC2020, CPSTCl, 6)
	gui.show_message("Cayo Heist", "Bypassed Drainage Cut")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Bypass Cayo Fingerprint", function()
	locals.set_int(FMC2020, CPFHl, 5)
	gui.show_message("Cayo Heist", "Bypassed Fingerprint Scanner")
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Bypass Cayo Glass", function()
	locals.set_float(FMC2020, CPPCCl, 100.0)
	gui.show_message("Cayo Heist", "Bypassed Plasma Cutter")
end)

HeistEditor:add_button("Remove All CCTV's", function()
	for _, ent in pairs(entities.get_all_objects_as_handles()) do
		for __, cam in pairs(CamList) do
			if ENTITY.GET_ENTITY_MODEL(ent) == cam then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
				ENTITY.DELETE_ENTITY(ent)
			end
		end
	end
end)
CamList = {
	joaat("prop_cctv_cam_01a"),
	joaat("prop_cctv_cam_01b"),
	joaat("prop_cctv_cam_02a"),
	joaat("prop_cctv_cam_03a"),
	joaat("prop_cctv_cam_04a"),
	joaat("prop_cctv_cam_04c"),
	joaat("prop_cctv_cam_05a"),
	joaat("prop_cctv_cam_06a"),
	joaat("prop_cctv_cam_07a"),
	joaat("prop_cs_cctv"),
	joaat("p_cctv_s"),
	joaat("hei_prop_bank_cctv_01"),
	joaat("hei_prop_bank_cctv_02"),
	joaat("ch_prop_ch_cctv_cam_02a"),
	joaat("xm_prop_x17_server_farm_cctv_01"),
}

HeistEditor:add_sameline()

HeistEditor:add_button("Delete Mission NPC's", function() -- Thanks to RazorGamerX for the help on this
	for index, ped in ipairs(entities.get_all_peds_as_handles()) do
		local model = ENTITY.GET_ENTITY_MODEL(ped)
		if model == 0x7ED5AD78 or model == 0x6C8C08E5 or model == 0x995B3F9F or model == 0xB881AEE then
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, true, true)
			PED.DELETE_PED(ped)
		end
	end
end)

HeistEditor:add_sameline()

HeistEditor:add_button("Reset Kosatka Planning Board", function()
	locals.set_int(HIP, 1564, 2)
	gui.show_message("Cayo Heist", "Planning board has been reset!")
end)

bagSizeVal = 1800
HeistEditor:add_imgui(function()
	bagSizeVal, used = ImGui.SliderInt("Bag Size", bagSizeVal, 1800, 7200) -- 7200 = 4 players, this works if you want more money solo and it adjusts so you can always have full bags
	if used then
		globals.set_int(BAS1, bagSizeVal)
		gui.show_message("Bag Size Modified!")
	end
end)

custombagSizeVal = 1800
HeistEditor:add_imgui(function()
	custombagSizeVal, used = ImGui.SliderInt("Custom Bag Size", custombagSizeVal, 1800, 2147483646)
	if used then
		globals.set_int(BAS1, custombagSizeVal)
		gui.show_message("Custom Bag Size Modified!")
	end
end)

HeistEditor:add_text("Primary Target Editors                    ")
HeistEditor:add_sameline()
HeistEditor:add_text("                          Secondary Target Editors")

pantherSizeVal = 1900000
HeistEditor:add_imgui(function()
	pantherSizeVal, used = ImGui.SliderInt("Panther Value", pantherSizeVal, 1900000, 3800000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(PSV, pantherSizeVal)
		gui.show_message("Panther Value Modified!", out)
	end
end)
HeistEditor:add_sameline()
goldSizeVal = 45375
HeistEditor:add_imgui(function()
	goldSizeVal, used = ImGui.SliderInt("Gold Value", goldSizeVal, 45375, 181500) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_GOLD_V", goldSizeVal)
		gui.show_message("Gold Value Modified!", out)
	end
end)

diamondSizeVal = 1300000
HeistEditor:add_imgui(function()
	diamondSizeVal, used = ImGui.SliderInt("Diamond Value", diamondSizeVal, 1300000, 2600000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(PDIAMOND, diamondSizeVal)
		gui.show_message("Diamond Value Modified!", out)
	end
end)
HeistEditor:add_sameline()
cokeSizeVal = 25312
HeistEditor:add_imgui(function()
	cokeSizeVal, used = ImGui.SliderInt("Coke Value", cokeSizeVal, 25312, 101248) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_COKE_V", cokeSizeVal)
		gui.show_message("Coke Value Modified!", out)
	end
end)

bondSizeVal = 770000
HeistEditor:add_imgui(function()
	bondSizeVal, used = ImGui.SliderInt("Bonds Value", bondSizeVal, 770000, 1540000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(BB, bondSizeVal)
		gui.show_message("Bonds Value Modified!", out)
	end
end)
HeistEditor:add_sameline()
paintSizeVal = 22500
HeistEditor:add_imgui(function()
	paintSizeVal, used = ImGui.SliderInt("Paintings Value", paintSizeVal, 22500, 90000) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", paintSizeVal)
		gui.show_message("Paintings Value Modified!", out)
	end
end)
necklaceSizeVal = 700000
HeistEditor:add_imgui(function()
	necklaceSizeVal, used = ImGui.SliderInt("Necklace Value", necklaceSizeVal, 700000, 1400000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(RN, necklaceSizeVal)
		gui.show_message("Necklace Value Modified!", out)
	end
end)
HeistEditor:add_sameline()
weedSizeVal = 16875
HeistEditor:add_imgui(function()
	weedSizeVal, used = ImGui.SliderInt("Weed Value", weedSizeVal, 16875, 67500) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_WEED_V", weedSizeVal)
		gui.show_message("Weed Value Modified!", out)
	end
end)
tequilaSizeVal = 693000
HeistEditor:add_imgui(function()
	tequilaSizeVal, used = ImGui.SliderInt("Tequila Value", tequilaSizeVal, 693000, 1400000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(TEQUILA, tequilaSizeVal)
		gui.show_message("Tequila Value Modified!", out)
	end
end)
HeistEditor:add_sameline()
cashSizeVal = 10406
HeistEditor:add_imgui(function()
	cashSizeVal, used = ImGui.SliderInt("Cash Value", cashSizeVal, 10406, 41624) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_WEED_V", cashSizeVal)
		gui.show_message("Cash Value Modified!", out)
	end
end)


HeistEditor:add_text("Doomsday Heist Editor")

HeistEditor:add_button("Setup Act 1: The Data Breaches", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 7)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 7)
end)
HeistEditor:add_sameline()
HeistEditor:add_button("Setup Act 2: The Bodgan Problem", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 240)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 248)
end)
HeistEditor:add_sameline()
HeistEditor:add_button("Setup Act 3: Doomsday Scenario", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 15872)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 16128)
end)

HeistEditor:add_button("Reset Preps", function()
	DoomsdayActSetter(240, 0)
end)
HeistEditor:add_sameline()
HeistEditor:add_button("Complete Preps", function()
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
end)
HeistEditor:add_sameline()
HeistEditor:add_button("Bypass Act III hack", function()
	locals.set_int(FMC, DDSHl, 3)
end)

