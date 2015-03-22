local material = {}
local shape = {}
local make_ok = {}
local anzahl = {}

minetest.register_node("mymineshaft:machine", {
	description = "Mine Shaft Machine",
	tiles = {"mymineshaft_sand.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, -- NodeBox3
			{-0.5, -0.5, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.0625, 0.0625, -0.25, 0, 0.1875, 0.25}, -- NodeBox7
			{-0.0625, 0.0625, -0.125, 0, 0.25, 0.125}, -- NodeBox8
		}
	},

	after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Mine Shaft Machine is empty (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("ingot") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[8,9;]"..
		"background[-0.15,-0.25;8.40,9.75;mymineshaft_background.png]"..
		"list[current_name;ingot;5.5,1;1,1;]"..
		"list[current_name;res;5.5,3;1,1;]"..
		"label[5.5,0.5;Input:]"..
		"label[5.5,2.5;Output:]"..
		"label[0,0;Choose Hole:]"..
--		Column 1
		"label[1,0.5;Shaft]"..
		"image_button[1,1;1,1;mymineshaft_mach1.png;shaft; ]"..
--		Column 2
		"label[2.5,0.5;Top]"..
		"image_button[2.5,1;1,1;mymineshaft_mach2.png;top2; ]"..
		"label[2.5,2;Bottom]"..
		"image_button[2.5,2.5;1,1;mymineshaft_mach3.png;bottom; ]"..
		"list[current_player;main;0,5;8,4;]")
	meta:set_string("infotext", "Brick Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

if fields["shaft"] 
or fields["top2"] 
or fields["bottom"]
then

	if fields["shaft"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mymineshaft:shaft_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["top2"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mymineshaft:shaft_top_closed_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["bottom"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mymineshaft:shaft_bottom_"
		if inv:is_empty("ingot") then
			return
		end
	end
--[[
	if fields["crossi"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mymineshaft:cross_iron_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["o"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mymineshaft:o_"
		if inv:is_empty("ingot") then
			return
		end
	end
--]]

		local ingotstack = inv:get_stack("ingot", 1)
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------
		if ingotstack:get_name()=="default:sandstone" then
				material = "default_sandstone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:clay" then
				material = "default_clay"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_stone" then
				material = "default_desert_stone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:cobble" then
				material = "default_cobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:stone" then
				material = "default_stone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:wood" then
				material = "default_wood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:dirt" then
				material = "default_dirt"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_cobble" then
				material = "default_desert_cobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:jungletree" then
				material = "default_jungletree"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:junglewood" then
				material = "default_junglewood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:mossycobble" then
				material = "default_mossycobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:tree" then
				material = "default_tree"
				make_ok = "1"
		end

----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape..material)
			end
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end
end


})

--Craft

minetest.register_craft({
		output = 'mymineshaft:machine',
		recipe = {
			{'default:sand', 'default:brick', 'default:sand'},
			{'default:brick', 'default:steel_ingot', 'default:brick'},
			{'default:sand', "default:brick", 'default:sand'},		
		},
})












