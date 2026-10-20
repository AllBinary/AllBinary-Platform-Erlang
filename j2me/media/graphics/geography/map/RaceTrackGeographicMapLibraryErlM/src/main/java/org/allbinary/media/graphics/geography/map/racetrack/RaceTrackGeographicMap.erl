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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory

-module('RaceTrackGeographicMap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseRaceTrackGeographicMap', Function, Arguments).

init_fields(This) ->
    put({This, customMapGenerator}, undefined),
    ok.


new(RaceTrackInfo, RaceTrackData, TiledLayerFactoryInterface, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory, CustomMapGeneratorBaseFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RaceTrackInfo, RaceTrackData, TiledLayerFactoryInterface, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory, CustomMapGeneratorBaseFactory),
    This.

'$init'(This, RaceTrackInfo, RaceTrackData, TiledLayerFactoryInterface, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory, CustomMapGeneratorBaseFactory) ->
        'BaseRaceTrackGeographicMap':'$init'(This, RaceTrackInfo, RaceTrackData, (get({TiledLayerFactoryInterface, '$class'})):getInstance(TiledLayerFactoryInterface, RaceTrackInfo, RaceTrackData), (fun(Target_N65898) -> (get({Target_N65898, '$class'})):getInstance(Target_N65898, RaceTrackInfo, RaceTrackData, TiledLayerFactoryInterface, GeographicMapCellPositionFactoryInterface, GeographicMapCellTypeFactory) end)('BasicGeographicMapFactory':new()), GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory),
        init_fields(This),
        put({This, customMapGenerator}, (get({CustomMapGeneratorBaseFactory, '$class'})):create(CustomMapGeneratorBaseFactory, This)).

getCustomMapGenerator(This) ->
        get({This, customMapGenerator}).

% throws Exception
isValid(This, GeographicMapCellPosition) ->
        try
        CustomMapArray = (get({get({This, customMapGenerator}), '$class'})):getCustomMapArray(get({This, customMapGenerator})),
        case ((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition) >= array:size(array:get(0, CustomMapArray))) of
            true ->
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Column: "),
            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition))),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " not in: "),
            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), array:size(array:get(0, CustomMapArray))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'})),
            case ((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition) =:= array:size(array:get(0, CustomMapArray))) of
                true ->
                throw({'$return', true});
                false ->
                throw({'$return', false})
            end;
            false ->
            case ((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition) > array:size(CustomMapArray)) of
            true ->
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Row: "),
            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition))),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " not in: "),
            (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), array:size(CustomMapArray)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'})),
            case ((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition) =:= array:size(CustomMapArray)) of
                true ->
                throw({'$return', true});
                false ->
                throw({'$return', false})
            end;
            false -> ok
        end
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

