class_name SpiralShootingAttackBehavior
extends AttackBehavior


export (PackedScene) var projectile_scene = preload("res://projectiles/bullet_enemy/enemy_projectile.tscn")
export (int) var projectile_speed = 100
export (float) var cooldown = 350
export (float) var cooldown_per_cycle = 30
export (int) var damage = 1
export (float) var damage_increase_each_wave = 1.0
export (int) var max_cd_randomization = 10
export (int) var min_range = 0
export (int) var max_range = 99999
export (float) var attack_anim_speed = 99999
export (int) var projectiles_per_angle = 8
export (int) var max_cycle = 15
export (int) var initial_cooldown = 0
export (bool) var rotate_projectile = true
export (bool) var delete_projectile_on_death = false

var _current_initial_cooldown = 0
var _projectiles_node:Node
var _last_angle:float = .0
var _current_cd:float = cooldown
var _current_cooldown = cooldown_per_cycle
var _current_cycle = 1
var _angle_per_projectile:float = 6.2 / projectiles_per_angle

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
	for i in projectiles_per_angle:
		_last_angle += _angle_per_projectile
		var _projectile = spawn_projectile(_last_angle, _parent.global_position)
		
	if _current_cycle >= max_cycle:
		_current_cooldown = cooldown
		_current_cycle = 1
	else:
		_current_cooldown = cooldown_per_cycle
		_current_cycle += 1
		
	_current_cd = get_cd()


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
	return rand_range(max(1, _current_cooldown - max_cd_randomization), _current_cooldown + max_cd_randomization)
