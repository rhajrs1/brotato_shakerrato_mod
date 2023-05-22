extends AttackBehavior

export (PackedScene) var projectile_scene = preload("res://projectiles/bullet_enemy/enemy_projectile.tscn")
export (int) var projectile_speed = 3000
export (float) var cooldown = 60.0
export (int) var damage = 1
export (float) var damage_increase_each_wave = 1.0
export (int) var max_cd_randomization = 10
export (int) var min_range = 0
export (int) var max_range = 300
export (float) var attack_anim_speed = 1.0
export (bool) var random_direction = false
export (int) var number_projectiles = 1
export (float, 0, 3.14, 0.1) var projectile_spread = 0.0
export (bool) var spawn_projectiles_on_target = false
export (int) var projectile_spawn_spread = 0
export (bool) var projectile_spawn_only_on_borders = false
export (bool) var constant_spread = false
export (bool) var atleast_one_projectile_on_target = false
export (int) var initial_cooldown = 0
export (bool) var shoot_in_unit_direction = false
export (bool) var rotate_projectile = true
export (bool) var delete_projectile_on_death = false




var _current_initial_cooldown = 0
var _projectiles_node:Node
var _current_cd:float = cooldown

var atk_duration = 0.5
var back_duration = 0.5
var rotate_speed = 0.03
var is_shooting = false

export (Resource) var outline_shader_mat

onready var weapon_pos_node = get_parent().get_node("weapon_pos")
onready var weapon_node = get_parent().get_node("weapon_pos/knife")
onready var tween_node = get_parent().get_node("Tween")

func _ready()->void :
	_projectiles_node = get_tree().current_scene.get_node("Projectiles")
	_current_cd = get_cd()
	_current_initial_cooldown = initial_cooldown
	weapon_node.get_node("Hitbox").damage = (damage + ((RunData.current_wave - 1) * damage_increase_each_wave)) as int
	outline_shader_mat.set_shader_param("outline_color", ItemService.get_color_from_tier(3))
	weapon_node.material = outline_shader_mat

func physics_process(delta:float)->void :
	
	var target_pos = _parent.player_ref.global_position
	var target_rotation = (target_pos - _parent.global_position).angle()
	var right_angle = false
	if is_shooting == false:
		#weapon_pos_node.rotation = (target_pos - _parent.global_position).angle()
		if abs(weapon_pos_node.rotation - target_rotation) > 0.03:
			if ((weapon_pos_node.rotation  < target_rotation and weapon_pos_node.rotation + PI > target_rotation)
			 or weapon_pos_node.rotation > target_rotation + PI):
				weapon_pos_node.rotation += rotate_speed
			else:
				weapon_pos_node.rotation -= rotate_speed
		else:
			right_angle = true
		if weapon_pos_node.rotation > PI:
			weapon_pos_node.rotation -= 2*PI
		elif weapon_pos_node.rotation < -PI:
			weapon_pos_node.rotation += 2*PI
	
	if _current_initial_cooldown > 0:
		_current_initial_cooldown = max(_current_initial_cooldown - Utils.physics_one(delta), 0)
		return 
	
	_current_cd = max(_current_cd - Utils.physics_one(delta), 0)
	
	if _current_cd <= 0 and Utils.is_between(_parent.global_position.distance_to(_parent.player_ref.global_position), min_range, max_range) and right_angle:
		_parent._animation_player.playback_speed = attack_anim_speed
		_parent._animation_player.play("shoot")


func shoot()->void :
	var initial_position:Vector2 = weapon_node.position
	melee_thrust_attack(initial_position)

func melee_thrust_attack(initial_position:Vector2)->void :
	
	var recoil = 10
	var recoil_duration = 0.01
	var thrust_half_duration = atk_duration / 2
	
	is_shooting = true
	interpolate("position", initial_position, Vector2(initial_position.x - recoil, initial_position.y), recoil_duration)
	
	tween_node.start()
	yield (tween_node, "tween_all_completed")
	
	#SoundManager.play(Utils.get_rand_element(_parent.current_stats.shooting_sounds), _parent.current_stats.sound_db_mod, 0.2)
	#weapon_node.get_node("Hitbox").enable()
	
	interpolate("position", weapon_node.position, Vector2(initial_position.x + max_range, initial_position.y), thrust_half_duration)
	
	tween_node.start()
	yield (tween_node, "tween_all_completed")
	
#	if not _parent.stats.deal_dmg_on_return:
#		weapon_node.disable_hitbox()
		
	interpolate("position", weapon_node.position, initial_position, back_duration)
	
	tween_node.start()
	yield (tween_node, "tween_all_completed")
	is_shooting = false
	#weapon_node.get_node("Hitbox").disable()
	
	#weapon_node.set_shooting(false)

func interpolate(property:String, val_a, val_b, duration, tween_trans = Tween.TRANS_EXPO, tween_ease = Tween.EASE_OUT, object = weapon_node)->void :
	tween_node.interpolate_property(
		object, 
		property, 
		val_a, 
		val_b, 
		duration, 
		tween_trans, 
		tween_ease
	)

func animation_finished(anim_name:String)->void :
	if anim_name == "shoot":
		_current_cd = get_cd()

func get_cd()->float:
	return rand_range(max(1, cooldown - max_cd_randomization), cooldown + max_cd_randomization)


