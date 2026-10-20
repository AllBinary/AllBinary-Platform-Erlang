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
% package org.allbinary.game.ag.ai
% import org.allbinary.game.input.GameInput
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable

-module('MultiKeyPressesAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('KeyPressesAI', Function, Arguments).

init_fields(This) ->
    put({This, toggleTimeHelper}, 'TimeDelayHelper':new(600)),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'KeyPressesAI':'$init'(This, Hashtable, OwnerLayerInterface, GameInput),
        init_fields(This),
        (get({This, '$class'})):update(This).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        ok.

% throws Exception
update(This) ->
        GameInput = (get({This, '$class'})):getGameInput(This),
        Keys = get({This, keys}),
        Size = array:size(Keys),
        case (get({This, '$class'})):isOn(This) of
            true ->
            lists:foreach(fun(Index) ->
                put({local, key}, (fun(Target_N66527) -> (get({Target_N66527, '$class'})):intValue(Target_N66527) end)(array:get(Index, Keys))),
                case (get({local, key}) =/= (-1)) of
                    true ->
                    (get({GameInput, '$class'})):add(GameInput, (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForKey(get({This, gameKeyEventFactory}), This, get({local, key})));
                    false -> ok
                end
            end, lists:seq(0, Size - 1));
            false ->
            lists:foreach(fun(Index) ->
                put({local, key}, (fun(Target_N66306) -> (get({Target_N66306, '$class'})):intValue(Target_N66306) end)(array:get(Index, Keys))),
                case (get({local, key}) =/= (-1)) of
                    true ->
                    (get({GameInput, '$class'})):addForRemoval(GameInput, (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForKey(get({This, gameKeyEventFactory}), This, get({local, key})));
                    false -> ok
                end
            end, lists:seq(0, Size - 1))
        end.

% throws Exception
toggle(This) ->
        case (get({get({This, toggleTimeHelper}), '$class'})):isTime(get({This, toggleTimeHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
            true ->
            'KeyPressesAI':toggle(This),
            (get({This, '$class'})):update(This);
            false -> ok
        end.

% throws Exception
disable(This) ->
        case (get({get({This, toggleTimeHelper}), '$class'})):isTime(get({This, toggleTimeHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
            true ->
            'KeyPressesAI':disable(This),
            (get({This, '$class'})):update(This);
            false -> ok
        end.

% throws Exception
enable(This) ->
        case (get({get({This, toggleTimeHelper}), '$class'})):isTime(get({This, toggleTimeHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
            true ->
            'KeyPressesAI':enable(This),
            (get({This, '$class'})):update(This);
            false -> ok
        end.

