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
% package org.allbinary.game.ai.path
% import javax.microedition.lcdui.Canvas
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.math.AngleIncrementInfo
% import org.allbinary.math.AngleInfo

-module('BasicDirectionAIHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, angleInfo}, undefined),
    ok.


new(Name, AngleInfo) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, AngleInfo),
    This.

'$init'(This, Name, AngleInfo) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, angleInfo}, AngleInfo).

turnAI(This, Frame) when is_integer(Frame) ->
        put({local, keyDirection}, (-1)),
        DirectionAngle = (fun(Target_N65960) -> (get({Target_N65960, '$class'})):getFrameAngle(Target_N65960, Frame) end)((get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo}))),
        Angle = (get({get({This, angleInfo}), '$class'})):getAngle(get({This, angleInfo})),
        Degrees = erlang:abs((DirectionAngle - Angle)),
        case (Degrees < 180) of
            true ->
            case (Angle > DirectionAngle) of
                true ->
                put({local, keyDirection}, get({'Canvas', 'LEFT'}));
                false ->
                case (Angle < DirectionAngle) of
                true ->
                put({local, keyDirection}, get({'Canvas', 'RIGHT'}));
                false -> ok
            end
            end;
            false ->
            case (Angle > DirectionAngle) of
                true ->
                put({local, keyDirection}, get({'Canvas', 'RIGHT'}));
                false ->
                case (Angle < DirectionAngle) of
                true ->
                put({local, keyDirection}, get({'Canvas', 'LEFT'}));
                false -> ok
            end
            end
        end,
        get({local, keyDirection}).

getAIKeyPressed(This, Frame) ->
        try
        Angle = trunc((fun(Target_N66507) -> (get({Target_N66507, '$class'})):getFrameAngle(Target_N66507, (get({Frame, '$class'})):intValue(Frame)) end)((get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo})))),
        case ((get({get({This, angleInfo}), '$class'})):getAngle(get({This, angleInfo})) =/= Angle) of
            true ->
            throw({'$return', (get({This, '$class'})):turnAI(This, (get({Frame, '$class'})):intValue(Frame))});
            false ->
            throw({'$return', get({'Canvas', 'UP'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAIKeyPressedFromDirection(This, GeographicMapDirectionData) ->
        put({local, keyDirection}, (-1)),
        AngleIncrementInfo = (get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo})),
        DirectionFactory = 'DirectionFactory':getInstance(),
        case (GeographicMapDirectionData =:= get({DirectionFactory, 'DOWN'})) of
            true ->
            put({local, keyDirection}, (get({This, '$class'})):getAIKeyPressed(This, get({AngleIncrementInfo, 'DOWN_FRAME'})));
            false ->
            case (GeographicMapDirectionData =:= get({DirectionFactory, 'UP'})) of
            true ->
            put({local, keyDirection}, (get({This, '$class'})):getAIKeyPressed(This, get({AngleIncrementInfo, 'UP_FRAME'})));
            false ->
            case (GeographicMapDirectionData =:= get({DirectionFactory, 'LEFT'})) of
            true ->
            put({local, keyDirection}, (get({This, '$class'})):getAIKeyPressed(This, get({AngleIncrementInfo, 'LEFT_FRAME'})));
            false ->
            case (GeographicMapDirectionData =:= get({DirectionFactory, 'RIGHT'})) of
            true ->
            put({local, keyDirection}, (get({This, '$class'})):getAIKeyPressed(This, get({AngleIncrementInfo, 'RIGHT_FRAME'})));
            false -> ok
        end
        end
        end
        end,
        get({local, keyDirection}).

getAngleInfoP(This) ->
        get({This, angleInfo}).

getName(This) ->
        get({This, name}).

