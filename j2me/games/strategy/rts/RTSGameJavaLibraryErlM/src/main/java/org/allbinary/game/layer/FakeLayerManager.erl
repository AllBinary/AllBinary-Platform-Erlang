% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
%  
% By agreeing to this license you and any business entity you represent are 
% legally bound to the AllBinary Open License Version 1 legal agreement. 
%  
% You may obtain the AllBinary Open License Version 1 legal agreement from 
% AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
%  
% Created By: Travis Berthelot  
% Generated Code Do Not Modify
% package org.allbinary.game.layer
% import org.allbinary.game.GameInfo
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface

-module('FakeLayerManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GeographicMapCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryGameLayerManager', Function, Arguments).

init_fields(This) ->
    put({This, geographicMapInterfaceArray}, get({'BasicGeographicMap', 'NULL_BASIC_GEOGRAPHIC_MAP_ARRAY'})),
    put({This, geographicMapCellTypeArray}, get({'GeographicMapCellType', 'NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY'})),
    ok.


new(GameInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameInfo),
    This.

init(This, GameInfo) ->
        'AllBinaryGameLayerManager':init(This, get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'}), GameInfo),
        init_fields(This).

getGeographicMapInterface(This) ->
        get({This, geographicMapInterfaceArray}).

setGeographicMapInterface(This, GeographicMapInterfaceArray) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined) ->
        put({This, geographicMapInterfaceArray}, GeographicMapInterfaceArray),
        put({This, geographicMapCellTypeArray}, array:new(array:size(get({This, geographicMapInterfaceArray})), {default, undefined})).

geographicMapCellTypeArray(This) ->
        get({This, geographicMapCellTypeArray}).

