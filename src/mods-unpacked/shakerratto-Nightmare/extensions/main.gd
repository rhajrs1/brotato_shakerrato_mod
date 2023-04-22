extends "res://main.gd"

func _on_enemy_died(enemy:Enemy)->void :
	._on_enemy_died(enemy)
	
	if not _cleaning_up:
		if enemy is Boss:
			if (_nb_bosses_killed_this_wave >= 1) and (RunData.current_wave == RunData.nightmare_end_wave):
				_wave_timer.wait_time = 0.1
				_wave_timer.start()

func is_last_wave()->bool:
	var is_last_wave = RunData.current_wave == ZoneService.get_zone_data(RunData.current_zone).waves_data.size()
	if RunData.is_endless_run: is_last_wave = RunData.current_wave >= RunData.nightmare_end_wave
	return is_last_wave

func _on_HarvestingTimer_timeout()->void :
	._on_HarvestingTimer_timeout()
	
	var weight = (RunData.current_wave - 10) - RunData.nb_of_waves
	if weight > 0:
		var val = ceil(Utils.get_stat("stat_harvesting") * (weight / 100.0))
		RunData.remove_stat("stat_harvesting", val)
