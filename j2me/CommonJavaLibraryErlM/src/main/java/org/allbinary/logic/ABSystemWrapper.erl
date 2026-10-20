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
% package org.allbinary.logic
% import jsinterop.annotations.JsType

-module('ABSystemWrapper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ABSystemWrapper':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ABSystemWrapper', instance}).

arraycopy(This, Src, SrcPos, Dest, DestPos, Length) when is_integer(SrcPos), is_integer(DestPos), is_integer(Length) ->
        allbinary_java:array_copy(Src, SrcPos, Dest, DestPos, Length).

currentTimeMillis(This) ->
        erlang:system_time(millisecond).

