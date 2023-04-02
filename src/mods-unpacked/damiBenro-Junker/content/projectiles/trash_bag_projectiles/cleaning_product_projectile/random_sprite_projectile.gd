extends PlayerProjectile

export (Array, Resource) var projectile_sprites = []
export (Resource) var burning_data

var rot_speed = 0

func _ready():
	if projectile_sprites.size() > 0:
		var sprite_path = Utils.get_rand_element(projectile_sprites)
		$Sprite.texture = sprite_path
	rot_speed = (randi() % 30) - 15
	

func _physics_process(delta):
	rotation_degrees += rot_speed


func set_damage(value:int, accuracy:float = 1.0, crit_chance:float = 0.0, crit_damage:float = 0.0, p_burning_data:BurningData = BurningData.new(), is_healing:bool = false)->void :
	var new_burning_data = WeaponService.init_burning_data(burning_data)
	new_burning_data.merge(p_burning_data)
	if _hitbox != null and is_instance_valid(_hitbox):
		new_burning_data.from = _hitbox.from
	.set_damage(value, accuracy, crit_chance, crit_damage, new_burning_data, is_healing)

