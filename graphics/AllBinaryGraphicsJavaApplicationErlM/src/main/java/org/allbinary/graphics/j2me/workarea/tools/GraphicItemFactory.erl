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
% package org.allbinary.graphics.j2me.workarea.tools
% import java.util.HashMap
% import org.allbinary.log.LOGGING
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Node

-module('GraphicItemFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GraphicItemFactory':new()),
    ok.

init_fields(This) ->
    put({This, graphicItems}, undefined),
    put({This, 'DEFAULT'}, 'SelectionToolFactory':new()),
    ok.


getInstance() ->
        get({'GraphicItemFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, graphicItems}, (fun(Target_N65927) -> (get({Target_N65927, '$class'})):createHashMap(Target_N65927) end)('StdUtil':getInstance())),
        (get({get({This, graphicItems}), '$class'})):put(get({This, graphicItems}), 'LinesGraphicItem':getStaticName(), 'LinesGraphicItemFactory':new()).

getInstance(This, ItemName) when (is_list(ItemName) orelse ItemName =:= undefined) ->
        put({local, graphicsItemInterfaceFactoryInterface}, (get({get({This, graphicItems}), '$class'})):get(get({This, graphicItems}), ItemName)),
        case (get({local, graphicsItemInterfaceFactoryInterface}) =:= undefined) of
            true ->
            put({local, graphicsItemInterfaceFactoryInterface}, get({This, 'DEFAULT'}));
            false -> ok
        end,
        get({local, graphicsItemInterfaceFactoryInterface});
% throws Exception
getInstance(This, GraphicItemNodeList) ->
        NumberOfItems = (get({GraphicItemNodeList, '$class'})):size(GraphicItemNodeList),
        GraphicItemHashMap = (fun(Target_N66262) -> (get({Target_N66262, '$class'})):createHashMap(Target_N66262) end)('StdUtil':getInstance()),
        case (get({get({'GraphicItemFactory', 'LOGGING'}), '$class'})):contains(get({'GraphicItemFactory', 'LOGGING'}), get({get({'GraphicItemFactory', 'LOGGING'}), 'MENUEVENT'})) of
            true ->
            ok;
            false -> ok
        end,
        lists:foreach(fun(Index) ->
            GraphicItem = 'GraphicItemBuilder':getInstance((get({GraphicItemNodeList, '$class'})):get(GraphicItemNodeList, Index)),
            (get({GraphicItemHashMap, '$class'})):put(GraphicItemHashMap, (get({GraphicItem, '$class'})):getTreeNode(GraphicItem), GraphicItem)
        end, lists:seq(0, NumberOfItems - 1)),
        GraphicItemHashMap.


