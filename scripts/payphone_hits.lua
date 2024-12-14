local payphone_hits_tab = gui.get_tab("GUI_TAB_LUA_SCRIPTS")

local PAYPHONE_FLOW  = 2709501
local FMMC_VARIATION = 2739811
local PAYPHONE_DATA  = 5778

local GPBL = 0x69FAE2

local PAYPHONE_STATE_WAIT       = 0
--local PAYPHONE_STATE_AVAILABLE  = 1
local PAYPHONE_STATE_ACTIVE     = 2
--local PAYPHONE_STATE_LAUNCHING  = 3
local PAYPHONE_STATE_ON_MISSION = 4

local ASSASSINATION_BONUSES = {
    [0] = { 0, 1, 2 },
    [1] = { 6, 7, 8 },
    [2] = { 9, 10, 11 },
    [3] = { 21, 22, 23 },
    [4] = { 15, 16, 17 },
    [5] = { 3, 4, 5 },
    [6] = { 18, 19, 20 },
    [7] = { 12, 13, 14 }
}

local VARIATION_NAMES = {
    "The Tech Entrepreneur",
    "The Judge",
    "The Cofounder",
    "The Trolls",
    "The Dealers",
    "The CEO",
    "The Popstar",
    "The Hitmen"
}

local SUBVARIATION_NAMES = {
    [0] = { "Ocean", "Car Crusher", "Gas Station" },
    [1] = { "Golf Club", "Golf Cart", "Remote Bomb" },
    [2] = { "Car on Fire", "Install Explosives", "Scoped Rifle" },
    [3] = { "Headshot", "7 minutes", "Run Over" },
    [4] = { "Scoped Rifle", "Suppressed Pistol", "Explosives" },
    [5] = { "Bulldozer", "Cargo Container", "Gas Tank Explosion" },
    [6] = { "Vagos Lowrider", "Police Cruiser", "Truck" },
    [7] = { "Throwable Explosives", "Drive-By", "After They Arrive" }
}

local selected_variation    = 0
local selected_subvariation = 0
local force_selected        = false

local payphone_state = 0
local is_host        = false
local cooldown_str   = ""

local function GET_COOLDOWN_STR()
    local epoch    = NETWORK.GET_CLOUD_TIME_AS_INT()
    local cooldown = stats.get_int("MPX_PAYPHONE_HIT_CDTIMER")

    if epoch > cooldown then
        return "Request is available."
    end

    local time_left = (cooldown - epoch) * 1000
    local ms_to_sec = time_left / 1000
    local minutes   = math.floor(ms_to_sec / 60)
    local seconds   = math.floor(ms_to_sec % 60)

    return string.format("Next request is available in %02d:%02d.", minutes, seconds)
end

script.register_looped("Payphone Hits", function()
    payphone_state = globals.get_int(PAYPHONE_FLOW)
    is_host        = NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_content_payphone_hit", 0, 0)
    cooldown_str   = GET_COOLDOWN_STR()

    if force_selected then
        globals.set_int(FMMC_VARIATION + 5265 + 347, selected_variation)
        locals.set_int("fm_content_payphone_hit", PAYPHONE_DATA + 749 + 2, ASSASSINATION_BONUSES[selected_variation][selected_subvariation + 1])
    end
end)

payphone_hits_tab:add_imgui(function()
    ImGui.BeginDisabled(payphone_state == PAYPHONE_STATE_ON_MISSION)
    selected_variation, used = ImGui.Combo("Select Variation", selected_variation, VARIATION_NAMES, #VARIATION_NAMES)
    if used then
        selected_subvariation = 0
    end

    selected_subvariation = ImGui.Combo("Select Subvariation", selected_subvariation, SUBVARIATION_NAMES[selected_variation], #SUBVARIATION_NAMES[selected_variation])

    force_selected = ImGui.Checkbox("Force Selected", force_selected)
    ImGui.EndDisabled()

    ImGui.Separator()

    ImGui.Text(cooldown_str)

    if ImGui.Button("Request Payphone Hit") then
        if payphone_state == PAYPHONE_STATE_WAIT then
            local value = globals.get_int(PAYPHONE_FLOW + 1 + 1) | (1 << 0)
            globals.set_int(PAYPHONE_FLOW + 1 + 1, value)
        else
            gui.show_error("Payphone Hits", "Not available at the moment.")
        end
    end

    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("You won't get paid if you request a hit when cooldown is active.")
    end

    if ImGui.Button("Teleport to Payphone") then
        script.run_in_fiber(function()
            if payphone_state == PAYPHONE_STATE_ACTIVE then
                local coords = scr_function.call_script_function("freemode", GPBL, "vector3", {})
                PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), coords.x, coords.y, coords.z + 2.0)
            else
                gui.show_error("Payphone Hits", "Not available at the moment.")
            end
        end)
    end

    if ImGui.Button("Instant Finish Payphone Hit") then
        if payphone_state == PAYPHONE_STATE_ON_MISSION then
            if is_host then
                locals.set_int("fm_content_payphone_hit", PAYPHONE_DATA + 689, 3)
            else
                gui.show_error("Payphone Hits", "You must be the mission host.")
            end
        else
            gui.show_error("Payphone Hits", "Not available at the moment.")
        end
    end

    if ImGui.Button("Complete Assassination Bonus") then
        if payphone_state == PAYPHONE_STATE_ON_MISSION then
            if is_host then
                local value = locals.get_int("fm_content_payphone_hit", PAYPHONE_DATA + 747 + 1) | (1 << 1)
                locals.set_int("fm_content_payphone_hit", PAYPHONE_DATA + 747 + 1, value)
            else
                gui.show_error("Payphone Hits", "You must be the mission host.")
            end
        else
            gui.show_error("Payphone Hits", "Not available at the moment.")
        end
    end
end)