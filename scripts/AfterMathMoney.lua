online_version = memory.scan_pattern("8B C3 33 D2 C6 44 24 20"):add(0x24):rip()
if tonumber(online_version:get_string()) == 3751.0 then 
    gui.show_message("AFTERMATH", "Money Methods From Popular Scripts + Menus.")

local CEO2=277644
local CEO3=277645
local CEO1=277877
local CHIP=1963515

local TransactionManager <const> = {};
TransactionManager.__index = TransactionManager

function TransactionManager.new()
    local instance = setmetatable({}, TransactionManager);
    instance.Transactions = {
        {label = "15M (Bend Job Limited)", hash = 0x176D9D54},
        {label = "15M (Bend Bonus Limited)", hash = 0xA174F633},
        {label = "7M (Gang Money Limited)", hash = 0xED97AFC1},
        {label = "3.6M (Casino Heist Money Limited)", hash = 0xB703ED29},
        {label = "2.5M (Gang Money Limited)", hash = 0x46521174},
        {label = "2.5M (Island Heist Money Limited)", hash = 0xDBF39508},
        {label = "2M (Heist Awards Money Limited)", hash = 0x8107BB89},
        {label = "2M (Tuner Robbery Money Limited)", hash = 0x921FCF3C},
        {label = "2M (Business Hub Money Limited)", hash = 0x4B6A869C},
        {label = "1M (Avenger Operations Money Limited)", hash = 0xE9BBC247},
        {label = "1M (Daily Objective Event Money Limited)", hash = 0x314FB8B0},
        {label = "1M (Daily Objective Money Limited)", hash = 0xBFCBE6B6},
        {label = "1M (Stealth 1 Million)", hash = 0x615762F1},
        {label = "680K (Betting Money Limited)", hash = 0xACA75AAE},
        {label = "500K (Juggalo Story Money Limited) [RISK]", hash = 0x05F2B7EE},
        {label = "310K (Vehicle Export Money Limited)", hash = 0xEE884170},
        {label = "200K (DoomsDay Finale Bonus Money Limited)", hash = 0xBA16F44B},
        {label = "200K (Action Figures Money Limited)",  hash = 0x9145F938},
        {label = "200K (Collectibles Money Limited)",    hash = 0xCDCF2380},
        {label = "190K (Vehicle Sales Money Limited)",   hash = 0xFD389995},
        {label = "50K (Stealth 50K)", hash = 0x610F9AB4}
    }
    return instance;
end

function TransactionManager:GetTransactionList()
    return self.Transactions;
end

function TransactionManager:GetCharacter()
    local _, char = STATS.STAT_GET_INT(joaat("MPPLY_LAST_MP_CHAR"), 0, 1)
    return tonumber(char);
end

function TransactionManager:GetPrice(hash, category)
    return tonumber(NETSHOPPING.NET_GAMESERVER_GET_PRICE(hash, 0x57DE404E, true))
end

function TransactionManager:TriggerTransaction(item_hash)
	script.execute_as_script("shop_controller", function()
		if NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
			NETSHOPPING.NET_GAMESERVER_BASKET_END()
		end
		local status, tranny_id = NETSHOPPING.NET_GAMESERVER_BEGIN_SERVICE(-1, 0x57DE404E, item_hash, 0x562592BB, self:GetPrice(item_hash), 2)
		if status then
			NETSHOPPING.NET_GAMESERVER_CHECKOUT_START(tranny_id)
		end
	end)
end

