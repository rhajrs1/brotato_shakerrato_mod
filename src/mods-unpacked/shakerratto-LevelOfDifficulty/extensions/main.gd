extends "res://main.gd"

var staticHitBox = Hitbox.new()

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

func handle_stat_damages(stat_damages:Array)->Array:
	var total_dmg_to_deal = 0
	var dmg_taken = [0, 0]
	
	if stat_damages.size() <= 0 or _entity_spawner.get_all_enemies().size() <= 0:
		return dmg_taken
	
	for stat_dmg in stat_damages:
		
		if randf() >= stat_dmg[2] / 100.0:
			continue
		
		var dmg_from_stat = max(1, (stat_dmg[1] / 100.0) * Utils.get_stat(stat_dmg[0]))
		var dmg = RunData.get_dmg(dmg_from_stat) as int
		total_dmg_to_deal += dmg
	
	var other_enemy = Utils.get_rand_element(_entity_spawner.get_all_enemies())
	
	if total_dmg_to_deal <= 0 or other_enemy == null or not is_instance_valid(other_enemy):
		return dmg_taken
	
	staticHitBox.crit_chance = Utils.get_stat("stat_crit_chance") / 100.0
	staticHitBox.crit_damage = 2.0
	dmg_taken = other_enemy.take_damage(total_dmg_to_deal, staticHitBox)
	
	return dmg_taken
