extends PlayerProjectile

export (Array, Resource) var projectile_sprites = []

onready var _slow_hitbox = $SlowHitbox


var rot_speed = 0

func _ready():
	_slow_hitbox.deals_damage = false
	
	if projectile_sprites.size() > 0:
		var sprite_path = Utils.get_rand_element(projectile_sprites)
		$Sprite.texture = sprite_path
	rot_speed = (randi() % 10) - 5
	

func _physics_process(delta):
	rotation_degrees += rot_speed


func set_damage(value:int, accuracy:float = 1.0, crit_chance:float = 0.0, crit_damage:float = 0.0, burning_data:BurningData = BurningData.new(), is_healing:bool = false)->void :
	.set_damage(value, accuracy, crit_chance, crit_damage, burning_data, is_healing)
	
	_hitbox.deals_damage = false
	weapon_stats.piercing = 99
#	_hitbox.damage = max(1.0, _hitbox.damage * 0.5)
	velocity = velocity * 1.5


func _on_SlowHitbox_hit_something(thing_hit:Node, _damage_dealt:int)->void :
	thing_hit.add_decaying_speed( - 250)
	thing_hit.emit_signal("speed_removed", thing_hit)
