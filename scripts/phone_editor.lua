local phone_editor_tab = gui.get_tab("GUI_TAB_LUA_SCRIPTS")

local selected_phone = 0;
local selected_os = 0;
local phone_anims_another_script = false;
local enable_phone_anims = false;
local restore_sp_funcs = false;

local phones_list = {
    {title = "iFruit", id = 0},
    {title = "Facade", id = 1},
    {title = "bitterSweet", id = 2},
    {title = "Unused Phone", id = 3},
    {title = "Celltowa", id = 4}
}

local os_list = {
    {title = "FruitOS", movie = "CELLPHONE_IFRUIT"},
    {title = "Facade", movie = "CELLPHONE_FACADE"},
    {title = "Drone", movie = "CELLPHONE_BADGER"},
    {title = "Celltowa", movie = "CELLPHONE_PROLOGUE"}
}

function CallScaleformFunction(scaleform, does_return_data, the_function, ...)
    GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, the_function)
    local args = {...}
    if args ~= nil then
        for i = 1,#args do
            local arg_type = type(args[i])
            if arg_type == "boolean" then
                GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(args[i])
            elseif arg_type == "number" then
                if not string.find(args[i], '%.') then
                    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(args[i])
                else
                    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(args[i])
                end
            elseif arg_type == "string" then
                GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_TEXTURE_NAME_STRING(args[i])
            end
        end
        if not does_return_data then
            GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
        else
            return GRAPHICS.END_SCALEFORM_MOVIE_METHOD_RETURN_VALUE()
        end
    end
end

local phones_titles = {}
for _, phone in ipairs(phones_list) do
    table.insert(phones_titles, phone.title)
end
local os_titles = {}
for _, os in ipairs(os_list) do
    table.insert(os_titles, os.title)
end

script.register_looped("Phone Editor", function()
    local phone_id = phones_list[selected_phone + 1].id
    local os_movie = GRAPHICS.REQUEST_SCALEFORM_MOVIE(os_list[selected_os + 1].movie)
    if script.is_active("cellphone_flashhand") then
        MOBILE.CREATE_MOBILE_PHONE(phone_id)
        globals.set_int(20911, os_movie)
        if phone_id == 1 then
            if globals.get_int(4543360) == 1 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 5);
            elseif globals.get_int(4543360) == 2 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 6);
            elseif globals.get_int(4543360) == 3 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 1);
            elseif globals.get_int(4543360) == 4 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 0);
            elseif globals.get_int(4543360) == 5 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 2);
            elseif globals.get_int(4543360) == 6 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 3);
            elseif globals.get_int(4543360) == 7 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 4);
            end
        elseif phone_id == 2 then
            if globals.get_int(4543360) == 1 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 6);
            elseif globals.get_int(4543360) == 2 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 0);
            elseif globals.get_int(4543360) == 3 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 1);
            elseif globals.get_int(4543360) == 4 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 2);
            elseif globals.get_int(4543360) == 5 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 3);
            elseif globals.get_int(4543360) == 6 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 4);
            elseif globals.get_int(4543360) == 7 then
                PLAYER.SET_PLAYER_PHONE_PALETTE_IDX(PLAYER.PLAYER_ID(), 5);
            end
        end
        if globals.get_int(79389) == 1 then
            if enable_phone_anims and not phone_anims_another_script then
                if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 242, true) then
                    PED.SET_PED_CONFIG_FLAG(self.get_ped(), 242, false)
                end
                if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 243, true) then
                    PED.SET_PED_CONFIG_FLAG(self.get_ped(), 243, false)
                end
                if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 244, true) then
                    PED.SET_PED_CONFIG_FLAG(self.get_ped(), 244, false)
                end
            elseif not phone_anims_another_script then
                PED.SET_PED_CONFIG_FLAG(self.get_ped(), 242, true)
                PED.SET_PED_CONFIG_FLAG(self.get_ped(), 243, true)
                PED.SET_PED_CONFIG_FLAG(self.get_ped(), 244, true)
            end
            if restore_sp_funcs then
                if PAD.IS_CONTROL_JUST_PRESSED(2, 172) then
                    MOBILE.CELL_SET_INPUT(1);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 173) then
                    MOBILE.CELL_SET_INPUT(2);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 174) then
                    MOBILE.CELL_SET_INPUT(3);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 175) then
                    MOBILE.CELL_SET_INPUT(4);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 176) then
                    MOBILE.CELL_SET_INPUT(5);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 177) then
                    MOBILE.CELL_SET_INPUT(5);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 178) then
                    MOBILE.CELL_SET_INPUT(5);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 179) then
                    MOBILE.CELL_SET_INPUT(5);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 180) then
                    MOBILE.CELL_SET_INPUT(1);
                end
                if PAD.IS_CONTROL_JUST_PRESSED(2, 181) then
                    MOBILE.CELL_SET_INPUT(2);
                end
                if script.is_active("appMPEmail") then
                    MOBILE.CELL_HORIZONTAL_MODE_TOGGLE(true)
                else
                    MOBILE.CELL_HORIZONTAL_MODE_TOGGLE(false)
                end
                if AUDIO.IS_MOBILE_PHONE_CALL_ONGOING() then
                    TASK.TASK_USE_MOBILE_PHONE(self.get_ped(), true, 1)
                end
            end
        end
    else
        MOBILE.DESTROY_MOBILE_PHONE()
        if GRAPHICS.HAS_SCALEFORM_MOVIE_LOADED(os_movie) then
            CallScaleformFunction(os_movie, false, "SHUTDOWN_MOVIE")
        end
        GRAPHICS.SET_SCALEFORM_MOVIE_AS_NO_LONGER_NEEDED(os_movie)
    end
