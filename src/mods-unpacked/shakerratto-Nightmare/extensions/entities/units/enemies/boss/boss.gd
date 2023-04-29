extends "res://entities/units/enemies/boss/boss.gd"

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, player_ref:Node2D = null, entity_spawner_ref:EntitySpawner = null)->void :
	.init(zone_min_pos, zone_max_pos, player_ref, entity_spawner_ref)
	
	if RunData.game_play_mode == 0 or RunData.current_wave <= 20: return
	
	var difficulty = 1
	if ProgressData.settings.has("hardcore_difficulty"):
		difficulty = ProgressData.settings["hardcore_difficulty"]

	var dw = (difficulty - 1) * (10.0 / 6)
	var targetHeath = round(max_stats.health * (2.0 + dw)) as int
	
	max_stats.health = targetHeath
	current_stats.health = targetHeath

func get_giant_factor()->float:
	return (RunData.effects["giant_crit_damage"] / 10000.0)
