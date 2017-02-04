@[Link("lua5.3")]
lib LibLua
  INT_INT = 1
  INT_LONG = 2
  INT_LONGLONG = 3
  FLOAT_FLOAT = 1
  FLOAT_DOUBLE = 2
  FLOAT_LONGDOUBLE = 3
  IDSIZE = 60
  VERSION_NUM = 503
  OK = 0
  YIELD = 1
  ERRRUN = 2
  ERRSYNTAX = 3
  ERRMEM = 4
  ERRGCMM = 5
  ERRERR = 6
  TNIL = 0
  TBOOLEAN = 1
  TLIGHTUSERDATA = 2
  TNUMBER = 3
  TSTRING = 4
  TTABLE = 5
  TFUNCTION = 6
  TUSERDATA = 7
  TTHREAD = 8
  NUMTAGS = 9
  MINSTACK = 20
  RIDX_MAINTHREAD = 1
  RIDX_GLOBALS = 2
  OPADD = 0
  OPSUB = 1
  OPMUL = 2
  OPMOD = 3
  OPPOW = 4
  OPDIV = 5
  OPIDIV = 6
  OPBAND = 7
  OPBOR = 8
  OPBXOR = 9
  OPSHL = 10
  OPSHR = 11
  OPUNM = 12
  OPBNOT = 13
  OPEQ = 0
  OPLT = 1
  OPLE = 2
  GCSTOP = 0
  GCRESTART = 1
  GCCOLLECT = 2
  GCCOUNT = 3
  GCCOUNTB = 4
  GCSTEP = 5
  GCSETPAUSE = 6
  GCSETSTEPMUL = 7
  GCISRUNNING = 9
  HOOKCALL = 0
  HOOKRET = 1
  HOOKLINE = 2
  HOOKCOUNT = 3
  HOOKTAILCALL = 4
  alias State = Void
  fun newstate = lua_newstate(f : Alloc, ud : Void*) : LuaState
  alias Alloc = (Void*, Void*, LibC::Int, LibC::Int -> Void*)
  type LuaState = Void*
  fun close = lua_close(l : LuaState)
  fun newthread = lua_newthread(l : LuaState) : LuaState
  fun atpanic = lua_atpanic(l : LuaState, panicf : Cfunction) : Cfunction
  alias Cfunction = (LuaState -> LibC::Int)
  fun version = lua_version(l : LuaState) : Number*
  alias Number = LibC::Double
  fun absindex = lua_absindex(l : LuaState, idx : LibC::Int) : LibC::Int
  fun gettop = lua_gettop(l : LuaState) : LibC::Int
  fun settop = lua_settop(l : LuaState, idx : LibC::Int)
  fun pushvalue = lua_pushvalue(l : LuaState, idx : LibC::Int)
  fun rotate = lua_rotate(l : LuaState, idx : LibC::Int, n : LibC::Int)
  fun copy = lua_copy(l : LuaState, fromidx : LibC::Int, toidx : LibC::Int)
  fun checkstack = lua_checkstack(l : LuaState, n : LibC::Int) : LibC::Int
  fun xmove = lua_xmove(from : LuaState, to : LuaState, n : LibC::Int)
  fun isnumber = lua_isnumber(l : LuaState, idx : LibC::Int) : LibC::Int
  fun isstring = lua_isstring(l : LuaState, idx : LibC::Int) : LibC::Int
  fun iscfunction = lua_iscfunction(l : LuaState, idx : LibC::Int) : LibC::Int
  fun isinteger = lua_isinteger(l : LuaState, idx : LibC::Int) : LibC::Int
  fun isuserdata = lua_isuserdata(l : LuaState, idx : LibC::Int) : LibC::Int
  fun type = lua_type(l : LuaState, idx : LibC::Int) : LibC::Int
  fun typename = lua_typename(l : LuaState, tp : LibC::Int) : LibC::Char*
  fun tonumberx = lua_tonumberx(l : LuaState, idx : LibC::Int, isnum : LibC::Int*) : Number
  fun tointegerx = lua_tointegerx(l : LuaState, idx : LibC::Int, isnum : LibC::Int*) : Integer
  alias Integer = LibC::LongLong
  fun toboolean = lua_toboolean(l : LuaState, idx : LibC::Int) : LibC::Int
  fun tolstring = lua_tolstring(l : LuaState, idx : LibC::Int, len : LibC::Int*) : LibC::Char*
  fun tocfunction = lua_tocfunction(l : LuaState, idx : LibC::Int) : Cfunction
  fun touserdata = lua_touserdata(l : LuaState, idx : LibC::Int) : Void*
  fun tothread = lua_tothread(l : LuaState, idx : LibC::Int) : LuaState
  fun topointer = lua_topointer(l : LuaState, idx : LibC::Int) : Void*
  fun arith = lua_arith(l : LuaState, op : LibC::Int)
  fun rawequal = lua_rawequal(l : LuaState, idx1 : LibC::Int, idx2 : LibC::Int) : LibC::Int
  fun compare = lua_compare(l : LuaState, idx1 : LibC::Int, idx2 : LibC::Int, op : LibC::Int) : LibC::Int
  fun pushnil = lua_pushnil(l : LuaState)
  fun pushnumber = lua_pushnumber(l : LuaState, n : Number)
  fun pushinteger = lua_pushinteger(l : LuaState, n : Integer)
  fun pushlstring = lua_pushlstring(l : LuaState, s : LibC::Char*, len : LibC::Int) : LibC::Char*
  fun pushstring = lua_pushstring(l : LuaState, s : LibC::Char*) : LibC::Char*
  fun pushvfstring = lua_pushvfstring(l : LuaState, fmt : LibC::Char*, argp : LibC::Int) : LibC::Char*
  fun pushfstring = lua_pushfstring(l : LuaState, fmt : LibC::Char*, ...) : LibC::Char*
  fun pushcclosure = lua_pushcclosure(l : LuaState, fn : Cfunction, n : LibC::Int)
  fun pushboolean = lua_pushboolean(l : LuaState, b : LibC::Int)
  fun pushlightuserdata = lua_pushlightuserdata(l : LuaState, p : Void*)
  fun pushthread = lua_pushthread(l : LuaState) : LibC::Int
  fun getglobal = lua_getglobal(l : LuaState, name : LibC::Char*) : LibC::Int
  fun gettable = lua_gettable(l : LuaState, idx : LibC::Int) : LibC::Int
  fun getfield = lua_getfield(l : LuaState, idx : LibC::Int, k : LibC::Char*) : LibC::Int
  fun geti = lua_geti(l : LuaState, idx : LibC::Int, n : Integer) : LibC::Int
  fun rawget = lua_rawget(l : LuaState, idx : LibC::Int) : LibC::Int
  fun rawgeti = lua_rawgeti(l : LuaState, idx : LibC::Int, n : Integer) : LibC::Int
  fun rawgetp = lua_rawgetp(l : LuaState, idx : LibC::Int, p : Void*) : LibC::Int
  fun createtable = lua_createtable(l : LuaState, narr : LibC::Int, nrec : LibC::Int)
  fun newuserdata = lua_newuserdata(l : LuaState, sz : LibC::Int) : Void*
  fun getmetatable = lua_getmetatable(l : LuaState, objindex : LibC::Int) : LibC::Int
  fun getuservalue = lua_getuservalue(l : LuaState, idx : LibC::Int) : LibC::Int
  fun setglobal = lua_setglobal(l : LuaState, name : LibC::Char*)
  fun settable = lua_settable(l : LuaState, idx : LibC::Int)
  fun setfield = lua_setfield(l : LuaState, idx : LibC::Int, k : LibC::Char*)
  fun seti = lua_seti(l : LuaState, idx : LibC::Int, n : Integer)
  fun rawset = lua_rawset(l : LuaState, idx : LibC::Int)
  fun rawseti = lua_rawseti(l : LuaState, idx : LibC::Int, n : Integer)
  fun rawsetp = lua_rawsetp(l : LuaState, idx : LibC::Int, p : Void*)
  fun setmetatable = lua_setmetatable(l : LuaState, objindex : LibC::Int) : LibC::Int
  fun setuservalue = lua_setuservalue(l : LuaState, idx : LibC::Int)
  fun callk = lua_callk(l : LuaState, nargs : LibC::Int, nresults : LibC::Int, ctx : Kcontext, k : Kfunction)
  alias IntptrT = LibC::Long
  alias Kcontext = IntptrT
  alias Kfunction = (LuaState, LibC::Int, Kcontext -> LibC::Int)
  fun pcallk = lua_pcallk(l : LuaState, nargs : LibC::Int, nresults : LibC::Int, errfunc : LibC::Int, ctx : Kcontext, k : Kfunction) : LibC::Int
  fun load = lua_load(l : LuaState, reader : Reader, dt : Void*, chunkname : LibC::Char*, mode : LibC::Char*) : LibC::Int
  alias Reader = (LuaState, Void*, LibC::Int* -> LibC::Char*)
  fun dump = lua_dump(l : LuaState, writer : Writer, data : Void*, strip : LibC::Int) : LibC::Int
  alias Writer = (LuaState, Void*, LibC::Int, Void* -> LibC::Int)
  fun yieldk = lua_yieldk(l : LuaState, nresults : LibC::Int, ctx : Kcontext, k : Kfunction) : LibC::Int
  fun resume = lua_resume(l : LuaState, from : LuaState, narg : LibC::Int) : LibC::Int
  fun status = lua_status(l : LuaState) : LibC::Int
  fun isyieldable = lua_isyieldable(l : LuaState) : LibC::Int
  fun gc = lua_gc(l : LuaState, what : LibC::Int, data : LibC::Int) : LibC::Int
  fun error = lua_error(l : LuaState) : LibC::Int
  fun next = lua_next(l : LuaState, idx : LibC::Int) : LibC::Int
  fun concat = lua_concat(l : LuaState, n : LibC::Int)
  fun len = lua_len(l : LuaState, idx : LibC::Int)
  fun getallocf = lua_getallocf(l : LuaState, ud : Void**) : Alloc
  fun setallocf = lua_setallocf(l : LuaState, f : Alloc, ud : Void*)
  struct Debug
    event : LibC::Int
    name : LibC::Char*
    namewhat : LibC::Char*
    what : LibC::Char*
    source : LibC::Char*
    currentline : LibC::Int
    linedefined : LibC::Int
    lastlinedefined : LibC::Int
    nups : UInt8
    nparams : UInt8
    isvararg : LibC::Char
    istailcall : LibC::Char
    short_src : LibC::Char[60]
    i_ci : Void*
  end
  fun getstack = lua_getstack(l : LuaState, level : LibC::Int, ar : Debug*) : LibC::Int
  fun getinfo = lua_getinfo(l : LuaState, what : LibC::Char*, ar : Debug*) : LibC::Int
  fun getlocal = lua_getlocal(l : LuaState, ar : Debug*, n : LibC::Int) : LibC::Char*
  fun setlocal = lua_setlocal(l : LuaState, ar : Debug*, n : LibC::Int) : LibC::Char*
  fun getupvalue = lua_getupvalue(l : LuaState, funcindex : LibC::Int, n : LibC::Int) : LibC::Char*
  fun setupvalue = lua_setupvalue(l : LuaState, funcindex : LibC::Int, n : LibC::Int) : LibC::Char*
  fun upvalueid = lua_upvalueid(l : LuaState, fidx : LibC::Int, n : LibC::Int) : Void*
  fun upvaluejoin = lua_upvaluejoin(l : LuaState, fidx1 : LibC::Int, n1 : LibC::Int, fidx2 : LibC::Int, n2 : LibC::Int)
  fun sethook = lua_sethook(l : LuaState, func : Hook, mask : LibC::Int, count : LibC::Int)
  alias Hook = (LuaState, Debug* -> Void)
  fun gethook = lua_gethook(l : LuaState) : Hook
  fun gethookmask = lua_gethookmask(l : LuaState) : LibC::Int
  fun gethookcount = lua_gethookcount(l : LuaState) : LibC::Int
  $ident : LibC::Char*
end
