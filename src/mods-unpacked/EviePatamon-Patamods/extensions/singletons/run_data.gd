extends "res://singletons/run_data.gd"

#Adds custom tracked stats to the dictionary
func init_tracked_effects()->Dictionary:
	var vanilla_tracked_effects = .init_tracked_effects()
	var patamods_tracked_effects = {
		"item_monocle":0,
		"item_domino":0,
		"weapon_midas_scepter":0
	}
	vanilla_tracked_effects.merge(patamods_tracked_effects)
	return vanilla_tracked_effects
