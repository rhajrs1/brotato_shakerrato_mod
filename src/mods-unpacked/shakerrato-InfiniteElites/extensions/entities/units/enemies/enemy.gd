extends "res://entities/units/enemies/enemy.gd"

func init_current_stats()->void :
	max_stats.copy_stats(stats)
	
	var str_factor = Utils.get_stat("enemy_health") / 100.0
	
	var new_val = round((stats.health + (stats.health_increase_each_wave * (RunData.current_wave - 1))) * (RunData.current_run_accessibility_settings.health + str_factor))
	
	if stats.health_increase_each_wave >= 700.0 :
		max_stats.health = round(new_val * (1.0 + RunData.get_endless_factor() * 4)) as int
	else :
		max_stats.health = round(new_val * (1.0 + RunData.get_endless_factor() * 2)) as int
	
	current_stats.copy(max_stats)
	reset_stats()
