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
% package org.allbinary.input.motion.button
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('TouchScreenFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'TouchScreenFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, touch}, false),
    put({This, multiTouch}, false),
    put({This, multiTouchDistinct}, false),
    put({This, touchScreenType}, get({'TouchScreenTypesFactory':getInstance(), 'NOTOUCH'})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        try
            (get({This, '$class'})):setTouch(This, true),
            (get({This, '$class'})):setMultiTouch(This, false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), get({'TouchScreenFactory', 'SINGLETON'}), get({CommonStrings, 'GET_INSTANCE'}), E)
        end.

getInstance() ->
        get({'TouchScreenFactory', 'SINGLETON'}).

setMultiTouch(This, MultiTouch) when is_boolean(MultiTouch) ->
        put({This, multiTouch}, MultiTouch).

isMultiTouch(This) ->
        get({This, multiTouch}).

setTouch(This, Touch) when is_boolean(Touch) ->
        put({This, touch}, Touch).

isTouch(This) ->
        get({This, touch}).

setMultiTouchDistinct(This, MultiTouchDistinct) when is_boolean(MultiTouchDistinct) ->
        put({This, multiTouchDistinct}, MultiTouchDistinct).

isMultiTouchDistinct(This) ->
        get({This, multiTouchDistinct}).

setTouchScreenType(This, TouchScreenType) ->
        put({This, touchScreenType}, TouchScreenType).

getTouchScreenType(This) ->
        get({This, touchScreenType}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "TouchScreen: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isTouch(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " MultiTouch: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isMultiTouch(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Distinct MultiTouch: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isMultiTouchDistinct(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " TouchScreenType: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66975) -> (get({Target_N66975, '$class'})):toString(Target_N66975, (get({This, '$class'})):getTouchScreenType(This)) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

