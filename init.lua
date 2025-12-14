local mines = core.settings:get_bool("mymineshaft.use_mines", true)

mymineshaft = {}
dofile(core.get_modpath("mymineshaft").."/nodes.lua")
dofile(core.get_modpath("mymineshaft").."/machine.lua")
dofile(core.get_modpath("mymineshaft").."/register.lua")
if mines then
dofile(core.get_modpath("mymineshaft").."/shafts.lua")
end

if core.get_modpath("myores") then
dofile(core.get_modpath("mymineshaft").."/myores.lua")
end






