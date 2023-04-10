extends "res://singletons/debug_service.gd"

func _ready():
	edit_items()
	edit_weapons()
	remove_items()
	remove_weapons()

# note : 아이템 수정 method, find_item으로 아이템을 찾은 후 property 수정
func edit_items() -> void:
	var item = find_item("ITEM_HANDCUFFS")
	if item != null:
		item.effects[0].value = 16

# note: 무기 수정 method, find_weapon으로 무기 찾은 후 property 수정
func edit_weapons() -> void:
	var w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.COMMON)
	if w != null:
		w.stats.damage = 999999
		w.stats.cooldown = 1
		w.stats.recoil = 1
		w.stats.recoil_duration = 0.01
		
	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.UNCOMMON)
	if w != null:
		w.stats.damage = 999999
		w.stats.cooldown = 1
		w.stats.recoil = 1
		w.stats.recoil_duration = 0.01
		
	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.RARE)
	if w != null:
		w.stats.damage = 999999
		w.stats.cooldown = 1
		w.stats.recoil = 1
		w.stats.recoil_duration = 0.01
		
	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.LEGENDARY)
	if w != null:
		w.stats.damage = 999999
		w.stats.cooldown = 1
		w.stats.recoil = 1
		w.stats.recoil_duration = 0.01

# note : 아이 삭제 method, remove_item(삭제 할 아이템 이름)
func remove_items() -> void:
	remove_item("Drone")
	remove_item("Spiky Ball")
	remove_item("Insect turret")
	remove_item("Swarm")

# note : 무기 삭제 method, remove_weapon(삭제 할 아이템 이름)
func remove_weapons() -> void:
	remove_weapon("Armageddon")
	remove_weapon("Bee hive")
	remove_weapon("Severed hand")
	remove_weapon("Flare gun")
	remove_weapon("Locust spreader")


#-----------------------------------------------------------------------
# note : 이하 utils
func find_item(name: String):
	for i in ItemService.items.size():
		if ItemService.items[i].name == name:
			return ItemService.items[i]
	print("Fail to find item : " + name)
	return null

func find_weapon(name: String, tier):
	for i in ItemService.weapons.size():
		var item = ItemService.weapons[i]
		if item.name == name && item.tier == tier:
			return item
	print("Fail to find weapon : " + name)
	return null

func remove_item(name: String) -> void:
	var removeTarget = []
	for i in ItemService.items.size():
		if ItemService.items[i].name == name:
			removeTarget.append(ItemService.items[i])
			
	if removeTarget.size() == 0:
		print("Fail to remove item : " + name)
		
	for i in removeTarget.size():
		ItemService.items.erase(removeTarget[i])

func remove_weapon(name: String) -> void:
	var removeTarget = []
	for i in ItemService.weapons.size():
		if ItemService.weapons[i].name == name:
			removeTarget.append(ItemService.weapons[i])
	
	if removeTarget.size() == 0:
		print("Fail to remove weapon : " + name)
	
	for i in removeTarget.size():
		ItemService.weapons.erase(removeTarget[i])
	
	removeTarget = []	
	for i in ItemService.characters.size():
		var targetCharacter = ItemService.characters[i]
		
		for j in targetCharacter.starting_weapons.size():
			if targetCharacter.starting_weapons[j].name == name:
				removeTarget.append(targetCharacter.starting_weapons[j])
		
		for j in removeTarget.size():
			targetCharacter.starting_weapons.erase(removeTarget[j])
