extends "res://singletons/debug_service.gd"

func _ready():
	edit_items()
	edit_weapons()
	remove_items()
	remove_weapons()

# note : 아이템 수정 method, find_item으로 아이템을 찾은 후 property 수정
func edit_items() -> void:
	var item = find_item("ITEM_BAIT")
	if item != null:
		item.effects[0].value = 12

	item = find_item("ITEM_PADDING")
	if item != null:
		item.max_nb = 5

	item = find_item("ITEM_VIGILANTE_RING")
	if item != null:
		item.effects[0].value = 4

	item = find_item("ITEM_SILVER_BULLET")
	if item != null:
		item.max_nb = 4

	item = find_item("ITEM_HANDCUFFS")
	if item != null:
		item.effects[0].value = 16

	item = find_item("ITEM_ALLOY")
	if item != null:
		item.effects[0].value = 6

	item = find_item("ITEM_CANDLE")
	if item != null:
		item.effects[2].value = 10

	item = find_item("ITEM_STATUE")
	if item != null:
		item.effects[0].text_key = "effect_stat_while_moving"
		item.effects[0].custom_key = "temp_stats_while_moving"
		item.effects[1].value = -5

	item = find_item("ITEM_CHAMELEON")
	if item != null:
		item.effects[1].text_key = "effect_stat_while_moving"
		item.effects[1].custom_key = "temp_stats_while_moving"

	item = find_item("ITEM_WHEAT")
	if item != null:
		item.effects[2].value = 20
		
	item = find_item("ITEM_TORTURE")
	if item != null:
		item.effects[0].key = "hp_start_wave"
		item.effects[0].text_key = "EFFECT_START_WAVE_LESS_HP"
		item.effects[0].value = -33
		item.effects[0].custom_key = ""
		var e2 = Effect.new()
		e2.key = "enemy_damage"
		e2.text_key = "effect_stat_next_wave"
		e2.value = 100
		e2.custom_key = "stats_next_wave"
		e2.effect_sign = Effect.Sign.NEGATIVE
		e2.storage_method = Effect.StorageMethod.KEY_VALUE
		item.effects.append(e2)
		var e3 = GainStatForEveryStatEffect.new()
		e3.key = "stat_percent_damage"
		e3.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e3.value = 1
		e3.custom_key = ""
		e3.storage_method = Effect.StorageMethod.SUM
		e3.effect_sign = Effect.Sign.POSITIVE
		e3.custom_args = []
		e3.nb_stat_scaled = 1
		e3.stat_scaled = "stat_lifesteal"
		item.effects.append(e3)
		var e4 = GainStatForEveryStatEffect.new()
		e4.key = "stat_percent_damage"
		e4.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e4.value = 2
		e4.custom_key = ""
		e4.storage_method = Effect.StorageMethod.SUM
		e4.effect_sign = Effect.Sign.POSITIVE
		e4.custom_args = []
		e4.nb_stat_scaled = 1
		e4.stat_scaled = "stat_hp_regeneration"
		item.effects.append(e4)
	
	item = find_item("ITEM_POTION")
	if item != null:
		item.effects[0].key = "stat_melee_damage"
		item.effects[0].text_key = ""
		item.effects[0].value = 40
		item.effects[0].custom_key = ""
		item.effects[0].storage_method = Effect.StorageMethod.SUM
		item.effects[0].effect_sign = Effect.Sign.FROM_VALUE
		item.effects[1].key = "explosion_size"
		item.effects[1].text_key = ""
		item.effects[1].value = -1000
		item.effects[1].custom_key = ""
		item.effects[1].storage_method = Effect.StorageMethod.SUM
		item.effects[1].effect_sign = Effect.Sign.FROM_VALUE
	
	item = find_item("ITEM_POTATO")
	if item != null:
		item.effects[3].value = 5
	
	item = find_item("ITEM_DIPLOMA")
	if item != null:
		item.effects[0].value = 15
		item.effects[1].value = 25
	
	item = find_item("ITEM_EXOSKELETON")
	if item != null:
		item.effects[2].value = 10
		
	item = find_item("ITEM_ESTYS_COUCH")
	if item != null:
		item.effects[1].key = "stat_crit_chance"
		item.effects[1].stat_scaled = "stat_armor"
		item.effects[0].key = "stat_dodge"
		item.effects[0].value = 10
		item.effects[2].key = "stat_armor"
		item.effects[2].value = -10
	
	item = find_item("ITEM_EXTRA_STOMACH")
	if item != null:
		item.effects[0].max_value = 15
	
	item = find_item("Blanket")
	if item != null:
		item.effects[2].value = -2
		
	item = find_item("Extra onion")
	if item != null:
		item.effects[1].value = -3
		
	item = find_item("John's coat")
	if item != null:
		item.effects[0].value = 30
	
	item = find_item("Mimicry")
	if item != null:
		item.effects[1].value = 8
		var effect = Effect.new()
		effect.key = "stat_max_hp"
		effect.value = -3
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
	
	item = find_item("Skal's firework")
	if item != null:
		item.effects[0].value = 15
		item.effects[1].value = 15
	
	item = find_item("Tijoe mask")
	if item != null:
		item.effects[2].value = -5
		
	item = find_item("Peter's trap")
	if item != null:
		item.effects[0].value = 12
		item.effects[1].key = "stat_armor"
		item.effects[1].value = -1
		var effect = Effect.new()
		effect.key = "stat_max_hp"
		effect.value = -2
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		
	item = find_item("Magical Plant")
	if item != null:
		item.effects[0].value = 3
		
	item = find_item("Abaddon")
	if item != null:
		item.effects[1].key = "stat_dodge"
		item.effects[2].value = 18
		var effect = Effect.new()
		effect.key = "stat_harvesting"
		effect.value = 25
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		
	item = find_item("Cursed dice")
	if item != null:
		item.max_nb = 1
		
	item = find_item("Modding Guide")
	if item != null:
		item.effects[0].value = 4
		
	item = find_item("Olexa's mantle")
	if item != null:
		item.max_nb = 2
		item.effects[0].nb_stat_scaled = 2
		item.effects[0].stat_scaled = "xp_gain"
		
	item = find_item("Chaos")
	if item != null:
		item.effects[1].key = "stat_melee_damage"
		item.effects[1].value = -4
		var effect = Effect.new()
		effect.key = "stat_ranged_damage"
		effect.value = -2
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		effect = Effect.new()
		effect.key = "stat_elemental_damage"
		effect.value = -2
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		effect = Effect.new()
		effect.key = "stat_max_hp"
		effect.value = -10
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
	
	item = find_item("Rhino's relic")
	if item != null:
		item.effects[0].key = "stat_melee_damage"
		item.effects[0].value = 8
		item.effects[1].key = "stat_percent_damage"
		item.effects[1].text_key = ""
		item.effects[1].custom_key = ""
		item.effects[1].value = 10
		item.effects[2].key = "stat_range"
		item.effects[2].text_key = ""
		item.effects[2].value = -40
		item.effects[3].key = "stat_max_hp"
		item.effects[3].value = -15
	
	item = find_item("Vurtfish")
	if item != null:
		item.effects = []
		var effect = Effect.new()
		effect.key = "hit_protection"
		effect.text_key = "effect_hit_protection"
		effect.value = 1
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		effect = Effect.new()
		effect.key = "stat_attack_speed"
		effect.value = 50
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		effect = Effect.new()
		effect.key = "stat_max_hp"
		effect.value = -100
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		effect = Effect.new()
		effect.key = "no_ranged_weapons"
		effect.text_key = "effect_no_ranged_weapons"
		effect.value = 0
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		effect = Effect.new()
		effect.key = "stat_ranged_damage"
		effect.value = -100
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		
	item = find_item("Tank muzzle")
	if item != null:
		item.effects[0].key = "explosion_damage"
		item.effects[0].text_key = "explosion_damage"
		item.effects[0].value = 8
		item.effects[0].custom_key = "stats_end_of_wave"
		item.effects[1].value = 50
		
	item = find_item("Dami's plushie")
	if item != null:
		item.effects[0].stats.scaling_stats[0][1] = 1.2
	
	item = find_item("Slashing Turret")
	if item != null:
		item.effects[0].stats.scaling_stats[0][1] = 1.45

