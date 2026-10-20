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
% package org.allbinary.media.graphics.geography.map
% import org.allbinary.logic.communication.log.LogUtil

-module('GeographicMapCellTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GeographicMapCellTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, geographicMapCellTypeArray}, array:new(512, {default, undefined})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GeographicMapCellTypeFactory', instance}).

get(This, Type) when is_integer(Type) ->
        array:get(Type, get({This, geographicMapCellTypeArray})).

getGeographicMapCellTypeArray(This) ->
        get({This, geographicMapCellTypeArray}).

getStartType(This) ->
        erlang:error({'RuntimeException'}).

getEndType(This) ->
        erlang:error({'RuntimeException'}).

getEmptyType(This) ->
        erlang:error({'RuntimeException'}).

isPath(This, CellType) ->
        erlang:error({'RuntimeException'}).

