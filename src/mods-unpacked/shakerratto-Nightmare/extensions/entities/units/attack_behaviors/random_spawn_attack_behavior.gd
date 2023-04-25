class_name RandomSpawnAttackBehavior
extends AttackBehavior

signal wanted_to_spawn_an_enemy(enemy_scene, position)

export (float) var cooldown = 60.0
export (int) var max_cd_randomization = 5
export (float) var attack_anim_speed = 0.5
export (int) var nb_to_boss_spawn = 1
export (int) var nb_to_elite_spawn = 2
export (int) var nb_to_enemy_spawn = 10
export (int) var nb_to_egg_spawn_max = 3
export (int) var egg_spawn_radius = 300

var _current_cd:float = cooldown

var elites = [
	preload("res://entities/units/enemies/020/20.tscn"),
	preload("res://entities/units/enemies/021/21.tscn"),
	preload("res://entities/units/enemies/022/22.tscn")
]

var enemies = [
	preload("res://entities/units/enemies/025/25.tscn"),
	preload("res://entities/units/enemies/026/26.tscn")
]

var egg = preload("res://entities/units/enemies/023/23.tscn")

func _ready()->void :
	_current_cd = get_cd()


func physics_process(delta:float)->void :
	_current_cd = max(_current_cd - Utils.physics_one(delta), 0)
	
	if _current_cd <= 0:
		_parent._animation_player.playback_speed = attack_anim_speed
		_parent._animation_player.play("shoot")


func shoot()->void :
	for i in nb_to_boss_spawn:
		emit_signal("wanted_to_spawn_an_enemy", Utils.get_rand_element(RunData.boss_scenes), ZoneService.get_rand_pos())
		
	for i in nb_to_elite_spawn:
		emit_signal("wanted_to_spawn_an_enemy", Utils.get_rand_element(elites), ZoneService.get_rand_pos())
		
	for i in nb_to_enemy_spawn:
		emit_signal("wanted_to_spawn_an_enemy", Utils.get_rand_element(enemies), ZoneService.get_rand_pos())
		
	var nb_egg = Utils.get_random_int(1, nb_to_egg_spawn_max)
	for i in nb_egg:
		emit_signal("wanted_to_spawn_an_enemy", egg, ZoneService.get_rand_pos_in_area(_parent.global_position, egg_spawn_radius))

func animation_finished(anim_name:String)->void :
	if anim_name == "shoot":
		_current_cd = get_cd()


func get_cd()->float:
	return rand_range(max(1, cooldown - max_cd_randomization), cooldown + max_cd_randomization)
