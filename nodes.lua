function mymineshaft.register_all(mat, desc, image, mygroups, craft, drawtype)

local shaftbox = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.46}, 
			{0.46, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, 0.46, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.46, 0.5, 0.5}, 
			}	
		}
local topboxc = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			}	
		}
local bottomnbox = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, 
			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375}, 
			}
		}
local bottombox = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, 
			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375}, 
			}
		}
local bottombox2 = {
		type = "fixed",
		fixed = {
			{-0.5, 0.5, 0.375, -0.375, 0.5, 0.5}, 
			{0.375, 0.5, 0.375, 0.5, 0.5, 0.5}, 
			{-0.5, 0.5, -0.5, -0.375, 0.5, -0.375}, 
			{0.375, 0.5, -0.5, 0.5, 0.5, -0.375}, 
			}	
		}
local middlebox = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, -0.375, 1.5, 0.5}, 
			{0.375, -0.5, 0.375, 0.5, 1.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375}, 
			{0.375, -0.5, -0.5, 0.5, 1.5, -0.375}, 
			}	
		}

core.register_node("mymineshaft:shaft_"..mat,{
	description = desc.." Shaft",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_shaft.obj",
	paramtype = "light",
	light_source = 8,
	climbable = true,
	walkable = true,
	groups = {crumbly = 1,  cracky=1, not_in_creative_inventory=1},
	selection_box = shaftbox,
	collision_box = shaftbox,
})
core.register_node("mymineshaft:shaft_top_open_"..mat,{
	description = desc.."Open Shaft Top",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_shaft.obj",
	paramtype = "light",
	climbable = true,
	walkable = true,
	drop = "mymineshaft:shaft_top_closed_"..mat,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = shaftbox,
	collision_box = shaftbox,
	
	on_punch = function(pos, node, clicker)
		core.set_node(pos,{name = "mymineshaft:shaft_top_closed_"..mat})
	end,
})
core.register_node("mymineshaft:shaft_top_closed_"..mat,{
	description = desc.." Closed Shaft Top",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_shaftc.obj",
	paramtype = "light",
	climbable = true,
	walkable = true,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	sounds = {footstep={name = "mymineshaft_step"}},
	selection_box = topboxc,
	collision_box = topboxc,

	on_punch = function(pos, node, clicker)
		core.set_node(pos,{name = "mymineshaft:shaft_top_open_"..mat})
	end,
})

core.register_node("mymineshaft:shaft_bottom_"..mat,{
	description = desc.." Shaft Bottom",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_bottom.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = false,
	walkable = true,
	groups = {crumbly = 1,  cracky=1, fall_damage_add_percent = -1000, not_in_creative_inventory=1},
	node_box = bottomnbox,
	selection_box = bottombox,
	collision_box = bottombox,

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        if core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
            core.chat_send_player( placer:get_player_name(), "Not enough space to place this!" )
            return
        end
        return core.item_place(itemstack, placer, pointed_thing)
    end,

	after_place_node = function(pos)
		core.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "mymineshaft:shaft_bottom2_"..mat})
	end,
	after_destruct = function(pos, oldnode)
		core.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end
})

core.register_node("mymineshaft:shaft_bottom2_"..mat,{
	description = desc.." Shaft Bottom 2",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_middle.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	drop = "mymineshaft:shaft_bottom_"..mat,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = bottombox2,
	collision_box = bottombox2,

	after_destruct = function(pos, oldnode)
		core.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end
})

core.register_node("mymineshaft:shaft_middle_"..mat,{
	description = desc.." Shaft Middle",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_middle.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	groups = {crumbly = 1,  cracky=1, fall_damage_add_percent = -1000, not_in_creative_inventory=1},
	selection_box = middlebox,
	collision_box = middlebox,

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        if core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
            core.chat_send_player( placer:get_player_name(), "Not enough space to place this!" )
            return
        end
        return core.item_place(itemstack, placer, pointed_thing)
    end,

	after_place_node = function(pos)
		core.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "mymineshaft:shaft_middle2_"..mat})
	end,
	after_destruct = function(pos, oldnode)
		core.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end

})

core.register_node("mymineshaft:shaft_middle2_"..mat,{
	description = desc.." Shaft Middle 2",
	tiles = {image},
	drawtype = "mesh",
	mesh = "mymineshaft_middle.obj",
	paramtype = "light",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	drop = "mymineshaft:shaft_bottom_"..mat,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = bottombox2,
	collision_box = bottombox2,

	after_destruct = function(pos, oldnode)
		core.set_node({x = pos.x, y = pos.y - 1, z = pos.z},{name = "air"})
	end
})

core.register_node("mymineshaft:shaft_bigshaft_"..mat,{
	description = desc.." Shaft Middle 2",
	tiles = {image},
	drawtype = "mesh",
	mesh = "twobymineshaft.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 8,
	sunlight_propogates = true,
	climbable = true,
	walkable = false,
	groups = {  cracky=1, crumbly = 1, not_in_creative_inventory=1},
	selection_box = shaftbox,
	collision_box = shaftbox,
})
end




		
