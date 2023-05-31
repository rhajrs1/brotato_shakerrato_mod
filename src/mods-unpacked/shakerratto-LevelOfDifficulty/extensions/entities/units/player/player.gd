extends "res://entities/units/player/player.gd"

func take_damage(value:int, hitbox:Hitbox = null, dodgeable:bool = true, armor_applied:bool = true, custom_sound:Resource = null, base_effect_scale:float = 1.0, bypass_invincibility:bool = false)->Array:
	
	if hitbox and hitbox.is_healing:
		var _healed = on_healing_effect(value)
	elif _invincibility_timer.is_stopped() or bypass_invincibility:
		var dmg_taken = .take_damage(value, hitbox, dodgeable, armor_applied, custom_sound, base_effect_scale)
		
		if dmg_taken[1] > 0:
			if RunData.effects["stats_on_hit"].size() > 0:
				for stat_on_hit in RunData.effects["stats_on_hit"]:
					RunData.add_stat(stat_on_hit[0], stat_on_hit[1])
		
		return dmg_taken
	
	return [0, 0]