function TransactionManager:Init()
    local tab               = gui.get_tab("GUI_TAB_LUA_SCRIPTS")
    local chips             = tab:add_tab("GUI_TAB_LUA_SCRIPTS")
    local heist             = tab:add_tab("GUI_TAB_LUA_SCRIPTS")
    local crate             = tab:add_tab("GUI_TAB_LUA_SCRIPTS")
    local sub_atm           = tab:add_tab("GUI_TAB_LUA_SCRIPTS")
    local sub_transaction   = tab:add_tab("GUI_TAB_LUA_SCRIPTS")
    local checkboxwb        = sub_atm:add_checkbox("Transfer Wallet Money To Bank") 
    local checkbox50k       = sub_transaction:add_checkbox("50K Loop")
    local sameline          = sub_transaction:add_sameline()
    local checkbox100k      = sub_transaction:add_checkbox("100K Loop")
    local sameline          = sub_transaction:add_sameline()
    local checkbox180k      = sub_transaction:add_checkbox("180k Loop")
    local checkbox1m        = sub_transaction:add_checkbox("1M Loop")
    local sameline          = sub_transaction:add_sameline()
    local checkbox40m       = sub_transaction:add_checkbox("40M Loop")
    local bountyloop        = sub_transaction:add_checkbox("Bounty Loop")
    local checkboxc5k       = chips:add_checkbox("Enable Chip 5k Loop")
    local checkboxcc        = crate:add_checkbox("Enable Ceo Crate Loop")
    local sub_transactionL  = tab:add_tab("GUI_TAB_LUA_SCRIPTS")
    local cs = "appsecuroserv"
    local ci = "gb_contraband_sell"
    local cb = "gb_contraband_buy"
    local am = "am_mp_warehouse"
    local am2= "am_mp_peds"
    cratevalue = 0
    crate:add_imgui(function()
        cratevalue, used = ImGui.DragInt("Crate Value", cratevalue, 10000, 0, 6000000)
        if used then
            globals.set_int(CEO1, cratevalue)
        end
    end)

    chips:add_button("Chips set to 1000000000", function()
    script.run_in_fiber(function (script)
        STATS.STAT_SET_INT(joaat("MPPLY_CASINO_CHIPS_PUR_GD"), -1000000000, true)
    end)
    end)

    chips:add_button("Chips reset to 0", function()
    script.run_in_fiber(function (script)
        STATS.STAT_SET_INT(joaat("MPPLY_CASINO_CHIPS_PUR_GD"), 0, true)
    end)
    end)

    crate:add_button("Open Warehouse", function() SCRIPT.REQUEST_SCRIPT("apparcadebusinesshub") SYSTEM.START_NEW_SCRIPT("apparcadebusinesshub", 8344) end)
    script.register_looped("ceocrateloop", function (script)
        cratevalue = globals.get_int(CEO1)
        globals.set_int(CEO2, 0)
        globals.set_int(CEO3, 0)
        script:yield()

        if checkboxcc:is_enabled() == true then
            if locals.get_int(ci, 2) == 1 then
                locals.set_int(ci, 1158, 1)
                locals.set_int(ci, 618, 0)
                locals.set_int(ci, 1147, 0) 
                locals.set_int(ci, 570, 7)
                script:sleep(500)
                locals.set_int(ci, 564, 99999)  
            end
            if locals.get_int(cs, 2) == 1 then
                script:sleep(500)
                locals.set_int(cs, 760, 1)
                script:sleep(200)
                locals.set_int(cs, 759, 1)
                script:sleep(200)
                locals.set_int(cs, 560, 3012)
                script:sleep(1000)
            end
            if locals.get_int(cb, 2) == 1 then
                locals.set_int(cb, 626, 1)
                locals.set_int(cb, 622, 111)
                locals.set_int(cb, 812, 6)
                locals.set_int(cb, 813, 4)
                gui.show_message("Your Warehouse Is Now Full!")
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

    script.register_looped("1mtransaction", function(script)
        if(checkbox1m:is_enabled()) then
            self:TriggerTransaction(0x615762F1)
        end
    end)
    
    script.register_looped("180ktransaction", function(script)
        if(checkbox180k:is_enabled()) then
            self:TriggerTransaction(0x615762F1)
        end
    end)

    script.register_looped("100ktransaction", function(script)
        if(checkbox100k:is_enabled()) then 
            self:TriggerTransaction(0x68341DC5)
        end
    end)

    script.register_looped("50ktransaction", function(script)
        if(checkbox50k:is_enabled()) then
            self:TriggerTransaction(0x610F9AB4)
        end
    end)

    script.register_looped("bountyloop", function(script)
        if(bountyloop:is_enabled()) then 
            self:TriggerTransaction(0xC4F96E65)
            script:sleep(1000);
            self:TriggerTransaction(0x610F9AB4)
        end
    end)

    script.register_looped("40mtransaction", function(script)
        if(checkbox40m:is_enabled()) then
            self:TriggerTransaction(0x176D9D54)
            script.yield(3000)
            self:TriggerTransaction(0xED97AFC1, 7000000)
            script.yield(3000)
            self:TriggerTransaction(0xA174F633, 15000000)
            script.yield(3000)
            self:TriggerTransaction(0x314FB8B0, 1000000)
            script.yield(3000)
            self:TriggerTransaction(0x4B6A869C, 2000000)
            script.yield(40000)
        end
    end)

    script.register_looped("5kchiptransaction", function(script)
        if(checkboxc5k:is_enabled()) then
            globals.set_int(CHIP, 1)
	script.yield(3000)
        end
    end)
    
    script.register_looped("wallettobank", function(script)
        if(checkboxwb:is_enabled()) then
            NETSHOPPING.NET_GAMESERVER_TRANSFER_WALLET_TO_BANK(self:GetCharacter(), MONEY.NETWORK_GET_VC_WALLET_BALANCE(self:GetCharacter()))
        end
    end)
    
    for _, stealth in ipairs(self:GetTransactionList()) do
        sub_transactionL:add_button(stealth.label, function()
            self:TriggerTransaction(stealth.hash)
        end)
    end    
end

TransactionManager.new():Init()

else
  gui.show_message("AFTERMATH", "Aftermath Money is not up-to-date.\nPlease update the script!")
  updateD = gui.get_tab("GUI_TAB_LUA_SCRIPTS")
  updateD:add_text("Aftermath Money is not up-to-date.\nPlease update the script.")
end
