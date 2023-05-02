extends "res://ui/menus/run/difficulty_selection/difficulty_selection.gd"

onready var _boxContainer: Node = $MarginContainer / VBoxContainer
onready var _endlessButton: Node = $MarginContainer / VBoxContainer / EndlessButton

var _multipleStateToggle = preload("res://mods-unpacked/shakerratto-Nightmare/extensions/ui/controls/multiple_state_toggle.tscn")
var _sliderOptionCustom = preload("res://mods-unpacked/shakerratto-Nightmare/extensions/ui/controls/slider_option_custom.tscn")
var _difficultyOption = _multipleStateToggle.instance()
var _endlessOption = _sliderOptionCustom.instance()
var _endlessOption_root: Node = null

func _ready()->void :
	._ready()
	
	_boxContainer.remove_child(_endlessButton)
	
	append_child_with_wrapping(_boxContainer, _difficultyOption)
	_difficultyOption._label.text = "Play Mode"
	_difficultyOption.connect("value_changed", self, "_on_Mode_changed")
	
	_endlessOption_root = append_child_with_wrapping(_boxContainer, _endlessOption)
	_endlessOption.size_flags_horizontal = 4
	_endlessOption.rect_size = Vector2(300, 70)
	_endlessOption.margin_right = 891
	_endlessOption._label.text = "Difficulty"
	_endlessOption._slider.connect("value_changed", self, "_on_Difficulty_changed")
	
	if ProgressData.settings.has("gameplay_mode"):
		_difficultyOption._slider.value = ProgressData.settings["gameplay_mode"]
	else: _difficultyOption._slider.value = 0
	_on_Mode_changed(_difficultyOption._slider.value)
	
	if ProgressData.settings.has("hardcore_difficulty"):
		_endlessOption._slider.value = ProgressData.settings["hardcore_difficulty"]
	else: _endlessOption._slider.value = 0

func append_child_with_wrapping(parent: Node, child: Node) -> Node:
	var panelContainer = PanelContainer.new()
	var marginContainer = MarginContainer.new()
	parent.add_child(panelContainer)
	panelContainer.add_child(marginContainer)
	marginContainer.add_child(child)
	panelContainer.size_flags_horizontal = 4
	marginContainer.add_constant_override ("margin_top", 10)
	marginContainer.add_constant_override ("margin_bottom", 10)
	marginContainer.add_constant_override ("margin_left", 10)
	marginContainer.add_constant_override ("margin_right", 10)
	return panelContainer

func _on_Mode_changed(value: int)-> void :
	RunData.game_play_mode = value
	ProgressData.settings["gameplay_mode"] = value
	if value <= 0:
		_endlessOption_root.hide()
		RunData.is_endless_run = false
		ProgressData.settings.endless_mode_toggled = false
	else:
		_endlessOption_root.show()
		RunData.is_endless_run = true
		ProgressData.settings.endless_mode_toggled = true

func _on_Difficulty_changed(value: float)->void :
	var intValue = int(value)
	RunData.game_play_difficulty = intValue
	ProgressData.settings["hardcore_difficulty"] = intValue
