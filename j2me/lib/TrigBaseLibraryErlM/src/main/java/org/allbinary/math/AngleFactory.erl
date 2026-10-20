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
% package org.allbinary.math
% import jsinterop.annotations.JsType
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('AngleFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AngleFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'TOTAL_ANGLE'}, 360),
    put({This, 'QUARTER_TOTAL_ANGLE'}, 90),
    put({This, angleArray}, array:new(get({This, 'TOTAL_ANGLE'}), {default, undefined})),
    put({This, 'NEGATIVE_ONE'}, (-1)),
    put({This, 'NOT_ANGLE'}, 'NamedAngle':new(get({This, 'NEGATIVE_ONE'}), get({'CommonStrings':getInstance(), 'EMPTY'}))),
    put({This, 'DOWN'}, undefined),
    put({This, 'UP'}, undefined),
    put({This, 'LEFT'}, undefined),
    put({This, 'RIGHT'}, undefined),
    put({This, frameUtil}, 'FrameUtil':getInstance()),
    ok.


getInstance() ->
        get({'AngleFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        CommonPhoneStrings = 'CommonPhoneStrings':getInstance(),
        Total = array:size(get({This, angleArray})),
        put({This, 'UP'}, 'NamedAngle':new(0, get({CommonPhoneStrings, 'UP'}))),
        put({This, angleArray}, array:set(0, get({This, 'UP'}), get({This, angleArray}))),
        lists:foreach(fun(Index) ->
            put({This, angleArray}, array:set(Index, 'Angle':new(Index), get({This, angleArray})))
        end, lists:seq(1, 90 - 1)),
        put({This, 'RIGHT'}, 'NamedAngle':new(90, get({CommonPhoneStrings, 'RIGHT'}))),
        put({This, angleArray}, array:set(90, get({This, 'RIGHT'}), get({This, angleArray}))),
        lists:foreach(fun(Index) ->
            put({This, angleArray}, array:set(Index, 'Angle':new(Index), get({This, angleArray})))
        end, lists:seq(91, 180 - 1)),
        put({This, 'DOWN'}, 'NamedAngle':new(180, get({CommonPhoneStrings, 'DOWN'}))),
        put({This, angleArray}, array:set(180, get({This, 'DOWN'}), get({This, angleArray}))),
        lists:foreach(fun(Index) ->
            put({This, angleArray}, array:set(Index, 'Angle':new(Index), get({This, angleArray})))
        end, lists:seq(181, 270 - 1)),
        put({This, 'LEFT'}, 'NamedAngle':new(270, get({CommonPhoneStrings, 'LEFT'}))),
        put({This, angleArray}, array:set(270, get({This, 'LEFT'}), get({This, angleArray}))),
        lists:foreach(fun(Index) ->
            put({This, angleArray}, array:set(Index, 'Angle':new(Index), get({This, angleArray})))
        end, lists:seq(271, Total - 1)).

getAt(This, Index) when is_integer(Index) ->
        AdjustedIndex = trunc((get({get({This, frameUtil}), '$class'})):adjustAngleToFrameAngle(get({This, frameUtil}), Index)),
        array:get(AdjustedIndex, get({This, angleArray})).

getClosestDirection(This, Angle) when is_integer(Angle) ->
        try
        case ((((Angle >= 315) andalso (Angle < 360))) orelse (((Angle >= 0) andalso (Angle < 45)))) of
            true ->
            throw({'$return', get({This, 'UP'})});
            false ->
            case ((Angle >= 45) andalso (Angle < 135)) of
            true ->
            throw({'$return', get({This, 'RIGHT'})});
            false ->
            case ((Angle >= 135) andalso (Angle < 225)) of
            true ->
            throw({'$return', get({This, 'DOWN'})});
            false ->
            case ((Angle >= 225) andalso (Angle < 315)) of
            true ->
            throw({'$return', get({This, 'LEFT'})});
            false -> ok
        end
        end
        end
        end,
        erlang:error({'RuntimeException'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getGeneralDirection(This) ->
        get({This, 'NOT_ANGLE'}).

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        StringMaker = 'StringMaker':new(),
        AngleFactory = 'AngleFactory':getInstance(),
        lists:foreach(fun(Index) ->
            (fun(Target_N68304) -> (get({Target_N68304, '$class'})):append(Target_N68304, get({'CommonSeps':getInstance(), 'NEW_LINE'})) end)((fun(Target_N68311) -> (get({Target_N68311, '$class'})):appendshort(Target_N68311, trunc((fun(Target_N68382) -> (get({Target_N68382, '$class'})):getValue(Target_N68382) end)((get({AngleFactory, '$class'})):getClosestDirection(AngleFactory, Index)))) end)((fun(Target_N68318) -> (get({Target_N68318, '$class'})):append(Target_N68318, get({'CommonSeps':getInstance(), 'FORWARD_SLASH'})) end)((get({StringMaker, '$class'})):appendint(StringMaker, Index))))
        end, lists:seq(0, 360 - 1)),
        (fun(Target_N68517) -> (get({Target_N68517, '$class'})):putF(Target_N68517, (get({StringMaker, '$class'})):toString(StringMaker), "main", "main") end)('LogUtil':getInstance()).

