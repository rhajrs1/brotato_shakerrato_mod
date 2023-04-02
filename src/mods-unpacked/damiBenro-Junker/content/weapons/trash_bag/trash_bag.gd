extends "res://weapons/melee/melee_weapon.gd"


export (Array, Resource) var possible_projectile_scenes = []

func shoot()->void :
	.shoot()
	
	swap_projectiles_on_hit()

func swap_projectiles_on_hit()->void :
	if not (possible_projectile_scenes.empty() or _hitbox.projectiles_on_hit.empty()):
		_hitbox.projectiles_on_hit[1].projectile_scene = Utils.get_rand_element(possible_projectile_scenes)
