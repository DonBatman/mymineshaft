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
		{"default:aspen_wood","default_aspen_wood"},
					{"myores:basalt", 					"basalt"},
					{"myores:basalt_brick",	   			"basalt_brick"},
					{"bmyores:asalt_tile",			  	"basalt_block"},
					{"bmyores:asalt_tiles",	 	  		"basalt_tiles"},
					{"bmyores:asalt_splitstone",		"basalt_splitstone"},
					{"myores:gneiss",					"gneiss"},
					{"myores:gneiss_brick",	 	  		"gneiss_brick"},
					{"myores:gneiss_tile",		 	 	"gneiss_block"},
					{"myores:gneiss_tiles",	  	  		"gneiss_tiles"},
					{"myores:gneiss_splitstone", 		"gneiss_splitstone"},
					{"myores:granite",			 		"granite"},
					{"myores:granite_bricks",	 		"granite_brick"},
					{"myores:granite_tile",	  	 		"granite_block"},
					{"myores:granite_tiles",	 	    "granite_tiles"},
					{"myores:granite_splitstone",		"granite_splitstone"},
					{"myores:marble",					"marble"},
					{"myores:marble_brick",	    		"marble_brick"},
					{"myores:marble_tile",			 	"marble_block"},
					{"myores:marble_tiles",	   			"marble_tiles"},
					{"myores:marble_splitstone", 		"marble_splitstone"},
					{"myores:schist", 			 		"schist"},
					{"myores:schist_brick", 	 	  	"schist_brick"},
					{"myores:schist_tile", 	 	  		"schist_block"},
					{"myores:schist_tiles", 	 	  	"schist_tiles"},
					{"myores:schist_splitstone", 		"schist_splitstone"},
					{"myores:shale",  			  		"shale"},
					{"myores:shale_brick",  	    	"shale_brick"},
					{"myores:shale_block",  	   	  	"shale_block"},
					{"myores:shale_tiles",  	   	  	"shale_tiles"},
					{"myores:shale_splitstone",   		"shale_splitstone"},
					{"myores:slate",                    "slate"},
					{"myores:slate_brick",            	"slate_brick"},
					{"myores:slate_tile",               "slate_block"},
					{"myores:slate_tiles",            	"slate_tiles"},
					{"myores:slate_splitstone",   		"slate_splitstone"},
					{"myores:chalk",  			  		"chalk"},
					{"myores:calcium_block",  	   	  	"calcium_block"},
					{"myores:sodium_block",  	 	  	"sodium_block"},
					{"myores:silver",  		 		  	"silver"},
					{"myores:silver_block",  	  	  	"silver_block"},
					{"myores:silver_brick",  	   	  	"silver_brick"},
					{"myores:silver_splitblock", 		"silver_splitblock"},
					{"myores:silver_tiles",  	 	  	"silver_tiles"},
					{"myores:chromium",  		   		"chromium"},
					{"myores:chromium_block",       	"chromium_block"},
					{"myores:chromium_brick",       	"chromium_brick"},
					{"myores:chromium_splitblock",		"chromium_splitblock"},
					{"myores:chromium_tiles",       	"chromium_tiles"},
					{"myores:manganese",  		   		"manganese"},
					{"myores:manganese_block",      	"manganese_block"},
					{"myores:manganese_brick",       	"manganese_brick"},
					{"myores:manganese_splitblock",		"manganese_splitblock"},
					{"myores:manganese_tiles",       	"manganese_tiles"},
					{"myores:quartz",  		  			"quartz.png"},
					{"myores:quartz_block",         	"quartz_block"},
					{"myores:quartz_brick",         	"quartz_brick"},
					{"myores:quartz_splitblock", 		"quartz_splitblock"},
					{"myores:quartz_tiles",        		"quartz_tiles"},
					{"myores:chalcopyrite",  			"chalcopyrite"},
					{"myores:chalcopyrite_block",       "chalcopyrite_block"},
					{"myores:chalcopyrite_brick",       "chalcopyrite_brick"},
					{"myores:chalcopyrite_splitblock", 	"chalcopyrite_splitblock"},
					{"myores:chalcopyrite_tiles",       "chalcopyrite_tiles"},
					{"myores:cobalt",  					"cobalt"},
					{"myores:cobalt_block",        		"cobalt_block"},
					{"myores:cobalt_brick",        		"cobalt_brick"},
					{"myores:cobalt_splitblock", 		"cobalt_splitblock"},
					{"myores:cobalt_tiles",        		"cobalt_tiles"},
					{"myores:uvarovite",  				"uvarovite"},
					{"myores:uvarovite_block",        	"uvarovite_block"},
					{"myores:uvarovite_brick",        	"uvarovite_brick"},
					{"myores:uvarovite_splitblock", 	"uvarovite_splitblock"},
					{"myores:uvarovite_tiles",        	"uvarovite_tiles"},
					{"myores:selenite",  		  	 	"selenite"},
					{"myores:selenite_block",       	"selenite_block"},
					{"myores:selenite_brick",      		"selenite_brick"},
					{"myores:selenite_splitblock", 		"selenite_splitblock"},
					{"myores:selenite_tiles",       	"selenite_tiles"},
					{"myores:miserite",  		  		"miserite"},
					{"myores:miserite_block",       	"miserite_block"},
					{"myores:miserite_brick",      		"miserite_brick"},
					{"myores:miserite_splitblock", 		"miserite_splitblock"},
					{"myores:miserite_tiles",         	"miserite_tiles"},
					{"myores:limonite",  		  		"limonite"},
					{"myores:limonite_block",         	"limonite_block"},
					{"myores:limonite_brick",        	"limonite_brick"},
					{"myores:limonite_splitblock", 		"limonite_splitblock"},
					{"myores:limonite_tiles",       	"limonite_tiles"},
					{"myores:sulfur",  		  			"sulfur"},
					{"myores:sulfur_block",       		"sulfur_block"},
					{"myores:sulfur_brick",     		"sulfur_brick"},
					{"myores:sulfur_splitblock", 		"sulfur_splitblock"},
					{"myores:sulfur_tiles",         	"sulfur_tiles"},
					{"myores:lapis_lazuli",  			"lapis_lazuli"},
					{"myores:lapis_lazuli_block",       "lapis_lazuli_block"},
					{"myores:lapis_lazuli_brick",       "lapis_lazuli_brick"},
					{"myores:lapis_lazuli_splitblock", 	"lapis_lazuli_splitblock"},
					{"myores:lapis_lazuli_tiles",      	"lapis_lazuli_tiles"},
					{"myores:emerald",  		   		"emerald"},
					{"myores:emerald_block",        	"emerald_block"},
					{"myores:emerald_brick",        	"emerald_brick"},
					{"myores:emerald_splitblock", 		"emerald_splitblock"},
					{"myores:emerald_tiles",        	"emerald_tiles"},
					{"myores:amethyst",  				"amethyst"},
					{"myores:amethyst_block",    		"amethyst_block"},
					{"myores:amethyst_brick",      		"amethyst_brick"},
					{"myores:amethyst_splitblock", 		"amethyst_splitblock"},
					{"myores:amethyst_tiles",        	"amethyst_tiles"},
		}

