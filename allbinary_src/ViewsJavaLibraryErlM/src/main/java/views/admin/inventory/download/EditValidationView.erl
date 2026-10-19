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
% package views.admin.inventory.download
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem
% import org.allbinary.business.user.commerce.money.MoneyException
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.downloads.DownloadItemsEntityFactory
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('EditValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('DownloadableInventoryItemView', Function, Arguments).

init_fields(This) ->
    put({This, downloadItemId}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'DownloadableInventoryItemView':init(This, TransformInfoInterface, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        init_fields(This),
        (get({This, '$class'})):getFormData(This).

% throws Exception
getFormData(This) ->
        HashMap = (fun(Target_N66432) -> (get({Target_N66432, '$class'})):toHashMap(Target_N66432) end)('RequestParams':new(get({This, request}))),
        case (HashMap =:= undefined) of
            true ->
            erlang:error({'Exception', "No Request Params Found"});
            false -> ok
        end,
        put({This, id}, (get({HashMap, '$class'})):get(HashMap, get({get({This, basicItemData}), 'ID'}))),
        put({This, downloadItemId}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'ID'}))).

% throws Exception
isValid(This) ->
        try
        case ((get({This, id}) =:= undefined) orelse (not (fun(Target_N66726) -> (get({Target_N66726, '$class'})):isNumber(Target_N66726, get({This, id})) end)('StringValidationUtil':getInstance()))) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        put({This, itemInterface}, (fun(Target_N66812) -> (get({Target_N66812, '$class'})):getItem(Target_N66812, get({This, id})) end)((fun(Target_N66819) -> (get({Target_N66819, '$class'})):getInventoryEntityInstance(Target_N66819) end)('InventoryEntityFactory':getInstance()))),
        case (get({This, itemInterface}) =:= undefined) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        Downloadable = list_to_integer((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface}))),
        case (Downloadable =/= 0) of
            true ->
            DownloadItemsEntity = (fun(Target_N67034) -> (get({Target_N67034, '$class'})):getDownloadItemsEntityInstance(Target_N67034) end)('DownloadItemsEntityFactory':getInstance()),
            Vector = (get({DownloadItemsEntity, '$class'})):getForItem(DownloadItemsEntity, get({This, id}), get({This, downloadItemId})),
            case ((get({Vector, '$class'})):size(Vector) =/= 1) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            put({This, downloadableItem}, (get({Vector, '$class'})):get(Vector, 0));
            false ->
            throw({'$return', false})
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws MoneyException
validationInfo(This) ->
        StringBuffer = 'StringMaker':new(),
        case ((get({This, id}) =:= undefined) orelse (not (fun(Target_N67484) -> (get({Target_N67484, '$class'})):isNumber(Target_N67484, get({This, id})) end)('StringValidationUtil':getInstance()))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Id is not valid.<br />");
            false -> ok
        end,
        case ((fun(Target_N67566) -> (get({Target_N67566, '$class'})):getItem(Target_N67566, get({This, id})) end)((fun(Target_N67573) -> (get({Target_N67573, '$class'})):getInventoryEntityInstance(Target_N67573) end)('InventoryEntityFactory':getInstance())) =:= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Item does not exist.<br />");
            false -> ok
        end,
        Downloadable = list_to_integer((get({get({This, itemInterface}), '$class'})):getDownloads(get({This, itemInterface}))),
        case (Downloadable =/= 0) of
            true ->
            case (get({This, downloadableItem}) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "DownloadableItem does not exist for item.<br />");
                false -> ok
            end;
            false ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Item should not have DownloadableItem.<br />")
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

