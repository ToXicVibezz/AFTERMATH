local rank_editor_tab = gui.get_tab("GUI_TAB_LUA_SCRIPTS")--:add_tab("Rank Editor")

local RP_TABLE = {
    0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000,
    28500, 33400, 38700, 44200, 50200, 56400, 63000, 69900, 77100, 84700,
    92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100,
    188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,
    312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800,
    465200, 482000, 499000, 516300, 533800, 551600, 569600, 588000, 606500, 625400,
    644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900,
    849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700,
    1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100,
    1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300, 1555800
}

local input_char_rank  = 1
local input_lscm_tier  = 1
local input_arena_ap   = 1

-- It's not worth it to call the script functions just for some math calculations.

local function GET_RP_FOR_RANK(rank)
    if rank < 100 then
        return RP_TABLE[rank]
    end

    return 25 * rank * rank + 23575 * rank - 1023150
end

local function GET_REP_FOR_LSCM_TIER(tier)
    if tier <= 1 then
        return 0
    end

    local _tier     = tonumber(tier)
    local increment = tonumber(tunables.get_int("TUNER_CARCLUB_REP_INCREMENT_PER_TIER_200")) / 2.0

    if tier >= 200 then
        local increment_1000 = tonumber(tunables.get_int("TUNER_CARCLUB_REP_INCREMENT_PER_TIER_1000"))
        local main_rep       = math.floor(((199.0 * 100.0) - 100.0) + ((199.0 - 3.0) * ((increment * (199.0 - 3.0)) + increment)) + 0.5)
        return ((tier - 199) * increment_1000) + main_rep
    end

    return math.floor((((_tier * 100.0) - 100.0) + ((_tier - 3.0) * ((increment * (_tier - 3.0)) + increment))) + 0.5)
end

rank_editor_tab:add_imgui(function()
    input_char_rank = ImGui.InputInt("Rank", input_char_rank)
    input_char_rank = math.min(math.max(input_char_rank, 1), 8000)
    
    if ImGui.Button("Set Rank") then
        script.run_in_fiber(function()
            local rp_value = GET_RP_FOR_RANK(input_char_rank)
            stats.set_int("MPPLY_GLOBALXP", rp_value)
            stats.set_int("MPX_CHAR_XP_FM", rp_value)
            stats.set_int("MPX_CHAR_SET_RP_GIFT_ADMIN", rp_value)
        end)
    end

    input_lscm_tier = ImGui.InputInt("LSCM Tier", input_lscm_tier)
    input_lscm_tier = math.min(math.max(input_lscm_tier, 1), 1000)
    
    if ImGui.Button("Set LSCM Tier") then
        script.run_in_fiber(function()
            local rep_value    = GET_REP_FOR_LSCM_TIER(input_lscm_tier)
            local current_tier = globals.get_int(1965235 + 8 + 2)
            stats.set_int("MPX_CAR_CLUB_REP", rep_value)
            scr_function.call_script_function("freemode", 0x6B73C9, "void", {
                { "int", current_tier },
                { "int", input_lscm_tier }
            })
        end)
    end

    input_arena_ap = ImGui.InputInt("Arena War AP", input_arena_ap)
    input_arena_ap = math.min(math.max(input_arena_ap, 1), 2147483647)
    
    if ImGui.Button("Add AP") then
        script.run_in_fiber(function()
            scr_function.call_script_function("freemode", 0x49DE6B, "void", {
                { "int", input_arena_ap },
                { "bool", false } -- Is gained from a match
            })
        end)
    end
end)