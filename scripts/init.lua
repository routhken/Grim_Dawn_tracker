ENABLE_DEBUG_LOG = false
IS_ITEMS_ONLY = false

ScriptHost:LoadScript("scripts/logic/logic.lua")

Tracker:AddItems("items/items.json")

Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")


-- if (string.find(Tracker.ActiveVariantUID,"standard")) then
--     Tracker:AddMaps("maps/maps.json")
--     Tracker:AddLocations("locations/locations.json")
--     Tracker:AddLayouts("layouts/broadcast.json")
--     Tracker:AddLayouts("layouts/tracker.json")
-- end

-- if (string.find(Tracker.ActiveVariantUID,"vertical")) then
--     Tracker:AddMaps("maps/maps_tall.json")
--     Tracker:AddLocations("locations/locations_tall.json")
--     Tracker:AddLayouts("layouts/broadcast.json")
--     Tracker:AddLayouts("layouts/tracker.json")
-- end

if (string.find(Tracker.ActiveVariantUID,"a_standard")) then
    Tracker:AddLayouts("layouts/items.json")
    Tracker:AddLayouts("layouts/tracker.json")
end

if (string.find(Tracker.ActiveVariantUID,"b_vertical")) then
    Tracker:AddLayouts("layouts/items_vertical.json")
    Tracker:AddLayouts("layouts/tracker_vertical.json")
end

if (string.find(Tracker.ActiveVariantUID,"c_items_only")) then
    Tracker:AddLayouts("layouts/items.json")
    Tracker:AddLayouts("layouts/tracker_items.json")
    IS_ITEMS_ONLY = true
end

Tracker:AddLayouts("layouts/map_layout.json")
Tracker:AddLayouts("layouts/act1.json")
Tracker:AddLayouts("layouts/act2.json")
Tracker:AddLayouts("layouts/act3.json")
Tracker:AddLayouts("layouts/act4.json")
Tracker:AddLayouts("layouts/act5.json")
Tracker:AddLayouts("layouts/act6.json")
Tracker:AddLayouts("layouts/act7.json")
Tracker:AddLayouts("layouts/settings.json")
--Tracker:AddLayouts("layouts/items.json")
--Tracker:AddLayouts("layouts/tracker.json")

if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end