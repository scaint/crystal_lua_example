module CrystalLuaExample
  class LuaState
    ALLOC = ->(ud : Void*, ptr : Void*, osize : LibC::Int, nsize : LibC::Int) do
      if nsize > 0
        GC.realloc(ptr, nsize)
      else
        GC.free(ptr)
        Pointer(Void).null
      end
    end

    def initialize
      @state = LibLua.newstate(ALLOC, Pointer(Void).null)
      raise "Could not create a new Lua state" if @state.null?
    end

    def version
      LibLua.version(@state).value
    end

    def to_unsafe
      @state
    end
  end
end
