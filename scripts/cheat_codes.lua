local cheat_handler = memory.scan_pattern("40 55 41 54 41 55 41 56 41 57 48 83 EC ? 48 8D 6C 24 ? 48 89 5D ? 48 8D 0D")

local cheat_handler_patch = cheat_handler:add(53):patch_byte({0xE9, 0x1A, 0x00, 0x00, 0x00})
cheat_handler_patch:apply()

cheat_controller_patch1 = scr_patch:new("cheat_controller", "ACCIMP1", "2D 00 02 00 00 71 2C", 5, {0x2E, 0x00, 0x00})
cheat_controller_patch2 = scr_patch:new("freemode", "ACCIMP2", "2C ? ? ? 2C ? ? ? 2C ? ? ? 06 56 ? ? 25", 0, {0x00, 0x00, 0x00, 0x00})

event.register_handler(menu_event.ScriptsReloaded, function()
    cheat_controller_patch1:disable_patch()
    cheat_controller_patch2:disable_patch()
end)

script.register_looped("Cheat Codes", function(sc)
    globals.set_int(33336, 0) -- Disable all "IS_CHEAT_DISABLED" bits
    globals.set_int(33338, 0) -- Bypass Achievement Disabler
    if not script.is_active("cheat_controller") then
        repeat
            SCRIPT.REQUEST_SCRIPT("cheat_controller")
            sc:yield()
        until SCRIPT.HAS_SCRIPT_LOADED("cheat_controller")
        SYSTEM.START_NEW_SCRIPT("cheat_controller", 1424)
        SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED("cheat_controller")
    end
end)