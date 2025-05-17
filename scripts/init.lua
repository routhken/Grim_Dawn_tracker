ENABLE_DEBUG_LOG = false

ScriptHost:LoadScript("scripts/logic/logic.lua")

Tracker:AddItems("items/items.json")

Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")

Tracker:AddLayouts("layouts/map_layout.json")
Tracker:AddLayouts("layouts/act1.json")
Tracker:AddLayouts("layouts/act2.json")
Tracker:AddLayouts("layouts/act3.json")
Tracker:AddLayouts("layouts/act4.json")
Tracker:AddLayouts("layouts/act5.json")
Tracker:AddLayouts("layouts/act6.json")
Tracker:AddLayouts("layouts/act7.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/tracker.json")

if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end