DragonNextLocation.MapPins = {}
DragonNextLocation.MapPins.__index = DragonNextLocation.MapPins

function DragonNextLocation.MapPins:new(dragon)
    local newMapPin = {
        dragon   = dragon,
        pinTag   = "",
        position = {-1, -1},
    }

    newMapPin.pinTag = string.format(
        "DragonNextLocation_Dragon%d",
        dragon.WEInstanceId
    )

    local newPinIdx = DragonNextLocation.MapPinsList.nbPin + 1
    DragonNextLocation.MapPinsList.pinList[newPinIdx] = newMapPin
    DragonNextLocation.MapPinsList.nbPin              = newPinIdx

    setmetatable(newMapPin, self)
    return newMapPin
end

function DragonNextLocation.MapPins:addPin()
    if not DragonNextLocation.libMapPins:IsEnabled(DragonNextLocation.MapPinsList.pinType) then
        return
    end

    if GetMapType() > MAPTYPE_ZONE then
        return
    end

    local currentZoneName = LibDragonWorldEvent.Zone.info.mapName
    local mapZoneName     = DragonNextLocation.libMapPins:GetZoneAndSubzone(true)

    if currentZoneName ~= mapZoneName then
        return
    end

    DragonNextLocation.libMapPins:CreatePin(
        DragonNextLocation.MapPinsList.pinType,
        self.pinTag,
        self.position[1],
        self.position[2]
    )
end

function DragonNextLocation.MapPins:changePosition(position)
    self.position = position
    DragonNextLocation.libMapPins:RefreshPins(DragonNextLocation.MapPinsList.pinType)
end

function DragonNextLocation.MapPins:hide()
    self.position = {-1, -1}
    DragonNextLocation.libMapPins:RefreshPins(DragonNextLocation.MapPinsList.pinType)
end
