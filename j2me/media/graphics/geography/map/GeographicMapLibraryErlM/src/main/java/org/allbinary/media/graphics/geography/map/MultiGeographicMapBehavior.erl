% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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

-module('MultiGeographicMapBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

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
getCellTypeAt(This, GeographicMapInterfaceArray, GeographicMapCellTypeArray, GeographicMapCellPosition) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), (is_tuple(GeographicMapCellTypeArray) orelse GeographicMapCellTypeArray =:= undefined) ->
        Size = array:size(GeographicMapInterfaceArray),
        put({local, cellType}, get({'GeographicMapCellType', 'NULL_GEOGRAPHIC_MAP_CELL_TYPE'})),
        put({local, index}, Size),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, cellType}, (fun(Target_N65719) -> (get({Target_N65719, '$class'})):getCellTypeAt(Target_N65719, GeographicMapCellPosition) end)(array:get(get({local, index}), GeographicMapInterfaceArray))),
            array:set(get({local, index}), get({local, cellType}), GeographicMapCellTypeArray),
            Loop();
        false -> ok end end)(),
        GeographicMapCellTypeArray.