core.register_node("mymineshaft:machine", {
	description = "Mine Shaft Machine",
	tiles = {
		"mymineshaft_machine.png",
		},
	drawtype = "mesh",
	mesh = "mymineshaft_machine.obj",
	paramtype = "light",
	paramtype2 = "facedir",
--	inventory_image = "mymineshaft_mach_inv.png",
	groups = {cracky=2},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.5, 0.5},
		}
	},

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        if core.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name ~= "air" then
            core.chat_send_player( placer:get_player_name(), "Not enough space to place this!" )
            return
        end
        return core.item_place(itemstack, placer, pointed_thing)
    end,

	after_destruct = function(pos, oldnode)
		core.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
	end,

	after_place_node = function(pos, placer)

	local meta = core.get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Mine Shaft Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,
can_dig = function(pos,player)
	local meta = core.get_meta(pos);
	local inv = meta:get_inventory()
	if inv:is_empty("ingot") and
	   inv:is_empty("res") then
		return true
	else
	return false
	end
end,

on_construct = function(pos)
	local meta = core.get_meta(pos)
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
    local meta = core.get_meta(pos)
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

core.register_craft({
		output = 'mymineshaft:machine',
		recipe = {
			{'default:sand', 'default:brick', 'default:sand'},
			{'default:brick', 'default:steel_ingot', 'default:brick'},
			{'default:sand', "default:brick", 'default:sand'},		
		},
})













