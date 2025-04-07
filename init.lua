local mines = core.settings:get_bool("mymineshaft.use_mines", true)

mymineshaft = {}
dofile(minetest.get_modpath("mymineshaft").."/nodes.lua")
dofile(minetest.get_modpath("mymineshaft").."/machine.lua")
dofile(minetest.get_modpath("mymineshaft").."/register.lua")
if mines then
dofile(minetest.get_modpath("mymineshaft").."/shafts.lua")
end







