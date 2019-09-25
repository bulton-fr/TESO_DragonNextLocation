DragonNextLocation = {}

DragonNextLocation.name       = "DragonNextLocation"
DragonNextLocation.ready      = false
DragonNextLocation.libMapPins = LibMapPins

if LibMapPins == nil and LibStub then
    DragonNextLocation.libMapPins = LibStub("LibMapPins-1.0")
end

--[[
-- Module initialiser
--]]
function DragonNextLocation:Initialise()
    DragonNextLocation.MapPins:initialise()
    DragonNextLocation.ready = true
end
