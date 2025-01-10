gtaoversion = memory.scan_pattern("8B C3 33 D2 C6 44 24 20"):add(0x24):rip()
if gtaoversion:get_string() == "3411" then
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("Mini-game instant complete", function()
    local local_H3_hack_1 = 53087  
    local local_H3_hack_2 = 54153 
    local local_H3_hack_1_p = 2861    
    local local_H3_hack_2_p = 3862    
    local local_H4_hack = 24986 

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_mission_controller_2020")) ~= 0 then

        locals.set_int("fm_mission_controller_2020", 29810, 6) 
        locals.set_float("fm_mission_controller_2020", 31049 + 3, 100)       
        locals.set_int("fm_mission_controller_2020", 9081 + 24, 7)
        locals.set_int("fm_mission_controller_2020", 1001 + 135, 3)                                                                                     
        locals.set_int("fm_mission_controller_2020", 1275, 2) 

        locals.set_int("fm_mission_controller_2020", 1744, 
            locals.get_int("fm_mission_controller_2020", 1745)) 
        locals.set_int("fm_mission_controller_2020", 1726, 3) 

        if locals.get_int("fm_mission_controller_2020", 31024) == 3 then 
            locals.set_int("fm_mission_controller_2020", 31025, 2) 
            locals.set_float("fm_mission_controller_2020", 31025 + 1 + 1, 
                locals.get_int("fm_mission_controller_2020", 31025 + 1 + 1 + 1)) 
            locals.set_float("fm_mission_controller_2020", 31025 + 1 + 1 + 2, 
                locals.get_int("fm_mission_controller_2020", 31025 + 1 + 1 + 1 + 2)) 
            locals.set_float("fm_mission_controller_2020", 31025 + 1 + 1 + 4, 
                locals.get_int("fm_mission_controller_2020", 31025 + 1 + 1 + 1 + 4)) 
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 237, 1.0) 
        end
    
        local_H4_hack_v = locals.get_int("fm_mission_controller_2020", local_H4_hack) 
        if (local_H4_hack_v & (1 << 0)) == 0 then
            local_H4_hack_v = local_H4_hack_v ~ (1 << 0)
            locals.set_int("fm_mission_controller_2020", local_H4_hack, local_H4_hack_v)
        end
    end
            
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_mission_controller")) ~= 0 then
        locals.set_int("fm_mission_controller", 163, 0)
        locals.set_int("fm_mission_controller", 164, 0)
        locals.set_int("fm_mission_controller", 179, 7)
        locals.set_int("fm_mission_controller", 1292 + 135, 3)
        locals.set_int("fm_mission_controller", 11812 + 24, 7) 
        locals.set_float("fm_mission_controller", 10103 + 11, 1) 
        locals.set_int("fm_mission_controller", 10143 + 2, 8) 
    end 

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_mission_controller")) ~= 0 then 
        local_H3_hack_1_v = locals.get_int("fm_mission_controller", local_H3_hack_1)
        if (local_H3_hack_1_v & (1 << 0)) == 0 then
            local_H3_hack_1_v = local_H3_hack_1_v ~ (1 << 0)
            locals.set_int("fm_mission_controller", local_H3_hack_1, local_H3_hack_1_v)
        end
        local_H3_hack_2_v = locals.get_int("fm_mission_controller", local_H3_hack_2)
        if (local_H3_hack_2_v & (1 << 0)) == 0 then
            local_H3_hack_2_v = local_H3_hack_2_v ~ (1 << 0)
            locals.set_int("fm_mission_controller", local_H3_hack_2, local_H3_hack_2_v)
        end

        -- locals.set_int("fm_mission_controller", 31765 + math.max(0, self.get_id()) * 292, 8)
        locals.set_int("fm_mission_controller", 62379, 5)
        locals.set_int("fm_mission_controller", 1566, 2)
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("am_mp_arc_cab_manager")) ~= 0 then 
        local_H3_hack_1_p_v = locals.get_int("am_mp_arc_cab_manager", local_H3_hack_1_p)
        if (local_H3_hack_1_p_v & (1 << 0)) == 0 then
            local_H3_hack_1_p_v = local_H3_hack_1_p_v ~ (1 << 0)
            locals.set_int("am_mp_arc_cab_manager", local_H3_hack_1_p, local_H3_hack_1_p_v)
        end
        local_H3_hack_2_p_v = locals.get_int("am_mp_arc_cab_manager", local_H3_hack_2_p)
        if (local_H3_hack_2_p_v & (1 << 0)) == 0 then
            local_H3_hack_2_p_v = local_H3_hack_2_p_v ~ (1 << 0)
            locals.set_int("am_mp_arc_cab_manager", local_H3_hack_2_p, local_H3_hack_2_p_v)
        end
    end

    --所有voltlab
        --[[
        if (iLocal_765 == iLocal_764)
            {
                AUDIO::PLAY_SOUND_FRONTEND(-1, "All_Connected_Correct", uParam1->f_741, true);
            }
    ]]

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_mission_controller_2020")) ~= 0 then 
        locals.set_int("fm_mission_controller_2020", 1744, locals.get_int("fm_mission_controller_2020", 1745)) 
        locals.set_int("fm_mission_controller_2020", 1746, 3) 
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_content_island_heist")) ~= 0 then
        locals.set_int("fm_content_island_heist", 787, locals.get_int("fm_content_island_heist", 767))
        locals.set_int("fm_content_island_heist", 789, 3) 
        locals.set_int("fm_content_island_heist", 10162 + 24, 7)
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_content_vehrob_prep")) ~= 0 then
        locals.set_int("fm_content_vehrob_prep", 568, locals.get_int("fm_content_vehrob_prep", 569)) 
        locals.set_int("fm_content_vehrob_prep", 570, 3) 
        locals.set_int("fm_content_vehrob_prep", 9223 + 24, 7)
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("am_mp_arc_cab_manager")) ~= 0 then
        locals.set_int("am_mp_arc_cab_manager", 476, locals.get_int("am_mp_arc_cab_manager", 477)) 
        locals.set_int("am_mp_arc_cab_manager", 478, 3) 
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_content_vehrob_casino_prize")) ~= 0 then
        locals.set_int("fm_content_vehrob_casino_prize", 1066 + 135, 3)
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_content_business_battles")) ~= 0 then
        locals.set_int("fm_content_business_battles", 4173 + 24, 7)
    end

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("am_mp_hotwire")) ~= 0 then
        locals.set_int("am_mp_hotwire", 298, 2) 
    end

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("word_hack")) ~= 0 then 
        locals.set_int("word_hack", 49 + 53, 5)
    end

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("circuitblockhack")) ~= 0 then
        locals.set_int("circuitblockhack", 49 + 9, 2) 
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_content_hacker_house_finale")) ~= 0 then
        locals.set_int("fm_content_hacker_house_finale", 5951 + 1, 5) 
    end

    local_mp2024_02_m4 = 5097 
    local_mp2024_02_m4_v = locals.get_int("fm_content_hacker_whistle_prep", local_mp2024_02_m4)
    if (local_mp2024_02_m4_v & (1 << 26)) == 0 then
        local_mp2024_02_m4_v = local_mp2024_02_m4_v ~ (1 << 26)
        locals.set_int("fm_content_hacker_whistle_prep", local_mp2024_02_m4, local_mp2024_02_m4_v)
    end
 
    -- int* iParam0, int iParam1, int iParam2, int iParam3, int iParam4, var uParam5, var uParam6, int iParam7, bool bParam8, bool bParam9, bool bParam10, bool bParam11, bool bParam12, bool bParam13, int iParam14, int iParam15, bool bParam16, bool bParam17, bool bParam18, bool bParam19, bool bParam20, bool bParam21
    local minigamelocaltable = {
        [1]  = { script_name = "agency_heist3b", minigame_local = 6210 },       
        [2]  = { script_name = "business_battles_sell", minigame_local = 452 }, 
        [3]  = { script_name = "fm_content_business_battles", minigame_local = 4173 },
        [4]  = { script_name = "fm_content_island_heist", minigame_local = 10162 },
        [5]  = { script_name = "fm_content_vehrob_casino_prize", minigame_local = 7774 + 2 },
        [6]  = { script_name = "fm_content_vehrob_police", minigame_local = 7667 },         
        [7]  = { script_name = "fm_content_vehrob_prep", minigame_local = 9223 },            
        [8]  = { script_name = "fm_content_vip_contract_1", minigame_local = 7408 },         
        [9]  = { script_name = "fm_mission_controller_2020", minigame_local = 29027 },      
        [10] = { script_name = "fm_mission_controller", minigame_local = 9809 },             
        [11] = { script_name = "gb_cashing_out", minigame_local = 422 },         
        [12] = { script_name = "gb_gunrunning_defend", minigame_local = 2282 }, 
        [13] = { script_name = "gb_sightseer", minigame_local = 462 }, 
    }
        --[12]  = {script_name = "gb_casino_heist", minigame_local = }, --Global_2737317
        --[12]  = {script_name = "gb_casino", minigame_local = }, --Global_2737317
        --[12]  = {script_name = "gb_gangops", minigame_local = }, --Global_2737317
        --[12]  = {script_name = "gb_gunrunning", minigame_local = }, --Global_2737317
        --[12]  = {script_name = "gb_infiltration", minigame_local = }, --Global_2737317
        --[12]  = {script_name = "gb_smuggler", minigame_local = }, --Global_2737317
        --[0]  = {script_name = "business_battles", minigame_local = }, --Global_2737317

    for i = 1, 13 do
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(minigamelocaltable[i].script_name)) ~= 0 then
            minigame_tmp_v = locals.get_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local)
            if (minigame_tmp_v & (1 << 9)) == 0 then
                minigame_tmp_v = minigame_tmp_v ~ (1 << 9)
                locals.set_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local, minigame_tmp_v)
            end
        end
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(minigamelocaltable[i].script_name)) ~= 0 then
            minigame_tmp_v = locals.get_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local) 
            if (minigame_tmp_v & (1 << 18)) == 0 then
                minigame_tmp_v = minigame_tmp_v ~ (1 << 18)
                locals.set_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local, minigame_tmp_v)
            end
        end
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(minigamelocaltable[i].script_name)) ~= 0 then
            minigame_tmp_v = locals.get_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local) 
            if (minigame_tmp_v & (1 << 26)) == 0 then
                minigame_tmp_v = minigame_tmp_v ~ (1 << 26)
                locals.set_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local, minigame_tmp_v)
            end
        end
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat(minigamelocaltable[i].script_name)) ~= 0 then
            minigame_tmp_v = locals.get_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local) 
            if (minigame_tmp_v & (1 << 28)) == 0 then
                minigame_tmp_v = minigame_tmp_v ~ (1 << 28)
                locals.set_int(minigamelocaltable[i].script_name, minigamelocaltable[i].minigame_local, minigame_tmp_v)
            end
        end
    end

    minigame_tmp_v2 = globals.get_int(2738536)
    if (minigame_tmp_v2 & (1 << 9)) == 0 then
        minigame_tmp_v2 = minigame_tmp_v2 ~ (1 << 9)
    end
    if (minigame_tmp_v2 & (1 << 18)) == 0 then
        minigame_tmp_v2 = minigame_tmp_v2 ~ (1 << 18)
    end
    if (minigame_tmp_v2 & (1 << 26)) == 0 then
        minigame_tmp_v2 = minigame_tmp_v2 ~ (1 << 26)
    end
    globals.set_int(2738536, minigame_tmp_v2)
	
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_content_stash_house")) ~= 0 then 
        for i = 0, 2 do
            local safe_code = locals.get_int("fm_content_stash_house", 140 + 22 + (1 + (i * 2)) + 1)
            locals.set_float("fm_content_stash_house", 140 + 22 + (1 + (i * 2)), safe_code)
        end
        s:sleep(250)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 235, 1.0)
        s:sleep(250)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 235, 1.0)
        s:sleep(250)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 237, 1.0)
    end
end)
else
  gui.show_message("AFTERMATH", "Aftermath Minigamehack is not up-to-date.\nPlease update the script!")
  updateD = gui.get_tab("GUI_TAB_LUA_SCRIPTS")
  updateD:add_text("Aftermath Minigamehack is not up-to-date.\nPlease update the script.")
end
