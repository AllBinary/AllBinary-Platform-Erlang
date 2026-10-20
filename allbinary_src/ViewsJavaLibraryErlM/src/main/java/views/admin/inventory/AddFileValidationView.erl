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
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil
% import org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileData
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonLabels
% import org.apache.commons.fileupload.FileItem
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('AddFileValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('InventoryItemView', Function, Arguments).

static_init() ->
    put({?MODULE, 'ADDPRODUCT'}, "Add Product"),
    put({?MODULE, 'NEXTSTEP'}, lists:concat([get({'CommonLabels':getInstance(), 'NEXT'}), " Step"])),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
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
            Command = (fun(Target_N66731) -> (get({Target_N66731, '$class'})):get(Target_N66731, get({get({'AddFileValidationView', 'GLOBALS2'}), 'ADMINCOMMAND'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case ((fun(Target_N66801) -> (get({Target_N66801, '$class'})):isEmpty(Target_N66801, Command) end)('StringValidationUtil':getInstance()) orelse ((((get({Command, '$class'})):compareTo(Command, get({'AddFileValidationView', 'ADDPRODUCT'})) =/= 0) andalso ((get({Command, '$class'})):compareTo(Command, get({'AddFileValidationView', 'NEXTSTEP'})) =/= 0)))) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Invalid AdminCommand: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, Command),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " must be: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({'AddFileValidationView', 'ADDPRODUCT'})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " or "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({'AddFileValidationView', 'NEXTSTEP'})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            BasicItemValidation = 'BasicItemValidation':new(get({This, itemInterface})),
            case ((get({BasicItemValidation, '$class'})):isValid(BasicItemValidation) =:= false) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({BasicItemValidation, '$class'})):validationInfo(BasicItemValidation), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N67808) -> (get({Target_N67808, '$class'})):getStoreName(Target_N67808) end)((get({This, '$class'})):getWeblisketSession(This))),
            (get({get({This, itemInterface}), '$class'})):setCategory(get({This, itemInterface}), ((get({StoreFrontInterface, '$class'})):getCategoryPath(StoreFrontInterface) + (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface})))),
            FullCategory = (fun(Target_N67926) -> (get({Target_N67926, '$class'})):toString(Target_N67926) end)((fun(Target_N67933) -> (get({Target_N67933, '$class'})):append(Target_N67933, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) end)((fun(Target_N67940) -> (get({Target_N67940, '$class'})):append(Target_N67940, (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)) end)((fun(Target_N67947) -> (get({Target_N67947, '$class'})):append(Target_N67947, (get({get({'AddFileValidationView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'AddFileValidationView', 'URLGLOBALS'}))) end)('StringMaker':new())))),
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
            case ((fun(Target_N68402) -> (get({Target_N68402, '$class'})):getItem(Target_N68402, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) end)((fun(Target_N68409) -> (get({Target_N68409, '$class'})):getInventoryEntityInstance(Target_N68409) end)('InventoryEntityFactory':getInstance())) =/= undefined) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Item Already Exists", This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false});
                false -> ok
            end,
            ImageFileItemObject = (fun(Target_N68725) -> (get({Target_N68725, '$class'})):get(Target_N68725, get({get({This, basicItemData}), 'IMAGE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N68782) -> (get({Target_N68782, '$class'})):isValid(Target_N68782, ImageFileItemObject) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                FileItem = ImageFileItemObject,
                FileName = (get({FileItem, '$class'})):getName(FileItem),
                Size = (get({FileItem, '$class'})):getSize(FileItem),
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
            Command = (fun(Target_N69560) -> (get({Target_N69560, '$class'})):get(Target_N69560, get({get({'AddFileValidationView', 'GLOBALS2'}), 'ADMINCOMMAND'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case ((fun(Target_N69630) -> (get({Target_N69630, '$class'})):isEmpty(Target_N69630, Command) end)('StringValidationUtil':getInstance()) orelse ((((get({Command, '$class'})):compareTo(Command, get({'AddFileValidationView', 'ADDPRODUCT'})) =/= 0) andalso ((get({Command, '$class'})):compareTo(Command, get({'AddFileValidationView', 'NEXTSTEP'})) =/= 0)))) of
                true ->
                throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})});
                false -> ok
            end,
            BasicItemValidation = 'BasicItemValidation':new(get({This, itemInterface})),
            case ((get({BasicItemValidation, '$class'})):isValid(BasicItemValidation) =:= false) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({BasicItemValidation, '$class'})):validationInfo(BasicItemValidation)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>");
                false -> ok
            end,
            StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N69986) -> (get({Target_N69986, '$class'})):getStoreName(Target_N69986) end)((get({This, '$class'})):getWeblisketSession(This))),
            FullCategory = (fun(Target_N70034) -> (get({Target_N70034, '$class'})):toString(Target_N70034) end)((fun(Target_N70041) -> (get({Target_N70041, '$class'})):append(Target_N70041, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))) end)((fun(Target_N70048) -> (get({Target_N70048, '$class'})):append(Target_N70048, (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)) end)((fun(Target_N70055) -> (get({Target_N70055, '$class'})):append(Target_N70055, (get({get({'AddFileValidationView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'AddFileValidationView', 'URLGLOBALS'}))) end)('StringMaker':new())))),
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
                (get({StringBuffer, '$class'})):append(StringBuffer, " does not exist.<br />");
                false -> ok
            end,
            try
                case ((fun(Target_N70575) -> (get({Target_N70575, '$class'})):getItem(Target_N70575, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))) end)((fun(Target_N70582) -> (get({Target_N70582, '$class'})):getInventoryEntityInstance(Target_N70582) end)('InventoryEntityFactory':getInstance())) =/= undefined) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Id is already in use. Refresh the page for a valid id.<br/>");
                    false -> ok
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Existing Item With MoneyException", This, "validationInfo()");
                    false -> ok
                end
            end,
            AnyType = (fun(Target_N70924) -> (get({Target_N70924, '$class'})):get(Target_N70924, get({get({This, basicItemData}), 'IMAGE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
            case (fun(Target_N70981) -> (get({Target_N70981, '$class'})):isValid(Target_N70981, AnyType) end)('HttpFileUploadUtil':getInstance()) of
                true ->
                FileItem = AnyType,
                FileName = (get({FileItem, '$class'})):getName(FileItem),
                FileItemFieldName = (get({FileItem, '$class'})):getFieldName(FileItem),
                Size = (get({FileItem, '$class'})):getSize(FileItem),
                (get({This, '$class'})):validationInfo(This, StringBuffer, FileName, FileItemFieldName, Size);
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
        case (Size > get({FileData, 'MINIMAGEFILESIZE'})) of
            true ->
            case (Size < get({FileData, 'MAXIMAGEFILESIZE'})) of
                true ->
                case (not (fun(Target_N72558) -> (get({Target_N72558, '$class'})):isValidRequired(Target_N72558, FileName, get({FileData, 'MINLEN'}), get({FileData, 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                    true ->
                    throw({'$return', false});
                    false ->
                    PathData = 'AbPathData':getInstance(),
                    Extension = (get({PathData, '$class'})):getExtension(PathData, FileName),
                    UploadMedia = 'UploadMediaSingleton':getInstance(),
                    case ((not (get({UploadMedia, '$class'})):isWriterSupported(UploadMedia, Extension)) andalso (not (get({UploadMedia, '$class'})):isReaderSupported(UploadMedia, Extension))) of
                        true ->
                        throw({'$return', false});
                        false -> ok
                    end
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "File Size To Large: "),
                    (get({get({local, stringBuffer}), '$class'})):appendlong(get({local, stringBuffer}), Size),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ">"),
                    (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc(get({FileData, 'MAXIMAGEFILESIZE'}))),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                    false -> ok
                end,
                throw({'$return', false})
            end,
            (get({This, '$class'})):processImageFiles(This);
            false ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "File Size To Small: "),
                (get({get({local, stringBuffer}), '$class'})):appendlong(get({local, stringBuffer}), Size),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), ">"),
                (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), trunc(get({FileData, 'MINIMAGEFILESIZE'}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            throw({'$return', false})
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
                    case (not (fun(Target_N73552) -> (get({Target_N73552, '$class'})):isValidRequired(Target_N73552, FileName, get({FileData, 'MINLEN'}), get({FileData, 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, "FileName must be >"),
                        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MINLEN'}))),
                        (get({StringBuffer, '$class'})):append(StringBuffer, " and <"),
                        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXLEN'}))),
                        (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>");
                        false ->
                        PathData = 'AbPathData':getInstance(),
                        Extension = (get({PathData, '$class'})):getExtension(PathData, FileName),
                        UploadMedia = 'UploadMediaSingleton':getInstance(),
                        case ((not (get({UploadMedia, '$class'})):isWriterSupported(UploadMedia, Extension)) andalso (not (get({UploadMedia, '$class'})):isReaderSupported(UploadMedia, Extension))) of
                            true ->
                            (get({StringBuffer, '$class'})):append(StringBuffer, "Image type: "),
                            (get({StringBuffer, '$class'})):append(StringBuffer, Extension),
                            (get({StringBuffer, '$class'})):append(StringBuffer, " not supported.<br />");
                            false -> ok
                        end
                    end;
                    false ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Image File Is To Large. "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MINIMAGEFILESIZE'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " < > "),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXIMAGEFILESIZE'}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>")
                end;
                false -> ok
            end;
            false ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Image File Is To Small. "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MINIMAGEFILESIZE'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " < > "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(get({FileData, 'MAXIMAGEFILESIZE'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, "<br/>")
        end.

