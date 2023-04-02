extends GainStatForEveryStatEffect


func get_args()->Array:
	var junker_keys = ["different_common_items", "most_stacked_item"]
	if junker_keys.has(stat_scaled):
		var actual_nb_scaled = 0
		var displayed_stat_scaled = tr(stat_scaled.to_upper())
		if stat_scaled == "different_common_items":
			actual_nb_scaled = Utils.junker_get_unique_items_of_tier(Tier.COMMON).size()
			displayed_stat_scaled = tr("TIER_I")
		else:
			actual_nb_scaled = Utils.junker_get_most_stacked_item()[1]
			
		
		var bonus = floor(value * (actual_nb_scaled / nb_stat_scaled))
		
		return [str(value), tr(key.to_upper()), str(nb_stat_scaled), displayed_stat_scaled, str(bonus)]
	else:
		return .get_args()
