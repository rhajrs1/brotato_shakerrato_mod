extends PlayerProjectile

export (Array, Resource) var projectile_sprites = []

var rot_speed = 0

func _ready():
	if projectile_sprites.size() > 0:
		var sprite_path = Utils.get_rand_element(projectile_sprites)
		$Sprite.texture = sprite_path
	rot_speed = (randi() % 30) - 15
	

func _physics_process(delta):
	rotation_degrees += rot_speed


func set_damage(value:int, accuracy:float = 1.0, crit_chance:float = 0.0, crit_damage:float = 0.0, burning_data:BurningData = BurningData.new(), is_healing:bool = false)->void :
	.set_damage(value, accuracy, crit_chance, crit_damage, burning_data, is_healing)
	weapon_stats.bounce += 2
	velocity = velocity * 0.6
