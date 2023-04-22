extends "res://main.gd"

const NIGHTMARE_END_WAVE = 50

func is_last_wave()->bool:
	var is_last_wave = RunData.current_wave == ZoneService.get_zone_data(RunData.current_zone).waves_data.size()
	if RunData.is_endless_run: is_last_wave = RunData.current_wave >= NIGHTMARE_END_WAVE
	return is_last_wave

func _on_HarvestingTimer_timeout()->void :
	._on_HarvestingTimer_timeout()
	
	var weight = (RunData.current_wave - 10) - RunData.nb_of_waves
	if weight > 0:
		var val = ceil(Utils.get_stat("stat_harvesting") * (weight / 100.0))
		RunData.remove_stat("stat_harvesting", val)
