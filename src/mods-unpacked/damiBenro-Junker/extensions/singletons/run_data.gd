extends "res://singletons/run_data.gd"

var TierItemBoosts

func _ready():
	TierItemBoosts = get_node("/root/ModLoader/damiBenro-Junker/TierItemBoosts")
	

func init_effects()->Dictionary:
	var new_effects = {
		"tier_specific_modification": {
			str(Tier.COMMON): 0,
			str(Tier.UNCOMMON): 0,
			str(Tier.RARE): 0,
			str(Tier.LEGENDARY): 0,
		},
		"stats_per_tier":{
			str(Tier.COMMON): init_stats(true),
			str(Tier.UNCOMMON): init_stats(true),
			str(Tier.RARE): init_stats(true),
			str(Tier.LEGENDARY): init_stats(true),
		},
		"downgrade_random_item":0,
		"random_item_at_end_of_wave":[]
	}
	var vanilla_effects = .init_effects()
	
	vanilla_effects.merge(new_effects)
	return vanilla_effects

func init_tracked_effects()->Dictionary:
	
	var new_tracked_effects = {
		"junker_item_street_stall": [],
		"junker_character_junker": []
	}
	var vanilla_tracked_effects = .init_tracked_effects()
	
	vanilla_tracked_effects.merge(new_tracked_effects)
	return vanilla_tracked_effects
	

func reset(restart:bool = false)->void:
	.reset(restart)
	
	if TierItemBoosts:
		TierItemBoosts.reset()


func add_item(item:ItemData)->void :
	.add_item(item)
	
	TierItemBoosts.reset()


func remove_item(item:ItemData)->void :
	.remove_item(item)
	
	TierItemBoosts.reset()


func add_weapon(weapon:WeaponData, is_starting:bool = false)->WeaponData:
	var new_weapon = .add_weapon(weapon, is_starting)
	
	TierItemBoosts.reset()
	return new_weapon


func remove_weapon(weapon:WeaponData)->int:
	var removed_weapon_tracked_value = .remove_weapon(weapon)
	
	TierItemBoosts.reset()
	return removed_weapon_tracked_value


func remove_all_weapons()->void :
	.remove_all_weapons()
	
	TierItemBoosts.reset()


func resume_from_state(state:Dictionary)->void :
	.resume_from_state(state)
	
	TierItemBoosts.reset()

func apply_item_effects(item_data:ItemParentData)->void :
	.apply_item_effects(item_data)
	
	if item_data.get_category() == Category.ITEM and not Utils.junker_is_character(item_data) and not Utils.junker_is_upgrade(item_data):
		for effect in item_data.effects:
			if effect.get_script().resource_path == "res://items/global/effect.gd" and init_stats().keys().has(effect.key):
				effects["stats_per_tier"][str(item_data.tier)][effect.key] += effect.value
				

func unapply_item_effects(item_data:ItemParentData)->void :
	.unapply_item_effects(item_data)
	
	if item_data.get_category() == Category.ITEM and not Utils.junker_is_character(item_data) and not Utils.junker_is_upgrade(item_data):
		for effect in item_data.effects:
			if effect.get_script().resource_path == "res://items/global/effect.gd" and init_stats().keys().has(effect.key):
				effects["stats_per_tier"][str(item_data.tier)][effect.key] -= effect.value
				


func junker_add_random_item(tier:int)->String:
	var tiered_items = ItemService.get_pool(tier, ItemService.TierData.ITEMS)
	
	tiered_items = Utils.junker_remove_limited_items_from(tiered_items)
	
	var random_item = Utils.get_rand_element(tiered_items)
	add_item(random_item)
	return random_item.name





