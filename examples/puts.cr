require "../src/crystal_lua_example"

state = CrystalLuaExample::LuaState.new

state.register "puts", ->(st : LibLua::LuaState) do
  current_state = CrystalLuaExample::LuaState.new(st)
  puts current_state.tostring(1)
  0
end

state.load_string <<-LUA
  local x, y = 1, 2;
  puts("x + y = " .. x + y)
LUA
state.call
