EVENT_MANAGER:RegisterForEvent(DragonNextLocation.name, EVENT_ADD_ON_LOADED, DragonNextLocation.Events.onLoaded)
EVENT_MANAGER:RegisterForEvent(DragonNextLocation.name, EVENT_WORLD_EVENT_ACTIVE_LOCATION_CHANGED, DragonNextLocation.Events.onWELocChanged)

LibDragonWorldEvent.Events.callbackManager:RegisterCallback(
    LibDragonWorldEvent.Events.callbackEvents.dragon.new,
    DragonNextLocation.Events.onNewDragon
)
LibDragonWorldEvent.Events.callbackManager:RegisterCallback(
    LibDragonWorldEvent.Events.callbackEvents.dragon.waiting,
    DragonNextLocation.Events.onDragonWaiting
)
