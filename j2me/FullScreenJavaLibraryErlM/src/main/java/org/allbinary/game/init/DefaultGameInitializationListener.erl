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
% package org.allbinary.game.init
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.configuration.event.GameInitializedEvent
% import org.allbinary.game.configuration.event.GameInitializedEventHandler
% import org.allbinary.game.configuration.event.GameInitializedListenerInterface
% import org.allbinary.game.resource.FeatureResourceInitializationUtil
% import org.allbinary.graphics.threed.SWTJOGLProcessor
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('DefaultGameInitializationListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameInitializedListenerInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, swtJOGLProcessor}, 'SWTJOGLProcessor':getInstance()),
    put({This, firstTime}, true),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        GameInitializedEventHandler = 'GameInitializedEventHandler':getInstance(),
        (get({GameInitializedEventHandler, '$class'})):removeAllListeners(GameInitializedEventHandler),
        (get({GameInitializedEventHandler, '$class'})):addListenerInterface(GameInitializedEventHandler, This).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onGameInitialized(This, GameInitializedEvent) ->
        ON_GAME_INITIALIZED = "onGameInitialized",
        CommonStrings = 'CommonStrings':getInstance(),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, ON_GAME_INITIALIZED),
            (fun Loop() -> case (not (get({get({This, swtJOGLProcessor}), '$class'})):isHolderCreated(get({This, swtJOGLProcessor}))) of true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'UPDATE'}), This, ON_GAME_INITIALIZED),
                timer:sleep(20),
                Loop();
            false -> ok end end)(),
            (fun(Target_N66547) -> (get({Target_N66547, '$class'})):init(Target_N66547, (get({GameInitializedEvent, '$class'})):getLevel(GameInitializedEvent)) end)('FeatureResourceInitializationUtil':getInstance()),
            case get({This, firstTime}) of
                true ->
                put({This, firstTime}, false);
                false ->
                (get({get({This, swtJOGLProcessor}), '$class'})):onSurfaceChanged(get({This, swtJOGLProcessor}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, ON_GAME_INITIALIZED, E)
        end.

