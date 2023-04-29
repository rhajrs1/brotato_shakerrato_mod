extends "res://singletons/run_data.gd"

var game_play_mode = 0
var nightmare_end_wave = 40
var boss_scenes = []
var boss_1 = null;

func _ready()->void :
	if ProgressData.settings.has("gameplay_mode"):
		RunData.game_play_mode = ProgressData.settings["gameplay_mode"]
		
	._ready()
	
	if boss_scenes.size() <= 0:
		var current_wave_data = ZoneService.get_wave_data(0, 20)
		for i in current_wave_data.groups_data.size():
			var groups_data = current_wave_data.groups_data[i]
			if groups_data.is_boss:
				for j in groups_data.wave_units_data.size():
					boss_scenes.append(groups_data.wave_units_data[j].unit_scene)

func init_elites_spawn(base_wave:int = 10, horde_chance:float = 0.4)->void :
	if RunData.game_play_mode == 0: .init_elites_spawn(base_wave, horde_chance)
	else:
		if base_wave < 20: .init_elites_spawn(base_wave, horde_chance)
		else :
			elites_spawn = []
			var nb_elites = get_current_difficulty()
			if nb_elites <= 0: nb_elites = 1
			var step = floor(10.0 / nb_elites)
			var possible_elites = ItemService.elites.duplicate()
			
			for i in nb_elites:
				var wave = int(base_wave + ((i + 1) * step))
				if wave % 10 == 0: continue
				elites_spawn.push_back([wave, EliteType.ELITE, Utils.get_rand_element(possible_elites).my_id])

func get_additional_elites_endless()->Array:
	var weight = 20.0
	if RunData.game_play_mode >= 1: weight = 10.0
	var new_elites = []
	if RunData.current_wave > RunData.nb_of_waves:
		var nb_of_additional_elites = ceil((RunData.current_wave - weight) / 10.0)
		for i in nb_of_additional_elites:
			new_elites.push_back(Utils.get_rand_element(ItemService.elites).my_id)
	
	return new_elites
