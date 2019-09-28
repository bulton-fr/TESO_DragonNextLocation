DragonNextLocation = {}

DragonNextLocation.name       = "DragonNextLocation"
DragonNextLocation.ready      = false
DragonNextLocation.savedVars  = nil
DragonNextLocation.libMapPins = LibMapPins

if LibMapPins == nil and LibStub then
    DragonNextLocation.libMapPins = LibStub("LibMapPins-1.0")
end

--[[
-- Addon initialiser
--]]
function DragonNextLocation:Initialise()
    DragonNextLocation.savedVars = ZO_SavedVars:NewAccountWide("DragonNextLocationSavedVariables", 1, nil, {})

    if DragonNextLocation.savedVars.mapPinsFilters == nil then
        DragonNextLocation.savedVars.mapPinsFilters = true
    end

    DragonNextLocation.MapPinsList:initialise()
    DragonNextLocation.ready = true
end
