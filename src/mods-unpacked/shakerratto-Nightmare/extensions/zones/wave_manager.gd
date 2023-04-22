extends "res://zones/wave_manager.gd"

func init_elite_group(elites_to_spawn:Array = [])->WaveGroupData:
	var local_elite_group = .init_elite_group(elites_to_spawn)
	
	var bossCount = local_elite_group.wave_units_data.size() - 1
	for i in bossCount:
		var boss = Utils.get_rand_element(RunData.bosses)
		var unit = WaveUnitData.new()
		unit.type = EntityType.BOSS
		unit.unit_scene = boss.unit_scene
		local_elite_group.wave_units_data.push_back(unit)
	
	return local_elite_group
