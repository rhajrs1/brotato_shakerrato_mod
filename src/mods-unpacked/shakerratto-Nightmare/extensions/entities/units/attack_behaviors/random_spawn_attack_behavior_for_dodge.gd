class_name RandomSpawnAttackBehaviorForDodge
extends AttackBehavior

signal wanted_to_spawn_an_enemy(enemy_scene, position)

export (float) var cooldown = 60.0
export (int) var max_cd_randomization = 5
export (float) var attack_anim_speed = 0.5
export (int) var nb_to_enemy_spawn = 10

var _current_cd:float = cooldown

var enemies = [
	preload("res://entities/units/enemies/007/7.tscn"),
	preload("res://entities/units/enemies/009/9.tscn"),
	preload("res://entities/units/enemies/012/12.tscn")
]

func _ready()->void :
	_current_cd = get_cd()


func physics_process(delta:float)->void :
	_current_cd = max(_current_cd - Utils.physics_one(delta), 0)
	
	if _current_cd <= 0:
		_parent._animation_player.playback_speed = attack_anim_speed
		_parent._animation_player.play("shoot")


func shoot()->void :
	for i in nb_to_enemy_spawn:
		emit_signal("wanted_to_spawn_an_enemy", Utils.get_rand_element(enemies), ZoneService.get_rand_pos())

func animation_finished(anim_name:String)->void :
	if anim_name == "shoot":
		_current_cd = get_cd()


func get_cd()->float:
	return rand_range(max(1, cooldown - max_cd_randomization), cooldown + max_cd_randomization)
