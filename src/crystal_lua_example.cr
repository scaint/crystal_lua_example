require "./liblua"
require "./crystal_lua_example/*"

state = CrystalLuaExample::LuaState.new
puts "Lua v#{state.version}"
