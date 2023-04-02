extends PlayerProjectile

export (Resource) var exploding_effect

var rot_speed = 0


func _ready():
	rot_speed = ((randi() % 20) + 10) * ((randi() % 1) * 2 - 1)
	

func _physics_process(delta):
	rotation_degrees += rot_speed


func set_effects(effects:Array)->void :
	.set_effects(effects)
	
	_hitbox.effects.push_back(exploding_effect)

func set_damage(value:int, accuracy:float = 1.0, crit_chance:float = 0.0, crit_damage:float = 0.0, burning_data:BurningData = BurningData.new(), is_healing:bool = false)->void :
	.set_damage(value, accuracy, crit_chance, crit_damage, burning_data, is_healing)
	
	var damage = _hitbox.damage
	var coeff = (1 + (Utils.get_stat("stat_percent_damage") + Utils.get_stat("explosion_damage")) / 100.0) / (1 + (Utils.get_stat("stat_percent_damage") / 100.0))
	damage = damage * coeff
	_hitbox.damage = damage
