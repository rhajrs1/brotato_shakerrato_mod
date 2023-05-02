extends "res://projectiles/bullet_enemy/enemy_projectile.gd"

func set_damage(value:int, accuracy:float = 1.0, crit_chance:float = 0.0, crit_damage:float = 0.0, burning_data:BurningData = BurningData.new(), is_healing:bool = false)->void :
	if _hitbox == null: return
	if RunData.current_wave <= RunData.nb_of_waves:
		.set_damage(value, accuracy, crit_chance, crit_damage, burning_data, is_healing)
	else:
		var adjustedValue = round(round(value * (1.0 + ((RunData.game_play_difficulty - 1) * (1.0 / 6)))) as int)
		.set_damage(adjustedValue, accuracy, crit_chance, crit_damage, burning_data, is_healing)
