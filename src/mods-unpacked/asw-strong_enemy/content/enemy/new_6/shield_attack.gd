extends AttackBehavior

export (Resource) var outline_shader_mat

onready var weapon_pos_node = get_parent().get_node("weapon_pos")
onready var weapon_node = get_parent().get_node("weapon_pos/shield")

var life = 0
var rotate_speed = 0.02

func _ready()->void :
	outline_shader_mat.set_shader_param("outline_color", ItemService.get_color_from_tier(3))
	#weapon_node.material = outline_shader_mat
	var stats = get_parent().stats
	var str_factor = Utils.get_stat("enemy_health") / 100.0
	var new_val = round((stats.health + (stats.health_increase_each_wave * (RunData.current_wave - 1))) * (RunData.current_run_accessibility_settings.health + str_factor))
	var new_health = round(new_val * (1.0 + RunData.get_endless_factor() * 2)) as int
	life = 3*new_health
	
# warning-ignore:unused_argument
func physics_process(delta:float)->void :
	var target_pos = _parent.player_ref.global_position
	var target_rotation = (target_pos - _parent.global_position).angle()
	if life > 0:
		if abs(weapon_pos_node.rotation - target_rotation) > 0.1:
			if ((weapon_pos_node.rotation  < target_rotation and weapon_pos_node.rotation + PI > target_rotation)
			 or weapon_pos_node.rotation > target_rotation + PI):
				weapon_pos_node.rotation += rotate_speed
			else:
				weapon_pos_node.rotation -= rotate_speed
		if weapon_pos_node.rotation > PI:
			weapon_pos_node.rotation -= 2*PI
		elif weapon_pos_node.rotation < -PI:
			weapon_pos_node.rotation += 2*PI


func _on_Area2D_area_entered(area):
	var hitbox = area
	var parent = area.get_parent()
	if parent.get_class() == "Node2D" and parent.name.count("PlayerExplosion") != 1:
		var dmg = hitbox.damage
		var dmg_taken = [0, 0]
		flash()
		var sound = Utils.get_rand_element(_parent.hurt_sounds)
		_parent.emit_signal("took_damage", _parent, dmg, Vector2(0,0), 0, false, false, false, false, 1, HitType.NORMAL)
		life -= dmg
		area.disable()
		area.get_parent().set_to_be_destroyed()
		if life <= 0:
			weapon_pos_node.queue_free()

func flash()->void :
	weapon_node.material.set_shader_param("flash_modifier", 1)
	weapon_node.get_node("FlashTimer").start()

func _on_FlashTimer_timeout()->void :
	weapon_node.material.set_shader_param("flash_modifier", 0)

