extends "res://zones/zone_service.gd"

func _ready():
	zones[RunData.current_zone] = load("res://mods-unpacked/asw-strong_enemy/content/zones/zone_1/zone_1_data.tres")
