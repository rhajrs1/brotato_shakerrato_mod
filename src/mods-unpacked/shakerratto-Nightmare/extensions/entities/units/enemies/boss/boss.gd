extends "res://entities/units/enemies/boss/boss.gd"

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, player_ref:Node2D = null, entity_spawner_ref:EntitySpawner = null)->void :
	.init(zone_min_pos, zone_max_pos, player_ref, entity_spawner_ref)
	
	if RunData.game_play_mode == 0 or RunData.current_wave <= 20: return
	
	var targetHeath = round(max_stats.health * (2.4 + ((RunData.game_play_difficulty - 1) * (10.0 / 6)))) as int
	
	max_stats.health = targetHeath
	current_stats.health = targetHeath
