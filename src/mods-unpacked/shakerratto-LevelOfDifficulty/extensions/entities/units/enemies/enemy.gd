extends "res://entities/units/enemies/enemy.gd"

var staticHitBox = Hitbox.new()

func _on_BurningTimer_timeout()->void :
	if _burning != null:
		staticHitBox.crit_chance = Utils.get_stat("stat_crit_chance") / 100.0
		staticHitBox.crit_damage = 2.0
		var dmg_taken = take_damage(_burning.damage, staticHitBox, false, false, Utils.get_rand_element(burn_sounds), 0.1)
		
		
		if RunData.effects["burn_chance"].chance > 0.0 and _burning.chance <= RunData.effects["burn_chance"].chance and _burning.damage == RunData.effects["burn_chance"].damage:
			RunData.tracked_item_effects["item_scared_sausage"] += dmg_taken[1]
		elif RunData.effects["burn_chance"].chance > 0.0:
			var nb_sausages = RunData.get_nb_item("item_scared_sausage")
			RunData.tracked_item_effects["item_scared_sausage"] += nb_sausages
		
		if _burning.from != null and is_instance_valid(_burning.from):
			_burning.from.on_weapon_hit_something(self, dmg_taken[1])
		
		_burning.duration -= 1
		if _burning.duration <= 0:
			_burning = null
			_burning_timer.stop()
			_burning_particles.emitting = false
			_burning_particles.deactivate_spread()
		elif _burning.spread <= 0:
			_burning_particles.deactivate_spread()
