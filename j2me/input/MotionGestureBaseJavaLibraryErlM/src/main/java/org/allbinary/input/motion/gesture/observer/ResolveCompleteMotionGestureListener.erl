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
% package org.allbinary.input.motion.gesture.observer
% import org.allbinary.game.input.CompleteMotionGestureInputEventHandler
% import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent
% import org.allbinary.game.input.motion.action.GameKeyFromMotionGestureEventListener
% import org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation
% import org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration
% import org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('ResolveCompleteMotionGestureListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CompleteMotionGestureListenerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "MotionGesture to CompleteMotionGesture Reciever", This, get({CommonStrings, 'CONSTRUCTOR'})),
        (fun(Target_N66074) -> (get({Target_N66074, '$class'})):addListener(Target_N66074, 'GameKeyFromMotionGestureEventListener':new()) end)('CompleteMotionGestureInputEventHandler':getInstance()).

% throws Exception
onMotionGestureCompleted(This, List) ->
        Configuration = 'MotionGestureConfigurationFactory':getInstance(),
        CommandActionsList = (get({Configuration, '$class'})):getAssociateCommandActionsList(Configuration),
        Size = (get({CommandActionsList, '$class'})):size(CommandActionsList),
        lists:foreach(fun(Index) ->
            Association = array:get(Index, get({CommandActionsList, objectArray})),
            case ((get({Association, '$class'})):isMotionGestureArrayEquals(Association, List) =:= true) of
                true ->
                CompleteMotionGestureInputEvent = (get({Association, '$class'})):getCommandAction(Association),
                (fun(Target_N66446) -> (get({Target_N66446, '$class'})):fireEvent(Target_N66446, CompleteMotionGestureInputEvent) end)('CompleteMotionGestureInputEventHandler':getInstance()),
                throw('$break');
                false -> ok
            end
        end, lists:seq((Size - 1), 0, -1)).

