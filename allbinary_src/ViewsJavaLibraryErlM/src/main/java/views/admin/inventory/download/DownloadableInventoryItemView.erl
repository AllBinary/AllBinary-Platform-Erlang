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
% import java.io.ByteArrayInputStream
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemView
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.request.MultipartRequestParams
% import org.allbinary.logic.communication.http.request.RequestMapInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FilePathData
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.file.zip.ZipFileUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.apache.commons.fileupload.FileItem
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('DownloadableInventoryItemView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements RequestMapInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

static_init() ->
    put({?MODULE, 'TYPE_ID'}, 11),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, itemInterface}, undefined),
    put({This, downloadableItem}, undefined),
    put({This, requestHashMap}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N66779) -> (get({Target_N66779, '$class'})):getRequest(Target_N66779) end)((get({This, '$class'})):getPageContext(This))),
        (get({This, '$class'})):getFormData(This).

new(TransformInfoInterface, Empty) when (is_list(Empty) orelse Empty =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Empty),
    This.

init(This, TransformInfoInterface, Empty) when (is_list(Empty) orelse Empty =:= undefined) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N66914) -> (get({Target_N66914, '$class'})):getRequest(Target_N66914) end)((get({This, '$class'})):getPageContext(This))).

getTypeId(This) ->
        get({'DownloadableInventoryItemView', 'TYPE_ID'}).

% throws Exception
getFormData(This) ->
        (get({This, '$class'})):setRequestHashMap(This, (fun(Target_N67113) -> (get({Target_N67113, '$class'})):toHashMap(Target_N67113) end)('MultipartRequestParams':new(get({This, request})))),
        put({This, id}, (fun(Target_N67171) -> (get({Target_N67171, '$class'})):get(Target_N67171, get({get({This, basicItemData}), 'ID'})) end)((get({This, '$class'})):getRequestHashMap(This))).

addDomNodeInterfaces(This) ->
        Vector = 'BasicArrayListD':new(),
        case (get({This, downloadableItem}) =/= undefined) of
            true ->
            (get({Vector, '$class'})):add(Vector, 'DownloadableItemView':new(get({This, downloadableItem})));
            false -> ok
        end,
        (get({This, '$class'})):addDomNodeInterface(This, 'BasicItemView':new(get({This, itemInterface}), Vector)).

% throws Exception
view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
processFile(This, FileItem) ->
        FileName = (get({FileItem, '$class'})):getName(FileItem),
        FullPath = (get({This, '$class'})):getItemFilePath(This),
        ItemResourceFile = 'AbFile':createAbFile(FullPath),
        (get({ItemResourceFile, '$class'})):mkdir(ItemResourceFile),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, FullPath),
        (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["FileName: ", FileName]), This, "processFile()"),
        File = 'AbFile':createAbFile((get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({File, '$class'})):getPath(File), This, "processFiles()"),
        (get({File, '$class'})):createNewFile(File),
        ByteArray = (get({FileItem, '$class'})):get(FileItem),
        (fun(Target_N68333) -> (get({Target_N68333, '$class'})):write(Target_N68333, 'ByteArrayInputStream':new(ByteArray), File) end)('FileUtil':getInstance()).

% throws Exception
unzip(This, FileItem) ->
        FileName = (get({FileItem, '$class'})):getName(FileItem),
        FullPath = (get({This, '$class'})):getItemFilePath(This),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, FullPath),
        (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["FileName: ", FileName]), This, "unzip()"),
        File = 'AbFile':createAbFile((get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({File, '$class'})):getPath(File), This, "unzip()"),
        (fun(Target_N68837) -> (get({Target_N68837, '$class'})):unzip(Target_N68837, FullPath, File, FileName) end)('ZipFileUtil':getInstance()).

getItemFilePath(This) ->
        StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N68987) -> (get({Target_N68987, '$class'})):getStoreName(Target_N68987) end)((get({This, '$class'})):getWeblisketSession(This))),
        FilePathData = 'FilePathData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'DownloadableInventoryItemView', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'DownloadableInventoryItemView', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))),
        (get({StringBuffer, '$class'})):appendchar(StringBuffer, get({FilePathData, 'SEPARATORCHAR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))),
        (get({StringBuffer, '$class'})):appendchar(StringBuffer, get({FilePathData, 'SEPARATORCHAR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, downloadableItem}), '$class'})):getId(get({This, downloadableItem}))),
        (get({StringBuffer, '$class'})):appendchar(StringBuffer, get({FilePathData, 'SEPARATORCHAR'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

setRequestHashMap(This, RequestHashMap) ->
        put({This, requestHashMap}, RequestHashMap).

getRequestHashMap(This) ->
        get({This, requestHashMap}).

getDownloadableItem(This) ->
        get({This, downloadableItem}).

