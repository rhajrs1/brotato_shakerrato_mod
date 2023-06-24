extends Node

const MOD_NAME = "otDan-BetterModList"

var dir = ""

func _init(modLoader = ModLoader):
	ModLoaderLog.info("Init", MOD_NAME)
	dir = ModLoaderMod.get_unpacked_dir() + MOD_NAME + "/"

	_add_child_classes()

	ModLoaderMod.install_script_extension(dir + "extensions/ui/menus/title_screen/title_screen_menus.gd")

	ModLoaderMod.add_translation(dir + "modlist_translation.en.translation")

func _ready():
	ModLoaderLog.info("Readying", MOD_NAME)
	ModLoaderLog.success("Loaded", MOD_NAME)

func _add_child_classes():
	var Colors = load(dir + "global/colors.gd").new()
	Colors.name = "Colors"
	add_child(Colors)
