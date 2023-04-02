extends "res://singletons/linked_stats.gd"

func reset()->void :
	.reset()
	
	for linked_stat in RunData.effects["stat_links"]:
		var junker_keys = ["different_common_items", "most_stacked_item"]
		if junker_keys.has(linked_stat[2]):
			var stat_to_tweak = linked_stat[0]
			var stat_scaled = 0
			if linked_stat[2] == "different_common_items":
				stat_scaled = Utils.junker_get_unique_items_of_tier(Tier.COMMON).size()
			elif linked_stat[2] == "most_stacked_item":
				stat_scaled = Utils.junker_get_most_stacked_item()[1]
			
			var amount_to_add = linked_stat[1] * (stat_scaled / linked_stat[3])
			
			add_stat(stat_to_tweak, amount_to_add)
