extends TextureProgress

export (Color) var progress_color: = Color.white

var _initialized = false

onready var _flash_timer = $Timer


func _ready()->void :
	tint_progress = progress_color


func update_value(current_val:int, max_val:int)->void :
	var new_value = clamp((float(current_val) / float(max_val)) * 100, 0.0, float(max_val) * 100)
	var is_healing = false
	
	if new_value >= value:
		is_healing = true
	
	set_value(new_value)
	
	if _initialized and not is_healing:
		tint_progress = Color.white
		_flash_timer.start()
	else :
		_initialized = true


func _on_Timer_timeout()->void :
	tint_progress = progress_color
