extends Node

const MOD_DIR = "shakerratto-LevelOfDifficulty/"
const MYMODNAME_LOG = "shakerrato"

var dir = ""
var content_dir = ""
var content_data_dir = ""
var weapons_dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MYMODNAME_LOG)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	content_dir = dir + "content/"
	content_data_dir = dir + "content_data/"
	
	# Add extensions
	modLoader.install_script_extension(ext_dir + "ui/menus/run/difficulty_selection/difficulty_selection.gd")
	modLoader.install_script_extension(ext_dir + "projectiles/bullet_enemy/enemy_projectile.gd")
	modLoader.install_script_extension(ext_dir + "entities/structures/landmine/landmine.gd")
	modLoader.install_script_extension(ext_dir + "entities/structures/turret/turret.gd")
	modLoader.install_script_extension(ext_dir + "entities/units/enemies/enemy.gd")
	modLoader.install_script_extension(ext_dir + "entities/units/enemies/boss/boss.gd")
	modLoader.install_script_extension(ext_dir + "zones/wave_manager.gd")
	modLoader.install_script_extension(ext_dir + "singletons/run_data.gd")
	modLoader.install_script_extension(ext_dir + "singletons/debug_service.gd")
	modLoader.install_script_extension(ext_dir + "main.gd")
	
	# Add translations
	modLoader.add_translation_from_resource(trans_dir + "/shakerratto_translations.en.translation")
	modLoader.add_translation_from_resource(trans_dir + "/shakerratto_translations.ko.translation")

func _ready():
	RunData.boss_1 = load(ext_dir + "entities/units/enemies/001/001.tscn")
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	ContentLoader.load_data(content_data_dir + "main_content.tres", MYMODNAME_LOG)
