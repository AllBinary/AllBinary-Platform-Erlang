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
% package views.generic.inventory
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.user.commerce.inventory.InventoryData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemView
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('InventoryView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This).

% throws Exception
toXmlNode(This, Document) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "toXmlNode");
                false -> ok
            end,
            InventoryEntityInterface = (fun(Target_N66542) -> (get({Target_N66542, '$class'})):getInventoryEntityInstance(Target_N66542) end)('InventoryEntityFactory':getInstance()),
            InventoryNode = (get({Document, '$class'})):createElement(Document, get({'InventoryData', 'INVENTORY'})),
            ItemVector = (get({InventoryEntityInterface, '$class'})):getItems(InventoryEntityInterface, 'StoreFrontFactory':getInstance((fun(Target_N66689) -> (get({Target_N66689, '$class'})):getStoreName(Target_N66689) end)((get({This, '$class'})):getTransformInfoInterface(This)))),
            (get({InventoryNode, '$class'})):appendChild(InventoryNode, 'ModDomHelper':createNameValueNodes(Document, get({'SearchData', 'TOTAL_NUMBER_ITEMS_ON_THIS_PAGE'}), (fun(Target_N66789) -> (get({Target_N66789, '$class'})):toString(Target_N66789) end)((get({ItemVector, '$class'})):size(ItemVector)))),
            Size = (get({ItemVector, '$class'})):size(ItemVector),
            lists:foreach(fun(Index) ->
                ItemInterface = (get({ItemVector, '$class'})):get(ItemVector, Index),
                case (ItemInterface =/= undefined) of
                    true ->
                    Node = (fun(Target_N67036) -> (get({Target_N67036, '$class'})):toXmlNode(Target_N67036, Document) end)('BasicItemView':new(ItemInterface, 'BasicArrayListD':new())),
                    (get({InventoryNode, '$class'})):appendChild(InventoryNode, Node);
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Inventory", This, "toXmlNode")
                end
            end, lists:seq(0, Size - 1)),
            InventoryNode
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "toXmlNode", E);
                false -> ok
            end,
            erlang:error(E)
        end.

addDomNodeInterfaces(This) ->
        (get({This, '$class'})):addDomNodeInterface(This, This).

view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to view Inventory",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            Error
        end.

