extends Node

const MOD_DIR = "FrakiLoZ-BladeDancer/"
const BLADEDANCER_LOG = "FrakiLoZ-BladeDancer"

var dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", BLADEDANCER_LOG)
	dir = modLoader.UNPACKED_DIR + "FrakiLoZ-BladeDancer/"
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"

	modLoader.add_translation_from_resource(trans_dir + "mod_bladedancer_text.en.translation")

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get the ContentLoader class
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	var content_dir = "res://mods-unpacked/FrakiLoZ-BladeDancer/content_data/"
	var mod_log = "FrakiLoZ-BladeDancer"

	# Add content. These .tres files are ContentData resources
	ContentLoader.load_data(content_dir + "contentdata_character_bladedancer.tres", mod_log)
	ContentLoader.load_data(content_dir + "contentdata_weapon_dancingblade.tres", mod_log)
	ContentLoader.load_data(content_dir + "contentdata_weapon_enchantedcutlass.tres", mod_log)
	ModLoaderUtils.log_info("Done", BLADEDANCER_LOG)
