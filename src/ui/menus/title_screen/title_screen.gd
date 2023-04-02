class_name TitleScreen
extends Control

onready var _menus = $MarginContainer / Menus
onready var _main_menu = $MarginContainer / Menus / MainMenu
onready var _attenuate_background = $AttenuateBackground


func _ready()->void :
	if ProgressData.current_run_state.has_run_state:
		_main_menu.continue_button.show()
		_main_menu.continue_button.activate()
	else :
		_main_menu.continue_button.hide()
		_main_menu.continue_button.disable()
	
	ProgressData.update_mouse_cursor(true)
	RunData.reset()
	if RunData.reload_music:
		MusicManager.play(0)
	else :
		RunData.reload_music = true
	
	_menus.connect("menu_page_switched", self, "on_menu_page_switched")
	$MarginContainer / Menus / MainMenu.init()


func on_menu_page_switched(_from:Control, to:Control)->void :
	if to != _main_menu:
		_attenuate_background.show()
	else :
		_attenuate_background.hide()
