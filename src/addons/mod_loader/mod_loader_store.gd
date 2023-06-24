extends Node













const MODLOADER_VERSION = "6.0.0"




const DEBUG_ENABLE_STORING_FILEPATHS: = false


const UNPACKED_DIR: = "res://mods-unpacked/"


const REQUIRE_CMD_LINE: = false

const LOG_NAME = "ModLoader:Store"





var mod_load_order: = []


var mod_data: = {}



var mod_missing_dependencies: = {}



var is_initializing: = true


var script_extensions: = []


var has_shown_editor_zips_warning: = false


var saved_objects: = []


var saved_scripts: = {}


var saved_mod_mains: = {}


var saved_extension_paths: = {}




var logged_messages: = {
	"all":{}, 
	"by_mod":{}, 
	"by_type":{
		"fatal-error":{}, 
		"error":{}, 
		"warning":{}, 
		"info":{}, 
		"success":{}, 
		"debug":{}, 
	}
}


var current_user_profile:ModUserProfile

var user_profiles: = {}


var cache: = {}






var ml_options: = {
	enable_mods = true, 
	log_level = ModLoaderLog.VERBOSITY_LEVEL.DEBUG, 

	
	locked_mods = [], 

	
	disabled_mods = [], 

	
	
	allow_modloader_autoloads_anywhere = false, 

	
	
	steam_workshop_enabled = false, 

	
	
	
	
	override_path_to_mods = "", 
	override_path_to_configs = "", 

	
	override_path_to_workshop = "", 

	
	
	
	ignore_deprecated_errors = false, 

	
	ignored_mod_names_in_log = [], 
}





func _init():
	_update_ml_options_from_options_resource()
	_update_ml_options_from_cli_args()
	
	_ModLoaderCache.init_cache(self)



func _update_ml_options_from_options_resource()->void :
	
	
	var ml_options_path: = "res://addons/mod_loader/options/options.tres"

	
	if _ModLoaderFile.file_exists(ml_options_path):
		var options_resource: = load(ml_options_path)
		if not options_resource.current_options == null:
			var current_options:Resource = options_resource.current_options
			
			for key in ml_options:
				ml_options[key] = current_options[key]
	else :
		ModLoaderLog.fatal(str("A critical file is missing: ", ml_options_path), LOG_NAME)



func _update_ml_options_from_cli_args()->void :
	
	if _ModLoaderCLI.is_running_with_command_line_arg("--disable-mods"):
		ml_options.enable_mods = false

	
	
	
	var cmd_line_mod_path: = _ModLoaderCLI.get_cmd_line_arg_value("--mods-path")
	if cmd_line_mod_path:
		ml_options.override_path_to_mods = cmd_line_mod_path
		ModLoaderLog.info("The path mods are loaded from has been changed via the CLI arg `--mods-path`, to: " + cmd_line_mod_path, LOG_NAME)

	
	
	
	var cmd_line_configs_path: = _ModLoaderCLI.get_cmd_line_arg_value("--configs-path")
	if cmd_line_configs_path:
		ml_options.override_path_to_configs = cmd_line_configs_path
		ModLoaderLog.info("The path configs are loaded from has been changed via the CLI arg `--configs-path`, to: " + cmd_line_configs_path, LOG_NAME)

	
	if _ModLoaderCLI.is_running_with_command_line_arg("-vvv") or _ModLoaderCLI.is_running_with_command_line_arg("--log-debug"):
		ml_options.log_level = ModLoaderLog.VERBOSITY_LEVEL.DEBUG
	elif _ModLoaderCLI.is_running_with_command_line_arg("-vv") or _ModLoaderCLI.is_running_with_command_line_arg("--log-info"):
		ml_options.log_level = ModLoaderLog.VERBOSITY_LEVEL.INFO
	elif _ModLoaderCLI.is_running_with_command_line_arg("-v") or _ModLoaderCLI.is_running_with_command_line_arg("--log-warning"):
		ml_options.log_level = ModLoaderLog.VERBOSITY_LEVEL.WARNING

	
	var ignore_mod_names: = _ModLoaderCLI.get_cmd_line_arg_value("--log-ignore")
	if not ignore_mod_names == "":
		ml_options.ignored_mod_names_in_log = ignore_mod_names.split(",")
