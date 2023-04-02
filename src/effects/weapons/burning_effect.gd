class_name BurningEffect
extends NullEffect

export (Resource) var burning_data = null


static func get_id()->String:
	return "weapon_burning"


func get_args()->Array:
	var current_burning_data = WeaponService.init_burning_data(burning_data)
	
	return [str(current_burning_data.damage), str(current_burning_data.duration), Utils.get_scaling_stat_text("stat_elemental_damage")]


func serialize()->Dictionary:
	var serialized = .serialize()
	
	if burning_data != null:
		serialized.burning_data = burning_data.serialize()
	
	return serialized


func deserialize_and_merge(serialized:Dictionary)->void :
	.deserialize_and_merge(serialized)
	
	if serialized.has("burning_data"):
		var data = BurningData.new()
		data.deserialize_and_merge(serialized.burning_data)
		burning_data = data
