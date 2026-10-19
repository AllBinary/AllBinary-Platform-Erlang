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
% package org.allbinary.util
% import jsinterop.annotations.JsType
% import java.util.Enumeration
% import jsinterop.annotations.JsMethod

-module('EnumerationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'EnumerationUtil':new()),
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
        get({'EnumerationUtil', instance}).

hasMoreElements(This, Enumeration) ->
        (get({Enumeration, '$class'})):hasMoreElements(Enumeration).

nextElement(This, Enumeration) ->
        (get({Enumeration, '$class'})):nextElement(Enumeration).

getAsArray(This, Enumeration) ->
        BasicArrayList = 'BasicArrayListD':new(),
        (fun Loop() -> case (get({This, '$class'})):hasMoreElements(This, Enumeration) of true ->
            (get({BasicArrayList, '$class'})):add(BasicArrayList, (get({This, '$class'})):nextElement(This, Enumeration)),
            Loop();
        false -> ok end end)(),
        (get({BasicArrayList, '$class'})):toArray(BasicArrayList).

