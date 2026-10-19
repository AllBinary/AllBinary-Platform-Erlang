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

-module('PersistanceStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PersistanceStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'SAVING'}, "Saving: "),
    put({This, 'NUMBER_OF_RECORDS'}, "Number of records: "),
    put({This, 'LOADING_ID'}, "Loading data with id: "),
    put({This, 'LOAD_ALL'}, "loadAll"),
    put({This, 'DELETING_WITH_ID'}, "Deleting data with id: "),
    put({This, 'CLOSING_RECORDSTORE'}, "Closing RecordStore"),
    put({This, 'NOT_SAVING'}, "Not Saving: "),
    put({This, 'ERROR_LOADING'}, "Error Loading gameActionInput: "),
    put({This, 'ERROR_LOADING_ID'}, "Error Loading id: "),
    put({This, 'ID'}, " id: "),
    put({This, 'GAME_ACTION_INPUT'}, " GameActionInput: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'PersistanceStrings', instance}).

