class_name ItemTierStatGainsModificationEffect
extends Effect


export (int) var stat_mod = 0


static func get_id()->String:
	return "junker_item_tier_stat_gains"


func apply():
	RunData.effects["tier_specific_modification"][str(value)] += stat_mod


func unapply():
	RunData.effects["tier_specific_modification"][str(value)] -= stat_mod


func get_args()->Array:
	return [str(stat_mod), str(value)]


func serialize()->Dictionary:
	var serialized = .serialize()
	
	serialized.stat_mod = stat_mod
	return serialized
	

func deserialize_and_merge(serialized:Dictionary):
	.deserialize_and_merge(serialized)
	
	stat_mod = serialized.stat_mod






