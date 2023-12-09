CEO2=277873
CEO3=277874
CEO1=278108
gui.show_error("YIMCEO v0.5 Script by Slon")
local cs = "appsecuroserv"
local ci = "gb_contraband_sell"
local cb = "gb_contraband_buy"
local am = "am_mp_warehouse"
local am2= "am_mp_peds"
local ucv = "GUI_TAB_LUA_SCRIPTS"
ult = gui.get_tab(ucv)
cratevalue = 0
ult:add_text("YimCeo v0.5 - Slon")
ult:add_imgui(function()
    cratevalue, used = ImGui.DragInt("Value", cratevalue, 10000, 0, 6000000)
    if used then
        globals.set_int(CEO1, cratevalue)
    end
end)
checkbox = ult:add_checkbox("Enable YimCeo")
ult:add_button("Open Warehouse", function() SCRIPT.REQUEST_SCRIPT("apparcadebusinesshub") SYSTEM.START_NEW_SCRIPT("apparcadebusinesshub", 8344) end)
script.register_looped("yimceoloop", function (script)
    cratevalue = globals.get_int(CEO1)
    globals.set_int(CEO2, 0)
    globals.set_int(CEO3, 0)
    script:yield()

    if checkbox:is_enabled() == true then
        if locals.get_int(ci, 2) == 1 then
            locals.set_int(ci, 1136, 1)
            locals.set_int(ci, 596, 0)
            locals.set_int(ci, 1125, 0) 
            locals.set_int(ci, 548, 7)
            script:sleep(500)
            locals.set_int(ci, 542, 99999)  
        end
        if locals.get_int(cs, 2) == 1 then
            script:sleep(500)
            locals.set_int(cs, 737, 1)
            script:sleep(200)
            locals.set_int(cs, 738, 1)
            script:sleep(200)
            locals.set_int(cs, 556, 3012)
            script:sleep(1000)
        end
        if locals.get_int(cb, 2) == 1 then
            locals.set_int(cb, 604, 1)
            locals.set_int(cb, 600, 111)
            locals.set_int(cb, 790, 6)
            locals.set_int(cb, 791, 4)
            gui.show_message("Ur Warehouse is now full!")
        end
        if locals.get_int(ci, 2) ~= 1 then  
            script:sleep(500)
            if locals.get_int(am, 2) == 1 then
                SCRIPT.REQUEST_SCRIPT("appsecuroserv")
                SYSTEM.START_NEW_SCRIPT("appsecuroserv", 8344)
                SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED("appsecuroserv")
            end
        end
    end
    script:sleep(500)
end)