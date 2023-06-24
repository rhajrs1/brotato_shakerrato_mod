extends Node



const MOD_DIR = "damiBenro-Junker/"
const LOG_NAME = "damiBenro-Junker"

var dir = ""
var content_dir = ""
var content_data_dir = ""
var weapons_dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderLog.info("Init", LOG_NAME)
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	content_dir = dir + "content/"
	content_data_dir = dir + "content_data/"
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	
	# Add extensions
	ModLoaderMod.install_script_extension(ext_dir + "singletons/utils.gd")
	ModLoaderMod.install_script_extension(ext_dir + "singletons/progress_data.gd")
	ModLoaderMod.install_script_extension(ext_dir + "singletons/run_data.gd")
	ModLoaderMod.install_script_extension(ext_dir + "singletons/text.gd")
	ModLoaderMod.install_script_extension(ext_dir + "singletons/linked_stats.gd")
	ModLoaderMod.install_script_extension(ext_dir + "singletons/weapon_service.gd")
	ModLoaderMod.install_script_extension(ext_dir + "main.gd")
	
	# Add tranlations
	ModLoaderMod.add_translation(trans_dir + "junker_translations.en.translation")
	ModLoaderMod.add_translation(trans_dir + "junker_translations.fr.translation")
	ModLoaderMod.add_translation(trans_dir + "junker_translations.ru.translation")
	
	# Instance TierItemBoosts pseudo singleton
	_add_child_class()
	
	### LEFT TO DO : TRACK COMMONS RECEIVED

func _ready():
	ModLoaderLog.info("Done", LOG_NAME)
	
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	ContentLoader.load_data(dir + "content_data/junker_content.tres", LOG_NAME)

func _add_child_class():
	var TierItemBoosts = load(content_dir + "singletons/tier_item_boosts.gd").new()
	TierItemBoosts.name = "TierItemBoosts"
	add_child(TierItemBoosts)
