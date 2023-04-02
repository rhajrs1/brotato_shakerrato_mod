extends PlayerProjectile

export (Array, Resource) var projectile_sprites = []
export (Array, Resource) var consume_sounds = []

var rot_speed = 0

func _ready():
	if projectile_sprites.size() > 0:
		var sprite_path = Utils.get_rand_element(projectile_sprites)
		$Sprite.texture = sprite_path
	rot_speed = (randi() % 12) - 6
	

func _physics_process(delta):
	rotation_degrees += rot_speed

func set_damage(value:int, accuracy:float = 1.0, crit_chance:float = 0.0, crit_damage:float = 0.0, burning_data:BurningData = BurningData.new(), is_healing:bool = false)->void :
	.set_damage(value, accuracy, crit_chance, crit_damage, burning_data, is_healing)
	weapon_stats.bounce += 1

func bounce(thing_hit:Node)->void :
	if randf() < 0.12:
		_hitbox.collision_layer = 16
		_hitbox.is_healing = true
		weapon_stats.bounce = 0
		var target = thing_hit.player_ref
		var direction = (target.global_position - global_position).angle() if target != null else rand_range( - PI, PI)
		velocity = Vector2.RIGHT.rotated(direction) * velocity.length() * 0.3
		rotation = velocity.angle()
		weapon_stats.max_range = 99999
		set_knockback_vector(Vector2.ZERO, 0.0)
		_hitbox.damage = 1
	else:
		set_to_be_destroyed()

func _on_Hitbox_hit_something(thing_hit:Node, damage_dealt:int)->void :
	._on_Hitbox_hit_something(thing_hit, damage_dealt)
	
	if _hitbox.is_healing:
		SoundManager.play(Utils.get_rand_element(consume_sounds))
