
extends PlayerProjectile


export (float, 0.01, 1.0) var drifting_factor = 0.1

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
	
	if not is_instance_valid(target) or target.dead:
		set_target()
	else :
		target_direction = global_position.direction_to(target.global_position)
	
	var target_velocity = target_direction * speed
	velocity += (target_velocity - velocity) * drifting_factor
	velocity = velocity.normalized() * speed
	rotation = velocity.angle()


func set_target():
	if not player == null:
		target = player._entity_spawner_ref.get_rand_enemy()


func set_damage(value:int, accuracy:float = 1.0, crit_chance:float = 0.0, crit_damage:float = 0.0, burning_data:BurningData = BurningData.new(), is_healing:bool = false)->void :
	.set_damage(max(1.0, value * 0.6), accuracy, crit_chance, crit_damage, burning_data, is_healing)
	
	weapon_stats.piercing += 1


func set_knockback_vector(knockback_direction:Vector2, knockback_amount:float)->void :
	.set_knockback_vector(Vector2.ZERO, 0.0)
