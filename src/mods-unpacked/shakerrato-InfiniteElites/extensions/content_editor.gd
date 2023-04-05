class_name ContentEditor
extends Node

func exec() -> void:
	
	var hc = find_item("ITEM_HANDCUFFS")
	if hc != null:
		hc.effects[0].value = 16
	
	remove_weapon("weapon_smg")

func find_item(name: String):
	for i in ItemService.items.size():
		if ItemService.items[i].name == name:
			return ItemService.items[i]
	return null

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

