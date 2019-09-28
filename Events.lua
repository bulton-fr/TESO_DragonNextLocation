DragonNextLocation.Events = {}

--[[
-- Called when the addon is loaded
--
-- @param number eventCode
-- @param string addonName name of the loaded addon
--]]
function DragonNextLocation.Events.onLoaded(eventCode, addOnName)
    -- The event fires each time *any* addon loads - but we only care about when our own addon loads.
    if addOnName == DragonNextLocation.name then
        DragonNextLocation:Initialise()
    end
end

function DragonNextLocation.Events.onNewDragon(dragon)
    dragon.mapPins = DragonNextLocation.MapPins:new(dragon)
end

function DragonNextLocation.Events.onWELocChanged(eventCode, worldEventInstanceId, oldWorldEventLocationId, newWorldEventLocationId)
    if DragonNextLocation.ready == false then
        return
    end

    local dragon = LibDragonWorldEvent.DragonList:obtainForWEInstanceId(worldEventInstanceId)
    if dragon == nil then -- no all loaded
        return
    end
    
    local position = DragonNextLocation.Zone:obtainPosition(self.dragon, newWorldEventLocationId)
    dragon.mapPins:changePosition(position)
end

function DragonNextLocation.Events.onDragonLanded(dragon)
    if DragonNextLocation.ready == false then
        return
    end

    dragon.mapPins:hide()
end
