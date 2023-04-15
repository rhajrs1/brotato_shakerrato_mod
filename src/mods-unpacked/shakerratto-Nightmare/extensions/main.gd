extends "res://main.gd"

func _on_HarvestingTimer_timeout()->void :
	._on_HarvestingTimer_timeout()
	
	var weight = (RunData.current_wave - 10) - RunData.nb_of_waves
	if weight > 0:
		var val = ceil(Utils.get_stat("stat_harvesting") * (weight / 100.0))
		RunData.remove_stat("stat_harvesting", val)
