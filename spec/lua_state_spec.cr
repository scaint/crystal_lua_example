require "./spec_helper"

private def  new_lua_state
  CrystalLuaExample::LuaState.new
end


describe CrystalLuaExample::LuaState do
  describe "#load_string" do
    context "with valid source" do
      it "loads a Lua chunk" do
        new_lua_state.load_string("a = 1 + 2").should eq LibLua::OK
      end
    end

    context "with syntax error" do
      it "returns an error" do
        state = new_lua_state
        state.load_string("}{").should eq LibLua::ERRSYNTAX
        state.tostring(1).should eq "[string \"line\"]:1: unexpected symbol near '}'"
      end
    end
  end

  describe "#register" do
    it "sets a global function" do
      state = new_lua_state
      state.register "nop", ->(state : LibLua::LuaState) { 0 }
      state.getglobal("nop").should eq LibLua::TFUNCTION
    end
  end

  pending "#call" do; end

  describe "#version" do
    it "returns Lua version number" do
      new_lua_state.version.should eq 503.0
    end
  end
end
