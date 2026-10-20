% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
%  
% By agreeing to this license you and any business entity you represent are 
% legally bound to the AllBinary Open License Version 1 legal agreement. 
%  
% You may obtain the AllBinary Open License Version 1 legal agreement from 
% AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
%  
% Created By: Travis Berthelot  
% Generated Code Do Not Modify
% package org.allbinary.game.layer.capital.event
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('CapitalEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, value}, 0),
    ok.


new(AnyType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnyType),
    This.

'$init'(This, AnyType) ->
        'AllBinaryEventObject':'$init'(This, AnyType),
        init_fields(This).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "CapitalEvent: Value: \n"),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getValue(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getValue(This) ->
        get({This, value}).

setValue(This, Value) when is_integer(Value) ->
        put({This, value}, Value).

