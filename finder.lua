core.register_node("mymineshaft:cave_finder", {
	description = "Cave Finder",
	drawtype = "normal",
	tiles = {
		"mymineshaft_cave_finder_top.png",
		"mymineshaft_cave_finder_top.png",
		"mymineshaft_cave_finder_top.png",
		"mymineshaft_cave_finder_top.png",
		"mymineshaft_cave_finder_front.png",
		"mymineshaft_cave_finder_front.png",
	},
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	groups = {handy = 1, snappy = 3, not_in_creative_inventory = 0},
})
core.register_craft({
		output = "mymineshaft:cave_finder",
		recipe = {
			{"group:wood","default:sand","group:wood"},
			{"default:sand","default:glass","default:sand"},
			{"group:wood","default:sand","group:wood"}
			}
})

