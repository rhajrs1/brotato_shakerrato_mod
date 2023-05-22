extends "res://main.gd"

func _on_enemy_died(enemy)->void :
	if RunData.game_play_mode <= 1:
		._on_enemy_died(enemy)
	else:
		if is_last_wave() == true: _nb_bosses_killed_this_wave = -99999999
		
		._on_enemy_died(enemy)
		
		if enemy.stats.gold_spread == 278654:
			_wave_timer.wait_time = 0.1
			_wave_timer.start()

func is_last_wave()->bool:
	if RunData.game_play_mode <= 1: return .is_last_wave()
	else:
		var is_last_wave = RunData.current_wave == ZoneService.get_zone_data(RunData.current_zone).waves_data.size()
		if RunData.is_endless_run: is_last_wave = RunData.current_wave >= RunData.nightmare_end_wave
		return is_last_wave

func _on_HarvestingTimer_timeout()->void :
	._on_HarvestingTimer_timeout()
	
	var weight = (RunData.current_wave - 10) - RunData.nb_of_waves
	if weight > 0:
		var val = ceil(Utils.get_stat("stat_harvesting") * (weight / 100.0))
		RunData.remove_stat("stat_harvesting", val)

func _on_WaveTimer_timeout()->void :
	._on_WaveTimer_timeout()
	
	if RunData.current_wave == 20:
		if RunData.effects["end_of_wave_20"].size() > 0:
			for kv in RunData.effects["end_of_wave_20"]:
				if kv[0] == "gain_gold":
					RunData.add_gold(kv[1])
