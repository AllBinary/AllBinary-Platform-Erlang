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
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItem
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemView
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil
% import org.allbinary.logic.communication.http.request.HttpRequestUtil
% import org.allbinary.logic.communication.http.request.MultipartRequestParams
% import org.allbinary.logic.communication.http.request.RequestMapInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.io.path.PathUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.visual.media.MediaData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.apache.commons.fileupload.FileItem
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('InventoryItemView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements RequestMapInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

static_init() ->
    put({?MODULE, 'TYPE_ID'}, 10),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, request}, undefined),
    put({This, imageFileName}, undefined),
    put({This, mediaData}, undefined),
    put({This, itemInterface}, undefined),
    put({This, downloadableItemVector}, undefined),
    put({This, requestHashMap}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N66869) -> (get({Target_N66869, '$class'})):getRequest(Target_N66869) end)((get({This, '$class'})):getPageContext(This))),
        (get({This, '$class'})):getFormData(This).

new(TransformInfoInterface, Empty) when (is_list(Empty) orelse Empty =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface, Empty),
    This.

'$init'(This, TransformInfoInterface, Empty) when (is_list(Empty) orelse Empty =:= undefined) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N67004) -> (get({Target_N67004, '$class'})):getRequest(Target_N67004) end)((get({This, '$class'})):getPageContext(This))).

getTypeId(This) ->
        get({'InventoryItemView', 'TYPE_ID'}).

% throws Exception
getFormData(This) ->
        (get({This, '$class'})):setRequestHashMap(This, (fun(Target_N67203) -> (get({Target_N67203, '$class'})):toHashMap(Target_N67203) end)('MultipartRequestParams':new(get({This, request})))),
        ImageFileItemObject = (fun(Target_N67251) -> (get({Target_N67251, '$class'})):get(Target_N67251, get({get({This, basicItemData}), 'IMAGE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
        case (fun(Target_N67308) -> (get({Target_N67308, '$class'})):isValid(Target_N67308, ImageFileItemObject) end)('HttpFileUploadUtil':getInstance()) of
            true ->
            FileItem = ImageFileItemObject,
            case ((FileItem =/= undefined) andalso ((get({FileItem, '$class'})):getSize(FileItem) > 1)) of
                true ->
                put({This, imageFileName}, (fun(Target_N67467) -> (get({Target_N67467, '$class'})):generateFileName(Target_N67467, (get({FileItem, '$class'})):getName(FileItem)) end)('HttpRequestUtil':getInstance())),
                PathData = 'AbPathData':getInstance(),
                PathUtil = 'PathUtil':getInstance(),
                put({This, mediaData}, 'MediaData':get((get({PathData, '$class'})):getExtension(PathData, get({This, imageFileName})))),
                put({This, imageFileName}, (get({PathUtil, '$class'})):getWithoutExtension(PathUtil, get({This, imageFileName}))),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                    true ->
                    StringBuffer = 'StringMaker':new(),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Uploaded File Data: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({This, imageFileName})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " Extension: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, mediaData}), '$class'})):getName(get({This, mediaData}))),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "getFormData()");
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end,
        put({This, itemInterface}, 'BasicItem':new((get({This, '$class'})):getRequestHashMap(This))).

addDomNodeInterfaces(This) ->
        Vector = 'BasicArrayListD':new(),
        put({local, downloadableItem}, undefined),
        Size = (get({get({This, downloadableItemVector}), '$class'})):size(get({This, downloadableItemVector})),
        lists:foreach(fun(Index) ->
            put({local, downloadableItem}, (get({get({This, downloadableItemVector}), '$class'})):get(get({This, downloadableItemVector}), Index)),
            (get({Vector, '$class'})):add(Vector, 'DownloadableItemView':new(get({local, downloadableItem})))
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):addDomNodeInterface(This, 'BasicItemView':new(get({This, itemInterface}), Vector)).

getItemInterface(This) ->
        get({This, itemInterface}).

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
processImageFiles(This) ->
        Set = (fun(Target_N69009) -> (get({Target_N69009, '$class'})):keySet(Target_N69009) end)((get({This, '$class'})):getRequestHashMap(This)),
        FieldNameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(FieldNameArray),
        lists:foreach(fun(Index) ->
            FieldName = array:get(Index, FieldNameArray),
            case ((get({FieldName, '$class'})):compareTo(FieldName, get({get({This, basicItemData}), 'IMAGE'})) =:= 0) of
                true ->
                StoreFrontInterface = 'StoreFrontFactory':getInstance((fun(Target_N69296) -> (get({Target_N69296, '$class'})):getStoreName(Target_N69296) end)((get({This, '$class'})):getWeblisketSession(This))),
                InventoryUploadMediaUtil = 'InventoryUploadMediaUtil':new(StoreFrontInterface, get({This, itemInterface})),
                FileItem = (fun(Target_N69408) -> (get({Target_N69408, '$class'})):get(Target_N69408, get({get({This, basicItemData}), 'IMAGE'})) end)((get({This, '$class'})):getRequestHashMap(This)),
                put({This, itemInterface}, (get({InventoryUploadMediaUtil, '$class'})):saveFiles(InventoryUploadMediaUtil, (get({FileItem, '$class'})):get(FileItem), get({This, imageFileName}), get({This, mediaData})));
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

setRequestHashMap(This, RequestHashMap) ->
        put({This, requestHashMap}, RequestHashMap).

getRequestHashMap(This) ->
        get({This, requestHashMap}).

