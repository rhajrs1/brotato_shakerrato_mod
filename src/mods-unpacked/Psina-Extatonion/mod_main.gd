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
	ModLoaderUtils.log_info("Init", LOG_NAME)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	trans_dir = dir + "translations/"
	content_dir = dir + "content/"
	content_data_dir = dir + "content_data/"
	ext_dir = dir + "extensions/"
	
	modLoader.add_translation_from_resource(trans_dir + "beelze_stuff.en.translation")
	modLoader.install_script_extension(ext_dir + "singletons/progress_data.gd")
	

func _ready():
	ModLoaderUtils.log_info("Done", LOG_NAME)
	
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	
	ContentLoader.load_data(dir + "content_data/extatonion_content.tres", LOG_NAME)

