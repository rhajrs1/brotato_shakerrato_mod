class_name MultipleStateToggle
extends HBoxContainer

export (Array) var states: Array = [ "Original", "Endless", "Impossible" ]

signal value_changed(value)

onready var _label = $Label
onready var _slider = $HSlider
onready var _value = $Value


func _ready()->void :
	_slider.min_value = 0
	_slider.max_value = states.size() - 1
	_slider.step = 1
	set_text(_slider.value)

func set_value(value:float)->void :
	set_text(value)
	_on_HSlider_value_changed(value)

func _on_HSlider_value_changed(value:float)->void :
	emit_signal("value_changed", set_text(value))

func set_text(value: float)-> int:
	var integerValue = floor(value)
	if integerValue < 0: integerValue = 0
	if integerValue >= states.size(): integerValue = states.size() - 1
	_value.text = states[integerValue]
	return integerValue
