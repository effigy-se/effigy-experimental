/datum/techweb_node/bluespace_miner
	id = "bluespace_miner"
	display_name = "Bluespace Miner"
	description = "The future is here, where we can mine ores from the great bluespace sea."
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	hidden = TRUE
	experimental = TRUE
	prereq_ids = list(TECHWEB_NODE_APPLIED_BLUESPACE)
	design_ids = list(
		"bluespace_miner",
	)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_ENGINEERING, RADIO_CHANNEL_SUPPLY)
