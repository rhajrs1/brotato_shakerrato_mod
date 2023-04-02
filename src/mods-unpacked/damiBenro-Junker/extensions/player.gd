extends "res://entities/units/player/player.gd"

var lightning_eyes_timer:Timer


func _ready():
	if RunData.effects["lightning_eyes"].size() > 0:
		lightning_eyes_timer = Timer.new()
		lightning_eyes_timer.wait_time = RunData.effects["lightning_eyes"][0][3]
		var _lightning_eyes = lightning_eyes_timer.connect("timeout", self, "on_lightning_eyes_timeout")
		add_child(lightning_eyes_timer)
		lightning_eyes_timer.start()

func on_lightning_eyes_timeout()->void :
	var projectiles = []
	var lightning_stats = WeaponService.init_ranged_stats(RunData.effects["lightning_eyes"][0][1])
	
#	SoundManager.play(Utils.get_rand_element(alien_sounds), 0, 0.1)
	
	for projectile in RunData.effects["lightning_eyes"]:
		for i in projectile[0]:
			projectiles.push_back(projectile)
	
	for i in projectiles.size():
		var direction = (2 * PI / projectiles.size()) * i
		
		var _projectile = WeaponService.manage_special_spawn_projectile(
			self, 
			lightning_stats, 
			projectiles[i][2], 
			_entity_spawner_ref, 
			direction, 
			"item_alien_eyes"
		)
