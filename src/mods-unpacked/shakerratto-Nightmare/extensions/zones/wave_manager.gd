extends "res://zones/wave_manager.gd"

func init(p_wave_timer:Timer, wave_data:Resource)->void :
#	p_wave_timer.wait_time = 5
#	p_wave_timer.start()
	.init(p_wave_timer, wave_data)
	
	var isEndless = RunData.current_wave > RunData.nb_of_waves
	if RunData.current_wave == RunData.nightmare_end_wave:
		# end wave
		p_wave_timer.wait_time = 86400
		p_wave_timer.start()
		
		var local_elite_group = elite_group.duplicate()
		var unit = WaveUnitData.new()
		unit.type = EntityType.BOSS
		unit.unit_scene = RunData.boss_1
		local_elite_group.wave_units_data.push_back(unit)
		wave_data.groups_data = [ local_elite_group ]
	#elif isEndless and RunData.current_wave % 10 = 0:	

func init_elite_group(elites_to_spawn:Array = [])->WaveGroupData:
	var local_elite_group = .init_elite_group(elites_to_spawn)
	
	var bossCount = local_elite_group.wave_units_data.size() - 1
	for i in bossCount:
		var unit = WaveUnitData.new()
		unit.type = EntityType.BOSS
		unit.unit_scene = Utils.get_rand_element(RunData.boss_scenes)
		local_elite_group.wave_units_data.push_back(unit)
	return local_elite_group
