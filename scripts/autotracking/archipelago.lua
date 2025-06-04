ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")


CURRENT_INDEX = -1

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

function onClear(slotData)
    CURRENT_INDEX = -1

    -- Reset Locations
    for _, layoutLocationPath in pairs(LOCATION_MAPPING) do

        if  layoutLocationPath and layoutLocationPath[1] then
            
            for _,layoutLocationElement in pairs(layoutLocationPath) do
                local layoutLocationObject = Tracker:FindObjectForCode(layoutLocationElement)

                if layoutLocationObject then
                    if layoutLocationElement:sub(1, 1) == "@" then
                        layoutLocationObject.AvailableChestCount = layoutLocationObject.ChestCount
                    else
                        layoutLocationObject.Active = false
                    end
                end
            end
        end
    end

    -- Reset Items
    for _, layoutItemData in pairs(ITEM_MAPPING) do
        if layoutItemData[1] and layoutItemData[2] then
            local layoutItemObject = Tracker:FindObjectForCode(layoutItemData[1])

            if layoutItemObject then
                if layoutItemData[2] == "toggle" then
                    layoutItemObject.Active = false
                elseif layoutItemData[2] == "progressive" then
                    layoutItemObject.CurrentStage = 0
                    layoutItemObject.Active = false
                elseif layoutItemData[2] == "consumable" then
                    layoutItemObject.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: Unknown item type %s for code %s", layoutItemData[2], layoutItemData[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: Could not find object for code %s", layoutItemData[1]))
            end
        end
    end

    -- Reset Settings
    Tracker:FindObjectForCode("goal_option").Active = true
    Tracker:FindObjectForCode("goal_korvaak").Active = false
    Tracker:FindObjectForCode("goal_swarm_queen_ravna").Active = false
    Tracker:FindObjectForCode("goal_loghorrean").Active = false
    Tracker:FindObjectForCode("goal_master_of_flesh").Active = false
    Tracker:FindObjectForCode("goal_all_bosses").Active = false
    Tracker:FindObjectForCode("goal_emblem_hunt").Active = false

    --print("Slotdata: ") --debug
    --print(dump(slotData)) --debug

    if slotData['goal'] then
        local goalValue = slotData['goal']
        local goalTrackerKey = nil
        local goalValueIndex = 0
        print("goalValue: " .. goalValue) --debug

        if      goalValue == 0 then
            goalTrackerKey = "goal_warden_krieg"
        elseif  goalValue == 1 then
            goalTrackerKey = "goal_korvaak"
        elseif  goalValue == 2 then
            goalTrackerKey = "goal_swarm_queen_ravna"
        elseif  goalValue == 3 then
            goalTrackerKey = "goal_loghorrean"
        elseif  goalValue == 4 then
            goalTrackerKey = "goal_master_of_flesh"
        elseif  goalValue == 50 then
            goalTrackerKey = "goal_all_bosses"
        elseif  goalValue == 51 then
            goalTrackerKey = "goal_emblem_hunt"
        end
        
        if      goalValue == 0 then
            goalValueIndex = 0
        elseif  goalValue == 1 then
            goalValueIndex = 1
        elseif  goalValue == 2 then
            goalValueIndex = 2
        elseif  goalValue == 3 then
            goalValueIndex = 3
        elseif  goalValue == 4 then
            goalValueIndex = 4
        elseif  goalValue == 50 then
            goalValueIndex = 5
        elseif  goalValue == 51 then
            goalValueIndex = 6
        end

        print("goalTrackerKey: " .. goalTrackerKey) --debug
        if goalTrackerKey then
            --local goalTrackerObject = Tracker:FindObjectForCode(goalTrackerKey)
            Tracker:FindObjectForCode("goal_option").CurrentStage = goalValueIndex
            --goalTrackerObject.Active = true
        end
    end

    Tracker:FindObjectForCode("setting_devotion_shrine").Active = false
    Tracker:FindObjectForCode("setting_forbidden_dungeons").Active = false
    Tracker:FindObjectForCode("setting_secret_chest").Active = false
    Tracker:FindObjectForCode("setting_one_shot_chest").Active = false
    Tracker:FindObjectForCode("setting_lore_note").Active = false
    Tracker:FindObjectForCode("setting_deathlink").Active = false
    Tracker:FindObjectForCode("setting_faction").Active = false
    Tracker:FindObjectForCode("setting_fgdlc").Active = false
    Tracker:FindObjectForCode("setting_skill_rando").Active = false
    Tracker:FindObjectForCode("setting_enemy_rando").Active = false
    Tracker:FindObjectForCode("setting_free_respec").Active = false
    Tracker:FindObjectForCode("setting_starting_bonus").Active = false
    Tracker:FindObjectForCode("setting_prog_prog").Active = false
    Tracker:FindObjectForCode("setting_aomdlc").Active = false
    Tracker:FindObjectForCode("goal_max_emblems").CurrentStage = 0
    Tracker:FindObjectForCode("goal_req_emblems").CurrentStage = 0

    if slotData['deathlink'] == 1 then
        Tracker:FindObjectForCode("setting_deathlink").Active = true
    end
    if slotData['forbidden_dungeons'] == 1 then
        Tracker:FindObjectForCode("setting_forbidden_dungeons").Active = true
    end
    if slotData['one_shot'] == 1 then
        Tracker:FindObjectForCode("setting_one_shot_chest").Active = true
    end
    if slotData['secret_chest'] == 1 then
        Tracker:FindObjectForCode("setting_secret_chest").Active = true
    end
    if slotData['devotion_shrine'] == 1 then
        Tracker:FindObjectForCode("setting_devotion_shrine").Active = true
    end
    if slotData['lore'] == 1 then
        Tracker:FindObjectForCode("setting_lore_note").Active = true
    end
    if slotData['faction'] == 1 then
        Tracker:FindObjectForCode("setting_faction").Active = true
    end
    if slotData['dlc_fg'] == 1 then
        Tracker:FindObjectForCode("setting_fgdlc").Active = true
    end
    if slotData['goal'] == 51 then
        Tracker:FindObjectForCode("goal_max_emblems").AcquiredCount = slotData['max_emblems']
        Tracker:FindObjectForCode("goal_req_emblems").AcquiredCount = slotData['required_emblems']
    end
    if slotData['skill_balance_randomizer'] == 1 then
        Tracker:FindObjectForCode("setting_skill_rando").Active = true
    end
    if slotData['enemy_randomizer'] == 1 then
        Tracker:FindObjectForCode("setting_enemy_rando").Active = true
    end
    if slotData['free_skill_respec'] == 1 then
        Tracker:FindObjectForCode("setting_free_respec").Active = true
    end
    if slotData['starting_skill_points'] == 1 then
        Tracker:FindObjectForCode("setting_starting_bonus").Active = true
    end
    if slotData['progressive_progression'] == 1 then
        Tracker:FindObjectForCode("setting_prog_prog").Active = true
    end
    if slotData['dlc_aom'] == 1 then
        Tracker:FindObjectForCode("setting_aomdlc").Active = true
    end
