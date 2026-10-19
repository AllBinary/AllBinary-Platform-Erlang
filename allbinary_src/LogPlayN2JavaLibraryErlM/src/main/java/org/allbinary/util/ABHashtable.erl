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
% import java.util.Enumeration
% import java.util.Hashtable
% import java.util.Map
% import java.util.Set
% import jsinterop.annotations.JsType

-module('ABHashtable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Hashtable', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'Hashtable':init(This).

size(This) ->
        'Hashtable':size(This).

isEmpty(This) ->
        'Hashtable':isEmpty(This).

elements(This) ->
        'Hashtable':elements(This).

contains(This, Value) ->
        'Hashtable':contains(This, Value).

containsValue(This, Value) ->
        'Hashtable':containsValue(This, Value).

containsKey(This, Key) ->
        'Hashtable':containsKey(This, Key).

get(This, Key) ->
        'Hashtable':get(This, Key).

clear(This) ->
        'Hashtable':clear(This).

clone(This) ->
        'Hashtable':clone(This).

toString(This) ->
        'Hashtable':toString(This).

equals(This, Obj) ->
        'Hashtable':equals(This, Obj).

hashCode(This) ->
        'Hashtable':hashCode(This).

