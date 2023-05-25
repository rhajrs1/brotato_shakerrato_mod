extends "res://singletons/debug_service.gd"

var supportSetData = preload("res://items/sets/support/support_set_data.tres")

func _ready():
	edit_characters()
	edit_items()
	edit_weapons()
	remove_items()
	remove_weapons()

func edit_characters() -> void:
	var character = find_character("CHARACTER_WELL_ROUNDED")
	if character != null:
		character.effects = []
		var effect = StatGainsModificationEffect.new()
		effect.key = "effect_increase_stat_gains"
		effect.text_key = ""
		effect.value = 20
		effect.custom_key = ""
		effect.storage_method = 0
		effect.effect_sign = 3
		effect.custom_args = [  ]
		effect.stat_displayed = "stat_damage"
		effect.stats_modified = [ "stat_percent_damage", "stat_ranged_damage", "stat_melee_damage", "stat_elemental_damage", "explosion_damage", "piercing_damage", "bounce_damage", "stat_engineering" ]
		character.effects.append(effect)
		
		effect = StatGainsModificationEffect.new()
		effect.key = "effect_increase_stat_gains"
		effect.text_key = ""
		effect.value = 20
		effect.custom_key = ""
		effect.storage_method = 0
		effect.effect_sign = 3
		effect.custom_args = [  ]
		effect.stat_displayed = "stat_attack_speed"
		effect.stats_modified = [ "stat_attack_speed" ]
		character.effects.append(effect)
		
		effect = StatGainsModificationEffect.new()
		effect.key = "effect_increase_stat_gains"
		effect.text_key = ""
		effect.value = 25
		effect.custom_key = ""
		effect.storage_method = 0
		effect.effect_sign = 3
		effect.custom_args = [  ]
		effect.stat_displayed = "stat_harvesting"
		effect.stats_modified = [ "stat_harvesting" ]
		character.effects.append(effect)
		
		effect = Effect.new()
		effect.key = "gain_gold"
		effect.text_key = "effect_gain_gold_end_of_wave_20"
		effect.value = 2000
		effect.custom_key = "end_of_wave_20"
		effect.storage_method = 0
		effect.effect_sign = 3
		effect.custom_args = [  ]
		character.effects.append(effect)
		
		character = find_character("CHARACTER_BRAWLER")
	if character != null:
		character.effects = []
		var e = ClassBonusEffect.new()
		e.key = "EFFECT_WEAPON_CLASS_BONUS"
		e.text_key = ""
		e.value = 150
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.set_id = "set_unarmed"
		e.stat_displayed_name = "stat_attack_speed"
		e.stat_name = "attack_speed_mod"
		character.effects.append(e)

		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_attack_speed"
		e.stats_modified = [ "stat_attack_speed" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapon_fist_1"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_dodge"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 35
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_ranged_damage"
		e.stats_modified = [ "stat_ranged_damage" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 12000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_CRAZY")
	if character != null:
		character.effects = []
		var e = ClassBonusEffect.new()
		e.key = "effect_weapon_class_bonus"
		e.text_key = ""
		e.value = 100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.set_id = "set_precise"
		e.stat_displayed_name = "stat_range"
		e.stat_name = "max_range"
		character.effects.append(e)

		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_range"
		e.stats_modified = [ "stat_range" ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 35
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapon_dagger_1"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_dodge"
		e.text_key = ""
		e.value = -30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_ranged_damage"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_RANGER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_range"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapon_pistol_1"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_ranged_damage"
		e.stats_modified = [ "stat_ranged_damage" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "no_melee_weapons"
		e.text_key = "effect_no_melee_weapons"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_max_hp"
		e.stats_modified = [ "stat_max_hp" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_ranged_damage"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 1
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_MAGE")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_elemental_damage"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 33
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_elemental_damage"
		e.stats_modified = [ "stat_elemental_damage" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "item_snake"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "item_scared_sausage"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.stat_displayed = "stat_melee_damage"
		e.stats_modified = [ "stat_melee_damage" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_ranged_damage"
		e.stats_modified = [ "stat_ranged_damage" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_elemental_damage"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 1
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 5000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_CHUNKY")
	if character != null:
		character.effects = []
		var e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		e.stat_displayed = "stat_max_hp"
		e.stats_modified = [ "stat_max_hp" ]
		character.effects.append(e)
		
		e = StatWithMaxEffect.new()
		e.key = "stat_max_hp"
		e.text_key = "EFFECT_CONSUMABLE_STAT_WHILE_MAX_LIMITED"
		e.value = 1
		e.custom_key = "consumable_stats_while_max"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.max_value = 10
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = CustomArg.Sign.FROM_ARG
		c.arg_value = CustomArg.ArgValue.USUAL
		c.arg_format = CustomArg.Format.USUAL
		e.custom_args.append(c)
		e.nb_stat_scaled = 3
		e.stat_scaled = "stat_max_hp"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "consumable_heal"
		e.text_key = "effect_consumable_heal"
		e.value = 3
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_lifesteal"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_hp_regeneration"
		e.stats_modified = [ "stat_hp_regeneration" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_dodge"
		e.stats_modified = [ "stat_dodge" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 2000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_OLD")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "enemy_speed"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "map_size"
		e.text_key = ""
		e.value = -20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "number_of_enemies"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = -5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_LUCKY")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 35
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_luck"
		e.stats_modified = [ "stat_luck" ]
		character.effects.append(e)
		
		e = ChanceStatDamageEffect.new()
		e.key = "stat_luck"
		e.text_key = "EFFECT_DEAL_DMG_WHEN_PICKUP_GOLD"
		e.value = 20
		e.custom_key = "dmg_when_pickup_gold"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.chance = 75
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_attack_speed"
		e.stats_modified = [ "stat_attack_speed" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "xp_gain"
		e.text_key = ""
		e.value = -40
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_MUTANT")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "xp_gain"
		e.text_key = ""
		e.value = 200
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "items_price"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_GENERALIST")
	if character != null:
		character.effects = []
		var e = GainStatForEveryStatEffect.new()
		e.key = "stat_melee_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = CustomArg.Sign.FROM_ARG
		c.arg_value = CustomArg.ArgValue.USUAL
		c.arg_format = CustomArg.Format.USUAL
		e.custom_args.append(c)
		e.nb_stat_scaled = 1
		e.stat_scaled = "stat_ranged_damage"
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_ranged_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = CustomArg.Sign.FROM_ARG
		c.arg_value = CustomArg.ArgValue.USUAL
		c.arg_format = CustomArg.Format.USUAL
		e.custom_args.append(c)
		e.nb_stat_scaled = 2
		e.stat_scaled = "stat_melee_damage"
		character.effects.append(e)

		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 5000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_LOUD")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = 30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "number_of_enemies"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = -3
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 2000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_MULTITASKER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "weapon_slot"
		e.text_key = "effect_max_weapons"
		e.value = 18
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = "effect_upgrade_random_weapon"
		e.value = 2
		e.custom_key = "upgrade_random_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_additional_weapon_bonus"
		e.value = -3
		e.custom_key = "additional_weapon_effects"
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 2
		c.arg_sign = 4
		c.arg_value = 4
		c.arg_format = 0
		e.custom_args.append(c)
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapons_price"
		e.text_key = ""
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 5000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		
		character = find_character("CHARACTER_WILDLING")
	if character != null:
		character.effects = []
		var e = ClassBonusEffect.new()
		e.key = "EFFECT_WEAPON_CLASS_BONUS"
		e.text_key = ""
		e.value = 30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.set_id = "set_primitive"
		e.stat_displayed_name = "stat_lifesteal"
		e.stat_name = "lifesteal"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapon_stick_1"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "max_weapon_tier"
		e.text_key = "effect_max_weapon_tier"
		e.value = 3
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 15000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_PACIFIST")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "pacifist"
		e.text_key = "effect_pacifist"
		e.value = 75
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 0
		c.arg_sign = 0
		c.arg_value = 0
		c.arg_format = 1
		e.custom_args.append(c)
		character.effects.append(e)

		e = Effect.new()
		e.key = "weapon_hand_1"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "item_lucky_coin"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "item_lumberjack_shirt"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 35
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_GLADIATOR")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = "effect_unique_weapon_bonus"
		e.value = 20
		e.custom_key = "unique_weapon_effects"
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 2
		c.arg_sign = 4
		c.arg_value = 3
		c.arg_format = 0
		e.custom_args.append(c)
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "no_ranged_weapons"
		e.text_key = "effect_no_ranged_weapons"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = -40
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = -30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 15000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_SAVER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.nb_stat_scaled = 25
		e.stat_scaled = "materials"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "item_piggy_bank"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "items_price"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 12000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_SICK")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_max_hp"
		e.text_key = ""
		e.value = 12
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_lifesteal"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "lose_hp_per_second"
		e.text_key = "effect_lose_hp_per_second"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 12000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
	character = find_character("CHARACTER_FARMER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = "EFFECT_CONSUMABLE_STAT_WHILE_MAX"
		e.value = 1
		e.custom_key = "consumable_stats_while_max"
		e.storage_method = 1
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "harvesting_growth"
		e.text_key = "effect_harvesting_growth"
		e.value = 3
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 40
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gold_drops"
		e.text_key = "effect_gold_drops"
		e.value = -20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 2000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_GHOST")
	if character != null:
		character.effects = []
		var e = GainStatForEveryStatEffect.new()
		e.key = "stat_attack_speed"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = 4
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 1
		e.stat_scaled = "stat_dodge"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "dodge_cap"
		e.text_key = "effect_dodge_cap"
		e.value = 80
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = ClassBonusEffect.new()
		e.key = "EFFECT_WEAPON_CLASS_BONUS"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.set_id = "set_ethereal"
		e.stat_displayed_name = "stat_damage"
		e.stat_name = "damage"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = ""
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_SPEEDY")
	if character != null:
		character.effects = []
		var e = GainStatForEveryStatEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_PERM_STAT"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = 4
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 2
		e.stat_scaled = "stat_speed"
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_melee_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = 4
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 2
		e.stat_scaled = "stat_speed"
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = 30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = ""
		e.value = -3
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = "effect_stat_while_not_moving"
		e.value = -50
		e.custom_key = "temp_stats_while_not_moving"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_ENTREPRENEUR")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "items_price"
		e.text_key = ""
		e.value = -20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_harvesting"
		e.stats_modified = [ "stat_harvesting" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "recycling_gains"
		e.text_key = "effect_recycling_gains"
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_pct_gold_start_wave"
		e.text_key = "effect_gain_pct_gold_start_wave"
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "EFFECT_REDUCE_STAT_GAINS"
		e.text_key = ""
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		e.stat_displayed = "stat_damage"
		e.stats_modified = [ "stat_damage" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 2000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
	character = find_character("CHARACTER_ENGINEER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_engineering"
		e.stats_modified = [ "stat_engineering" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapon_wrench_1"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "group_structures"
		e.text_key = "effect_group_structures"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_EXPLORER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "trees"
		e.text_key = "effect_trees"
		e.value = 12
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "item_lumberjack_shirt"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "pickup_range"
		e.text_key = "effect_pickup_range"
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "map_size"
		e.text_key = ""
		e.value = 33
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "number_of_enemies"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "enemy_gold_drops"
		e.text_key = "effect_enemy_gold_drops"
		e.value = -30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "enemy_speed"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -40
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "trees_start_wave"
		e.text_key = "[EMPTY]"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 5000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_DOCTOR")
	if character != null:
		character.effects = []
		var e = ClassBonusEffect.new()
		e.key = "EFFECT_WEAPON_CLASS_BONUS"
		e.text_key = ""
		e.value = 200
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.set_id = "set_medical"
		e.stat_displayed_name = "stat_attack_speed"
		e.stat_name = "attack_speed_mod"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "double_hp_regen"
		e.text_key = "effect_double_hp_regen"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_armor"
		e.stats_modified = [ "stat_armor" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_HUNTER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_range"
		e.text_key = ""
		e.value = 100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = 4
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 10
		e.stat_scaled = "stat_range"
		character.effects.append(e)

		e = Effect.new()
		e.key = "item_hunting_trophy"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_crit_chance"
		e.stats_modified = [ "stat_crit_chance" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		e.stat_displayed = "stat_harvesting"
		e.stats_modified = [ "stat_harvesting" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -33
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_max_hp"
		e.stats_modified = [ "stat_max_hp" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
	character = find_character("CHARACTER_ARTIFICER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "explosion_damage"
		e.text_key = ""
		e.value = 75
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 3
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = GainStatForEveryStatEffect.new()
		e.key = "explosion_size"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 4
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = CustomArg.Sign.FROM_ARG
		c.arg_value = CustomArg.ArgValue.USUAL
		c.arg_format = CustomArg.Format.USUAL
		e.custom_args.append(c)
		e.nb_stat_scaled = 1
		e.stat_scaled = "stat_elemental_damage"
		character.effects.append(e)

		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_harvesting"
		e.stats_modified = [ "stat_harvesting" ]
		character.effects.append(e)

		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_attack_speed"
		e.stats_modified = [ "stat_attack_speed" ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 10000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_ARMS_DEALER")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "weapons_price"
		e.text_key = ""
		e.value = -95
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 33
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_damage"
		e.stats_modified = [ "stat_percent_damage", "stat_ranged_damage", "stat_melee_damage", "stat_elemental_damage", "explosion_damage", "piercing_damage", "bounce_damage", "stat_engineering" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "item_dangerous_bunny"
		e.text_key = "effect_starting_item"
		e.value = 2
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "minimum_weapons_in_shop"
		e.text_key = "effect_minimum_weapon_in_shop"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "destroy_weapons"
		e.text_key = "effect_destroy_weapons"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_armor"
		e.stats_modified = [ "stat_armor" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 10000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_STREAMER")
	if character != null:
		character.effects = []
		var e = StatWithMaxEffect.new()
		e.key = "percent_materials"
		e.text_key = "EFFECT_GOLD_WHILE_NOT_MOVING"
		e.value = 3
		e.custom_key = "temp_stats_while_not_moving"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.max_value = 25
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 40
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = "effect_stat_while_moving"
		e.value = 40
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_armor"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 2
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = 4
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 1
		e.stat_scaled = "structure"
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "gold_drops"
		e.text_key = "effect_gold_drops"
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = -1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		c = CustomArg.new()
		c.arg_index = 2
		c.arg_sign = 0
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		c = CustomArg.new()
		c.arg_index = 3
		c.arg_sign = 0
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = 4
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 15
		e.stat_scaled = "materials"
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_speed"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = -1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		c = CustomArg.new()
		c.arg_index = 2
		c.arg_sign = 0
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		c = CustomArg.new()
		c.arg_index = 3
		c.arg_sign = 0
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = 4
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 30
		e.stat_scaled = "materials"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_CYBORG")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "weapon_minigun_3"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 250
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_ranged_damage"
		e.stats_modified = [ "stat_ranged_damage" ]
		character.effects.append(e)
		
		e = ConvertStatEffect.new()
		e.key = "stat_ranged_damage"
		e.text_key = "EFFECT_CONVERT_STAT_TEMP_HALF_WAVE"
		e.value = 1
		e.custom_key = "convert_stats_half_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.pct_converted = 100
		e.to_stat = "stat_engineering"
		e.to_value = 2
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -75
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_engineering"
		e.stats_modified = [ "stat_engineering" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_melee_damage"
		e.stats_modified = [ "stat_melee_damage" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_elemental_damage"
		e.stats_modified = [ "stat_elemental_damage" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 10000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_GLUTTON")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "explosion_damage"
		e.text_key = "EFFECT_CONSUMABLE_STAT_WHILE_MAX"
		e.value = 1
		e.custom_key = "consumable_stats_while_max"
		e.storage_method = 1
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = ItemExplodingEffect.new()
		e.key = "explode_on_consumable"
		e.text_key = "effect_explode_on_consumable"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.chance = 1
		e.explosion_scene = load("res://projectiles/explosion.tscn")
		e.scale = 2
		e.base_smoke_amount = 20
		e.sound_db_mod = -13
		e.stats = load("res://items/characters/glutton/glutton_explosion_stats.tres")
		e.tracking_text = "character_glutton"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "items_price"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "xp_gain"
		e.text_key = ""
		e.value = -20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 10000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_JACK")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "damage_against_bosses"
		e.text_key = "effect_damage_against_bosses"
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "enemy_gold_drops"
		e.text_key = "effect_enemy_gold_drops"
		e.value = 200
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "number_of_enemies"
		e.text_key = ""
		e.value = -75
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "enemy_health"
		e.text_key = ""
		e.value = 250
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "enemy_damage"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 10000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_LICH")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_lifesteal"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = ChanceStatDamageEffect.new()
		e.key = "stat_max_hp"
		e.text_key = "EFFECT_DEAL_DMG_WHEN_HEAL"
		e.value = 100
		e.custom_key = "dmg_when_heal"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.chance = 100
		character.effects.append(e)
		
		e = ItemExplodingEffect.new()
		e.key = "explode_on_death"
		e.text_key = "effect_explode_on_death"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.chance = 0.25
		e.explosion_scene = load("res://projectiles/explosion.tscn")
		e.scale = 0.65
		e.base_smoke_amount = 20
		e.sound_db_mod = -13
		e.stats = load("res://items/characters/lich/lich_explosion_stats.tres")
		e.tracking_text = "character_lich"
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_damage"
		e.stats_modified = [ "stat_percent_damage", "stat_ranged_damage", "stat_melee_damage", "stat_elemental_damage", "explosion_damage", "piercing_damage", "bounce_damage", "stat_engineering" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 10000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
	character = find_character("CHARACTER_ONE_ARM")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = 200
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_damage"
		e.stats_modified = [ "stat_percent_damage", "stat_ranged_damage", "stat_melee_damage", "stat_elemental_damage", "explosion_damage", "piercing_damage", "bounce_damage", "stat_engineering" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 8
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapon_slot"
		e.text_key = "EFFECT_ONE_WEAPON_SLOT_LIMIT"
		e.value = -5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 12000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

	character = find_character("CHARACTER_BULL")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_max_hp"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		e = Effect.new()
		e.key = "item_tardigrade"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_item"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_hp_regeneration"
		e.stats_modified = [ "stat_hp_regeneration" ]
		character.effects.append(e)
		
		e = ItemExplodingEffect.new()
		e.key = "explode_on_hit"
		e.text_key = "effect_explode_on_hit"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.chance = 1
		e.explosion_scene = load("res://projectiles/explosion.tscn")
		e.scale = 1
		e.base_smoke_amount = 20
		e.sound_db_mod = -15
		e.stats = load("res://items/characters/bull/bull_explosion_stats.tres")
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "weapon_slot"
		e.text_key = "effect_no_weapons"
		e.value = 0
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

	character = find_character("CHARACTER_SOLDIER")
	if character != null:
		var e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 4
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 3
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 15000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_MASOCHIST")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_on_hit"
		e.value = 5
		e.custom_key = "temp_stats_on_hit"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_max_hp"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = ""
		e.value = 8
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 5000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
	character = find_character("CHARACTER_KNIGHT")
	if character != null:
		character.effects = []
		var e = GainStatForEveryStatEffect.new()
		e.key = "stat_melee_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = CustomArg.Sign.FROM_ARG
		c.arg_value = CustomArg.ArgValue.USUAL
		c.arg_format = CustomArg.Format.USUAL
		e.custom_args.append(c)
		e.nb_stat_scaled = 1
		e.stat_scaled = "stat_armor"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 2
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "no_ranged_weapons"
		e.text_key = "effect_no_ranged_weapons"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -40
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_attack_speed"
		e.stats_modified = [ "stat_attack_speed" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "min_weapon_tier"
		e.text_key = "effect_min_weapon_tier"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 1
		e.custom_args = [  ]
		c = CustomArg.new()
		c.arg_index = 0
		c.arg_sign = CustomArg.Sign.NEGATIVE
		c.arg_value = CustomArg.ArgValue.TIER
		c.arg_format = CustomArg.Format.USUAL
		e.custom_args.append(c)
		character.effects.append(e)

		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 8000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)

		character = find_character("CHARACTER_DEMON")
	if character != null:
		character.effects = []
		var e = ConvertStatEffect.new()
		e.key = "materials"
		e.text_key = "effect_convert_stat_end_of_wave"
		e.value = 15
		e.custom_key = "convert_stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.pct_converted = 50
		e.to_stat = "stat_max_hp"
		e.to_value = 1
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "hp_shop"
		e.text_key = "effect_hp_shop"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 2000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_HERO")
	if character != null:
		character.effects = []
		var e = Effect.new()
		e.key = "weapon_thunder_sword_3"
		e.text_key = "effect_starting_item"
		e.value = 1
		e.custom_key = "starting_weapon"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = ConvertStatEffect.new()
		e.key = "stat_elemental_damage"
		e.text_key = "EFFECT_CONVERT_STAT_TEMP_HALF_WAVE"
		e.value = 1
		e.custom_key = "convert_stats_half_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.pct_converted = 100
		e.to_stat = "stat_melee_damage"
		e.to_value = 2
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_attack_speed"
		e.stats_modified = [ "stat_attack_speed" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_ranged_damage"
		e.stats_modified = [ "stat_ranged_damage" ]
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_reduce_stat_gains"
		e.text_key = ""
		e.value = -100
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_engineering"
		e.stats_modified = [ "stat_engineering" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 9000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_BUILDER")
	if character != null:
		character.effects = []
		var e = ConvertStatEffect.new()
		e.key = "materials"
		e.text_key = "effect_convert_stat_end_of_wave"
		e.value = 25
		e.custom_key = "convert_stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.pct_converted = 20
		e.to_stat = "stat_engineering"
		e.to_value = 1
		character.effects.append(e)
		
		e = GainStatForEveryStatEffect.new()
		e.key = "stat_harvesting"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		var c = CustomArg.new()
		c.arg_index = 2
		c.arg_sign = 0
		c.arg_value = 0
		c.arg_format = 0
		e.custom_args.append(c)
		e.nb_stat_scaled = 1
		e.stat_scaled = "structure"
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "map_size"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 2
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "map_size"
		e.text_key = ""
		e.value = -60
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 9000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		character = find_character("CHARACTER_PERFECTIONIST")
	if character != null:
		character.effects = []
		var e = StatWithMaxEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_CONSUMABLE_STAT_WHILE_MAX_LIMITED"
		e.value = 3
		e.custom_key = "consumable_stats_while_max"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.max_value = 15
		character.effects.append(e)
		
		e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 33
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		e.custom_args = [  ]
		e.stat_displayed = "stat_dodge"
		e.stats_modified = [ "stat_dodge" ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 30
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = "effect_on_hit"
		e.value = -10
		e.custom_key = "temp_stats_on_hit"
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "stat_lifesteal"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "consumable_heal"
		e.text_key = "effect_consumable_heal"
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
		e = Effect.new()
		e.key = "gain_gold"
		e.text_key = "effect_gain_gold_end_of_wave_20"
		e.value = 9000
		e.custom_key = "end_of_wave_20"
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		character.effects.append(e)
		
# note : 아이템 수정 method, find_item으로 아이템을 찾은 후 property 수정
func edit_items() -> void:
	var item = find_item("ITEM_BAIT")
	if item != null:
		for i in item.effects.size():
			if item.effects[i].key == "stat_percent_damage":
				item.effects[i].value = 12

#	item = find_item("ITEM_BOOK")
#	if item != null:
#		var effect = Effect.new()
#		effect.key = "stat_max_hp"
#		effect.text_key = "EFFECT_FEELING_GOOD"
#		effect.value = 0
#		effect.storage_method = Effect.StorageMethod.SUM
#		effect.effect_sign = Effect.Sign.FROM_VALUE
#		item.effects.append(effect)
#		effect = Effect.new()
#		effect.key = "stat_max_hp"
#		effect.text_key = "EFFECT_FEELING_INCREASING_DROPING"
#		effect.value = 0
#		effect.storage_method = Effect.StorageMethod.SUM
#		effect.effect_sign = Effect.Sign.FROM_VALUE
#		item.effects.append(effect)

	item = find_item("ITEM_GLASSES")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_range"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_PENCIL")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = 3
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = -1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_crit_chance"
		e.text_key = ""
		e.value = -1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_WEIRD_GHOST")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "hp_start_next_wave"
		e.text_key = "effect_hp_start_next_wave"
		e.value = -100
		e.custom_key = ""
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.POSITIVE
		item.effects.append(e)
		e = Effect.new()
		e.key = "enemy_damage"
		e.text_key = "effect_stat_next_wave"
		e.value = 200
		e.custom_key = "stats_next_wave"
		e.effect_sign = Effect.Sign.NEGATIVE
		e.storage_method = Effect.StorageMethod.KEY_VALUE
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		item.effects.append(e)
		e = Effect.new()
		e.key = "harvesting_growth"
		e.text_key = "effect_harvesting_growth"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.custom_args = [  ]
		e.stat_displayed = "stat_harvesting"
		e.stats_modified = [ "stat_harvesting" ]
		item.effects.append(e)

	item = find_item("ITEM_BOOK")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = 2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_LITTLE_MUSCLEY_DUDE")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = ""
		e.value = 3
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_max_hp"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_range"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_EYES_SURGERY")
	if item != null:
		item.max_nb = 4
		item.effects = []
		var e = Effect.new()
		e.key = "burning_cooldown_reduction"
		e.text_key = "effect_burning_cooldown_reduction"
		e.value = 15
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_range"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_COG")
	if item != null:
		item.max_nb = 2
		item.effects = []
		var e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 2
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e.key = "stat_speed"
		e.text_key = ""
		e.value = -2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_METAL_DETECTOR")
	if item != null:
		item.tier = 2
		item.max_nb = 2
		item.effects = []
		var e = Effect.new()
		e.key = "chance_double_gold"
		e.text_key = "effect_chance_double_gold"
		e.value = 16
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 16
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 16
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -16
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = -6
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_COMPASS")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = 4
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_crit_chance"
		e.text_key = ""
		e.value = -3
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_PADDING")
	if item != null:
		item.max_nb = 5

	item = find_item("ITEM_ALIEN_EYES")
	if item != null:
		item.max_nb = 5
		item.effects[0].weapon_stats.scaling_stats[0][1] = 0.25

	item = find_item("ITEM_VIGILANTE_RING")
	if item != null:
		for i in item.effects.size():
			if item.effects[i].key == "stat_percent_damage":
				item.effects[i].value = 4

	item = find_item("ITEM_SILVER_BULLET")
	if item != null:
		item.max_nb = 4

	item = find_item("ITEM_ALLOY")
	if item != null:
		for i in item.effects.size():
			if item.effects[i].key == "stat_melee_damage":
				item.effects[i].value = 6

	item = find_item("ITEM_CANDLE")
	if item != null:
		for i in item.effects.size():
			if item.effects[i].key == "number_of_enemies":
				item.effects[i].value = 10

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

	item = find_item("ITEM_HANDCUFFS")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "lose_hp_per_second"
		e.text_key = "effect_lose_hp_per_second"
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = "effect_on_hit"
		e.value = 2
		e.custom_key = "temp_stats_on_hit"
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_ranged_damage"
		e.text_key = "effect_on_hit"
		e.value = 1
		e.custom_key = "temp_stats_on_hit"
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "hp_cap"
		e.text_key = "EFFECT_HP_CAP"
		e.value = 500
		e.custom_key = ""
		e.storage_method = 2
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_SAD_TOMATO")
	if item != null:
		item.effects = []
		var e = StatWithMaxEffect.new()
		e.key = "stat_max_hp"
		e.text_key = "EFFECT_CONSUMABLE_STAT_WHILE_MAX_LIMITED"
		e.value = 1
		e.custom_key = "consumable_stats_while_max"
		e.storage_method = 0
		e.effect_sign = 3
		e.max_value = 4
		item.effects.append(e)

	item = find_item("ITEM_TRIANGLE_OF_POWER")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = ""
		e.value = 2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_on_hit"
		e.value = -2
		e.custom_key = "temp_stats_on_hit"
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_TOOLBOX")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = 8
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = -4
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_CLOVER")
	if item != null:
		item.max_nb = 1
		item.effects = []
		var e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_dodge"
		e.text_key = ""
		e.value = 6
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_lifesteal"
		e.text_key = ""
		e.value = -2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_ALIEN_BABY")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_max_hp"
		e.text_key = ""
		e.value = 15
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_WISDOM")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_stack_stat"
		e.value = 10
		e.custom_key = "temp_stats_stacking"
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -40
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_PEACOCK")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "xp_gain"
		e.text_key = ""
		e.value = 35
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "xp_gain"
		e.text_key = "effect_stat_next_wave"
		e.value = 100
		e.custom_key = "stats_next_wave"
		e.storage_method = 1
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "enemy_damage"
		e.text_key = "effect_stat_next_wave"
		e.value = 50
		e.custom_key = "stats_next_wave"
		e.storage_method = 1
		e.effect_sign = 1
		item.effects.append(e)
	
	item = find_item("ITEM_TARDIGRADE")
	if item != null:
		item.max_nb = 5
		
	item = find_item("ITEM_TORTURE")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "lose_hp_per_second"
		e.text_key = "effect_lose_hp_per_second"
		e.value = 1
		e.custom_key = ""
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.NEGATIVE
		item.effects.append(e)
		var effect = GainStatForEveryStatEffect.new()
		effect.key = "stat_percent_damage"
		effect.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		effect.value = 1
		effect.custom_key = ""
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.POSITIVE
		effect.custom_args = []
		effect.nb_stat_scaled = 1
		effect.stat_scaled = "stat_lifesteal"
		var c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = CustomArg.Sign.FROM_ARG
		c.arg_value = CustomArg.ArgValue.USUAL
		c.arg_format = CustomArg.Format.USUAL
		effect.custom_args.append(c)
		item.effects.append(effect)
		effect = GainStatForEveryStatEffect.new()
		effect.key = "stat_percent_damage"
		effect.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		effect.value = 2
		effect.custom_key = ""
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.POSITIVE
		effect.custom_args = []
		effect.nb_stat_scaled = 1
		effect.stat_scaled = "stat_hp_regeneration"
		c = CustomArg.new()
		c.arg_index = 4
		c.arg_sign = CustomArg.Sign.FROM_ARG
		c.arg_value = CustomArg.ArgValue.USUAL
		c.arg_format = CustomArg.Format.USUAL
		effect.custom_args.append(c)
		item.effects.append(effect)
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_lifesteal"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
	
	item = find_item("ITEM_POTION")
	if item != null:
		item.effects = []
		var e1 = StatGainsModificationEffect.new()
		e1.key = "effect_increase_stat_gains"
		e1.text_key = ""
		e1.value = 40
		e1.storage_method = Effect.StorageMethod.SUM
		e1.effect_sign = Effect.Sign.FROM_VALUE
		e1.stat_displayed = "stat_melee_damage"
		e1.stats_modified = [ "stat_melee_damage" ]
		item.effects.append(e1)
		var effect = Effect.new()
		effect.key = "explosion_size"
		effect.text_key = ""
		effect.value = -1000
		effect.custom_key = ""
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
	
	item = find_item("ITEM_POTATO")
	if item != null:
		var e = StatGainsModificationEffect.new()
		e.key = "effect_increase_stat_gains"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		e.custom_args = []
		e.stat_displayed = "stat_damage"
		e.stats_modified = [ "stat_percent_damage", "stat_ranged_damage", "stat_melee_damage", "stat_elemental_damage", "explosion_damage", "piercing_damage", "bounce_damage", "stat_engineering" ]
		var effects = item.effects
		item.effects = [ e ]
		for i in effects.size():
			item.effects.append(effects[i])
	
	item = find_item("ITEM_DIPLOMA")
	if item != null:
		item.effects[0].value = 15
		item.effects[1].value = 50
	
	item = find_item("ITEM_EXOSKELETON")
	if item != null:
		item.effects[2].value = 10

	item = find_item("ITEM_MAMMOTH")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = ""
		e.value = 15
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = 4
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = -3
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_GNOME")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_elemental_damage"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_range"
		e.text_key = ""
		e.value = 20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "pickup_range"
		e.text_key = "effect_pickup_range"
		e.value = -20
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_MEDIKIT")
	if item != null:
		item.max_nb = 1
		item.effects = []
		var e = Effect.new()
		e.key = "double_hp_regen"
		e.text_key = "effect_double_hp_regen"
		e.value = 1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_hp_regeneration"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("ITEM_FOCUS")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_unique_weapon_bonus"
		e.value = -3
		e.custom_key = "unique_weapon_effects"
		e.storage_method = 0
		e.effect_sign = 1
		e.custom_args = []
		var c = CustomArg.new()
		c.arg_index = 2
		c.arg_sign = 4
		c.arg_value = 3
		c.arg_format = 0
		e.custom_args.append(c)
		item.effects.append(e)

	item = find_item("ITEM_EXTRA_STOMACH")
	if item != null:
		item.effects[0].max_value = 15

	item = find_item("ITEM_ESTYS_COUCH")
	if item != null:
		item.max_nb = 1
		item.effects = []
		var e = StatWithMaxEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_CONSUMABLE_STAT_WHILE_MAX_LIMITED"
		e.value = 1
		e.custom_key = "consumable_stats_while_max"
		e.storage_method = 0
		e.effect_sign = 3
		e.max_value = 15
		item.effects.append(e)
		
#	item = find_item("ITEM_ESTYS_COUCH")
#	if item != null:
#		item.effects = []
#		var e = GainStatForEveryStatEffect.new()
#		e.key = "stat_crit_chance"
#		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
#		e.value = 2
#		e.storage_method = Effect.StorageMethod.SUM
#		e.effect_sign = Effect.Sign.FROM_VALUE
#		e.nb_stat_scaled = -1
#		e.stat_scaled = "stat_armor"
#		e.custom_args = []
#		var c = CustomArg.new()
#		c.arg_index = 2
#		c.arg_sign = CustomArg.Sign.NEGATIVE
#		c.arg_value = CustomArg.ArgValue.USUAL
#		c.arg_format = CustomArg.Format.USUAL
#		e.custom_args.append(c)
#		c = CustomArg.new()
#		c.arg_index = 3
#		c.arg_sign = CustomArg.Sign.NEGATIVE
#		c.arg_value = CustomArg.ArgValue.USUAL
#		c.arg_format = CustomArg.Format.USUAL
#		e.custom_args.append(c)
#		c = CustomArg.new()
#		c.arg_index = 4
#		c.arg_sign = CustomArg.Sign.FROM_ARG
#		c.arg_value = CustomArg.ArgValue.USUAL
#		c.arg_format = CustomArg.Format.USUAL
#		e.custom_args.append(c)
#		item.effects.append(e)
#		var effect = Effect.new()
#		effect.key = "stat_dodge"
#		effect.value = 10
#		effect.storage_method = Effect.StorageMethod.SUM
#		effect.effect_sign = Effect.Sign.FROM_VALUE
#		item.effects.append(effect)
#		effect = Effect.new()
#		effect.key = "stat_armor"
#		effect.value = -10
#		effect.storage_method = Effect.StorageMethod.SUM
#		effect.effect_sign = Effect.Sign.FROM_VALUE
#		item.effects.append(effect)
	
	
	item = find_item("ITEM_LANDMINES")
	if item != null:
		item.effects[0].stats.crit_damage = 2.0
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
	
	item = find_item("ITEM_TURRET")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("ITEM_TURRET_FLAME")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("ITEM_TURRET_LASER")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("ITEM_TURRET_ROCKET")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("ITEM_TYLER")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("Dami's plushie")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("Drone")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("Insect turret")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("Slashing Turret")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
		
	item = find_item("Spiky Ball")
	if item != null:
		item.effects[0].stats.scaling_stats.append([ "stat_percent_damage", 1 ])
		item.effects[0].stats.scaling_stats.append([ "stat_crit_chance", 1 ])
	
	item = find_item("Blanket")
	if item != null:
		item.effects[2].value = -2
		
	item = find_item("Extra onion")
	if item != null:
		item.effects[1].value = -2

	item = find_item("Not a rat")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("Brun's badge")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = 15
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = ""
		e.value = -1
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)


	item = find_item("Gabriel's gloves")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 15
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_elemental_damage"
		e.text_key = ""
		e.value = -2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("John's coat")
	if item != null:
		item.effects[0].value = 30
		item.effects[1].value = -2
		item.effects[2].value = -2
	
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
		item.effects = []
		var e = Effect.new()
		e.key = "stat_dodge"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_attack_speed"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = -4
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		
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

	item = find_item("ITEM_DOMINO")
	if item != null:
		item.effects = []
		var e = ChanceStatDamageEffect.new()
		e.key = "stat_attack_speed"
		e.text_key = "EFFECT_DEAL_DMG_WHEN_DEATH"
		e.value = 25
		e.custom_key = "dmg_when_death"
		e.storage_method = 0
		e.effect_sign = 3
		e.chance = 25
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_luck"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = -4
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		item.effects.append(e)

	item = find_item("ITEM_BELL_COLLAR")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "number_of_enemies"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 2
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_dodge"
		e.text_key = ""
		e.value = 10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 0
		item.effects.append(e)
		e = Effect.new()
		e.key = "xp_gain"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 1
		item.effects.append(e)
		
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

	item = find_item("June's Tail")
	if item != null:
		item.effects = []
		var e = GainStatForEveryStatEffect.new()
		e.key = "stat_percent_damage"
		e.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e.value = 2
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		e.nb_stat_scaled = 5
		e.stat_scaled = "stat_luck"
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = ""
		e.value = -5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		
	item = find_item("Cursed dice")
	if item != null:
		item.max_nb = 1
		
	item = find_item("Modding Guide")
	if item != null:
		item.max_nb = 2
		item.effects = []
		var e = Effect.new()
		e.key = "stat_engineering"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 4
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = -4
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		
	item = find_item("Olexa's mantle")
	if item != null:
		item.max_nb = 1
		item.effects[0].nb_stat_scaled = 2
		
	item = find_item("John's contract")
	if item != null:
		item.effects = []
		var e = Effect.new()
		e.key = "stat_harvesting"
		e.text_key = ""
		e.value = 35
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = ""
		e.value = 25
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_max_hp"
		e.value = -10
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

	item = find_item("Dark altar")
	if item != null:
		item.effects = []
		var e1 = StatGainsModificationEffect.new()
		e1.key = "effect_increase_stat_gains"
		e1.text_key = ""
		e1.value = 7
		e1.storage_method = Effect.StorageMethod.SUM
		e1.effect_sign = Effect.Sign.FROM_VALUE
		e1.stat_displayed = "stat_harvesting"
		e1.stats_modified = [ "stat_harvesting" ]
		item.effects.append(e1)
		var effect = Effect.new()
		effect.key = "stat_harvesting"
		effect.value = 20
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)

	item = find_item("Investments")
	if item != null:
		item.max_nb = 1
		item.effects = []
		var e1 = GainStatForEveryStatEffect.new()
		e1.key = "stat_harvesting"
		e1.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT"
		e1.value = 1
		e1.effect_sign = Effect.Sign.FROM_VALUE
		e1.nb_stat_scaled = 1
		e1.stat_scaled = "xp_gain"
		item.effects.append(e1)
		var effect = Effect.new()
		effect.key = "stat_percent_damage"
		effect.text_key = ""
		effect.value = -5
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)

	item = find_item("Dami's plushie")
	if item != null:
		item.effects[0].stats.scaling_stats[0][1] = 1.2
	
	item = find_item("Slashing Turret")
	if item != null:
		item.effects[0].stats.scaling_stats[0][1] = 1.45
	
	item = find_item("Meat Amulet")
	if item != null:
		item.max_nb = 1
		
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
		item.effects = []
		var effect = Effect.new()
		effect.key = "stat_melee_damage"
		effect.text_key = ""
		effect.value = 8
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		var e2 = StatGainsModificationEffect.new()
		e2.key = "effect_increase_stat_gains"
		e2.value = 10
		e2.storage_method = Effect.StorageMethod.SUM
		e2.effect_sign = Effect.Sign.FROM_VALUE
		e2.stat_displayed = "stat_melee_damage"
		e2.stats_modified = [ "stat_melee_damage" ]
		item.effects.append(e2)
		effect = Effect.new()
		effect.key = "stat_range"
		effect.value = 250
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		effect = Effect.new()
		effect.key = "stat_max_hp"
		effect.value = -15
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)	
	
	item = find_item("Vurtfish")
	if item != null:
		item.max_nb = 1
		item.effects = []
		var effect = Effect.new()
		effect.key = "hit_protection"
		effect.text_key = "effect_hit_protection"
		effect.value = 1
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		var e1 = StatGainsModificationEffect.new()
		e1.key = "effect_increase_stat_gains"
		e1.text_key = ""
		e1.value = 60
		e1.storage_method = Effect.StorageMethod.SUM
		e1.effect_sign = Effect.Sign.FROM_VALUE
		e1.stat_displayed = "stat_attack_speed"
		e1.stats_modified = [ "stat_attack_speed" ]
		item.effects.append(e1)
		effect = Effect.new()
		effect.key = "stat_range"
		effect.value = 350
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
		effect.key = "stat_max_hp"
		effect.value = -30
		effect.storage_method = Effect.StorageMethod.SUM
		effect.effect_sign = Effect.Sign.FROM_VALUE
		item.effects.append(effect)
		e1 = StatGainsModificationEffect.new()
		e1.key = "effect_reduce_stat_gains"
		e1.text_key = ""
		e1.value = -100
		e1.storage_method = Effect.StorageMethod.SUM
		e1.effect_sign = Effect.Sign.FROM_VALUE
		e1.stat_displayed = "stat_ranged_damage"
		e1.stats_modified = [ "stat_ranged_damage" ]
		item.effects.append(e1)

	item = find_item("Tank muzzle")
	if item != null:
		item.max_nb = 1
		item.effects = []
		var e = Effect.new()
		e.key = "explosion_damage"
		e.text_key = "effect_gain_stat_end_of_wave"
		e.value = 8
		e.custom_key = "stats_end_of_wave"
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "explosion_size"
		e.text_key = ""
		e.value = 50
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_armor"
		e.text_key = ""
		e.value = -5
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)
		e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = -10
		e.custom_key = ""
		e.storage_method = 0
		e.effect_sign = 3
		item.effects.append(e)

# note: 무기 수정 method, find_weapon으로 무기 찾은 후 property 수정
func edit_weapons() -> void:
	var w = find_weapon("WEAPON_POTATO_THROWER", ItemParentData.Tier.UNCOMMON)	
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
		w.effects = []
		var e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = 2
		e.custom_key = ""
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 3
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 1
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		
	w = find_weapon("WEAPON_JOUSTING_LANCE", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.effects = []
		var e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = 2
		e.custom_key = ""
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 6
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 2
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		
	w = find_weapon("WEAPON_JOUSTING_LANCE", ItemParentData.Tier.RARE)	
	if w != null:
		w.effects = []
		var e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = 3
		e.custom_key = ""
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 9
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 4
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		
	w = find_weapon("WEAPON_JOUSTING_LANCE", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.effects = []
		var e = Effect.new()
		e.key = "stat_speed"
		e.text_key = ""
		e.value = 5
		e.custom_key = ""
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_percent_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 15
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)
		e = Effect.new()
		e.key = "stat_melee_damage"
		e.text_key = "effect_stat_while_moving"
		e.value = 8
		e.custom_key = "temp_stats_while_moving"
		e.storage_method = Effect.StorageMethod.SUM
		e.effect_sign = Effect.Sign.FROM_VALUE
		w.effects.append(e)

	w = find_weapon("WEAPON_ROCK", ItemParentData.Tier.COMMON)
	if w != null:
		w.stats.scaling_stats[0][1] = 1.0
		
	w = find_weapon("WEAPON_ROCK", ItemParentData.Tier.UNCOMMON)
	if w != null:
		w.stats.scaling_stats[0][1] = 1.0
		
	w = find_weapon("WEAPON_ROCK", ItemParentData.Tier.RARE)
	if w != null:
		w.stats.scaling_stats[0][1] = 1.25
		
	w = find_weapon("WEAPON_ROCK", ItemParentData.Tier.LEGENDARY)
	if w != null:
		w.stats.scaling_stats[0][1] = 1.5

	w = find_weapon("Bow", ItemParentData.Tier.COMMON)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.2
		w.stats.scaling_stats[1][1] = 0.1
		w.stats.crit_damage = 2
		w.stats.piercing = 2
		
	w = find_weapon("Bow", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.3
		w.stats.scaling_stats[1][1] = 0.125
		w.stats.crit_damage = 2.25
		w.stats.piercing = 2

	w = find_weapon("Bow", ItemParentData.Tier.RARE)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.4
		w.stats.scaling_stats[1][1] = 0.15
		w.stats.crit_damage = 2.5
		w.stats.piercing = 2
		
	w = find_weapon("Bow", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.5
		w.stats.scaling_stats[1][1] = 0.2
		w.stats.crit_damage = 3
		w.stats.piercing = 2

	w = find_weapon("Taxes", ItemParentData.Tier.COMMON)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 0.1 ])
		w.stats.crit_damage = 2
		
	w = find_weapon("Taxes", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 0.2 ])
		w.stats.crit_damage = 3

	w = find_weapon("Taxes", ItemParentData.Tier.RARE)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 0.3 ])
		w.stats.crit_damage = 4
		
	w = find_weapon("Taxes", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 0.4 ])
		w.stats.crit_damage = 5

	w = find_weapon("WEAPON_HOOKSHOT", ItemParentData.Tier.COMMON)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.8
		w.stats.scaling_stats[1][1] = 0.1
		
	w = find_weapon("WEAPON_HOOKSHOT", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.7
		w.stats.scaling_stats[1][1] = 0.15

	w = find_weapon("WEAPON_HOOKSHOT", ItemParentData.Tier.RARE)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.6
		w.stats.scaling_stats[1][1] = 0.2
		
	w = find_weapon("WEAPON_HOOKSHOT", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.stats.scaling_stats[0][1] = 0.5
		w.stats.scaling_stats[1][1] = 0.25

	w = find_weapon("WEAPON_DANCING_BLADE", ItemParentData.Tier.COMMON)	
	if w != null:
		w.stats.crit_damage = 2
		
	w = find_weapon("WEAPON_DANCING_BLADE", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.stats.crit_damage = 2.25

	w = find_weapon("WEAPON_DANCING_BLADE", ItemParentData.Tier.RARE)	
	if w != null:
		w.stats.crit_damage = 2.5
		
	w = find_weapon("WEAPON_DANCING_BLADE", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.stats.crit_damage = 3

	w = find_weapon("WEAPON_ENCHANTED_CUTLASS", ItemParentData.Tier.COMMON)	
	if w != null:
		w.stats.scaling_stats[0][1] = 1.0
		
	w = find_weapon("WEAPON_ENCHANTED_CUTLASS", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.stats.scaling_stats[0][1] = 1.25

	w = find_weapon("WEAPON_ENCHANTED_CUTLASS", ItemParentData.Tier.RARE)	
	if w != null:
		w.stats.scaling_stats[0][1] = 1.25
		
	w = find_weapon("WEAPON_ENCHANTED_CUTLASS", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.stats.scaling_stats[0][1] = 1.5

	w = find_weapon("WEAPON_SPIKY_SHIELD", ItemParentData.Tier.COMMON)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 1.0 ])
		
	w = find_weapon("WEAPON_SPIKY_SHIELD", ItemParentData.Tier.UNCOMMON)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 1.0 ])

	w = find_weapon("WEAPON_SPIKY_SHIELD", ItemParentData.Tier.RARE)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 1.0 ])
		
	w = find_weapon("WEAPON_SPIKY_SHIELD", ItemParentData.Tier.LEGENDARY)	
	if w != null:
		w.stats.scaling_stats.append([ "stat_melee_damage", 1.0 ])
		
	w = find_weapon("WEAPON_WRENCH", ItemParentData.Tier.COMMON)
	if w != null:
		w.stats.scaling_stats.append([ "stat_engineering", .7 ])
		
	w = find_weapon("WEAPON_WRENCH", ItemParentData.Tier.UNCOMMON)
	if w != null:
		w.stats.scaling_stats.append([ "stat_engineering", .8 ])
		
	w = find_weapon("WEAPON_WRENCH", ItemParentData.Tier.RARE)
	if w != null:
		w.stats.scaling_stats.append([ "stat_engineering", .9 ])
		
	w = find_weapon("WEAPON_WRENCH", ItemParentData.Tier.LEGENDARY)
	if w != null:
		w.stats.scaling_stats.append([ "stat_engineering", 1.0 ])
	
	supportSetData.set_bonuses[0][0].value = 25
	supportSetData.set_bonuses[1][0].value = 30
	supportSetData.set_bonuses[2][0].value = 35
	supportSetData.set_bonuses[3][0].value = 40
	supportSetData.set_bonuses[4][0].value = 50
	
	w = find_weapon("WEAPON_SCREWDRIVER", ItemParentData.Tier.COMMON)
	if w != null:
		w.stats.scaling_stats[0][1] = 0.5
		w.stats.scaling_stats[1][1] = 0.5
		w.sets.append(supportSetData)

	w = find_weapon("WEAPON_SCREWDRIVER", ItemParentData.Tier.UNCOMMON)
	if w != null:
		w.stats.scaling_stats[0][1] = 0.6
		w.stats.scaling_stats[1][1] = 0.6
		w.sets.append(supportSetData)

	w = find_weapon("WEAPON_SCREWDRIVER", ItemParentData.Tier.RARE)
	if w != null:
		w.stats.scaling_stats[0][1] = 0.7
		w.stats.scaling_stats[1][1] = 0.7
		w.sets.append(supportSetData)

	w = find_weapon("WEAPON_SCREWDRIVER", ItemParentData.Tier.LEGENDARY)
	if w != null:
		w.stats.scaling_stats[0][1] = 1.0
		w.stats.scaling_stats[1][1] = 1.0
		w.sets.append(supportSetData)

	w = find_weapon("WEAPON_OBLITERATOR", ItemParentData.Tier.RARE)
	if w != null:
		w.stats.projectile_speed = 2000

	w = find_weapon("WEAPON_OBLITERATOR", ItemParentData.Tier.LEGENDARY)
	if w != null:
		w.stats.projectile_speed = 2000

	w = find_weapon("WEAPON_LASER_GUN", ItemParentData.Tier.COMMON)
	if w != null:
		w.stats.cooldown = 60
		w.stats.recoil = 30
		w.stats.recoil_duration = 0.15
		
	w = find_weapon("WEAPON_LASER_GUN", ItemParentData.Tier.UNCOMMON)
	if w != null:
		w.stats.cooldown = 55
		w.stats.recoil = 30
		w.stats.recoil_duration = 0.15
		
	w = find_weapon("WEAPON_LASER_GUN", ItemParentData.Tier.RARE)
	if w != null:
		w.stats.cooldown = 50
		w.stats.recoil = 30
		w.stats.recoil_duration = 0.15
		
	w = find_weapon("WEAPON_LASER_GUN", ItemParentData.Tier.LEGENDARY)
	if w != null:
		w.stats.cooldown = 45
		w.stats.recoil = 30
		w.stats.recoil_duration = 0.15

	w = find_weapon("WEAPON_PISTOL", ItemParentData.Tier.COMMON)
	if w != null:
		w.stats.crit_damage = 2.15
		w.stats.scaling_stats[0][1] = 1.0

	w = find_weapon("WEAPON_PISTOL", ItemParentData.Tier.UNCOMMON)
	if w != null:
		w.stats.crit_damage = 2.3
		w.stats.scaling_stats[0][1] = 1.1

	w = find_weapon("WEAPON_PISTOL", ItemParentData.Tier.RARE)
	if w != null:
		w.stats.crit_damage = 2.4
		w.stats.scaling_stats[0][1] = 1.2
		
	w = find_weapon("WEAPON_PISTOL", ItemParentData.Tier.LEGENDARY)
	if w != null:
		w.stats.crit_damage = 2.5
		w.stats.scaling_stats[0][1] = 1.5
		
		
		
		
#	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.COMMON)
#	if w != null:
#		w.stats.damage = 20000
#		w.stats.cooldown = 1
#		w.stats.recoil = 1
#		w.stats.recoil_duration = 0.05
#
#	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.UNCOMMON)
#	if w != null:
#		w.stats.damage = 20000
#		w.stats.cooldown = 1
#		w.stats.recoil = 1
#		w.stats.recoil_duration = 0.05
#
#	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.RARE)
#	if w != null:
#		w.stats.damage = 20000
#		w.stats.cooldown = 1
#		w.stats.recoil = 1
#		w.stats.recoil_duration = 0.05
#
#	w = find_weapon("WEAPON_SHREDDER", ItemParentData.Tier.LEGENDARY)
#	if w != null:
#		w.stats.damage = 20000
#		w.stats.cooldown = 1
#		w.stats.recoil = 1
#		w.stats.recoil_duration = 0.05
#
#	for i in ItemService.characters.size():
#		ItemService.characters[i].starting_weapons.append(w)
#
#	w = find_weapon("WEAPON_SCREWDRIVER", ItemParentData.Tier.LEGENDARY)
#
#	for i in ItemService.characters.size():
#		ItemService.characters[i].starting_weapons.append(w)
#
#	var character = find_character("CHARACTER_WELL_ROUNDED")
#	if character != null:
#		var e = Effect.new()
#		e.key = "stat_max_hp"
#		e.text_key = ""
#		e.value = 999999
#		e.custom_key = ""
#		e.storage_method = 0
#		e.effect_sign = 3
#		e.custom_args = [  ]
#		character.effects.append(e)
#		e = Effect.new()
#		e.key = "stat_crit_chance"
#		e.text_key = ""
#		e.value = 50.0
#		e.custom_key = ""
#		e.storage_method = 0
#		e.effect_sign = 3
#		e.custom_args = [  ]
#		character.effects.append(e)
#		e = Effect.new()
#		e.key = "stat_speed"
#		e.text_key = ""
#		e.value = 60
#		e.custom_key = ""
#		e.storage_method = 0
#		e.effect_sign = 3
#		e.custom_args = [  ]
#		character.effects.append(e)
#		e = Effect.new()
#		e.key = "giant_crit_damage"
#		e.text_key = "effect_giant_crit_damage"
#		e.value = 10
#		e.custom_key = ""
#		e.storage_method = 0
#		e.effect_sign = 3
#		e.custom_args = [  ]
#		var c = CustomArg.new()
#		c.arg_index = 1
#		c.arg_sign = CustomArg.Sign.POSITIVE
#		c.arg_value = CustomArg.ArgValue.VALUE
#		c.arg_format = CustomArg.Format.ARG_VALUE_AS_NUMBER
#		e.custom_args.append(c)
#		character.effects.append(e)


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
func find_character(name: String):
	for i in ItemService.characters.size():
		if ItemService.characters[i].name == name:
			return ItemService.characters[i]
	print("Fail to find character : " + name)
	return null

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
