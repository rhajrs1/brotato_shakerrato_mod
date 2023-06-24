extends "res://singletons/run_data.gd"

var game_play_mode = 0
var game_play_difficulty = 1
var nightmare_end_wave = 30
var boss_scenes = []
var boss_1 = null;

func _ready()->void :
	if ProgressData.settings.has("gameplay_mode"):
		RunData.game_play_mode = ProgressData.settings["gameplay_mode"]
		
	if ProgressData.settings.has("hardcore_difficulty"):
		RunData.game_play_difficulty = ProgressData.settings["hardcore_difficulty"]
		
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
			var wave_set = {}
			var nb_elite_waves = get_current_difficulty()
			if nb_elite_waves <= 0: wave_set[Utils.get_random_int(1, 9)] = null
			elif nb_elite_waves > 9: for i in 9: wave_set[i] = null
			else:
				var wave_count = 0
				while true:
					if wave_count >= nb_elite_waves : break
					var wave = Utils.get_random_int(1, 9)
					if !wave_set.has(wave):
						wave_set[wave] = null
						wave_count += 1
			
			elites_spawn = []
			var waves = wave_set.keys()
			waves.sort()
			for i in waves:
				elites_spawn.push_back([base_wave + i, EliteType.ELITE, Utils.get_rand_element(ItemService.elites.duplicate()).my_id])

func get_additional_elites_endless()->Array:
	var weight = 20.0
	if RunData.game_play_mode >= 1: weight = 10.0
	var new_elites = []
	if RunData.current_wave > RunData.nb_of_waves:
		var nb_of_additional_elites = ceil((RunData.current_wave - weight) / 10.0)
		for i in nb_of_additional_elites:
			new_elites.push_back(Utils.get_rand_element(ItemService.elites).my_id)
	
	return new_elites


func init_effects()->Dictionary:
	var ret = .init_effects()
	ret["end_of_wave_20"] = []
	ret["stats_on_hit"] = []
	ret["tag_for_shakerratto"] = []
	return ret
