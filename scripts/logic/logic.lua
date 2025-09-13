-- Core Functions
function has_not(item)
    return Tracker:ProviderCountForCode(item) == 0
end

function has(item)
    return Tracker:ProviderCountForCode(item) > 0
end

function has_at_least(item, amount)
    return Tracker:ProviderCountForCode(item) >= amount
end

-- Accessibilty Rules
function hasAct1()
    return true
end

function hasHiddenPath()
    return has("lower_crossing_destroy_blockade")
end

function hasSunkenReliquary()
    return has("flooded_passage_destroy_blockade")
end

function hasDepravedSanctuary()
    return has("strange_key")
end

function hasEastMarsh()
    return has("east_marsh_bridge_repair")
end

function hasWardensCellar()
    return has("warden_boss_door_unlock") or has("progressive_fg")
end

function hasAct2()
    return has("arkovia_bridge_repair") or has("progressive_main")
end

function hasAct3()
    return (hasAct2() and has("arkovian_foothills_destroy_barricade")) or has_at_least("progressive_main",2)
end

function hasForbiddenDoorUnlock()
    return has("forbidden_door_unlock")
end

function hasStepsOfTorment()
    return hasAct3()
end

function hasFourHillsSecret()
    return hasAct3() and has("new_harbor_destroy_barricade")
end

function hasTyrantsHold()
    return hasAct3() and ((has("twin_falls_bridge_repair") and has("setting_fgdlc")) or has("prospectors_trail_destroy_barricade"))
end

function hasPortValbury()
    return hasAct3() and has("conflagration_destroy_barricade")
end

function hasHomesteadSideDoors()
    return hasAct3() and has("homestead_side_doors_unlock")
end

function hasRoyalHive()
    return hasHomesteadSideDoors() and has("royal_hive_queen_door_unlock")
end

function hasAct4()
    return (hasAct3() and has("homestead_main_doors_unlock")) or has_at_least("progressive_main",3)
end

function hasTempleOfTheThree()
    return hasEastMarsh() and has("witch_gods_temple_unlock")
end

function hasAct5()
    return (hasAct4() and has("fort_ikon_gate_unlock")) or has_at_least("progressive_main",4)
end

function hasAct6()
    return (hasAct5() and has("fort_ikon_destroy_blockade")) or has_at_least("progressive_main",5)
end

function hasFactionQuest6Hard()
    return hasAct6() and hasEastMarsh()
end

function hasFactionQuest6Soft()
    return hasAct6() or hasEastMarsh()
end

function hasBastionOfChaos()
    return hasAct6() and has("necropolis_bridge_repair")
end

function hasTombOfTheWatchers()
    return (hasAct6() and has("tomb_of_the_watchers_door_unlock")) or has_at_least("progressive_main",6)
end

function hasEdgeOfMadness()
    return (hasTombOfTheWatchers() and has("loghorrean_seal_unlock")) or has_at_least("progressive_main",7)
end

function hasAct7()
    return has("gloomwald_destroy_blockade") or has("progressive_aom")
end

function hasNanesHideout()
    return hasAct7() and has("nanes_hideout_destroy_barricade")
end

function hasDenOfTheAncient()
    return hasAct7() and has("ugdenbog_destroy_barricade")
end

function hasForlornCellar()
    return hasAct7() and has("forlorn_cellar_unlock")
end

function hasAct8()
    return (hasAct7() and has("altar_of_rattosh_portal")) or has_at_least("progressive_aom",2)
end

function hasMalmouthSewer()
    return hasAct8() and has("malmouth_sewer_destroy_blockade")
end

function hasAct9()
    return (hasAct8() and has("steelcap_district_door_unlock")) or has_at_least("progressive_aom",3)
end

function hasCandleDistrict()
    return hasAct9() or (hasAct8() and has("candle_district_door_unlock"))
end

function hasHarborStash()
    return hasAct9() and has("malmouth_harbor_destroy_barricade")
end

function hasCrownHill()
    return (hasAct9() and has("crown_hill_destroy_gates")) or has_at_least("progressive_aom",4)
end

function hasFleshworks()
    return (hasCrownHill() and has("crown_hill_open_flesh_barrier")) or has_at_least("progressive_aom",5)
end

function hasSanctumOfFlesh()
    return (hasFleshworks() and has("fleshworks_open_flesh_barrier")) or has_at_least("progressive_aom",6)
end

function hasAct10()
    return hasWardensCellar() or has("progressive_fg")
end

function hasAoMLeveling()
    return hasAct10() or hasAct3()
end

function hasAct11()
    return (hasAct10() and has("vanguard_of_the_three_door_unlock")) or has_at_least("progressive_fg",2)
end

function hasDevilsAquifer()
    return has("5_scrap") or hasAct3() or hasAct11()
end

function hasLostOasis()
    return hasAct11() and has("valley_of_the_chosen_destroy_barrier")
end

function hasTombOfTheEldritchSun()
    return (hasAct11() and has("path_of_ascension_destroy_barrier")) or has_at_least("progressive_fg",3)
end

function hasTheEldritchGate()
    return (hasTombOfTheEldritchSun() and has("eldritch_gate_destroy_barrier")) or has_at_least("progressive_fg",4)
end

function hasDevilsCrossingRevered()
    return has("devils_crossing_revered")
end

function hasRoversRevered()
    return has("rovers_revered")
end

function hasHomesteadRevered()
    return has("homestead_revered")
end

function hasDeathsVigilKymonsChosenRevered()
    return has("deaths_vigil_kymons_chosen_revered")
end

function hasBlackLegionRevered()
    return has("black_legion_revered")
end

function hasCovenRevered()
    return has("coven_of_ugdenbog_revered")
end

function hasMalmouthResistanceRevered()
    return has("malmouth_resistance_revered")
end

function hasWitchGodCultsRevered()
    return has("witch_god_cults_revered")
end

-- Visibility Rules
function hasGoalOfAtLeastKrieg()
    return true
end

function hasFGDLC()
    return has("setting_fgdlc")
end

function hasAoMDLC()
    return has("setting_aomdlc")
end

function hasGoalOfAtLeastKorvaak()
    return hasFGDLC() and (has("goal_korvaak") or has("goal_swarm_queen_ravna") or has("goal_loghorrean") or has("goal_master_of_flesh") or has("goal_all_bosses") or has("goal_emblem_hunt"))
end

function hasGoalOfAtLeastRavna()
    return has("goal_swarm_queen_ravna") or has("goal_loghorrean") or has("goal_master_of_flesh") or has("goal_all_bosses") or has("goal_emblem_hunt")
end

function hasGoalOfAtLeastLoghorrean()
    return has("goal_loghorrean") or has("goal_master_of_flesh") or has("goal_all_bosses") or has("goal_emblem_hunt")
end

function hasGoalOfAtLeastMasterOfFlesh()
    return has("goal_master_of_flesh") or has("goal_all_bosses") or has("goal_emblem_hunt")
end

function hasDevotionShrines()
    return has("setting_devotion_shrine")
end

function hasForbiddenDungeons()
    return has("setting_forbidden_dungeons")
end

function hasSecretChests()
    return has("setting_secret_chest")
end

function hasOneShotChests()
    return has("setting_one_shot_chest")
end

function hasLoreNotes()
    return has("setting_lore_note")
end

function hasFactions()
    return has("setting_faction")
end