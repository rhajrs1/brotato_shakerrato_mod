extends ItemData

func get_effects_text()->String:
	var text = .get_effects_text()
	
	if RunData.tracked_item_effects.has("junker_" + my_id):
		var args = RunData.tracked_item_effects["junker_" + my_id]
		var args_text = ""
		if args.size() > 0:
			var duplicates = {}
			
			for arg in args:
				if duplicates.keys().has(arg):
					duplicates[arg] += 1
				else:
					duplicates[arg] = 1
			
			
			for tracked_key in duplicates.keys():
				args_text += tr(tracked_key)
				if duplicates[tracked_key] > 1:
					args_text += " (" + str(duplicates[tracked_key]) + ")"
				args_text += ", "
				
			args_text.erase(args_text.length() - 2, 2)
			
			
		text += "\n[color=#" + Utils.SECONDARY_FONT_COLOR.to_html() + "]" + Text.text(tracking_text, [args_text]) + "[/color]"
	
	return text
