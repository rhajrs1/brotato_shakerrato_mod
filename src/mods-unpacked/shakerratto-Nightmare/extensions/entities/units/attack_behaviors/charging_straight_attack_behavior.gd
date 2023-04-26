class_name ChargingStraightAttackBehavior
extends AttackBehavior

enum TargetType{PLAYER, RAND_POINT_AROUND_PLAYER}

export (float) var cooldown = 100
export (int) var max_cd_randomization = 0
export (int) var min_range = 0
export (int) var max_range = 2000
export (float) var attack_anim_speed = 1.0
export (float) var charge_duration = 1.0
export (int) var charge_speed_acc = 3

const EDGE_DISTANCE = 700
const EDGE_CD = 0
const HPI = PI / 2
const QPI = HPI / 2
var _charge_direction:Vector2
var _unlock_move_timer = Timer.new()
var _charge_acc_timer = Timer.new()
var _current_cd:float = cooldown
var _current_cooldown = EDGE_CD

var posList = []

func _ready()->void :
	_current_cd = get_cd()
	add_child(_unlock_move_timer)
	_unlock_move_timer.wait_time = charge_duration
	_unlock_move_timer.one_shot = true
	_unlock_move_timer.autostart = false
	_unlock_move_timer.connect("timeout", self, "on_unlock_move_timer_timeout")
	
	add_child(_charge_acc_timer)
	_charge_acc_timer.wait_time = 0.01
	_charge_acc_timer.one_shot = true
	_charge_acc_timer.autostart = false
	_charge_acc_timer.connect("timeout", self, "on_charge_acc_timer_timeout")


func physics_process(delta:float)->void :
	_current_cd = max(_current_cd - Utils.physics_one(delta), 0)
	
	if _current_cd <= 0 and Utils.is_between(_parent.global_position.distance_to(_parent.player_ref.global_position), min_range, max_range):
		_parent._animation_player.playback_speed = attack_anim_speed
		_parent._animation_player.play("shoot")

func getPosPattern():
	match Utils.get_random_int(0, 2):
		0:
			return [_parent.player_ref.global_position - _parent.global_position]
		1:
			return [
				_parent.player_ref.global_position - _parent.global_position,
				_parent.global_position - _parent.player_ref.global_position
			]
		2:
			var target_pos = _parent.player_ref.global_position
			var posC = [ 
				Vector2(target_pos.x + cos(QPI + (HPI * 2)) * EDGE_DISTANCE, target_pos.y + sin(QPI + (HPI * 2)) * EDGE_DISTANCE),
				Vector2(target_pos.x + cos(QPI + (HPI * 3)) * EDGE_DISTANCE, target_pos.y + sin(QPI + (HPI * 3)) * EDGE_DISTANCE),
				Vector2(target_pos.x + cos(QPI + (HPI * 4)) * EDGE_DISTANCE, target_pos.y + sin(QPI + (HPI * 4)) * EDGE_DISTANCE),
				Vector2(target_pos.x + cos(QPI + (HPI * 5)) * EDGE_DISTANCE, target_pos.y + sin(QPI + (HPI * 5)) * EDGE_DISTANCE) ]
			var index = Utils.get_random_int(0, posC.size() - 1)
			var pos1 = posC[index]
			posC.remove(index)
			index = Utils.get_random_int(0, posC.size() - 1)
			var pos2 = posC[index]
			return [ pos1 - _parent.global_position, pos2 - pos1 ]

func start_shoot()->void :
	_parent._can_move = false
	_parent._ground_attack_behavior.shoot()

func shoot()->void :
	_parent._can_move = true
	_parent._move_locked = true
	_parent.bonus_speed = 0
	
	if posList.size() <= 0: posList = getPosPattern()
	
	_parent._current_movement = posList[0]
	posList.pop_front()
	_unlock_move_timer.start()
	_charge_acc_timer.start()
	_current_cd = get_cd() + charge_duration * 60

func on_unlock_move_timer_timeout()->void :
	_parent._move_locked = false
	_parent.bonus_speed = 0
	_parent._animation_player.playback_speed = _parent._idle_playback_speed
	
	if posList.size() <= 0: 
		_current_cooldown = cooldown
		_parent._ground_attack_behavior.shoot()
	else: _current_cooldown = EDGE_CD
	_current_cd = get_cd()

func on_charge_acc_timer_timeout()->void :
	_parent.bonus_speed += charge_speed_acc + (_parent.bonus_speed * .085)
	if _parent._move_locked == true:
		_charge_acc_timer.start()

func animation_finished(anim_name:String)->void :
	if anim_name == "shoot":
		_parent._animation_player.playback_speed *= 2

func get_cd()->float:
	return rand_range(max(1, _current_cooldown - max_cd_randomization), _current_cooldown + max_cd_randomization)
