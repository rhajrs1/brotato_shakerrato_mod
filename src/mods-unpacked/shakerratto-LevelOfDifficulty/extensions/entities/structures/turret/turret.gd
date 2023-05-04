extends "res://entities/structures/turret/turret.gd"

func reload_data()->void :
	.reload_data()
	
	stats.crit_chance = Utils.get_stat("stat_crit_chance")
