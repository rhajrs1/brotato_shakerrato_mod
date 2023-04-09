extends "res://entities/units/enemies/enemy.gd"

func init_current_stats()->void :
	max_stats.copy_stats(stats)
	var str_factor = Utils.get_stat("enemy_health") / 100.0
	var new_val = round((stats.health + (stats.health_increase_each_wave * (RunData.current_wave - 1))) * (RunData.current_run_accessibility_settings.health + str_factor))
	
	var difficulty = 50.0
	if ProgressData.settings.has("endless_mode_difficulty"):
		difficulty = ProgressData.settings["endless_mode_difficulty"]
	
	var weight = 2
	if stats.always_drop_consumables == true && stats.gold_spread == 0:
		weight += ((difficulty / 100) * 4)
	
	max_stats.health = round(new_val * (1.0 + RunData.get_endless_factor() * weight)) as int
	current_stats.copy(max_stats)
	reset_stats()
