extends "res://entities/units/enemies/boss/boss.gd"

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, player_ref:Node2D = null, entity_spawner_ref:EntitySpawner = null)->void :
	.init(zone_min_pos, zone_max_pos, player_ref, entity_spawner_ref)
	
	if RunData.current_wave <= 20:
		return
	
	var difficulty = .0
	if ProgressData.settings.has("nightmare_mode_difficulty"):
		difficulty = ProgressData.settings["nightmare_mode_difficulty"]

	var targetHeath = round(max_stats.health * (3.0 + (difficulty * 10))) as int
	max_stats.health = targetHeath
	current_stats.health = targetHeath
