local is_content_item_locked = memory.scan_pattern("89 54 24 ? 48 83 EC ? 85 D2")

-- Get more hashes from freemode.
local G9EC_LOCK_HASHES = {
    [joaat("CU_SUM24_CLOTHES_G9EC")] = true,
    [joaat("CU_SUM24_MASKS_G9EC")]   = true,
    [joaat("CU_X23_MASKS_G9EC")]     = true,
    [joaat("CU_X23_CLOTHES_G9EC")]   = true,
    [joaat("CU_SUM23_MASKS_G9EC")]   = true,
    [joaat("CU_SUM23_CLOTHES_G9EC")] = true,
    [joaat("CU_X22_MASKS_G9EC")]     = true,
    [joaat("CU_X22_CLOTHES_G9EC")]   = true,
    [joaat("CU_SUM2_G9EC_MASKS")]    = true,
    [joaat("CU_SUM2_G9EC_CLOTHES")]  = true
}

memory.dynamic_hook("is_content_item_locked", "bool", { "int64_t", "int" }, is_content_item_locked,
function(ret_val, this, hash)
    local item_hash = hash:get()
    if G9EC_LOCK_HASHES[item_hash] then
        ret_val:set(false)
        return false
    end
    return true
end,
function(ret_val, this, hash)
end)