# note: 무기 수정 method, find_weapon으로 무기 찾은 후 property 수정
func edit_weapons() -> void:
	var w = find_weapon("WEAPON_SMG", ItemParentData.Tier.COMMON)
	if w != null:
		w.stats.damage = 999999
		w.stats.cooldown = 1
		w.stats.recoil = 1
		w.stats.recoil_duration = 0.01
	
	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.COMMON)
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
	
	w = find_weapon("WEAPON_POTATO_THROWER", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.stats.scaling_stats[0][1] = .3
		w.stats.scaling_stats[1][1] = .1
		
	w = find_weapon("WEAPON_POTATO_THROWER", ItemParentData.Tier.RARE)	
	if w != null:
		w.stats.scaling_stats[0][1] = .4
		w.stats.scaling_stats[1][1] = .1
		
	w = find_weapon("WEAPON_POTATO_THROWER", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.stats.scaling_stats[0][1] = .5
		w.stats.scaling_stats[1][1] = .1
		
	w = find_weapon("WEAPON_JOUSTING_LANCE", ItemParentData.Tier.COMMON)	
	if w != null:
		w.effects[0].value = 1
		w.effects[1].text_key = "effect_stat_while_moving"
		w.effects[1].value = 3
		w.effects[1].custom_key = "temp_stats_while_moving"
		var effect = Effect.new()
		effect.key = "stat_melee_damage"
		effect.text_key = "effect_stat_while_moving"
		effect.value = 1
		effect.custom_key = "temp_stats_while_moving"
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(effect)
		
	w = find_weapon("WEAPON_JOUSTING_LANCE", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.effects[0].value = 2
		w.effects[1].text_key = "effect_stat_while_moving"
		w.effects[1].value = 6
		w.effects[1].custom_key = "temp_stats_while_moving"
		var effect = Effect.new()
		effect.key = "stat_melee_damage"
		effect.text_key = "effect_stat_while_moving"
		effect.value = 2
		effect.custom_key = "temp_stats_while_moving"
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(effect)
		
	w = find_weapon("WEAPON_JOUSTING_LANCE", ItemParentData.Tier.RARE)	
	if w != null:
		w.effects[0].value = 3
		w.effects[1].text_key = "effect_stat_while_moving"
		w.effects[1].value = 9
		w.effects[1].custom_key = "temp_stats_while_moving"
		var effect = Effect.new()
		effect.key = "stat_melee_damage"
		effect.text_key = "effect_stat_while_moving"
		effect.value = 4
		effect.custom_key = "temp_stats_while_moving"
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(effect)
		
	w = find_weapon("WEAPON_JOUSTING_LANCE", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.effects[0].value = 5
		w.effects[1].text_key = "effect_stat_while_moving"
		w.effects[1].value = 15
		w.effects[1].custom_key = "temp_stats_while_moving"
		var effect = Effect.new()
		effect.key = "stat_melee_damage"
		effect.text_key = "effect_stat_while_moving"
		effect.value = 8
		effect.custom_key = "temp_stats_while_moving"
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(effect)

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
