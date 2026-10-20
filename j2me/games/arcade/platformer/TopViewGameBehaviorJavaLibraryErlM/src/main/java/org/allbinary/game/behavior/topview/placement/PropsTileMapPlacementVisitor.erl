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
% package org.allbinary.game.behavior.topview.placement
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.mapeditor.core.TileLayer
% import org.mapeditor.core.TiledMap

-module('PropsTileMapPlacementVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TileMapPlacementVisitor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, randomFactory}, 'MyRandomFactory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TileMapPlacementVisitor':'$init'(This),
    init_fields(This).


visit(This, LastMap, MapData) when (is_tuple(MapData) orelse MapData =:= undefined) ->
        LayerIndex = 0,
        TileLayer = ((get({LastMap, '$class'})):getLayer(LastMap, LayerIndex)),
        MapArray = (get({TileLayer, '$class'})):getMapArray(TileLayer),
        Size = array:size(MapData),
        Size2 = array:size(array:get(0, MapData)),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(Index2) ->
                case (array:get(Index2, array:get(Index, MapArray)) =:= 14) of
                    true ->
                    ok;
                    false ->
                    (get({This, '$class'})):visit2(This, MapArray, MapData, Index, Index2)
                end,
                case ((Index rem 7) =:= 0) of
                    true ->
                    case (array:get(Index2, array:get(Index, MapArray)) =:= 19) of
                        true ->
                        put({local, randomInt}, (get({get({This, randomFactory}), '$class'})):getAbsoluteNextIntAllowZero(get({This, randomFactory}), 3)),
                        case (get({local, randomInt}) =:= 0) of
                            true ->
                            array:set(Index, array:set(Index2, 1, array:get(Index, MapData)), MapData);
                            false ->
                            case (get({local, randomInt}) =:= 1) of
                            true ->
                            array:set(Index, array:set(Index2, 81, array:get(Index, MapData)), MapData);
                            false ->
                            case (get({local, randomInt}) =:= 2) of
                            true ->
                            array:set(Index, array:set(Index2, 97, array:get(Index, MapData)), MapData);
                            false -> ok
                        end
                        end
                        end;
                        false ->
                        case (array:get(Index2, array:get(Index, MapArray)) =:= 17) of
                        true ->
                        put({local, randomInt}, (get({get({This, randomFactory}), '$class'})):getAbsoluteNextIntAllowZero(get({This, randomFactory}), 3)),
                        case (get({local, randomInt}) =:= 0) of
                            true ->
                            array:set(Index, array:set(Index2, 17, array:get(Index, MapData)), MapData);
                            false ->
                            case (get({local, randomInt}) =:= 1) of
                            true ->
                            array:set(Index, array:set(Index2, 81, array:get(Index, MapData)), MapData);
                            false ->
                            case (get({local, randomInt}) =:= 2) of
                            true ->
                            array:set(Index, array:set(Index2, 97, array:get(Index, MapData)), MapData);
                            false -> ok
                        end
                        end
                        end;
                        false -> ok
                    end
                    end;
                    false -> ok
                end,
                case ((Index2 rem 7) =:= 0) of
                    true ->
                    case (array:get(Index2, array:get(Index, MapArray)) =:= 34) of
                        true ->
                        put({local, randomInt}, (get({get({This, randomFactory}), '$class'})):getAbsoluteNextIntAllowZero(get({This, randomFactory}), 4)),
                        case (get({local, randomInt}) =:= 0) of
                            true ->
                            array:set(Index, array:set(Index2, 33, array:get(Index, MapData)), MapData);
                            false ->
                            case (get({local, randomInt}) =:= 1) of
                            true ->
                            array:set(Index, array:set(Index2, 65, array:get(Index, MapData)), MapData);
                            false ->
                            case (get({local, randomInt}) =:= 2) of
                            true ->
                            array:set(Index, array:set(Index2, 81, array:get(Index, MapData)), MapData);
                            false ->
                            case (get({local, randomInt}) =:= 3) of
                            true ->
                            array:set(Index, array:set(Index2, 97, array:get(Index, MapData)), MapData);
                            false -> ok
                        end
                        end
                        end
                        end;
                        false -> ok
                    end;
                    false -> ok
                end
            end, lists:seq(0, Size2 - 1))
        end, lists:seq(0, Size - 1)).

visit2(This, MapArray, MapData, Index, Index2) when (is_tuple(MapArray) orelse MapArray =:= undefined), (is_tuple(MapData) orelse MapData =:= undefined), is_integer(Index), is_integer(Index2) ->
        try
        CommonStrings = 'CommonStrings':getInstance(),
        put({local, countX}, 0),
        put({local, countY}, 0),
        put({local, index3}, (Index - 1)),
        lists:foreach(fun(Index4) ->
            put({local, index3}, get({local, index3}) - 1),
            case ((get({local, index3}) < 0) orelse (Index4 < 0)) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            case ((array:get(Index4, array:get(get({local, index3}), MapArray)) =/= 14) orelse (array:get(Index4, array:get(get({local, index3}), MapData)) =/= 0)) of
                true ->
                case ((get({local, countX}) > 10) andalso (get({local, countY}) > 10)) of
                    true ->
                    lists:foreach(fun(Index5) ->
                        lists:foreach(fun(Index6) ->
                            case ((array:get(Index6, array:get(Index5, MapArray)) =/= 14) orelse (array:get(Index6, array:get(Index5, MapData)) =/= 0)) of
                                true ->
                                throw({'$return', ok});
                                false -> ok
                            end
                        end, lists:seq((Index4 + 1), (Index2 - 1) - 1))
                    end, lists:seq((get({local, index3}) + 1), (Index - 1) - 1)),
                    X = (Index - ((get({local, countX}) div 2))),
                    Y = (Index2 - ((get({local, countY}) div 2))),
                    case ((((X >= 0) andalso (Y >= 0)) andalso (X < array:size(MapData))) andalso (Y < array:size(array:get(0, MapData)))) of
                        true ->
                        ok;
                        false -> ok
                    end;
                    false -> ok
                end,
                throw({'$return', ok});
                false -> ok
            end,
            put({local, countY}, get({local, countY}) + 1),
            put({local, countX}, get({local, countX}) + 1)
        end, lists:seq((Index2 - 1), 0 + 1, -1))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

