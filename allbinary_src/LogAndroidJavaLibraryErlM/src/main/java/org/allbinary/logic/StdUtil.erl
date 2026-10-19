% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.logic
% import org.allbinary.util.ABHashMap
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.ABStack
% import org.allbinary.util.ABVector

-module('StdUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StdUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'EMPTY_VECTOR'}, (get({This, '$class'})):createVector(This)),
    put({This, 'NULL_TABLE'}, (get({This, '$class'})):createHashtable(This)),
    put({This, 'NULL_MAP'}, (get({This, '$class'})):createHashMap(This)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'StdUtil', instance}).

createStack(This) ->
        'ABStack':new().

createVector(This) ->
        'ABVector':new().

createHashtable(This) ->
        'ABHashtable':new().

createHashMap(This) ->
        'ABHashMap':new().

