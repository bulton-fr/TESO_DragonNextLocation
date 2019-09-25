DragonNextLocation.Zone = {}

DragonNextLocation.Zone.positionList = {
    [680] = { -- North Elsweyr
        dragons = {
            [1] = {
                [1] = {55.58, 55.07},
                [2] = {58.35, 52.58},
                [3] = {51.74, 55.06},
                [4] = {54.41, 58.89},
                [5] = {52.25, 66.71}
            },
            [2] = {
                [6] = {46.67, 32.79},
                [7] = {43.55, 27.16},
                [8] = {42.37, 31.31},
                [9] = {44.16, 38.12},
            },
            [3] = {
                [10] = {27.12, 61.11},
                [11] = {29.85, 57.84},
                [12] = {31.07, 62.55},
                [13] = {25.72, 64.03},
            }
        }
    },
    [719] = { -- South Elsweyr
        dragons = {
            [12] = {
                [22] = {0.4345, 0.3343},
                [23] = {0.3252, 0.3894},
                [24] = {0.3067, 0.2914},
                [28] = {0.3702, 0.3206},
            },
            [13] = {
                [25] = {0.5042, 0.6478},
                [26] = {0.6001, 0.5716},
                [27] = {0.6507, 0.5914},
                [29] = {0.5734, 0.6105},
            }
        }
    }
}

function DragonNextLocation.Zone:obtainPosition(dragon, locationId)
    local currentZoneId = LibDragonWorldEvent.Zone.info.mapZoneIdx
    local WEInstanceId  = dragon.WEInstanceId

    return self.positionList[currentZoneId].dragons[WEInstanceId][locationId]
end
