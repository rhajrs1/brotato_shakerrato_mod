extends TempStats


func reset(stat_name:String = "", value:int = 0)->void :
	.reset()
	
	for tier in RunData.effects["tier_specific_modification"].keys():
		var boost = RunData.effects["tier_specific_modification"][str(tier)]
		if not boost == 0:
			for stat_key in stats.keys():
				var stat_amount = 0
				if RunData.effects["stats_per_tier"][str(tier)].has(stat_key):
					stat_amount = RunData.effects["stats_per_tier"][str(tier)][stat_key]
				stat_amount = stat_amount * boost / 100.0
				stats[stat_key] = stat_amount
	
