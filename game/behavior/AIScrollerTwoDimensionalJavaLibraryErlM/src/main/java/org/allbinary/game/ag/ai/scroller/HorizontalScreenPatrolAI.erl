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
% package org.allbinary.game.ag.ai.scroller
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.audio.PlayerQueue
% import org.allbinary.media.audio.SecondaryPlayerQueueFactory
% import org.allbinary.media.audio.Sound
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable

-module('HorizontalScreenPatrolAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

static_init() ->
    put({?MODULE, 'SOUND'}, (fun(Target_N66364) -> (get({Target_N66364, '$class'})):getAt(Target_N66364, 433) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, keyDirection}, get({'Canvas', 'LEFT'})),
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, firingX}, (get({get({This, displayInfoSingleton}), '$class'})):getLastHalfWidth(get({This, displayInfoSingleton}))),
    put({This, firedIndex}, 0),
    put({This, 'MAX_FIRE'}, 28),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(240)),
    put({This, secondaryPlayerQueue}, 'SecondaryPlayerQueueFactory':getInstance()),
    put({This, sound}, undefined),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

init(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'BasicAI':init(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, sound}, (get({Hashtable, '$class'})):get(Hashtable, get({'HorizontalScreenPatrolAI', 'SOUND'}))),
        case (get({This, sound}) =:= undefined) of
            true ->
            erlang:error({'Exception', "No Sound Provided!!"});
            false -> ok
        end.

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        'BasicAI':processKeyAI(This, get({This, keyDirection})),
        case (get({get({This, timeDelayHelper}), '$class'})):isTimeTNT(get({This, timeDelayHelper})) of
            true ->
            LayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
            CurrentOwnerLayerX = (get({LayerInterface, '$class'})):getXP(LayerInterface),
            case (CurrentOwnerLayerX < (-(get({LayerInterface, '$class'})):getWidth(LayerInterface))) of
                true ->
                Y = (fun(Target_N66883) -> (get({Target_N66883, '$class'})):getAbsoluteNextIntAllowZero(Target_N66883, 50) end)('MyRandomFactory':getInstance()),
                (get({LayerInterface, '$class'})):setPosition(LayerInterface, (((get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton})) + (get({LayerInterface, '$class'})):getWidth(LayerInterface)) + 50), Y, (get({LayerInterface, '$class'})):getZP(LayerInterface)),
                put({This, firedIndex}, 0),
                put({This, firingX}, ((get({get({This, displayInfoSingleton}), '$class'})):getLastHalfWidth(get({This, displayInfoSingleton})) + (fun(Target_N67091) -> (get({Target_N67091, '$class'})):getNextInt(Target_N67091, (get({get({This, displayInfoSingleton}), '$class'})):getLastHalfWidth(get({This, displayInfoSingleton}))) end)('MyRandomFactory':getInstance()))),
                (get({get({This, secondaryPlayerQueue}), '$class'})):add(get({This, secondaryPlayerQueue}), get({This, sound}));
                false -> ok
            end,
            case ((CurrentOwnerLayerX < get({This, firingX})) andalso (CurrentOwnerLayerX > (-(get({LayerInterface, '$class'})):getWidth(LayerInterface)))) of
                true ->
                'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_NUM1'})),
                GameLayerManager = AllBinaryLayerManager,
                put({local, 'FIRE'}, ((((fun(Target_N67377) -> (get({Target_N67377, '$class'})):getCurrentLevel(Target_N67377) end)((get({GameLayerManager, '$class'})):getGameInfo(GameLayerManager)) + 12)) bsr 2)),
                case (get({local, 'FIRE'}) > get({This, 'MAX_FIRE'})) of
                    true ->
                    put({local, 'FIRE'}, get({This, 'MAX_FIRE'}));
                    false -> ok
                end,
                case (get({This, firedIndex}) > get({local, 'FIRE'})) of
                    true ->
                    put({This, firedIndex}, 0),
                    put({This, firingX}, get({'Integer', 'MIN_VALUE'}));
                    false -> ok
                end,
                put({This, firedIndex}, get({This, firedIndex}) + 1);
                false -> ok
            end;
            false -> ok
        end.

nextDirection(This) ->
        ok.

