extends "res://singletons/utils.gd"

var TierItemBoosts

func _ready():
	TierItemBoosts = get_node("/root/ModLoader/damiBenro-Junker/TierItemBoosts")
	
	ItemService.effects.push_back(preload("res://mods-unpacked/damiBenro-Junker/content/effects/get_random_item_at_end_of_wave_effect.gd"))
	ItemService.effects.push_back(preload("res://mods-unpacked/damiBenro-Junker/content/effects/item_tier_stat_modification_effect.gd"))


func junker_is_character(item:ItemParentData)->bool:
	return item.my_id.begins_with("character_")

func junker_is_upgrade(item:ItemParentData)->bool:
	return item.my_id.begins_with("upgrade_")

func junker_remove_limited_items_from(item_list:Array = [])->Array:
	
	var items_to_remove = []
	
	for item in item_list:
		if item.max_nb != -1:
			var limited_count = 0
			
			for item_bis in RunData.items:
				if item.my_id == item_bis.my_id:
					limited_count += 1
					if limited_count == item.max_nb:
						items_to_remove.push_back(item)
						break
	
	for item in items_to_remove:
		while item_list.has(item):
			item_list.erase(item)
	
	return item_list

func junker_get_all_unlocked_items(p_tier:int = -1)->Array:
	
	var item_list = []
	if p_tier == -1:
		for tier in ItemService._tiers_data:
			item_list.append_array(tier[ItemService.TierData.ITEMS])
	else:
		item_list.append_array(ItemService._tiers_data[p_tier][ItemService.TierData.ITEMS])
	
	item_list = junker_remove_limited_items_from(item_list)
	
	return item_list
	

func junker_get_unique_items_of_tier(p_tier:int, remove_limited:bool = false)->Array:
	
	var all_items_from_tier = []
	for item in RunData.items:
		if item.tier == p_tier and not junker_is_character(item) and not all_items_from_tier.has(item):
			all_items_from_tier.push_back(item)
	
	if remove_limited:
		all_items_from_tier = junker_remove_limited_items_from(all_items_from_tier)
	
	return all_items_from_tier


func junker_get_most_stacked_item()->Array:
	var highest_number = 0
	var highest_item = ""
	var current_items_dictionary = {}
	for item in RunData.items:
		if not junker_is_character(item):
			if not current_items_dictionary.keys().has(item.my_id):
				current_items_dictionary[item.my_id] = 0
			current_items_dictionary[item.my_id] += 1
	
	for item_id in current_items_dictionary.keys():
		var item_stacks = current_items_dictionary[item_id]
		if item_stacks > highest_number:
			highest_item = item_id
			highest_number = item_stacks
	
	return [highest_item, highest_number]


func junker_get_all_items_but_this_tier(tier:int, no_dupes:bool = false)->Array:
	var all_items_but_this_tier = []
	for item in RunData.items:
		if not item.tier == tier and not junker_is_character(item) and not (no_dupes and all_items_but_this_tier.has(item)):
			all_items_but_this_tier.push_back(item)
	
	return all_items_but_this_tier


func get_stat(stat_name:String)->float:
	return RunData.get_stat(stat_name) + TempStats.get_stat(stat_name) + LinkedStats.get_stat(stat_name) + TierItemBoosts.get_stat(stat_name)