end


function onItem(index, itemId, itemName, playerNumber)
    if index <= CURRENT_INDEX then
        return
    end

    CURRENT_INDEX = index

    local itemObject = ITEM_MAPPING[itemId]
    
    if not itemObject or not itemObject[1] then
        return
    end

    local trackerItemObject = Tracker:FindObjectForCode(itemObject[1])

    if trackerItemObject then
        if itemObject[2] == "toggle" then
            trackerItemObject.Active = true
        elseif itemObject[2] == "progressive" then
            if trackerItemObject.Active then
                trackerItemObject.CurrentStage = trackerItemObject.CurrentStage + 1
            else
                trackerItemObject.Active = true
            end
        elseif itemObject[2] == "consumable" then
            trackerItemObject.AcquiredCount = trackerItemObject.AcquiredCount + trackerItemObject.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: Unknown item type %s for code %s", itemObject[2], itemObject[1]))
        end
    else
        print(string.format("onItem: Could not find object for code %s", itemObject[1]))
    end
end


function onLocation(locationId, locationName)
    local locationObject = LOCATION_MAPPING[locationId]

    if not locationObject or not locationObject[1] then
        return
    end

    for _,layoutLocationElement in pairs(locationObject) do

        local trackerLocationObject = Tracker:FindObjectForCode(layoutLocationElement)

        if trackerLocationObject then
            if layoutLocationElement:sub(1, 1) == "@" then
                trackerLocationObject.AvailableChestCount = trackerLocationObject.AvailableChestCount - 1
            else
                trackerLocationObject.Active = false
            end
        else
            print(string.format("onLocation: Could not find object for code %s", layoutLocationElement))
        end
    end
end


Archipelago:AddClearHandler("Clear", onClear)
Archipelago:AddItemHandler("Item", onItem)
Archipelago:AddLocationHandler("Location", onLocation)