class_name ContentUnloader
extends Node

func remove_weapon(name: String) -> void:
	var removeTarget = []
	for i in ItemService.weapons.size():
		if ItemService.weapons[i].weapon_id == name:
			removeTarget.append(ItemService.weapons[i])
			
	for i in removeTarget.size():
		ItemService.weapons.erase(removeTarget[i])
	
	removeTarget = []	
	for i in ItemService.characters.size():
		var targetCharacter = ItemService.characters[i]
		
		for j in targetCharacter.starting_weapons.size():
			if targetCharacter.starting_weapons[j].weapon_id == name:
				removeTarget.append(targetCharacter.starting_weapons[j])
		
		for j in removeTarget.size():
			targetCharacter.starting_weapons.erase(removeTarget[j])
