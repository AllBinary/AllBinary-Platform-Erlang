% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.unit
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.ImageItem
% import org.allbinary.game.layer.RTSGameStrings
% import org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem
% import org.allbinary.game.layer.item.RTSLayerTextAnimation
% import org.allbinary.game.layer.resources.BasicGameResources
% import org.allbinary.game.layer.waypoint.FlagGameResources
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.image.GameFeatureImageCacheFactory
% import org.allbinary.string.CommonSeps
% import org.allbinary.animation.Animation
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.form.item.CustomItemUtil
% import org.allbinary.graphics.form.item.ItemArraySingletonFactoryInterface
% import org.allbinary.image.ImageCache
% import org.allbinary.layer.LayerInterfaceFactoryInterface

-module('UnitItemArrayFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ItemArraySingletonFactoryInterface

static_init() ->
    put({?MODULE, 'ITEMS'}, get({'CustomItemUtil':getInstance(), 'CUSTOM_ITEM_ARRAY'})),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'WHITE'})),
    put({This, resources}, undefined),
    ok.


new(Resources) when (is_tuple(Resources) orelse Resources =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Resources),
    This.

init(This, Resources) when (is_tuple(Resources) orelse Resources =:= undefined) ->
    init_fields(This),
        put({This, resources}, Resources).

% throws Exception
createFlagItem(This, FlagResources, LayerInterfaceFactoryInterface) ->
        put({local, name}, get({FlagResources, 'NAME'})),
        Index = allbinary_java:index_of(get({local, name}), get({get({This, commonSeps}), 'SPACE'})),
        case (Index >= 0) of
            true ->
            put({local, name}, string:slice(get({local, name}), Index));
            false -> ok
        end,
        (get({This, '$class'})):createNamedFlagItem(This, FlagResources, get({local, name}), LayerInterfaceFactoryInterface).

% throws Exception
createNamedFlagItem(This, FlagResources, Name, LayerInterfaceFactoryInterface) when (is_list(Name) orelse Name =:= undefined) ->
        IMAGE_CACHE = 'GameFeatureImageCacheFactory':getInstance(),
        Image = (get({IMAGE_CACHE, '$class'})):getWithKey(IMAGE_CACHE, get({FlagResources, 'RESOURCE_ICON'})),
        Item = 'LayerInterfaceFactoryImageItem':new(Name, Image, get({'ImageItem', 'LAYOUT_DEFAULT'}), get({FlagResources, 'NAME'}), get({This, basicColor}), array:from_list(['RTSLayerTextAnimation':new(get({'RTSGameStrings':getInstance(), 'DRAGGABLE'}), Image)]), LayerInterfaceFactoryInterface),
        Item.

% throws Exception
getItems(This) ->
        get({'UnitItemArrayFactory', 'ITEMS'}).

getResources(This) ->
        get({This, resources}).

indexOf(This, BasicGameResources) ->
        try
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, resources})) =:= BasicGameResources) of
                true ->
                throw({'$return', Index});
                false -> ok
            end
        end, lists:seq((array:size(get({This, resources})) - 1), 0, -1)),
        (-1)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

