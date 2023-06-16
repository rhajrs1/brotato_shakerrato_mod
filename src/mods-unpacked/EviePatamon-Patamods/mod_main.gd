extends Node

const PATAMODS_LOG = "EviePatamon-Patamods"

var dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", PATAMODS_LOG)
	dir = modLoader.UNPACKED_DIR + "EviePatamon-Patamods/"
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"

	# Add extensions
	var extensions = [
		"/singletons/run_data.gd", #Initialise custom tracking data and stats
		"/main.gd"
	]
	for path in extensions:
		modLoader.install_script_extension(ext_dir + path)

	# Add translations
	modLoader.add_translation_from_resource(trans_dir + "patamods_text.en.translation")

func _ready():
	_load_patamods_content()
	
	#Set custom tags for items that Patamods characters will benefit from
	#hit_protection custom tagged items
	var tardigrade_data = load("res://items/all/tardigrade/tardigrade_data.tres")
	tardigrade_data.tags.push_back("hit_protection")
	
	#pickup_range custom tagged items
	var alien_tongue_data = load("res://items/all/alien_tongue/alien_tongue_data.tres")
	alien_tongue_data.tags.push_back("pickup_range")
	var little_frog_data = load("res://items/all/little_frog/little_frog_data.tres")
	little_frog_data.tags.push_back("pickup_range")
	
	#structure custom tagged items
	var StructureTag = [
		"res://items/all/landmines/landmines_data.tres",
		"res://items/all/garden/garden_data.tres",
		"res://items/all/turret/turret_data.tres",
		"res://items/all/turret_flame/turret_flame_data.tres",
		"res://items/all/turret_healing/turret_healing_data.tres",
		"res://items/all/turret_laser/turret_laser_data.tres",
		"res://items/all/turret_rocket/turret_rocket_data.tres",
		"res://items/all/tyler/tyler_data.tres",
		"res://items/all/wandering_bot/wandering_bot_data.tres",
		"res://items/all/improved_tools/improved_tools_data.tres"
		]
	for path in StructureTag:
		var StructureTag_data = load(path)
		StructureTag_data.tags.push_back("structure")

	#wave_clear custom tagged items
	var WaveClearTag = [
		"res://items/all/baby_elephant/baby_elephant_data.tres",
		"res://items/all/baby_with_a_beard/baby_with_a_beard_data.tres",
		"res://items/all/bandana/bandana_data.tres",
		"res://items/all/community_support/community_support_data.tres",
		"res://items/all/cyberball/cyberball_data.tres",
		"res://items/all/pumpkin/pumpkin_data.tres",
		"res://items/all/ricochet/ricochet_data.tres",
		"res://items/all/rip_and_tear/rip_and_tear_data.tres",
		]
	for path in WaveClearTag:
		var WaveClearTag_data = load(path)
		WaveClearTag_data.tags.push_back("wave_clear")
	
	#damage_against_bosses custom tagged items
	var silver_bullet_data = load("res://items/all/silver_bullet/silver_bullet_data.tres")
	silver_bullet_data.tags.push_back("damage_against_bosses")
	var giant_belt_data = load("res://items/all/giant_belt/giant_belt_data.tres")
	giant_belt_data.tags.push_back("damage_against_bosses")
	
	ModLoaderUtils.log_info("Done", PATAMODS_LOG)

func _load_patamods_content():
	ModLoaderUtils.log_info("Loading custom content", PATAMODS_LOG)
	
		# Get the ContentLoader class
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	var content_dir = "res://mods-unpacked/EviePatamon-Patamods/content_data/"
	var mod_log = "EviePatamon-Patamods"

	# Add content. These .tres files are ContentData resources
	ContentLoader.load_data(content_dir + "patamods_content.tres", mod_log)
