extends Node



const MOD_DIR = "asw-strong_enemy/"
const LOG_NAME = "asw-strong_enemy"

var dir = ""
var content_dir = ""
var content_data_dir = ""
var weapons_dir = ""
var ext_dir = ""
var trans_dir = ""

var _modLoader

func _init(modLoader = ModLoader):
	_modLoader = modLoader
	ModLoaderLog.info("Init",  LOG_NAME)
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	trans_dir = dir + "translations/"
	content_dir = dir + "content/"
	content_data_dir = dir + "content_data/"
	ext_dir = dir + "extensions/"
	ModLoaderMod.install_script_extension("res://mods-unpacked/asw-strong_enemy/extensions/zone_service.gd")

func _ready():
	
	ModLoaderLog.info("Done",  LOG_NAME)

	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	
	ContentLoader.load_data("res://mods-unpacked/asw-strong_enemy/content/Content_data.tres", LOG_NAME)
