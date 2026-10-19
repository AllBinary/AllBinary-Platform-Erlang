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
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('TouchButtonInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameKeyEventSourceInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Input', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    put({This, 'TOUCH_BUTTON_SOURCE_ID'}, get({get({This, gameKeyEventFactory}), 'TOUCH_BUTTON_SOURCE_ID'})),
    put({This, gameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    ok.


new(Id, Name) when is_integer(Id), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Id, Name),
    This.

init(This, Id, Name) when is_integer(Id), (is_list(Name) orelse Name =:= undefined) ->
        'Input':init(This, Id, Name),
        init_fields(This),
        InputFactory = 'InputFactory':getInstance(),
        (get({InputFactory, '$class'})):add(InputFactory, (get({This, '$class'})):getId(This), This).

update(This, InputToGameKeyMapping) ->
        try
            GameKey = (get({InputToGameKeyMapping, '$class'})):getInstance(InputToGameKeyMapping, (get({This, '$class'})):getId(This)),
            put({This, gameKeyEvent}, (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), This, GameKey))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'UPDATE'}), E)
        end.

getSourceId(This) ->
        get({This, 'TOUCH_BUTTON_SOURCE_ID'}).

getGameKeyEvent(This) ->
        get({This, gameKeyEvent}).

