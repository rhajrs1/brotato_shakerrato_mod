extends Node



const MOD_DIR = "Psina-Extatonion/"
const LOG_NAME = "Psina-Extatonion"

var dir = ""
var content_dir = ""
var content_data_dir = ""
var weapons_dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderLog.info("Init", LOG_NAME)
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	trans_dir = dir + "translations/"
	content_dir = dir + "content/"
	content_data_dir = dir + "content_data/"
	ext_dir = dir + "extensions/"
	
	ModLoaderMod.add_translation(trans_dir + "beelze_stuff.en.translation")
	ModLoaderMod.install_script_extension(ext_dir + "singletons/progress_data.gd")
	

func _ready():
	ModLoaderLog.info("Done", LOG_NAME)
	
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	
	ContentLoader.load_data(dir + "content_data/extatonion_content.tres", LOG_NAME)

