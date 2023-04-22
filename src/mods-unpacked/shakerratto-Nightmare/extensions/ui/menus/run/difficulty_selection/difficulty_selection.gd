extends "res://ui/menus/run/difficulty_selection/difficulty_selection.gd"

onready var _boxContainer: Node = $MarginContainer / VBoxContainer
onready var _endlessButton: Node = $MarginContainer / VBoxContainer / EndlessButton

var _sliderOption = preload("res://ui/menus/global/slider_option.tscn")
var _endlessOption = _sliderOption.instance()

func _ready()->void :
	._ready()
	
	_boxContainer.add_child(_endlessOption)
	_endlessOption.size_flags_horizontal = _endlessButton.size_flags_horizontal
	_endlessOption.rect_size = _endlessButton.rect_size
	_endlessOption.margin_right = _endlessButton.margin_right
	_endlessOption._label.text = "Nightmare mode Difficulty"
	_endlessOption._slider.connect("value_changed", self, "_on_EndlessSlider_changed")
	if ProgressData.settings.has("nightmare_mode_difficulty"):
		_endlessOption._slider.value = ProgressData.settings["nightmare_mode_difficulty"]
	else:
		_endlessOption._slider.value = 0
	
	_endlessButton.text = "Nightmare mode"
	if _endlessButton.pressed == true: _endlessOption.show()
	else: _endlessOption.hide()

func _on_EndlessButton_toggled(button_pressed:bool)->void :
	._on_EndlessButton_toggled(button_pressed)
	
	if button_pressed == true: _endlessOption.show()
	else: _endlessOption.hide()

func _on_EndlessSlider_changed(value: float)->void :
	ProgressData.settings["nightmare_mode_difficulty"] = value
