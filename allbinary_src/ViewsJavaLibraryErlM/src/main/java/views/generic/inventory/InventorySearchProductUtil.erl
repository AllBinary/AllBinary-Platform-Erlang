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
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.inventory.item.BasicItemView
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.StoreTransformer
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.data.TransformStoreDocumentFactory
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpSearch
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings

-module('InventorySearchProductUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InventorySearchProductUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'ITEM_NOT_FOUND'}, "Item Not Found."),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'InventorySearchProductUtil', instance}).

% throws Exception
getProduct(This, AbeClientInformation, SearchRequest, Product) when (is_list(Product) orelse Product =:= undefined) ->
        try
        try
            InventoryEntityInterface = (fun(Target_N66436) -> (get({Target_N66436, '$class'})):getInventoryEntityInstance(Target_N66436) end)('InventoryEntityFactory':getInstance()),
            ItemInterface = (get({InventoryEntityInterface, '$class'})):getItem(InventoryEntityInterface, Product),
            case (ItemInterface =/= undefined) of
                true ->
                ViewDocumentInterface = 'TransformStoreDocumentFactory':getInstance(SearchRequest),
                (fun(Target_N66633) -> (get({Target_N66633, '$class'})):appendChild(Target_N66633, (fun(Target_N66658) -> (get({Target_N66658, '$class'})):toXmlNode(Target_N66658, (get({ViewDocumentInterface, '$class'})):getDoc(ViewDocumentInterface)) end)('BasicItemView':new(ItemInterface, 'BasicArrayListD':new()))) end)((get({ViewDocumentInterface, '$class'})):getBaseNode(ViewDocumentInterface)),
                Success = 'XmlDocumentHelper':toString((get({ViewDocumentInterface, '$class'})):getDoc(ViewDocumentInterface)),
                OutputStr = (fun(Target_N66796) -> (get({Target_N66796, '$class'})):translate(Target_N66796, Success) end)('StoreTransformer':new(AbeClientInformation, 'TransformInfoHttpSearch':new(SearchRequest))),
                throw({'$return', OutputStr});
                false ->
                throw({'$return', get({This, 'ITEM_NOT_FOUND'})})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "getProduct", E);
                false -> ok
            end,
            erlang:error({'Exception', "Failed to getProduct"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

