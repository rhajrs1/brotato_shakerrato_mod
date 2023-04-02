extends "res://main.gd"


var TierItemBoosts

func _ready():
	TierItemBoosts = get_node("/root/ModLoader/damiBenro-Junker/TierItemBoosts")


	if RunData.effects["downgrade_random_item"] > 0:
		var all_items_but_commons:Array = Utils.junker_get_all_items_but_this_tier(Tier.COMMON, true)
		var max_applications = min(all_items_but_commons.size(), RunData.effects["downgrade_random_item"]) as int

		RunData.tracked_item_effects["junker_character_junker"].clear()

		for effect in max_applications:

			if all_items_but_commons.size() > 0:
				var item_to_remove = Utils.get_rand_element(all_items_but_commons)
				var downgrade_candidates = Utils.junker_get_all_unlocked_items(item_to_remove.tier - 1)

				var selected_downgrade = Utils.get_rand_element(downgrade_candidates)
				var all_commons = Utils.junker_get_unique_items_of_tier(Tier.COMMON, true)

				all_items_but_commons.erase(item_to_remove)
				RunData.remove_item(item_to_remove)
				RunData.add_item(selected_downgrade)

				if all_commons.size() == 0:
					all_commons = Utils.junker_get_all_unlocked_items(Tier.COMMON)

				var new_random_item = Utils.get_rand_element(all_commons)
				RunData.add_item(new_random_item)

				RunData.tracked_item_effects["junker_character_junker"].push_back(selected_downgrade.name)
				RunData.tracked_item_effects["junker_character_junker"].push_back(new_random_item.name)

		reset_player_timers()
		reload_stats()
	if not LinkedStats.is_connected("linked_stat_updated", TierItemBoosts, "reset"):
		LinkedStats.connect("linked_stat_updated", TierItemBoosts, "reset")

func _on_WaveTimer_timeout()->void :
	
	if RunData.effects["random_item_at_end_of_wave"].size() > 0:
		for item_end_of_wave in RunData.effects["random_item_at_end_of_wave"]:
			
			for i in item_end_of_wave[1]:
				var random_item = RunData.junker_add_random_item(item_end_of_wave[0])
				
				RunData.tracked_item_effects["junker_item_street_stall"].push_back(random_item)
				if i == 0:
					RunData.remove_gold(item_end_of_wave[2])
				
	._on_WaveTimer_timeout()


func reload_stats()->void :
	.reload_stats()
	
	if TierItemBoosts:
		TierItemBoosts.reset()

func reset_player_timers()->void :
	
	if RunData.effects["torture"] == 0:
		_player._health_regen_timer.wait_time = RunData.get_hp_regeneration_timer(Utils.get_stat("stat_hp_regeneration"))
	
	if RunData.effects["double_hp_regen"] == 0:
		_player._hp_regen_val = 1
	
	if RunData.effects["lose_hp_per_second"] == 0:
		_player._lose_health_timer.stop()
	
	if _player._alien_eyes_timer and RunData.effects["alien_eyes"].size() == 0:
		_player._alien_eyes_timer.stop()
