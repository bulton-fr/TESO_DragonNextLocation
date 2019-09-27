DragonNextLocation.MapPinsList = {}
DragonNextLocation.MapPinsList.pinType   = "DRAGON_NEXT_LOCATION_PIN_TYPE_DRAGON"
DragonNextLocation.MapPinsList.pinTypeId = nil
DragonNextLocation.MapPinsList.pinList   = {}
DragonNextLocation.MapPinsList.nbPin     = 0

function DragonNextLocation.MapPinsList:initialise()
    local pinLayoutData = {
        level = 50,
        texture = "DragonNextLocation/textures/dragonNextLocation.dds",
        size = 35,
    }

    self.pinTypeId = DragonNextLocation.libMapPins:AddPinType(
        self.pinType,
        self.onMapChange,
        nil,
        pinLayoutData,
        "Next dragon position"
    )

    DragonNextLocation.libMapPins:AddPinFilter(
        self.pinTypeId,
        "Dragon next location",
        false,
        DragonNextLocation.savedVars,
        "mapPinsFilters"
    )
end

function DragonNextLocation.MapPinsList.onMapChange()
    local pinIndex    = 1
    local pinInstance = nil

    for pinIndex = 1, DragonNextLocation.MapPinsList.nbPin do
        pinInstance = DragonNextLocation.MapPinsList.pinList[pinIndex]
        
        if pinInstance ~= nil then
            pinInstance:addPin()
        end
    end
end
