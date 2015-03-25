function mymineshaft.register_all(mat, desc, image, mygroups, craft, drawtype)

minetest.register_node("mymineshaft:shaft_"..mat,{
--	description = desc.." Shaft",
	tiles = {image},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 8,
	climbable = true,
	walkable = false,
	groups = {crumbly = 1,  cracky=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375}, 
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, 
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.25, 0.5, -0.375}, 
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.25}, 
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125}, 
			{-0.5, -0.5, 0.375, -0.25, 0.5, 0.5}, 
			{-0.5, -0.5, 0.25, -0.375, 0.5, 0.5}, 
			{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5}, 
			{0.25, -0.5, 0.375, 0.5, 0.5, 0.5},
			{0.375, -0.5, 0.25, 0.5, 0.5, 0.5}, 
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5},
			{0.25, -0.5, -0.5, 0.5, 0.5, -0.375},
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.25},
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375}, 
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, 
		}	
	},
})


local function update_node(pos, node) 
	minetest.set_node(pos, node)
end

local function punch(pos)
	local meta = minetest.get_meta(pos)
	local state = meta:get_int("state")
	local me = minetest.get_node(pos)
	local tmp_node
	local tmp_node2
	oben = {x=pos.x, y=pos.y, z=pos.z}
		if state == 1 then
			state = 0
			tmp_node = {name="mymineshaft:shaft_top_open_"..mat, param1=me.param1, param2=me.param2}
		else
			state = 1
			tmp_node = {name="mymineshaft:shaft_top_closed_"..mat, param1=me.param1, param2=me.param2}
		end
		update_node(pos, tmp_node)
		meta:set_int("state", state)
end

minetest.register_node("mymineshaft:shaft_top_open_"..mat,{
--	description = desc.."Open Shaft Top",
	tiles = {image.."^mymineshaft_top.png", image, image, image, image, image},
	drawtype = "nodebox",
	paramtype = "light",
	climbable = true,
	walkable = false,
	drop = "mymineshaft:shaft_top_closed_"..mat,
	groups = {  cracky=1, crumbly = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375}, 
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.25, 0.5, -0.375}, 
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.25}, 
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125}, 
			{-0.5, -0.5, 0.375, -0.25, 0.5, 0.5}, 
			{-0.5, -0.5, 0.25, -0.375, 0.5, 0.5}, 
			{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5}, 
			{0.25, -0.5, 0.375, 0.5, 0.5, 0.5}, 
			{0.375, -0.5, 0.25, 0.5, 0.5, 0.5},
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, 
			{0.25, -0.5, -0.5, 0.5, 0.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.25}, 
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		}	
	},
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})
minetest.register_node("mymineshaft:shaft_top_closed_"..mat,{
--	description = desc.." Closed Shaft Top",
	tiles = {image.."^mymineshaft_top.png", image, image, image, image, image},
	drawtype = "nodebox",
	paramtype = "light",
	climbable = true,
	walkable = true,
	groups = {  cracky=1, crumbly = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375}, 
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, 
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.25, 0.5, -0.375},
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.25}, 
			{-0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125}, 
			{-0.5, -0.5, 0.375, -0.25, 0.5, 0.5}, 
			{-0.5, -0.5, 0.25, -0.375, 0.5, 0.5}, 
			{-0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5}, 
			{0.25, -0.5, 0.375, 0.5, 0.5, 0.5}, 
			{0.375, -0.5, 0.25, 0.5, 0.5, 0.5}, 
			{0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5}, 
			{0.25, -0.5, -0.5, 0.5, 0.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.25}, 
			{0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125}, 
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, 
		}
	},
---[[
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
		}	
	},
--]]
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})

minetest.register_node("mymineshaft:shaft_bottom_"..mat,{
--	description = desc.." Shaft Bottom",
	tiles = {image},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 8,
	climbable = false,
	walkable = true,
	groups = {crumbly = 1,  cracky=1, fall_damage_add_percent = -1000},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, 
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, 
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, 
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5},  
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5},
		}	
	},

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
            minetest.chat_send_player( placer:get_player_name(), "Not enough space to place this!" )
            return
        end
        return minetest.item_place(itemstack, placer, pointed_thing)
    end,

	after_place_node = function(pos)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "mymineshaft:shaft_bottom2_"..mat})
	end,
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end
})

minetest.register_node("mymineshaft:shaft_bottom2_"..mat,{
--	description = desc.." Shaft Bottom 2",
	tiles = {image},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 8,
	climbable = true,
	walkable = false,
	drop = "mymineshaft:shaft_bottom_"..mat,
	groups = {  cracky=1, crumbly = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, 
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, 
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, 
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5},  
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375}, 
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, 
		}	
	},
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end
})

end





		
