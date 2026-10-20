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
% package views.admin.inventory
% import java.util.HashMap
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
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
    apply('InventoryItemView', Function, Arguments).

init_fields(This) ->
    put({This, id}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'InventoryItemView':'$init'(This, TransformInfoInterface, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        init_fields(This),
        (get({This, '$class'})):getFormData(This).

% throws Exception
getFormData(This) ->
        HashMap = (fun(Target_N66127) -> (get({Target_N66127, '$class'})):toHashMap(Target_N66127) end)('RequestParams':new(get({This, request}))),
        case (HashMap =:= undefined) of
            true ->
            erlang:error({'Exception', "No Request Params Found"});
            false -> ok
        end,
        put({This, id}, (get({HashMap, '$class'})):get(HashMap, get({get({This, basicItemData}), 'ID'}))).

isValid(This) ->
        try
        try
            case ((get({This, id}) =:= undefined) orelse (not (fun(Target_N66358) -> (get({Target_N66358, '$class'})):isNumber(Target_N66358, get({This, id})) end)('StringValidationUtil':getInstance()))) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            put({This, itemInterface}, (fun(Target_N66444) -> (get({Target_N66444, '$class'})):getItem(Target_N66444, get({This, id})) end)((fun(Target_N66451) -> (get({Target_N66451, '$class'})):getInventoryEntityInstance(Target_N66451) end)('InventoryEntityFactory':getInstance()))),
            case (get({This, itemInterface}) =:= undefined) of
                true ->
                false;
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
            case ((get({This, id}) =:= undefined) orelse (not (fun(Target_N66810) -> (get({Target_N66810, '$class'})):isNumber(Target_N66810, get({This, id})) end)('StringValidationUtil':getInstance()))) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Id is not valid.<br />");
                false -> ok
            end,
            case ((fun(Target_N66892) -> (get({Target_N66892, '$class'})):getItem(Target_N66892, get({This, id})) end)((fun(Target_N66899) -> (get({Target_N66899, '$class'})):getInventoryEntityInstance(Target_N66899) end)('InventoryEntityFactory':getInstance())) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Item does not exist.<br />");
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            "Unkown Validation Error.<br />"
        end.

