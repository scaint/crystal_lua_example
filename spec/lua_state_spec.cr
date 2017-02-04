require "./spec_helper"

describe CrystalLuaExample::LuaState do
  describe "#version" do
    it "returns Lua version number" do
      CrystalLuaExample::LuaState.new.version.should eq 503.0
    end
  end
end
