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
% package org.allbinary.input.event
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.logic.util.event.handler.BasicEventHandler

-module('VirtualKeyboardEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicEventHandler', Function, Arguments).

static_init() ->
    put({?MODULE, gameKeyEventHandler}, 'VirtualKeyboardEventHandler':new()),
    ok.

init_fields(This) ->
    put({This, 'SHOW_EVENT'}, 'VirtualKeyboardEvent':new(get({'BooleanFactory':getInstance(), 'TRUE'}))),
    put({This, 'HIDE_EVENT'}, 'VirtualKeyboardEvent':new(get({'BooleanFactory':getInstance(), 'FALSE'}))),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BasicEventHandler':init(This),
    init_fields(This),
        ok.

getInstance() ->
        get({'VirtualKeyboardEventHandler', gameKeyEventHandler}).

% throws Exception
process(This, EventObject, EventListenerInterface) ->
        VirtualKeyboardEventListenerInterface = EventListenerInterface,
        (get({VirtualKeyboardEventListenerInterface, '$class'})):onVirtualKeyboardEvent(VirtualKeyboardEventListenerInterface, EventObject).

open(This) ->
        try
            timer:sleep(120),
            (get({This, '$class'})):fireEvent(This, get({This, 'SHOW_EVENT'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "open", E)
        end.

% throws Exception
close(This) ->
        try
            timer:sleep(120),
            (get({This, '$class'})):fireEvent(This, get({This, 'HIDE_EVENT'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CLOSE'}), E)
        end.

