# Dragon Next Location

It's an addon for [The Elder Scroll Online](https://www.elderscrollsonline.com) which display the next location of dragons in Elsweyr when they're flying.

## Dependencies

Two libraries :

* [`LibWorldEvents`](https://www.esoui.com/downloads/info2473-LibWorldEvents.html)
* [`LibMapPins-1.0`](https://www.esoui.com/downloads/info563-LibMapPins.html)

## Install it

Into the addon folder (`Elder Scrolls Online\live\AddOns` in your document folder), you need to have a folder `DragonNextLocation` and copy all files into it.

So you can :

* Clone the repository in the AddOns folder and name it `DragonNextLocation`.
* Or download the zip file started by `esoui-` of the last release in github, and extract it in the AddOns folder.

## In game

Go to Elsweyr, wait a dragon appear or start to fly, open your map, and you will see an icon at the next location of the dragon.

![North dragon in north elsweyr](https://projects.bulton.fr/teso/DragonNextLocation/DragonNextLocationNorth.jpg)  
![South dragon in north elsweyr](https://projects.bulton.fr/teso/DragonNextLocation/DragonNextLocationSouth.jpg)
![West dragon in north elsweyr](https://projects.bulton.fr/teso/DragonNextLocation/DragonNextLocationWest.jpg)

## API usage

A dragon is a "World Event" in the API, so we use some event on WorldEvents.

Game Events triggered :

* `EVENT_ADD_ON_LOADED` : When the addon is loaded
* `EVENT_WORLD_EVENT_ACTIVE_LOCATION_CHANGED` : When a dragon start to fly to go at a different location

`LibWorldEvents` events triggered :

* `LibWorldEvents.Events.callbackEvents.dragon.new` : When a new dragon instance is created.
* `LibWorldEvents.Events.callbackEvents.dragon.landed` : When a dragon has landed.

## About lua files

There are loaded in order :

* Initialise.lua
* Events.lua
* MapPinsList.lua
* MapPins.lua
* Zone.lua
* Run.lua

### Initialise.lua

Declare all variables and the initialise function.

Declared variables :

* `DragonNextLocation` : The global table for all addon's properties and methods.
* `DragonNextLocation.name` : The addon name
* `DragonNextLocation.ready` : If the addon is ready to be used
* `DragonNextLocation.savedVars` : The `ZO_SavedVars` table which contains saved variable for this addon. Used by LibMapPins filters.
* `DragonNextLocation.libMapPins` : The `LibMapPins-1.0` library

### Events.lua

Table : `DragonNextLocation.Events`

Contain all functions called when a listened event is triggered.

* `DragonNextLocation.Events.onLoaded` : Called when the addon is loaded
* `DragonNextLocation.Events.onNewDragon` : Called when a new dragon instance is created
* `DragonNextLocation.Events.onWELocChanged` : Called when a dragon start to fly to go at a different location
* `DragonNextLocation.Events.onDragonLanded` : Called when a dragon has landed

### MapPinsList.lua

Table : `DragonNextLocation.MapPinsList`

Contains all functions to manages all pins created.

Properties :

* `pinType` : The pinType for dragonNextLocation pins
* `pinTypeId` : The pinTypeId returned by LibMapPins
* `pinList` : The list of all pins created.
* `nbPin` : Number of items in `pinList`.

Methods :

* `DragonNextLocation.MapPinsList:initialise` : Declare the pinType with LibMapPins, and add the pin filter.
* `DragonNextLocation.MapPinsList:onMapChange` : Called when a map is displayed to add pins on the map.  
When the player open the map, the method is called.  
When the player change map to go in subzone or parent zone, the method is called.

### MapPins.lua

Table : `DragonNextLocation.MapPins`

Contain all data to create a pins on the map.

Properties :

* `dragon` : The Dragon instance linked to the MapPins
* `pinTag` : The pinTag used for the pins corresponding to `dragon`.
* `position` : The position of the pins on the map.

Methods :

* `DragonNextLocation.MapPins:new` : To instanciate a new MapPins instance
* `DragonNextLocation.MapPins:addPin` : To add the pin on the map
* `DragonNextLocation.MapPins:changePosition` : Change the pins position
* `DragonNextLocation.MapPins:hide` : Hide the pins

### Zone.lua

Table : `DragonNextLocation.Zone`

Contains all possible positions of each dragons.

Property :

* `positionList` : All possition position for each dragons in Elsweyr zones.

Method :

* `DragonNextLocation.Zone.obtainPosition` : To transform a dragon and locationId to a x/y normalized position.

### Run.lua

Define a listener to all used events.
