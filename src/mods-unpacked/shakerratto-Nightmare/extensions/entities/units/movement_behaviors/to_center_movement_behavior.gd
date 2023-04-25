class_name ToCenterMovementBehavior
extends MovementBehavior

func get_movement()->Vector2:
	var vector = Vector2(ZoneService.current_zone_max_position.x / 2, ZoneService.current_zone_max_position.y / 2) - _parent.global_position
	if vector.x >= 10.0 or vector.y >= 10.0: return vector
	return Vector2.ZERO
