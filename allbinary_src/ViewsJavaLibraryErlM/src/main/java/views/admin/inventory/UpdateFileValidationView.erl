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
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemValidation
% import org.allbinary.business.user.commerce.money.MoneyException
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.apache.commons.fileupload.FileItem
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UpdateFileValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('InventoryItemView', Function, Arguments).

static_init() ->
    put({?MODULE, 'UPDATEPRODUCT'}, get({'CommonStrings':getInstance(), 'UPDATE'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'InventoryItemView':'$init'(This, TransformInfoInterface),
        init_fields(This).

isValid(This) ->
        try
        try
            Command = (fun(Target_N66590) -> (get({Target_N66590, '$class'})):get(Target_N66590, get({get({'UpdateFileValidationView', 'GLOBALS2'}), 'ADMINCOMMAND'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case ((Command =:= undefined) orelse ((get({Command, '$class'})):compareTo(Command, get({'UpdateFileValidationView', 'UPDATEPRODUCT'})) =/= 0)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Invalid AdminCommand=", Command]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            case ((fun(Target_N66995) -> (get({Target_N66995, '$class'})):isValid(Target_N66995) end)('BasicItemValidation':new(get({This, itemInterface}))) =:= false) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "BasicItem is not valid", This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N67328) -> (get({Target_N67328, '$class'})):getStoreName(Target_N67328) end)((get({This, '$class'})):getWeblisketSession(This))),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'UpdateFileValidationView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'UpdateFileValidationView', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))),
            FullCategory = (get({StringBuffer, '$class'})):toString(StringBuffer),
            CategoryFile = 'AbFile':createAbFile(FullCategory),
            case (not (get({CategoryFile, '$class'})):isDirectory(CategoryFile)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Category Does Not Exist: ", FullCategory]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            InventoryEntity = (fun(Target_N67927) -> (get({Target_N67927, '$class'})):getInventoryEntityInstance(Target_N67927) end)('InventoryEntityFactory':getInstance()),
            case ((get({InventoryEntity, '$class'})):getItem(InventoryEntity, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) =:= undefined) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            AnyType = (fun(Target_N68055) -> (get({Target_N68055, '$class'})):get(Target_N68055, get({get({This, basicItemData}), 'IMAGE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N68112) -> (get({Target_N68112, '$class'})):isValid(Target_N68112, AnyType) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                FileItem = AnyType,
                Size = (get({FileItem, '$class'})):getSize(FileItem),
                FileName = (get({FileItem, '$class'})):getName(FileItem),
                'HttpFileUploadUtil':log(FileItem),
                case ((get({This, '$class'})):isValid(This, FileName, Size) =:= false) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Exception in validation", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
validationInfo(This) ->
        try
        StringBuffer = 'StringMaker':new(),
        Command = (fun(Target_N68882) -> (get({Target_N68882, '$class'})):get(Target_N68882, get({get({'UpdateFileValidationView', 'GLOBALS2'}), 'ADMINCOMMAND'})) end)((get({This, '$class'})):getRequestHashMap(This)),
        case ((Command =:= undefined) orelse ((get({Command, '$class'})):compareTo(Command, get({'UpdateFileValidationView', 'UPDATEPRODUCT'})) =/= 0)) of
            true ->
            throw({'$return', get({'CommonSeps':getInstance(), 'SPACE'})});
            false -> ok
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N69069) -> (get({Target_N69069, '$class'})):validationInfo(Target_N69069) end)('BasicItemValidation':new(get({This, itemInterface})))),
        StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N69134) -> (get({Target_N69134, '$class'})):getStoreName(Target_N69134) end)((get({This, '$class'})):getWeblisketSession(This))),
        FullCategory = (((get({get({'UpdateFileValidationView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'UpdateFileValidationView', 'URLGLOBALS'})) + (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)) + (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Category: ", FullCategory]), This, "validationInfo()");
            false -> ok
        end,
        try
            case ((fun(Target_N69514) -> (get({Target_N69514, '$class'})):getItem(Target_N69514, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) end)((fun(Target_N69521) -> (get({Target_N69521, '$class'})):getInventoryEntityInstance(Target_N69521) end)('InventoryEntityFactory':getInstance())) =:= undefined) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Item does not exist.<br>");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Existing Item With MoneyException", This, "validationInfo()");
                false -> ok
            end
        end,
        AnyType = (fun(Target_N69863) -> (get({Target_N69863, '$class'})):get(Target_N69863, get({get({This, basicItemData}), 'IMAGE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
        case (fun(Target_N69920) -> (get({Target_N69920, '$class'})):isValid(Target_N69920, AnyType) end)('HttpFileUploadUtil':getInstance()) of
            true ->
            FileItem = AnyType,
            Size = (get({FileItem, '$class'})):getSize(FileItem),
            FileName = (get({FileItem, '$class'})):getName(FileItem),
            FileItemFieldName = (get({FileItem, '$class'})):getFieldName(FileItem),
            (get({This, '$class'})):validationInfo(This, StringBuffer, FileName, FileItemFieldName, Size);
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isValid(This, FileName, Size) when (is_list(FileName) orelse FileName =:= undefined), is_integer(Size) ->
        try
        FileData = 'FileData':getInstance(),
        case (Size > get({FileData, 'MINIMAGEFILESIZE'})) of
            true ->
            case (Size < get({FileData, 'MAXIMAGEFILESIZE'})) of
                true ->
                case (not (fun(Target_N70802) -> (get({Target_N70802, '$class'})):isValidRequired(Target_N70802, FileName, get({FileData, 'MINLEN'}), get({FileData, 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "File Size To Large: "),
                    (get({StringBuffer, '$class'})):appendlong(StringBuffer, Size),
                    (get({StringBuffer, '$class'})):append(StringBuffer, ">"),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXIMAGEFILESIZE'}))),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false})
            end,
            (get({This, '$class'})):processImageFiles(This);
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This, StringBuffer, FileName, FileItemFieldName, Size) when (is_list(FileName) orelse FileName =:= undefined), (is_list(FileItemFieldName) orelse FileItemFieldName =:= undefined), is_integer(Size) ->
        FileData = 'FileData':getInstance(),
        case (Size > get({FileData, 'MINIMAGEFILESIZE'})) of
            true ->
            case ((get({FileItemFieldName, '$class'})):compareTo(FileItemFieldName, get({get({This, basicItemData}), 'IMAGE'})) =:= 0) of
                true ->
                case (Size < get({FileData, 'MAXIMAGEFILESIZE'})) of
                    true ->
                    case (not (fun(Target_N71355) -> (get({Target_N71355, '$class'})):isValidRequired(Target_N71355, FileName, get({FileData, 'MINLEN'}), get({FileData, 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, "FileName must be >"),
                        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MINLEN'}))),
                        (get({StringBuffer, '$class'})):append(StringBuffer, "and <"),
                        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXLEN'}))),
                        (get({StringBuffer, '$class'})):append(StringBuffer, "<br />");
                        false -> ok
                    end;
                    false ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Image File Is Not The Right Size. "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MINIMAGEFILESIZE'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "< > "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXIMAGEFILESIZE'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br />")
                end;
                false -> ok
            end;
            false -> ok
        end.

