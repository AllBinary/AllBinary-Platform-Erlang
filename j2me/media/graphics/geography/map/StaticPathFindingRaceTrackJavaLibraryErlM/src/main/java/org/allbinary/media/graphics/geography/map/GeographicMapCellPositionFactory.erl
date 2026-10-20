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
% import org.allbinary.string.CommonStrings
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.ABHashtable

-module('GeographicMapCellPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellPositionBaseFactory', Function, Arguments).

static_init() ->
    put({?MODULE, hashtable}, (fun(Target_N65847) -> (get({Target_N65847, '$class'})):createHashtable(Target_N65847) end)('StdUtil':getInstance())),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'GeographicMapCellPositionBaseFactory':'$init'(This),
    init_fields(This).


% throws Exception
getInstance(This, GeographicMapInterface) ->
        try
        CommonStrings = 'CommonStrings':getInstance(),
        AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        put({local, geographicMapCellPositionFactoryCanBeNull}, (get({get({'GeographicMapCellPositionFactory', hashtable}), '$class'})):get(get({'GeographicMapCellPositionFactory', hashtable}), (get({AllBinaryTiledLayer, '$class'})):getDataId(AllBinaryTiledLayer))),
        case (get({local, geographicMapCellPositionFactoryCanBeNull}) =:= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66276) -> (get({Target_N66276, '$class'})):toString(Target_N66276) end)((fun(Target_N66283) -> (get({Target_N66283, '$class'})):appendint(Target_N66283, trunc((fun(Target_N66319) -> (get({Target_N66319, '$class'})):intValue(Target_N66319) end)((get({AllBinaryTiledLayer, '$class'})):getDataId(AllBinaryTiledLayer)))) end)((fun(Target_N66290) -> (get({Target_N66290, '$class'})):append(Target_N66290, "Creating GeographicMapCellPositionFactory for TileLayer: ") end)('StringMaker':new()))), This, get({CommonStrings, 'GET_INSTANCE'})),
            put({local, geographicMapCellPositionFactoryCanBeNull}, 'BasicGeographicMapCellPositionFactory':new(GeographicMapInterface)),
            (get({get({'GeographicMapCellPositionFactory', hashtable}), '$class'})):put(get({'GeographicMapCellPositionFactory', hashtable}), (get({AllBinaryTiledLayer, '$class'})):getDataId(AllBinaryTiledLayer), get({local, geographicMapCellPositionFactoryCanBeNull})),
            throw({'$return', get({local, geographicMapCellPositionFactoryCanBeNull})});
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66130) -> (get({Target_N66130, '$class'})):toString(Target_N66130) end)((fun(Target_N66137) -> (get({Target_N66137, '$class'})):appendint(Target_N66137, trunc((fun(Target_N66173) -> (get({Target_N66173, '$class'})):intValue(Target_N66173) end)((get({AllBinaryTiledLayer, '$class'})):getDataId(AllBinaryTiledLayer)))) end)((fun(Target_N66144) -> (get({Target_N66144, '$class'})):append(Target_N66144, "Reusing GeographicMapCellPositionFactory for TileLayer: ") end)('StringMaker':new()))), This, get({CommonStrings, 'GET_INSTANCE'})),
            throw({'$return', get({local, geographicMapCellPositionFactoryCanBeNull})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getHashtable() ->
        get({'GeographicMapCellPositionFactory', hashtable}).

