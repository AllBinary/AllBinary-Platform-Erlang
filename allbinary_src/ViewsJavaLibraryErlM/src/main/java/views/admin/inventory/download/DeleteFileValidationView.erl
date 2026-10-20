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
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
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

-module('DeleteFileValidationView').
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
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'DownloadableInventoryItemView':'$init'(This, TransformInfoInterface, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        init_fields(This),
        (get({This, '$class'})):getFormData(This).

% throws Exception
getFormData(This) ->
        HashMap = (fun(Target_N66392) -> (get({Target_N66392, '$class'})):toHashMap(Target_N66392) end)('RequestParams':new(get({This, request}))),
        case (HashMap =:= undefined) of
            true ->
            erlang:error({'Exception', "No Request Params Found"});
            false -> ok
        end,
        put({This, id}, (get({HashMap, '$class'})):get(HashMap, get({get({This, basicItemData}), 'ID'}))),
        put({This, downloadItemId}, (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'ID'}))).

isValid(This) ->
        try
        try
            case ((get({This, id}) =:= undefined) orelse (not (fun(Target_N66694) -> (get({Target_N66694, '$class'})):isNumber(Target_N66694, get({This, id})) end)('StringValidationUtil':getInstance()))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            InventoryEntity = (fun(Target_N66773) -> (get({Target_N66773, '$class'})):getInventoryEntityInstance(Target_N66773) end)('InventoryEntityFactory':getInstance()),
            put({This, itemInterface}, (get({InventoryEntity, '$class'})):getItem(InventoryEntity, get({This, id}))),
            case (get({This, itemInterface}) =:= undefined) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            DownloadItemsEntity = (fun(Target_N66924) -> (get({Target_N66924, '$class'})):getDownloadItemsEntityInstance(Target_N66924) end)('DownloadItemsEntityFactory':getInstance()),
            Vector = (get({DownloadItemsEntity, '$class'})):getForItem(DownloadItemsEntity, get({This, id}), get({This, downloadItemId})),
            case ((get({Vector, '$class'})):size(Vector) =/= 1) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            case ((get({This, id}) =:= undefined) orelse (not (fun(Target_N67363) -> (get({Target_N67363, '$class'})):isNumber(Target_N67363, get({This, id})) end)('StringValidationUtil':getInstance()))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Id is not valid.<br />");
                false -> ok
            end,
            case ((fun(Target_N67445) -> (get({Target_N67445, '$class'})):getItem(Target_N67445, get({This, id})) end)((fun(Target_N67452) -> (get({Target_N67452, '$class'})):getInventoryEntityInstance(Target_N67452) end)('InventoryEntityFactory':getInstance())) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Item does not exist.<br />");
                false -> ok
            end,
            DownloadItemsEntity = (fun(Target_N67541) -> (get({Target_N67541, '$class'})):getDownloadItemsEntityInstance(Target_N67541) end)('DownloadItemsEntityFactory':getInstance()),
            Vector = (get({DownloadItemsEntity, '$class'})):getForItem(DownloadItemsEntity, get({This, id}), get({This, downloadItemId})),
            case ((get({Vector, '$class'})):size(Vector) =:= 0) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "DownloadItem does not exist.<br />");
                false -> ok
            end,
            case ((get({Vector, '$class'})):size(Vector) > 1) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "To Many DownloadItems exist.<br />");
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            "Unkown Validation Error.<br />"
        end.

