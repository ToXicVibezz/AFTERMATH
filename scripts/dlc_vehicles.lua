patch1 = scr_patch:new("appinternet", "TVPB", "59 ? ? 72 2E 02 01", 0, {0x2B, 0x00, 0x00})
patch2 = scr_patch:new("appinternet", "HTVB", "56 ? ? 70 2E 04 01 38 01", 0, {0x55})
patch3 = scr_patch:new("appinternet", "ABTV", "5D ? ? ? 06 56 ? ? 38 00 25 ? 50", 5, {0x55})

event.register_handler(menu_event.ScriptsReloaded, function()
    patch1:disable_patch()
    patch2:disable_patch()
    patch3:disable_patch()
end)