end)

phone_editor_tab:add_imgui(function()
    ImGui.Text("Phone")
    ImGui.SameLine()
    if ImGui.IsItemHovered(ImGui.TextColored(0.7, 0.7, 0.7, 1, "(info)")) then
        ImGui.BeginTooltip()
        ImGui.Text("Select phone model to be used for player.")
        ImGui.Text(" iFruit - iPhone parody, used by Michael, online player and all other peds by default")
        ImGui.Text(" Facade - Microsoft/Nokia Lumia parody, used by Trevor")
        ImGui.Text(" bitterSweet - Samsung parody, used by Franklin")
        ImGui.Text(" Unused phone - Looks like it's armored or something, unused")
        ImGui.Text(" Celltowa - Old cellphone, used by Michael in prologue")
        ImGui.EndTooltip()
    end
    selected_phone = ImGui.Combo("##selected_phone", selected_phone, phones_titles, #phones_list)
    ImGui.Text("Phone's OS")
    ImGui.SameLine()
    if ImGui.IsItemHovered(ImGui.TextColored(0.7, 0.7, 0.7, 1, "(info)")) then
        ImGui.BeginTooltip()
        ImGui.Text("Select an operating system to be used for player's phone.")
        ImGui.Text(" FruitOS - iOS parody, used in iFruit phone")
        ImGui.Text(" Facade - Windows Phone parody, used in Facade phone")
        ImGui.Text(" Drone - Android parody, used in bitterSweet phone")
        ImGui.Text(" Celltowa - Celltowa's phone OS")
        ImGui.Text("Notes:")
        ImGui.Text(" SecuroServ app in all systems except FruitOS doesn't have interface, but app is still usable")
        ImGui.Text(" Celltowa's phone OS only has one app and I don't know which one, could be contacts as well as job list")
        ImGui.Text(" Crew emblem wallpaper works only on FruitOS")
        ImGui.Text(" Wallpaper setting on Facade OS is useless")
        ImGui.EndTooltip()
    end
    selected_os = ImGui.Combo("##selected_os", selected_os, os_titles, #os_list)
    if not enable_phone_anims then
        phone_anims_another_script = ImGui.Checkbox("Phone Anims Enabled in other script", phone_anims_another_script)
        ImGui.SameLine()
        if ImGui.IsItemHovered(ImGui.TextColored(0.7, 0.7, 0.7, 1, "(info)")) then
            ImGui.BeginTooltip()
            ImGui.Text("Because some scripts like Samurai's has it's own phone animations function, it will conflict with this script's function,")
            ImGui.Text("so if you installed a script that already has a phone animations function, use it, and please check this.")
            ImGui.EndTooltip()
        end
    end
    if not phone_anims_another_script then
        enable_phone_anims = ImGui.Checkbox("Enable Phone Animations", enable_phone_anims)
        ImGui.SameLine()
        if ImGui.IsItemHovered(ImGui.TextColored(0.7, 0.7, 0.7, 1, "(info)")) then
            ImGui.BeginTooltip()
            ImGui.Text("Makes so player's ped actually uses phone like in singleplayer")
            ImGui.EndTooltip()
        end
    end
    if enable_phone_anims or phone_anims_another_script then
        restore_sp_funcs = ImGui.Checkbox("Restore Singleplayer Functions", restore_sp_funcs)
        ImGui.SameLine()
        if ImGui.IsItemHovered(ImGui.TextColored(0.7, 0.7, 0.7, 1, "(info)")) then
            ImGui.BeginTooltip()
            ImGui.Text("Recreates singleplayer's phone functions like finger moving, phone leaning in email app etc.")
            ImGui.EndTooltip()
        end
    end
end)