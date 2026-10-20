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
% package org.allbinary.game.ai
% import org.allbinary.ai.ArtificialIntelligence
% import org.allbinary.game.displayable.canvas.CanvasUtil
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('BasicAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GameKeyEventSourceInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ArtificialIntelligence', Function, Arguments).

static_init() ->
    put({?MODULE, 'AI_VISITOR'}, (fun(Target_N65978) -> (get({Target_N65978, '$class'})):getAt(Target_N65978, 2) end)('SmallIntegerSingletonFactory':getInstance())),
    put({?MODULE, 'ID'}, (fun(Target_N66047) -> (get({Target_N66047, '$class'})):getAt(Target_N66047, 1) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    put({This, ownerLayerInterface}, undefined),
    put({This, gameInput}, undefined),
    put({This, lastKey}, (-1)),
    ok.


new(OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerLayerInterface, GameInput),
    This.

'$init'(This, OwnerLayerInterface, GameInput) ->
    'ArtificialIntelligence':'$init'(This),
    init_fields(This),
        put({This, ownerLayerInterface}, OwnerLayerInterface),
        put({This, gameInput}, GameInput).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
processKeyAI(This, Key) when is_integer(Key) ->
        case (Key =/= (-1)) of
            true ->
            (get({get({This, gameInput}), '$class'})):add(get({This, gameInput}), (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForKey(get({This, gameKeyEventFactory}), This, Key));
            false -> ok
        end.

setLastKey(This, LastKey) when is_integer(LastKey) ->
        put({This, lastKey}, LastKey).

getLastKey(This) ->
        get({This, lastKey}).

getOwnerLayerInterface(This) ->
        get({This, ownerLayerInterface}).

getGameInput(This) ->
        get({This, gameInput}).

getName(This) ->
        atom_to_list(get({This, '$class'})).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " LastKey: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'CanvasUtil':getKeyName((get({This, '$class'})):getLastKey(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getSourceId(This) ->
        1.

