DragonNextLocation.MapPins = {}
DragonNextLocation.MapPins.__index = DragonNextLocation.MapPins

DragonNextLocation.MapPins.pinType   = "DRAGON_NEXT_LOCATION_PIN_TYPE_DRAGON"
DragonNextLocation.MapPins.pinTypeId = nil

function DragonNextLocation.MapPins:initialise()
    local pinLayoutData = {
        level = 50,
        texture = "DragonNextLocation/textures/dragonNextLocation.dds",
        size = 35,
    }

    -- lib:AddPinType(pinTypeString, pinTypeAddCallback, pinTypeOnResizeCallback, pinLayoutData, pinTooltipCreator)
    self.pinTypeId = DragonNextLocation.libMapPins:AddPinType(
        self.pinType,
        function() end,
        nil,
        pinLayoutData,
        "Next dragon position"
    )
end

function DragonNextLocation.MapPins:new(dragon)
    local newMapPin = {
        dragon = dragon,
        pinTag = "",
        pin    = nil
    }

    newMapPin.pinTag = string.format(
        "DragonNextLocation_Dragon%d",
        dragon.WEInstanceId
    )

    setmetatable(newMapPin, self)
    return newMapPin
end

function DragonNextLocation.MapPins:addPinsToLocationId(locationId)
    if not DragonNextLocation.libMapPins:IsEnabled(self.pinType) then
        return
    end

    if GetMapType() > MAPTYPE_ZONE then
        return
    end

    local position = DragonNextLocation.Zone:obtainPosition(self.dragon, locationId)
    self.pin       = DragonNextLocation.libMapPins:CreatePin(
        self.pinType,
        self.pinTag,
        position[1],
        position[2]
    )
end

function DragonNextLocation.MapPins:hidePins()
    DragonNextLocation.libMapPins:RemoveCustomPin(
        self.pinType,
        self.pinTag
    )
end
