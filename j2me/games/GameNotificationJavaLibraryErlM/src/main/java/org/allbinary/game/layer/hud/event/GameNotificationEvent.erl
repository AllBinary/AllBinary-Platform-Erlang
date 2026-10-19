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
% package org.allbinary.game.layer.hud.event
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('GameNotificationEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, string}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, seconds}, undefined),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'BLACK'})),
    put({This, removeable}, undefined),
    ok.


new(AnyType, String, Seconds, BasicColor, Permanent) when (is_list(String) orelse String =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnyType, String, Seconds, BasicColor, Permanent),
    This.

init(This, AnyType, String, Seconds, BasicColor, Permanent) when (is_list(String) orelse String =:= undefined) ->
        'AllBinaryEventObject':init(This, AnyType),
        init_fields(This),
        (get({This, '$class'})):setString(This, String),
        put({This, seconds}, Seconds),
        (get({This, '$class'})):setBasicColorP(This, BasicColor),
        put({This, removeable}, Permanent).

getString(This) ->
        get({This, string}).

getSeconds(This) ->
        get({This, seconds}).

getBasicColorP(This) ->
        get({This, basicColor}).

getPermanent(This) ->
        get({This, removeable}).

setString(This, String) when (is_list(String) orelse String =:= undefined) ->
        put({This, string}, String).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor).

