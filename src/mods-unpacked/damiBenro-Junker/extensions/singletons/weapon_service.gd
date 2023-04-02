extends "res://singletons/weapon_service.gd"


func explode(effect:Effect, pos:Vector2, damage:int, accuracy:float, crit_chance:float, crit_dmg:float, burning_data:BurningData, is_healing:bool = false, ignored_objects:Array = [], damage_tracking_key:String = "")->Node:
	var vanilla_explosion = .explode(effect, pos, damage, accuracy, crit_chance, crit_dmg, burning_data, is_healing, ignored_objects, damage_tracking_key)
	
	if effect.get("effect_scale"):
		vanilla_explosion.call_deferred("set_effect_scale", effect.effect_scale)
	return vanilla_explosion
