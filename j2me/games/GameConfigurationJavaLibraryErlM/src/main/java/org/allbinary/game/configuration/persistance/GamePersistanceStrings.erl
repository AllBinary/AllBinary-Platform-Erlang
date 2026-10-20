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
% package org.allbinary.game.configuration.persistance

-module('GamePersistanceStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GamePersistanceStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'SAVED_GAME_RECORD_ID'}, "_SG"),
    put({This, 'SAVED_GAME_CONFIGURATION_RECORD_ID'}, "_SGC"),
    put({This, 'DEFAULT_INPUT_MAPPING_RECORD_ID'}, "_DIM"),
    put({This, 'SAVED_INPUT_CONFIGURATION_RECORD_ID'}, "_SIC"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GamePersistanceStrings', instance}).

