extends "res://singletons/run_data.gd"

func get_additional_elites_endless()->Array:
	print("이게 패치 된 메서드111111111")
	var new_elites = []
	if RunData.current_wave > RunData.nb_of_waves:
		var nb_of_additional_elites = ceil(RunData.current_wave / 10.0)
		for i in nb_of_additional_elites:
			new_elites.push_back(Utils.get_rand_element(ItemService.elites).my_id)
	
	return new_elites
