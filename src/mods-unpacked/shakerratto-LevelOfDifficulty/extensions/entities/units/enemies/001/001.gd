extends Boss

const TARGET_GIANT_DAMAGE = 100000
const CHARGING_ATTACK_COOLDOWN = 5.0

var defaultAB = []
var phaseAB = []
var charging_attack_cd = 0.0

onready var _phaseAlways = $States / PhaseAlways
onready var _charging_attack_behavior = $ChargingAttackBehavior
onready var _ground_attack_behavior = $GroundAttackBehavior

func _ready()->void :
	_charging_attack_behavior.init(self)
	_ground_attack_behavior.init(self)
	
	for b in _phaseAlways.get_children():
		if b is AttackBehavior:
			if _phaseAlways.movement_behavior == b or _phaseAlways.attack_behavior == b: continue
			defaultAB.append(b)
			b.init(self)
			
	for state in _states_container.get_children():
		if state == _phaseAlways: continue
		for b in state.get_children():
			if state.attack_behavior == b: continue
			b.init(self)

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, player_ref:Node2D = null, entity_spawner_ref:EntitySpawner = null)->void :
	.init(zone_min_pos, zone_max_pos, player_ref, entity_spawner_ref)

func _physics_process(delta:float)->void :
	if dead: return
	
	var pr = Utils.physics_one(delta)
	
	charging_attack_cd = max(0.0, charging_attack_cd - pr)
	if _move_locked and charging_attack_cd <= 0.0:
		charging_attack_cd = CHARGING_ATTACK_COOLDOWN
		_charging_attack_behavior.shoot()
	
	for i in defaultAB.size(): 
		var target = defaultAB[i]
		target._current_cd = max(target._current_cd - pr, 0)
		if target._current_cd <= 0.0:
			target._current_cd = target.cooldown
			target.shoot()
	
	for i in phaseAB.size(): 
		var target = phaseAB[i]
		target._current_cd = max(target._current_cd - pr, 0)
		if target._current_cd <= 0.0:
			target._current_cd = target.cooldown
			target.shoot()

func on_state_changed(new_state:int)->void :
	.on_state_changed(new_state)
	
	var currentAB = _states[new_state][3]
	for state in _states_container.get_children():
		if state.attack_behavior == currentAB:
			var newPhaseAB = []			
			for b in state.get_children():
				if state.movement_behavior == b or state.attack_behavior == b: continue
				if b is AttackBehavior: 
					newPhaseAB.append(b)
			phaseAB = newPhaseAB

func get_giant_factor()->float:
	return (RunData.effects["giant_crit_damage"] / 100000.0)
	#return (TARGET_GIANT_DAMAGE * max(1.0, RunData.get_endless_factor() * 0.2)) / current_stats.health
