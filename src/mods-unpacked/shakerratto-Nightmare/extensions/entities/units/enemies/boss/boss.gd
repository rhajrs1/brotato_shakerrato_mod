extends "res://entities/units/enemies/boss/boss.gd"

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, player_ref:Node2D = null, entity_spawner_ref:EntitySpawner = null)->void :
	.init(zone_min_pos, zone_max_pos, player_ref, entity_spawner_ref)
	
	if RunData.current_wave <= 20:
		return
	
	var difficulty = .5
	if ProgressData.settings.has("endless_mode_difficulty"):
		difficulty = ProgressData.settings["endless_mode_difficulty"]

	max_stats.health = round(max_stats.health * (1.0 + (difficulty * 2))) as int
