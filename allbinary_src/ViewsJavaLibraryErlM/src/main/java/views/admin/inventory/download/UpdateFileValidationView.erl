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
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemValidation
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemValidation
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
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings
% import org.apache.commons.fileupload.FileItem
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UpdateFileValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('DownloadableInventoryItemView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'DownloadableInventoryItemView':init(This, TransformInfoInterface),
        init_fields(This).

isValid(This) ->
        try
        try
            Command = (fun(Target_N66754) -> (get({Target_N66754, '$class'})):get(Target_N66754, get({get({'UpdateFileValidationView', 'GLOBALS2'}), 'ADMINCOMMAND'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case ((fun(Target_N66824) -> (get({Target_N66824, '$class'})):isEmpty(Target_N66824, Command) end)('StringValidationUtil':getInstance()) orelse ((get({Command, '$class'})):compareTo(Command, get({get({This, commonStrings}), 'UPDATE'})) =/= 0)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Invalid AdminCommand=", Command]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            try
                InventoryEntity = (fun(Target_N67193) -> (get({Target_N67193, '$class'})):getInventoryEntityInstance(Target_N67193) end)('InventoryEntityFactory':getInstance()),
                put({This, itemInterface}, (get({InventoryEntity, '$class'})):getItem(InventoryEntity, get({This, id})))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Existing Item With MoneyException", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                    false -> ok
                end
            end,
            case (get({This, itemInterface}) =:= undefined) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Item Does Not Exist", This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            case ((fun(Target_N67834) -> (get({Target_N67834, '$class'})):isValid(Target_N67834) end)('BasicItemValidation':new(get({This, itemInterface}))) =:= false) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "BasicItem is not valid", This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N68167) -> (get({Target_N68167, '$class'})):getStoreName(Target_N68167) end)((get({This, '$class'})):getWeblisketSession(This))),
            FullCategory = (fun(Target_N68215) -> (get({Target_N68215, '$class'})):toString(Target_N68215) end)((fun(Target_N68222) -> (get({Target_N68222, '$class'})):append(Target_N68222, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) end)((fun(Target_N68229) -> (get({Target_N68229, '$class'})):append(Target_N68229, (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)) end)((fun(Target_N68236) -> (get({Target_N68236, '$class'})):append(Target_N68236, (get({get({'UpdateFileValidationView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'UpdateFileValidationView', 'URLGLOBALS'}))) end)('StringMaker':new())))),
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
            DownloadableFileObject = (fun(Target_N68699) -> (get({Target_N68699, '$class'})):get(Target_N68699, get({'DownloadItemData', 'FILE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N68756) -> (get({Target_N68756, '$class'})):isValid(Target_N68756, DownloadableFileObject) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                put({local, fileItem}, DownloadableFileObject),
                put({local, fileName}, (get({get({local, fileItem}), '$class'})):getName(get({local, fileItem}))),
                put({local, size}, (get({get({local, fileItem}), '$class'})):getSize(get({local, fileItem}))),
                'HttpFileUploadUtil':log(get({local, fileItem})),
                case ((get({This, '$class'})):isValid(This, get({local, fileName}), get({local, size})) =:= false) of
                    true ->
                    throw({'$return', false});
                    false ->
                    (get({This, '$class'})):processFile(This, get({local, fileItem})),
                    (fun(Target_N69097) -> (get({Target_N69097, '$class'})):put(Target_N69097, get({'DownloadItemData', 'SIZE'}), allbinary_java:to_string(get({local, size}))) end)((get({This, '$class'})):getRequestHashMap(This))
                end;
                false ->
                (fun(Target_N68799) -> (get({Target_N68799, '$class'})):remove(Target_N68799, get({'DownloadItemData', 'FILE'})) end)((get({This, '$class'})):getRequestHashMap(This))
            end,
            LicenseFileObject = (fun(Target_N69207) -> (get({Target_N69207, '$class'})):get(Target_N69207, get({'DownloadItemData', 'LICENSE_FILE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N69264) -> (get({Target_N69264, '$class'})):isValid(Target_N69264, LicenseFileObject) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                put({local, fileItem}, LicenseFileObject),
                put({local, fileName}, (get({get({local, fileItem}), '$class'})):getName(get({local, fileItem}))),
                put({local, size}, (get({get({local, fileItem}), '$class'})):getSize(get({local, fileItem}))),
                'HttpFileUploadUtil':log(get({local, fileItem})),
                case ((get({This, '$class'})):isValid(This, get({local, fileName}), get({local, size})) =:= false) of
                    true ->
                    ok;
                    false ->
                    (get({This, '$class'})):processFile(This, get({local, fileItem}))
                end;
                false ->
                (fun(Target_N69307) -> (get({Target_N69307, '$class'})):remove(Target_N69307, get({'DownloadItemData', 'LICENSE_FILE'})) end)((get({This, '$class'})):getRequestHashMap(This))
            end,
            ExtraFilesObject = (fun(Target_N69618) -> (get({Target_N69618, '$class'})):get(Target_N69618, get({'DownloadItemData', 'EXTRA_FILES'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N69675) -> (get({Target_N69675, '$class'})):isValid(Target_N69675, ExtraFilesObject) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                put({local, fileItem}, ExtraFilesObject),
                put({local, fileName}, (get({get({local, fileItem}), '$class'})):getName(get({local, fileItem}))),
                put({local, size}, (get({get({local, fileItem}), '$class'})):getSize(get({local, fileItem}))),
                'HttpFileUploadUtil':log(get({local, fileItem})),
                case ((get({This, '$class'})):isValid(This, get({local, fileName}), get({local, size})) =:= false) of
                    true ->
                    ok;
                    false ->
                    (get({This, '$class'})):processFile(This, get({local, fileItem})),
                    (get({This, '$class'})):unzip(This, get({local, fileItem}))
                end;
                false ->
                (fun(Target_N69718) -> (get({Target_N69718, '$class'})):remove(Target_N69718, get({'DownloadItemData', 'EXTRA_FILES'})) end)((get({This, '$class'})):getRequestHashMap(This))
            end,
            HashMap = (get({This, '$class'})):getRequestHashMap(This),
            (get({HashMap, '$class'})):put(HashMap, get({get({This, basicItemData}), 'ID'}), (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))),
            LicenseObject = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'LICENSE_FILE'})),
            case (LicenseObject =/= undefined) of
                true ->
                (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'LICENSE_FILE'}), (get({(LicenseObject), '$class'})):getName((LicenseObject)));
                false ->
                (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'LICENSE_FILE'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
            end,
            FileObject = (get({HashMap, '$class'})):get(HashMap, get({'DownloadItemData', 'FILE'})),
            case (FileObject =/= undefined) of
                true ->
                (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'FILE'}), (get({(FileObject), '$class'})):getName((FileObject)));
                false ->
                (get({HashMap, '$class'})):put(HashMap, get({'DownloadItemData', 'FILE'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))
            end,
            put({This, downloadableItem}, 'DownloadableItem':new(HashMap)),
            DownloadableItemValidation = 'DownloadableItemValidation':new(get({This, downloadableItem})),
            case ((get({DownloadableItemValidation, '$class'})):isValid(DownloadableItemValidation) =:= false) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "DownloadableItem is not valid", This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
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

validationInfo(This) ->
        try
        try
            StringBuffer = 'StringMaker':new(),
            Command = (fun(Target_N71483) -> (get({Target_N71483, '$class'})):get(Target_N71483, get({get({'UpdateFileValidationView', 'GLOBALS2'}), 'ADMINCOMMAND'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case ((fun(Target_N71553) -> (get({Target_N71553, '$class'})):isEmpty(Target_N71553, Command) end)('StringValidationUtil':getInstance()) orelse ((get({Command, '$class'})):compareTo(Command, get({get({This, commonStrings}), 'UPDATE'})) =/= 0)) of
                true ->
                throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})});
                false -> ok
            end,
            case (get({This, itemInterface}) =:= undefined) of
                true ->
                ITEM_NOT_FOUND = "Item Does Not Exist",
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), ITEM_NOT_FOUND, This, "validationInfo()");
                    false -> ok
                end,
                throw({'$return', ITEM_NOT_FOUND});
                false -> ok
            end,
            BasicItemValidation = 'BasicItemValidation':new(get({This, itemInterface})),
            case ((get({BasicItemValidation, '$class'})):isValid(BasicItemValidation) =:= false) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({BasicItemValidation, '$class'})):validationInfo(BasicItemValidation)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>");
                false -> ok
            end,
            StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N72166) -> (get({Target_N72166, '$class'})):getStoreName(Target_N72166) end)((get({This, '$class'})):getWeblisketSession(This))),
            FullCategory = (fun(Target_N72214) -> (get({Target_N72214, '$class'})):toString(Target_N72214) end)((fun(Target_N72221) -> (get({Target_N72221, '$class'})):append(Target_N72221, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) end)((fun(Target_N72228) -> (get({Target_N72228, '$class'})):append(Target_N72228, (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)) end)((fun(Target_N72235) -> (get({Target_N72235, '$class'})):append(Target_N72235, (get({get({'UpdateFileValidationView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'UpdateFileValidationView', 'URLGLOBALS'}))) end)('StringMaker':new())))),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Category: ", FullCategory]), This, "validationInfo()");
                false -> ok
            end,
            CategoryFile = 'AbFile':createAbFile(FullCategory),
            case (not (get({CategoryFile, '$class'})):isDirectory(CategoryFile)) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Category "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " does not exist."),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br />");
                false -> ok
            end,
            DownloadableFileObject = (fun(Target_N72778) -> (get({Target_N72778, '$class'})):get(Target_N72778, get({'DownloadItemData', 'FILE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N72835) -> (get({Target_N72835, '$class'})):isValid(Target_N72835, DownloadableFileObject) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                put({local, fileItem}, DownloadableFileObject),
                put({local, fileName}, (get({get({local, fileItem}), '$class'})):getName(get({local, fileItem}))),
                put({local, size}, (get({get({local, fileItem}), '$class'})):getSize(get({local, fileItem}))),
                (get({This, '$class'})):validationInfo(This, StringBuffer, get({local, fileName}), get({local, size}));
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Download File Missing"),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>")
            end,
            LicenseFileObject = (fun(Target_N73121) -> (get({Target_N73121, '$class'})):get(Target_N73121, get({'DownloadItemData', 'LICENSE_FILE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N73178) -> (get({Target_N73178, '$class'})):isValid(Target_N73178, LicenseFileObject) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                put({local, fileItem}, LicenseFileObject),
                put({local, fileName}, (get({get({local, fileItem}), '$class'})):getName(get({local, fileItem}))),
                put({local, size}, (get({get({local, fileItem}), '$class'})):getSize(get({local, fileItem}))),
                (get({This, '$class'})):validationInfo(This, StringBuffer, get({local, fileName}), get({local, size}));
                false ->
                ok
            end,
            ExtraFilesObject = (fun(Target_N73406) -> (get({Target_N73406, '$class'})):get(Target_N73406, get({'DownloadItemData', 'EXTRA_FILES'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N73463) -> (get({Target_N73463, '$class'})):isValid(Target_N73463, ExtraFilesObject) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                put({local, fileItem}, ExtraFilesObject),
                put({local, fileName}, (get({get({local, fileItem}), '$class'})):getName(get({local, fileItem}))),
                put({local, size}, (get({get({local, fileItem}), '$class'})):getSize(get({local, fileItem}))),
                (get({This, '$class'})):validationInfo(This, StringBuffer, get({local, fileName}), get({local, size}));
                false ->
                ok
            end,
            case (get({This, downloadableItem}) =/= undefined) of
                true ->
                DownloadableItemValidation = 'DownloadableItemValidation':new(get({This, downloadableItem})),
                case ((get({DownloadableItemValidation, '$class'})):isValid(DownloadableItemValidation) =:= false) of
                    true ->
                    Log = (get({DownloadableItemValidation, '$class'})):validationInfo(DownloadableItemValidation),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Log, This, get({get({This, commonStrings}), 'IS_VALID'}));
                        false -> ok
                    end,
                    (get({StringBuffer, '$class'})):append(StringBuffer, Log),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>");
                    false -> ok
                end;
                false -> ok
            end,
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Getting Validation Info"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isValid(This, FileName, Size) when (is_list(FileName) orelse FileName =:= undefined), is_integer(Size) ->
        try
        FileData = 'FileData':getInstance(),
        case (Size > get({FileData, 'MINDOWNLOADABLEFILESIZE'})) of
            true ->
            case (Size < get({FileData, 'MAXDOWNLOADABLEFILESIZE'})) of
                true ->
                case (not (fun(Target_N75440) -> (get({Target_N75440, '$class'})):isValidRequired(Target_N75440, FileName, get({FileData, 'MINLEN'}), get({FileData, 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                        true ->
                        put({local, stringBuffer}, 'StringMaker':new()),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "File name is not valid: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), FileName),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                        false -> ok
                    end,
                    throw({'$return', false});
                    false ->
                    ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "File Size To Large: "),
                    (get({get({local, stringBuffer}), '$class'})):appendlong(get({local, stringBuffer}), Size),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ">"),
                    (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc(get({FileData, 'MAXDOWNLOADABLEFILESIZE'}))),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false})
            end;
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "File Size To Small: "),
                (get({get({local, stringBuffer}), '$class'})):appendlong(get({local, stringBuffer}), Size),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ">"),
                (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc(get({FileData, 'MINDOWNLOADABLEFILESIZE'}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            throw({'$return', false})
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This, StringBuffer, FileName, Size) when (is_list(FileName) orelse FileName =:= undefined), is_integer(Size) ->
        FileData = 'FileData':getInstance(),
        case (Size > get({FileData, 'MINDOWNLOADABLEFILESIZE'})) of
            true ->
            case (Size < get({FileData, 'MAXDOWNLOADABLEFILESIZE'})) of
                true ->
                case (not (fun(Target_N76264) -> (get({Target_N76264, '$class'})):isValidRequired(Target_N76264, FileName, get({FileData, 'MINLEN'}), get({FileData, 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "File Name must be more than "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MINLEN'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " and less than "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXLEN'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " characters in length: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>");
                    false ->
                    ok
                end;
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "File Is Not The Right Size. "),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MINDOWNLOADABLEFILESIZE'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, "< >"),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXDOWNLOADABLEFILESIZE'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>")
            end;
            false -> ok
        end.

