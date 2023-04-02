class_name GetRandomItemAtEndOfWaveEffect
extends Effect

enum Tier{COMMON, UNCOMMON, RARE, LEGENDARY}

export (Tier) var item_tier = Tier.COMMON
export (int) var item_price = 0


static func get_id()->String:
	return "junker_end_of_wave_item"

func apply():
	RunData.effects["random_item_at_end_of_wave"].push_back([item_tier, value, item_price])

func unapply():
	RunData.effects["random_item_at_end_of_wave"].erase([item_tier, value, item_price])

func get_args()->Array:
	var val = "TIER_I"
	if item_tier == Tier.UNCOMMON:val = "TIER_II"
	elif item_tier == Tier.RARE:val = "TIER_III"
	elif item_tier == Tier.LEGENDARY:val = "TIER_IV"
	
	var final_value = tr(val)
	return [str(item_price), str(value), final_value]
