class_name PlayerHomingProjectile
extends PlayerProjectile


var target = null
var player = null
var speed = - 1



func _ready():
	player = TempStats.player
	set_target()


func _physics_process(delta):
	if speed == - 1:
		speed = velocity.length()
	
	var target_direction = velocity.normalized()
	
	if target == null or target.dead:
		set_target()
	else :
		target_direction = global_position.direction_to(target.global_position)
	
	var target_velocity = target_direction * speed
	velocity += (target_velocity - velocity) * 0.1
	velocity = velocity.normalized() * speed
	rotation = velocity.angle()


func set_target():
	if not player == null:
		target = player._entity_spawner_ref.get_rand_enemy()
