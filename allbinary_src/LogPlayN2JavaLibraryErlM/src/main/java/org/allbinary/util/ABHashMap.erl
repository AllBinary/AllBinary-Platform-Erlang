% 
% AllBinary Open License Version 1 
% Copyright (c) 2026 AllBinary 
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
% package org.allbinary.util
% import java.util.HashMap
% import java.util.Map
% import java.util.Set
% import jsinterop.annotations.JsType

-module('ABHashMap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HashMap', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'HashMap':'$init'(This),
    init_fields(This).


size(This) ->
        'HashMap':size(This).

isEmpty(This) ->
        'HashMap':isEmpty(This).

get(This, Key) ->
        'HashMap':get(This, Key).

containsKey(This, Key) ->
        'HashMap':containsKey(This, Key).

put(This, Key, Value) ->
        'HashMap':put(This, Key, Value).

putAll(This, Map) ->
        'HashMap':putAll(This, Map).

remove(This, Key) ->
        'HashMap':remove(This, Key).

clear(This) ->
        'HashMap':clear(This).

containsValue(This, Value) ->
        'HashMap':containsValue(This, Value).

keySet(This) ->
        'HashMap':keySet(This).

entrySet(This) ->
        'HashMap':entrySet(This).

getOrDefault(This, Key, DefaultValue) ->
        'HashMap':getOrDefault(This, Key, DefaultValue).

putIfAbsent(This, Key, Value) ->
        'HashMap':putIfAbsent(This, Key, Value).

clone(This) ->
        'HashMap':clone(This).

