class_name MultipleGroundAttack3Behavior
extends AttackBehavior


export (PackedScene) var projectile_scene = preload("res://projectiles/bullet_enemy/enemy_projectile.tscn")
export (int) var projectile_speed = 3000
export (float) var cooldown = 60.0
export (int) var damage = 1
export (float) var damage_increase_each_wave = 1.0
export (int) var max_cd_randomization = 10
export (int) var min_range = 0
export (int) var max_range = 500
export (float) var attack_anim_speed = 1.0

export (float, 0.1, 3.14, 0.1) var projectile_angle = 0.1

export (int) var initial_cooldown = 0
export (bool) var rotate_projectile = false
export (bool) var delete_projectile_on_death = false

var _current_initial_cooldown = 0
var _projectiles_node:Node
var _current_cd:float = cooldown

func _ready()->void :
	_projectiles_node = get_tree().current_scene.get_node("Projectiles")
	_current_cd = get_cd()
	_current_initial_cooldown = initial_cooldown

func physics_process(delta:float)->void :
	if _current_initial_cooldown > 0:
		_current_initial_cooldown = max(_current_initial_cooldown - Utils.physics_one(delta), 0)
		return 
	
	_current_cd = max(_current_cd - Utils.physics_one(delta), 0)
	
	if _current_cd <= 0 and Utils.is_between(_parent.global_position.distance_to(_parent.player_ref.global_position), min_range, max_range):
		_parent._animation_player.playback_speed = attack_anim_speed
		_parent._animation_player.play("shoot")


func shoot()->void :
	var x = 0
	var y = 0
	var xg = Utils.get_random_int(0, 800) + 400
	var yg = Utils.get_random_int(0, 800) + 400
	
	x = xg
	while x < ZoneService.current_zone_max_position.x:
		y = 0
		while y < ZoneService.current_zone_max_position.y:
			spawn_projectile(0, Vector2(x, y))
			y += 100
		x += xg
		
	y = yg
	while y < ZoneService.current_zone_max_position.y:
		x = 0
		while x < ZoneService.current_zone_max_position.x:
			spawn_projectile(0, Vector2(x, y))
			x += 100
		y += yg

func animation_finished(anim_name:String)->void :
	if anim_name == "shoot":
		_current_cd = get_cd()


func spawn_projectile(rotation:float, pos:Vector2)->Node:
	var projectile = projectile_scene.instance()
	projectile.global_position = pos
	_projectiles_node.call_deferred("add_child", projectile)
	
	projectile.call_deferred("set_from", _parent)
	projectile.set_deferred("velocity", Vector2.RIGHT.rotated(rotation) * projectile_speed * RunData.current_run_accessibility_settings.speed)
	
	if rotate_projectile:
		projectile.set_deferred("rotation", rotation)
	
	if delete_projectile_on_death:
		var _error_died = _parent.connect("died", projectile, "on_entity_died")
	
	projectile.call_deferred("set_damage", ((damage + ((RunData.current_wave - 1) * damage_increase_each_wave)) as int))
	
	return projectile


func get_cd()->float:
	return rand_range(max(1, _current_cd - max_cd_randomization), _current_cd + max_cd_randomization)
