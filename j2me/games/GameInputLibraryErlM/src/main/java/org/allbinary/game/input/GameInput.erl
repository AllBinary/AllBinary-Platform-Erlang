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
% package org.allbinary.game.input
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.InputFeatureFactory
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('GameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gameKeyEventList}, undefined),
    put({This, removalGameKeyEventList}, undefined),
    put({This, isRemoveDuplicateKeyPresses}, false),
    ok.


new(GameKeyEventList, RemovalGameKeyEventList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameKeyEventList, RemovalGameKeyEventList),
    This.

init(This, GameKeyEventList, RemovalGameKeyEventList) ->
    init_fields(This),
        put({This, gameKeyEventList}, GameKeyEventList),
        put({This, removalGameKeyEventList}, RemovalGameKeyEventList),
        put({This, isRemoveDuplicateKeyPresses}, (fun(Target_N66053) -> (get({Target_N66053, '$class'})):isFeature(Target_N66053, get({'InputFeatureFactory':getInstance(), 'REMOVE_DUPLICATE_KEY_PRESSES'})) end)('Features':getInstance())).

add(This, GameKeyEvent) ->
        try
        case (get({This, isRemoveDuplicateKeyPresses}) andalso (get({get({This, gameKeyEventList}), '$class'})):contains(get({This, gameKeyEventList}), GameKeyEvent)) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        case (GameKeyEvent =/= undefined) of
            true ->
            (get({get({This, gameKeyEventList}), '$class'})):add(get({This, gameKeyEventList}), GameKeyEvent);
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Danger Passed Null GameKeyEvent", This, get({get({This, commonStrings}), 'ADD'}))
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addForRemoval(This, GameKeyEvent) ->
        (get({get({This, removalGameKeyEventList}), '$class'})):add(get({This, removalGameKeyEventList}), GameKeyEvent).

isForRemoval(This, GameKeyEvent) ->
        (get({get({This, removalGameKeyEventList}), '$class'})):contains(get({This, removalGameKeyEventList}), GameKeyEvent).

clear(This) ->
        (get({get({This, gameKeyEventList}), '$class'})):clear(get({This, gameKeyEventList})).

removeNonAIInputGameKeyEvents(This) ->
        List = get({This, gameKeyEventList}),
        put({local, gameKeyEvent}, undefined),
        put({local, index}, (get({List, '$class'})):size(List)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, gameKeyEvent}, array:get(get({local, index}), get({List, objectArray}))),
            case ((get({get({local, gameKeyEvent}), '$class'})):getSourceId(get({local, gameKeyEvent})) =/= 1) of
                true ->
                (get({List, '$class'})):removeAt(List, get({local, index}));
                false -> ok
            end,
            Loop();
        false -> ok end end)().

update(This) ->
        RemoveList = get({This, removalGameKeyEventList}),
        List = get({This, gameKeyEventList}),
        Size = (get({RemoveList, '$class'})):size(RemoveList),
        lists:foreach(fun(Index) ->
            AnyType = array:get(Index, get({RemoveList, objectArray})),
            put({local, index2}, (get({List, '$class'})):size(List)),
            (fun Loop() -> case (begin put({local, index2}, get({local, index2}) - 1), get({local, index2}) end >= 0) of true ->
                case (array:get(get({local, index2}), get({List, objectArray})) =:= AnyType) of
                    true ->
                    (get({List, '$class'})):removeAt(List, get({local, index2}));
                    false -> ok
                end,
                Loop();
            false -> ok end end)()
        end, lists:seq(0, Size - 1)),
        (get({RemoveList, '$class'})):clear(RemoveList).

getRemovalGameKeyEventList(This) ->
        get({This, removalGameKeyEventList}).

getGameKeyEventList(This) ->
        get({This, gameKeyEventList}).

