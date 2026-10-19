%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.servlet
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.globals.AppUrlGlobals
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.system.loader.WebappClassLoaderInfo

-module('BlisketServletUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BlisketServletUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'BlisketServletUtil', instance}).

init(This, Request) ->
        UrlGlobals = 'AppUrlGlobals':new(),
        (get({UrlGlobals, '$class'})):setWebappPath(UrlGlobals, (fun(Target_N65894) -> (get({Target_N65894, '$class'})):getRealPath(Target_N65894, get({'AbPathData':getInstance(), 'SEPARATOR'})) end)((get({Request, '$class'})):getServletContext(Request))),
        (get({get({'BlisketServletUtil', 'URLGLOBALS'}), '$class'})):init(get({'BlisketServletUtil', 'URLGLOBALS'}), UrlGlobals),
        'WebappClassLoaderInfo':setLoader((fun(Target_N66003) -> (get({Target_N66003, '$class'})):getClassLoader(Target_N66003) end)((get({This, '$class'})):getClass(This))).

