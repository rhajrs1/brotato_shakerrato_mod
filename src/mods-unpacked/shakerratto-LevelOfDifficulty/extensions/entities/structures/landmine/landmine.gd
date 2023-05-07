extends "res://entities/structures/landmine/landmine.gd"

func reload_data()->void :
	.reload_data()
	
	stats.crit_chance = Utils.get_stat("stat_crit_chance") / 100.0
