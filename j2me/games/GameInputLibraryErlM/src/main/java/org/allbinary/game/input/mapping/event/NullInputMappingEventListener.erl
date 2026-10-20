% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.game.input.mapping.event
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('NullInputMappingEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements InputMappingEventListenerInterface

static_init() ->
    put({?MODULE, 'NULL_INPUT_MAPPING_EVENT_LISTENER'}, 'NullInputMappingEventListener':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
onInputMappingEvent(This, InputMappingEvent) ->
        ok.

onEvent(This, EventObject) ->
        ok.

