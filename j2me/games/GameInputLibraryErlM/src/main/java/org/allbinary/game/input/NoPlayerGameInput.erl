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
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.util.BasicArrayListD

-module('NoPlayerGameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'NoPlayerGameInput':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'NoPlayerGameInput', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'PlayerGameInput':'$init'(This, 'BasicArrayListD':new(), 'BasicArrayListD':new(), (-1)).

onDownGameKeyEvent(This, GameKeyEvent) ->
        ok.

onUpGameKeyEvent(This, GameKeyEvent) ->
        ok.

