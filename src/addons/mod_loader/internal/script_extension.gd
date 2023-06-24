class_name _ModLoaderScriptExtension
extends Reference





const LOG_NAME: = "ModLoader:ScriptExtension"




static func handle_script_extensions()->void :
	var script_extension_data_array: = []
	for extension_path in ModLoaderStore.script_extensions:

		if not File.new().file_exists(extension_path):
			ModLoaderLog.error("The child script path '%s' does not exist" % [extension_path], LOG_NAME)
			continue

		var child_script = ResourceLoader.load(extension_path)

		var mod_id:String = extension_path.trim_prefix(_ModLoaderPath.get_unpacked_mods_dir_path()).get_slice("/", 0)

		var parent_script:Script = child_script.get_base_script()
		var parent_script_path:String = parent_script.resource_path

		script_extension_data_array.push_back(
			ScriptExtensionData.new(extension_path, parent_script_path, mod_id)
		)

	
	script_extension_data_array = _sort_extensions_from_load_order(script_extension_data_array)

	
	script_extension_data_array.sort_custom(InheritanceSorting, "_check_inheritances")

	
	for extension in script_extension_data_array:
		var script:Script = apply_extension(extension.extension_path)
		_reload_vanilla_child_classes_for(script)



class InheritanceSorting:
	
	static func _check_inheritances(extension_a:ScriptExtensionData, extension_b:ScriptExtensionData)->bool:
		var a_stack: = []
		var parent_script:Script = load(extension_a.extension_path)
		while parent_script:
			a_stack.push_front(parent_script.resource_path)
			parent_script = parent_script.get_base_script()
		a_stack.pop_back()
		
		var b_stack: = []
		parent_script = load(extension_b.extension_path)
		while parent_script:
			b_stack.push_front(parent_script.resource_path)
			parent_script = parent_script.get_base_script()
		b_stack.pop_back()
		
		var last_index:int
		for index in a_stack.size():
			if index >= b_stack.size():
				return false
			if a_stack[index] != b_stack[index]:
				return a_stack[index] < b_stack[index]
			last_index = index
			
		if last_index < b_stack.size():
			
			return true
			
		return extension_a.extension_path < extension_b.extension_path

static func apply_extension(extension_path:String)->Script:
	
	if not File.new().file_exists(extension_path):
		ModLoaderLog.error("The child script path '%s' does not exist" % [extension_path], LOG_NAME)
		return null

	var child_script:Script = ResourceLoader.load(extension_path)
	
	
	
	
	child_script.set_meta("extension_script_path", extension_path)

	
	
	
	
	
	
	
	child_script.new()

	var parent_script:Script = child_script.get_base_script()
	var parent_script_path:String = parent_script.resource_path

	
	
	if not ModLoaderStore.saved_scripts.has(parent_script_path):
		ModLoaderStore.saved_scripts[parent_script_path] = []
		
		
		ModLoaderStore.saved_scripts[parent_script_path].append(parent_script.duplicate())

	ModLoaderStore.saved_scripts[parent_script_path].append(child_script)

	ModLoaderLog.info("Installing script extension: %s <- %s" % [parent_script_path, extension_path], LOG_NAME)
	child_script.take_over_path(parent_script_path)

	return child_script



static func _sort_extensions_from_load_order(extensions:Array)->Array:
	var extensions_sorted: = []

	for _mod_data in ModLoaderStore.mod_load_order:
		for script in extensions:
			if script.mod_id == _mod_data.dir_name:
				extensions_sorted.push_front(script)

	return extensions_sorted





static func _reload_vanilla_child_classes_for(script:Script)->void :
	if script == null:
		return 
	var current_child_classes: = []
	var actual_path:String = script.get_base_script().resource_path
	var classes:Array = ProjectSettings.get_setting("_global_script_classes")

	for _class in classes:
		if _class.path == actual_path:
			current_child_classes.push_back(_class)
			break

	for _class in current_child_classes:
		for child_class in classes:

			if child_class.base == _class.class :
				load(child_class.path).reload()



static func remove_specific_extension_from_script(extension_path:String)->void :
	
	if not _ModLoaderFile.file_exists(extension_path):
		ModLoaderLog.error("The extension script path \"%s\" does not exist" % [extension_path], LOG_NAME)
		return 

	var extension_script:Script = ResourceLoader.load(extension_path)
	var parent_script:Script = extension_script.get_base_script()
	var parent_script_path:String = parent_script.resource_path

	
	if not ModLoaderStore.saved_scripts.has(parent_script_path):
		ModLoaderLog.error("The extension parent script path \"%s\" has not been extended" % [parent_script_path], LOG_NAME)
		return 

	
	
	if not ModLoaderStore.saved_scripts[parent_script_path].size() > 0:
		ModLoaderLog.error("The extension script path \"%s\" does not have the base script saved, this should never happen, if you encounter this please create an issue in the github repository" % [parent_script_path], LOG_NAME)
		return 

	var parent_script_extensions:Array = ModLoaderStore.saved_scripts[parent_script_path].duplicate()
	parent_script_extensions.remove(0)

	
	var found_script_extension:Script = null
	for script_extension in parent_script_extensions:
		if script_extension.get_meta("extension_script_path") == extension_path:
			found_script_extension = script_extension
			break

	if found_script_extension == null:
		ModLoaderLog.error("The extension script path \"%s\" has not been found in the saved extension of the base script" % [parent_script_path], LOG_NAME)
		return 
	parent_script_extensions.erase(found_script_extension)

	
	_remove_all_extensions_from_script(parent_script_path)

	
	for script_extension in parent_script_extensions:
		apply_extension(script_extension.get_meta("extension_script_path"))



static func _remove_all_extensions_from_script(parent_script_path:String)->void :
	
	if not _ModLoaderFile.file_exists(parent_script_path):
		ModLoaderLog.error("The parent script path \"%s\" does not exist" % [parent_script_path], LOG_NAME)
		return 

	
	if not ModLoaderStore.saved_scripts.has(parent_script_path):
		ModLoaderLog.error("The parent script path \"%s\" has not been extended" % [parent_script_path], LOG_NAME)
		return 

	
	
	if not ModLoaderStore.saved_scripts[parent_script_path].size() > 0:
		ModLoaderLog.error("The parent script path \"%s\" does not have the base script saved, \nthis should never happen, if you encounter this please create an issue in the github repository" % [parent_script_path], LOG_NAME)
		return 

	var parent_script:Script = ModLoaderStore.saved_scripts[parent_script_path][0]
	parent_script.take_over_path(parent_script_path)

	
	ModLoaderStore.saved_scripts.erase(parent_script_path)



static func remove_all_extensions_of_mod(mod:ModData)->void :
	var _to_remove_extension_paths:Array = ModLoaderStore.saved_extension_paths[mod.manifest.get_mod_id()]
	for extension_path in _to_remove_extension_paths:
		remove_specific_extension_from_script(extension_path)
		ModLoaderStore.saved_extension_paths.erase(mod.manifest.get_mod_id())
