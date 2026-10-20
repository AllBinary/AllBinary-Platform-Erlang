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
% package org.allbinary.game.ag.ai.tactical
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.ag.ai.InputProbability
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.time.GameTickTimeDelayHelperFactory

-module('BasicRandomAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, i_random}, 0),
    put({This, inputProbability}, undefined),
    put({This, visitor}, undefined),
    put({This, keyArray}, array:from_list([get({'Canvas', 'UP'}), get({'Canvas', 'DOWN'}), get({'Canvas', 'LEFT'}), get({'Canvas', 'RIGHT'}), get({'Canvas', 'KEY_NUM1'}), get({'Canvas', 'KEY_NUM7'}), get({'Canvas', 'KEY_NUM9'})])),
    put({This, myRandomFactory}, 'MyRandomFactory':getInstance()),
    ok.


new(OwnerLayerInterface, GameInput, InputProbability, Visitor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerLayerInterface, GameInput, InputProbability, Visitor),
    This.

'$init'(This, OwnerLayerInterface, GameInput, InputProbability, Visitor) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, inputProbability}, InputProbability),
        put({This, visitor}, Visitor).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        case (fun(Target_N66350) -> (get({Target_N66350, '$class'})):isTime(Target_N66350, get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) end)((get({get({This, inputProbability}), '$class'})):getTimeDelayHelper(get({This, inputProbability}))) of
            true ->
            put({This, i_random}, (get({get({This, myRandomFactory}), '$class'})):getAbsoluteNextInt(get({This, myRandomFactory}), (get({get({This, inputProbability}), '$class'})):getMax(get({This, inputProbability})))),
            put({local, repeat}, false),
            RepeatLikelyhoodIntegerArray = (get({get({This, inputProbability}), '$class'})):getRepeatLikelyhoodIntegerArray(get({This, inputProbability})),
            case (((get({This, '$class'})):getLastKey(This) =/= (-1)) andalso ((fun(Target_N66584) -> (get({Target_N66584, '$class'})):intValue(Target_N66584) end)(array:get((get({This, '$class'})):getLastKey(This), RepeatLikelyhoodIntegerArray)) >= get({This, i_random}))) of
                true ->
                put({local, repeat}, true);
                false -> ok
            end,
            case (not get({local, repeat})) of
                true ->
                LikelyhoodIntegerArray = (get({get({This, inputProbability}), '$class'})):getLikelyhoodIntegerArray(get({This, inputProbability})),
                put({This, i_random}, (get({get({This, myRandomFactory}), '$class'})):getAbsoluteNextInt(get({This, myRandomFactory}), (get({get({This, inputProbability}), '$class'})):getMax(get({This, inputProbability})))),
                Size = array:size(get({This, keyArray})),
                put({local, likelyhoodIntegerKeyArray}, undefined),
                lists:foreach(fun(Index) ->
                    Key = array:get(Index, get({This, keyArray})),
                    put({local, likelyhoodIntegerKeyArray}, array:get(Key, LikelyhoodIntegerArray)),
                    case ((array:size(LikelyhoodIntegerArray) >= Key) andalso (array:get(0, get({local, likelyhoodIntegerKeyArray})) =/= undefined)) of
                        true ->
                        case ((get({This, i_random}) >= (fun(Target_N67048) -> (get({Target_N67048, '$class'})):intValue(Target_N67048) end)(array:get(0, get({local, likelyhoodIntegerKeyArray})))) andalso (get({This, i_random}) < (fun(Target_N67088) -> (get({Target_N67088, '$class'})):intValue(Target_N67088) end)(array:get(1, get({local, likelyhoodIntegerKeyArray}))))) of
                            true ->
                            (get({This, '$class'})):setLastKey(This, Key),
                            throw('$break');
                            false -> ok
                        end;
                        false -> ok
                    end
                end, lists:seq(0, Size - 1));
                false -> ok
            end,
            (get({get({This, visitor}), '$class'})):visit(get({This, visitor}), This);
            false -> ok
        end.

