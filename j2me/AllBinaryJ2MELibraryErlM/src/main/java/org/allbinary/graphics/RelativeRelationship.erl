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
% package org.allbinary.graphics
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('RelativeRelationship').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_RELATIVE_RELATIONSHIP'}, 'RelativeRelationship':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), (fun(Target_N65692) -> (get({Target_N65692, '$class'})):getImmutableInstance(Target_N65692) end)('BasicArrayListUtil':getInstance()))),
    ok.

init_fields(This) ->
    put({This, typesAllowedList}, undefined),
    put({This, x}, 0),
    put({This, y}, 0),
    put({This, z}, 0),
    ok.


new(Point, TypesAllowedList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Point, TypesAllowedList),
    This.

init(This, Point, TypesAllowedList) ->
    init_fields(This),
        put({This, x}, (get({Point, '$class'})):getX(Point)),
        put({This, y}, (get({Point, '$class'})):getY(Point)),
        put({This, z}, (get({Point, '$class'})):getZ(Point)),
        put({This, typesAllowedList}, TypesAllowedList).

getX(This) ->
        get({This, x}).

getY(This) ->
        get({This, y}).

getZ(This) ->
        get({This, z}).

getTypesAllowedList(This) ->
        get({This, typesAllowedList}).

setTypesAllowedList(This, TypesAllowedList) ->
        put({This, typesAllowedList}, TypesAllowedList).

