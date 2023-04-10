extends "res://singletons/run_data.gd"

func get_additional_elites_endless()->Array:
	var difficulty = .5
	if ProgressData.settings.has("endless_mode_difficulty"):
		difficulty = ProgressData.settings["endless_mode_difficulty"]
	
	var weight = 20 - (difficulty * 60)
	
	var new_elites = []
	if RunData.current_wave > RunData.nb_of_waves:
		var nb_of_additional_elites = ceil((RunData.current_wave - weight) / 10.0)
		for i in nb_of_additional_elites:
			new_elites.push_back(Utils.get_rand_element(ItemService.elites).my_id)
	
	return new_elites
