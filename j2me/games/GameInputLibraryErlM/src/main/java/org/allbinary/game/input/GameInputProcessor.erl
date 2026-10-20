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
% import org.allbinary.layer.AllBinaryLayerManager

-module('GameInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameInputProcessor':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'GameInputProcessor', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
processEvent(This, AllbinaryLayerManager, GameKeyEvent) ->
        ok.

% throws Exception
processReleasedEvent(This, AllbinaryLayerManager, GameKeyEvent) ->
        ok.

% throws Exception
processAnalog(This, AllbinaryLayerManager, GameKeyEvent, AnalogValue) when is_integer(AnalogValue) ->
        ok.

% throws Exception
process(This, AllbinaryLayerManager, KeyAsInteger) ->
        ok.

% throws Exception
processReleased(This, AllbinaryLayerManager, KeyAsInteger) ->
        ok.

