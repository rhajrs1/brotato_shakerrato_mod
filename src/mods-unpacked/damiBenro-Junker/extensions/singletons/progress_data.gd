extends "res://singletons/progress_data.gd"

func _ready():
	if ModLoader.mod_data.keys().has("damiBenro-Junker") and ModLoader.mod_data.keys().has("Psina-Extatonion"):
		check_crossover_starting_weapons("res://mods-unpacked/damiBenro-Junker/content_data/junker_extatonion_content.tres")


func check_crossover_starting_weapons(crossover_content_data_path:String):
	if not File.new().file_exists(crossover_content_data_path):
		return

	var mod_data = load(crossover_content_data_path)
	
	for i in mod_data.weapons_characters.size():
		if mod_data.weapons[i]:
			var wpn_characters = mod_data.weapons_characters[i]
			for character in wpn_characters:
				if not character.starting_weapons.has(mod_data.weapons[i]):
					character.starting_weapons.push_back(mod_data.weapons[i])
