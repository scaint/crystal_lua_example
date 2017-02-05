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

    alias Buffer = IO::Memory

    BUFFER_READER = ->(state : LibLua::LuaState, data : Void*, size : LibC::Int*) do
      buffer = data.as(Buffer*).value
      str = buffer.gets
      if str.nil?
        size.value = 0
        Pointer(LibC::Char).null
      else
        size.value = str.bytesize
        str.to_unsafe
      end
    end

    def initialize
      @state = LibLua.newstate(ALLOC, Pointer(Void).null)
      raise "Could not create a new Lua state" if @state.null?
    end

    def initialize(exising_state : LibLua::LuaState)
      @state = exising_state
    end

    def tostring(idx : LibC::Int)
      ptr = LibLua.tolstring(@state, idx, out len)
      String.new(ptr, len)
    end

    def getglobal(name : String)
      LibLua.getglobal(@state, name)
    end

    def setglobal(name : String)
      LibLua.setglobal(@state, name)
    end

    def pushcfunction(cfun : LibLua::Cfunction)
      LibLua.pushcclosure(@state, cfun, 0)
    end

    def register(name : String, cfun : LibLua::Cfunction)
      pushcfunction(cfun)
      setglobal(name)
    end

    def load_string(source : String)
      buffer = Buffer.new(source)
      LibLua.load(
        @state,
        BUFFER_READER,
        pointerof(buffer),
        "line",
        Pointer(LibC::Char).null
      )
    end

    def call(nargs : LibC::Int = 0, nresults : LibC::Int = 0)
      LibLua.callk(@state, nargs, nresults, 0, nil)
    end

    def version
      LibLua.version(@state).value
    end

    def to_unsafe
      @state
    end
  end
end
