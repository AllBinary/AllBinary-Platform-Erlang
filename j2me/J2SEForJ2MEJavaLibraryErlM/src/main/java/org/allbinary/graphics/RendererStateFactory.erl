% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.graphics

-module('RendererStateFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'RendererStateFactory':new()),
    ok.

init_fields(This) ->
    put({This, loaded}, false),
    put({This, surfaceChanged}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'RendererStateFactory', instance}).

setLoaded(This, Loaded) when is_boolean(Loaded) ->
        put({This, loaded}, Loaded).

isLoaded(This) ->
        get({This, loaded}).

setSurfaceChanged(This, Initialized) when is_boolean(Initialized) ->
        put({This, surfaceChanged}, Initialized).

isSurfaceChanged(This) ->
        get({This, surfaceChanged}).

