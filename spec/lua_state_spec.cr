require "./spec_helper"

private def  new_lua_state
  CrystalLuaExample::LuaState.new
end


describe CrystalLuaExample::LuaState do
  describe "#load_string" do
    it "loads a Lua chunk" do
      new_lua_state.load_string("a = 1 + 2").should eq LibLua::OK
    end
  end

  describe "#version" do
    it "returns Lua version number" do
      new_lua_state.version.should eq 503.0
    end
  end
end
