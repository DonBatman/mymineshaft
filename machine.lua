local material = nil
local shape = nil
local make_ok = false
local anzahl = 0
local mat_tab = {
		{"default:cobble","default_cobble"},
		{"default:desert_cobble","default_desert_cobble"},
		{"default:mossycobble","default_mossycobble"},
		{"default:stone","default_stone"},
		{"default:desert_stone","default_desert_stone"},
		{"default:sandstone","default_sandstone"},
		{"default:desert_sandstone","default_desert_sandstone"},
		{"default:dirt","default_dirt"},
		{"default:clay","default_clay"},
		{"default:brick","default_brick"},
		{"default:tree","default_tree"},
		{"default:jungletree","default_jungletree"},
		{"default:pine_tree","default_pine_tree"},
		{"default:acacia_tree","default_acacia_tree"},
		{"default:aspen_tree","default_aspen_tree"},
		{"default:wood","default_wood"},
		{"default:junglewood","default_junglewood"},
		{"default:pine_wood","default_pine_wood"},
		{"default:acacia_wood","default_acacia_wood"},
		{"default:aspen_wood","default_aspen_wood"}
		}

minetest.register_node("mymineshaft:machine_top", {
--	description = "Mine Shaft Machine Top",
	tiles = {
		"mymineshaft_machine_top_top.png",
		"mymineshaft_machine_top_bottom.png^[transformR180",
		"mymineshaft_machine_top_right.png",
		"mymineshaft_machine_top_left.png",
		"mymineshaft_machine_top_back.png",
		"mymineshaft_machine_top_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "mymineshaft:machine",
	sunlight_propogates = true,
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.4375, 0.0625}, 
			{-0.125, -0.4375, -0.0625, 0.125, -0.375, 0.0625}, 
			{-0.1875, -0.375, -0.0625, 0.1875, -0.3125, 0.0625}, 
			{-0.25, -0.3125, -0.0625, 0.25, -0.0625, 0.0625}, 
			{-0.0625, -0.4375, -0.125, 0.0625, -0.375, 0.125}, 
			{-0.0625, -0.375, -0.1875, 0.0625, -0.3125, 0.1875},
			{-0.0625, -0.3125, -0.25, 0.0625, -0.0625, 0.25}, 
			{-0.0625, -0.0625, -0.0625, 0.0625, 0.125, 0.0625}, 
			{-0.125, 0.125, -0.125, 0.125, 0.4375, 0.125},
			{-0.5, -0.5, 0.375, -0.3125, 0.5, 0.5}, 
			{0.3125, -0.5, 0.375, 0.5, 0.5, 0.5}, 
			{-0.5, 0.375, 0.125, -0.375, 0.5, 0.375}, 
			{0.375, 0.375, 0.125, 0.5, 0.5, 0.375}, 
			{-0.375, 0.375, 0.125, 0.375, 0.5, 0.1875}, 
			{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.125}, 
		}
	},
	after_destruct = function(pos, oldnode)
		minetest.remove_node({x = pos.x, y = pos.y - 1, z = pos.z})
	end,
})

minetest.register_node("mymineshaft:machine", {
	description = "Mine Shaft Machine",
	tiles = {
		"mymineshaft_machine_bottom_top.png",
		"mymineshaft_machine_bottom_bottom.png",
		"mymineshaft_machine_bottom_right.png",
		"mymineshaft_machine_bottom_left.png",
		"mymineshaft_machine_bottom_front.png",
		"mymineshaft_machine_bottom_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "mymineshaft_mach_inv.png",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, 
			{-0.1875, -0.375, -0.4375, 0.1875, 0, 0.4375}, 
			{-0.25, -0.375, -0.375, 0.25, 0, 0.375},
			{-0.3125, -0.375, -0.3125, 0.3125, 0, 0.3125}, 
			{-0.375, -0.375, -0.25, 0.375, 0, 0.25},
			{-0.4375, -0.375, -0.1875, 0.4375, 0, 0.1875}, 
			{-0.5, -0.375, 0.375, -0.3125, 0.5, 0.5}, 
			{0.3125, -0.375, 0.375, 0.5, 0.5, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.5, 0.5},
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

	after_destruct = function(pos, oldnode)
		minetest.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
	end,

	after_place_node = function(pos, placer)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "mymineshaft:machine_top", param2=minetest.dir_to_facedir(placer:get_look_dir())});

	local meta = minetest.get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Mine Shaft Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,
	after_destruct = function(pos, oldnode)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "air"})
	end,
can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if inv:is_empty("ingot") and
	   inv:is_empty("res") then
		return true
	else
	return false
	end
end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "size[8,9;]"..
		"background[-0.15,-0.25;8.40,9.75;mymineshaft_background.png;]"..
		"list[current_name;ingot;5.5,1;1,1;]"..
		"list[current_name;res;5.5,3;1,1;]"..
		"label[5.5,0.5;Input:]"..
		"label[5.5,2.5;Output:]"..
--		Column 1
		"label[1,0.5;Shaft]"..
		"image_button[1,1;1,1;mymineshaft_tunnel.png;shaft;]"..
		"label[1,2;Middle]"..
		"image_button[1,2.5;1,1;mymineshaft_middle.png;middle;]"..
--		Column 2
		"label[2.5,0.5;Corner]"..
		"image_button[2.5,1;1,1;mymineshaft_corner.png;newshaft;]"..
		"label[2.5,2;Top]"..
		"image_button[2.5,2.5;1,1;mymineshaft_tops.png;top;]"..
--      Column 3
		"label[4,0.5;Bottom]"..
		"image_button[4,1;1,1;mymineshaft_bottom.png;bottom;]"..
--      Player Inventory
		"list[current_player;main;0,5;8,4;]")
		
	meta:set_string("infotext", "Mine Shaft Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local ingot_stack = inv:get_stack("ingot", 1)
    local res_stack = inv:get_stack("res", 1)
    local shape = nil
    local material = nil

    if fields["shaft"] or fields["top"] or fields["bottom"] or fields["middle"] or fields["newshaft"] then
        if fields["shaft"] then
            shape = "mymineshaft:shaft_"
        elseif fields["top"] then
            shape = "mymineshaft:shaft_top_closed_"
        elseif fields["bottom"] then
            shape = "mymineshaft:shaft_bottom_"
        elseif fields["middle"] then
            shape = "mymineshaft:shaft_middle_"
        elseif fields["newshaft"] then
            shape = "mymineshaft:shaft_bigshaft_"
        end

        if inv:is_empty("ingot") then
            return
        end

        for _, mat_data in ipairs(mat_tab) do
            if ingot_stack:get_name() == mat_data[1] then
                material = mat_data[2]
                break
            end
        end

        if material then
            inv:add_item("res", shape .. material)
            ingot_stack:take_item()
            inv:set_stack("ingot", 1, ingot_stack)
        end
    end
end

})

--Craft Machine

minetest.register_craft({
		output = 'mymineshaft:machine',
		recipe = {
			{'default:sand', 'default:brick', 'default:sand'},
			{'default:brick', 'default:steel_ingot', 'default:brick'},
			{'default:sand', "default:brick", 'default:sand'},		
		},
})













