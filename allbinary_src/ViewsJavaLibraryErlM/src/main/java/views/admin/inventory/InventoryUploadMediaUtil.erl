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
% import java.io.ByteArrayInputStream
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.media.MediaData
% import org.allbinary.logic.visual.media.MediaTypeData
% import org.allbinary.logic.visual.media.MediaUtil
% import org.allbinary.string.CommonStrings

-module('InventoryUploadMediaUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, mediaUtil}, 'MediaUtil':getInstance()),
    put({This, 'LARGEWIDTH'}, 1024),
    put({This, 'LARGEHEIGHT'}, 1024),
    put({This, 'MEDIUMWIDTH'}, 256),
    put({This, 'MEDIUMHEIGHT'}, 256),
    put({This, 'SMALLWIDTH'}, 128),
    put({This, 'SMALLHEIGHT'}, 128),
    put({This, 'SMALL'}, "Small"),
    put({This, 'MEDIUM'}, "Medium"),
    put({This, 'LARGE'}, "Large"),
    put({This, storeFrontInterface}, undefined),
    put({This, itemInterface}, undefined),
    ok.


new(StoreFrontInterface, ItemInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreFrontInterface, ItemInterface),
    This.

'$init'(This, StoreFrontInterface, ItemInterface) ->
    init_fields(This),
        put({This, storeFrontInterface}, StoreFrontInterface),
        put({This, itemInterface}, ItemInterface).

% throws Exception
saveFiles(This, ByteArray, FileName, MediaData) when (is_tuple(ByteArray) orelse ByteArray =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Start FileName: ", FileName]), This, "saveFiles()");
            false -> ok
        end,
        case (fun(Target_N66924) -> (get({Target_N66924, '$class'})):isEmpty(Target_N66924, FileName) end)('StringValidationUtil':getInstance()) of
            true ->
            erlang:error({'Exception', "Image File Name Was Null"});
            false -> ok
        end,
        FileUtil = 'FileUtil':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'InventoryUploadMediaUtil', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'InventoryUploadMediaUtil', 'URLGLOBALS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, storeFrontInterface}), '$class'})):getCurrentHostNamePath(get({This, storeFrontInterface}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, itemInterface}), '$class'})):getCategory(get({This, itemInterface}))),
        FullPath = (get({StringBuffer, '$class'})):toString(StringBuffer),
        ImageDirectoryFile = 'AbFile':createAbFile(FullPath),
        case (not (get({ImageDirectoryFile, '$class'})):isDirectory(ImageDirectoryFile)) of
            true ->
            erlang:error({'Exception', "Unable to save file to non existant directory"});
            false -> ok
        end,
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, FullPath),
        (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({MediaData, '$class'})):getName(MediaData)),
        OriginalImageFile = 'AbFile':createAbFile((get({StringBuffer, '$class'})):toString(StringBuffer)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Saving Original Image: ", OriginalImageFile]), This, "saveFiles()");
            false -> ok
        end,
        (get({OriginalImageFile, '$class'})):createNewFile(OriginalImageFile),
        (get({FileUtil, '$class'})):write(FileUtil, 'ByteArrayInputStream':new(ByteArray), OriginalImageFile),
        UploadMedia = 'UploadMediaSingleton':getInstance(),
        IsMediaSupported = ((get({UploadMedia, '$class'})):isWriterSupported(UploadMedia, (get({MediaData, '$class'})):getName(MediaData)) orelse (get({UploadMedia, '$class'})):isReaderSupported(UploadMedia, (get({MediaData, '$class'})):getName(MediaData))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Is Image Type: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({MediaData, '$class'})):getName(MediaData)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " supported: "),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsMediaSupported),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "saveFiles()");
            false -> ok
        end,
        DefaultMediaData = 'MediaData':getDefault(),
        (get({This, '$class'})):setFileNames(This, FileName),
        case IsMediaSupported of
            true ->
            IsMediaResizable = (get({UploadMedia, '$class'})):isWriterMedia(UploadMedia, (get({MediaData, '$class'})):getName(MediaData), get({'MediaTypeData':getInstance(), 'RESIZABLE_MEDIA'})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Is "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({MediaData, '$class'})):toString(MediaData)),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Image Resize Supported:"),
                (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({UploadMedia, '$class'})):isSupported(UploadMedia, (get({MediaData, '$class'})):getName(MediaData))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " WriterMedia: "),
                (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsMediaResizable),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "saveFiles()");
                false -> ok
            end,
            case IsMediaResizable of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Saving Small Image: ", (get({get({This, itemInterface}), '$class'})):getSmallImage(get({This, itemInterface}))]), This, "saveFiles()");
                    false -> ok
                end,
                (get({get({This, mediaUtil}), '$class'})):saveImageFile(get({This, mediaUtil}), OriginalImageFile, (get({get({This, itemInterface}), '$class'})):getSmallImage(get({This, itemInterface})), FullPath, MediaData, get({This, 'SMALLWIDTH'}), get({This, 'SMALLHEIGHT'})),
                (get({get({This, mediaUtil}), '$class'})):saveImageFile(get({This, mediaUtil}), OriginalImageFile, (get({get({This, itemInterface}), '$class'})):getMediumImage(get({This, itemInterface})), FullPath, MediaData, get({This, 'MEDIUMWIDTH'}), get({This, 'MEDIUMHEIGHT'})),
                (get({get({This, mediaUtil}), '$class'})):saveImageFile(get({This, mediaUtil}), OriginalImageFile, (get({get({This, itemInterface}), '$class'})):getLargeImage(get({This, itemInterface})), FullPath, MediaData, get({This, 'LARGEWIDTH'}), get({This, 'LARGEHEIGHT'}));
                false ->
                IsConvertable = (get({MediaData, '$class'})):isConvertableTo(MediaData, DefaultMediaData),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Converting: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({DefaultMediaData, '$class'})):getName(DefaultMediaData)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " into "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({MediaData, '$class'})):getName(MediaData)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " if Convertable is it: "),
                    (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsConvertable),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "saveFiles()");
                    false -> ok
                end,
                case IsConvertable of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Saving Small Image: ", (get({get({This, itemInterface}), '$class'})):getSmallImage(get({This, itemInterface}))]), This, "saveFiles()");
                        false -> ok
                    end,
                    (get({get({This, mediaUtil}), '$class'})):saveImageFile(get({This, mediaUtil}), OriginalImageFile, (get({get({This, itemInterface}), '$class'})):getSmallImage(get({This, itemInterface})), FullPath, DefaultMediaData, get({This, 'SMALLWIDTH'}), get({This, 'SMALLHEIGHT'})),
                    (get({get({This, mediaUtil}), '$class'})):saveImageFile(get({This, mediaUtil}), OriginalImageFile, (get({get({This, itemInterface}), '$class'})):getMediumImage(get({This, itemInterface})), FullPath, DefaultMediaData, get({This, 'MEDIUMWIDTH'}), get({This, 'MEDIUMHEIGHT'})),
                    (get({get({This, mediaUtil}), '$class'})):saveImageFile(get({This, mediaUtil}), OriginalImageFile, (get({get({This, itemInterface}), '$class'})):getLargeImage(get({This, itemInterface})), FullPath, DefaultMediaData, get({This, 'LARGEWIDTH'}), get({This, 'LARGEHEIGHT'}));
                    false ->
                    SmallImageFile = 'AbFile':createAbFile((get({get({This, itemInterface}), '$class'})):getSmallImage(get({This, itemInterface}))),
                    (get({SmallImageFile, '$class'})):createNewFile(SmallImageFile),
                    (get({FileUtil, '$class'})):write(FileUtil, 'ByteArrayInputStream':new(ByteArray), SmallImageFile),
                    MediumImageFile = 'AbFile':createAbFile((get({get({This, itemInterface}), '$class'})):getMediumImage(get({This, itemInterface}))),
                    (get({SmallImageFile, '$class'})):createNewFile(SmallImageFile),
                    (get({FileUtil, '$class'})):write(FileUtil, 'ByteArrayInputStream':new(ByteArray), MediumImageFile),
                    LargeImageFile = 'AbFile':createAbFile((get({get({This, itemInterface}), '$class'})):getSmallImage(get({This, itemInterface}))),
                    (get({LargeImageFile, '$class'})):createNewFile(LargeImageFile),
                    (get({FileUtil, '$class'})):write(FileUtil, 'ByteArrayInputStream':new(ByteArray), LargeImageFile)
                end
            end;
            false -> ok
        end,
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'END'}), This, "saveFiles()");
            false -> ok
        end,
        get({This, itemInterface}).

setFileNames(This, FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, itemInterface}), '$class'})):getId(get({This, itemInterface}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71625) -> (get({Target_N71625, '$class'})):getName(Target_N71625) end)('MediaData':getDefault())),
        END = (get({StringBuffer, '$class'})):toString(StringBuffer),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SMALL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, END),
        put({local, newImageFileName}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({get({This, itemInterface}), '$class'})):setSmallImage(get({This, itemInterface}), get({local, newImageFileName})),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'MEDIUM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, END),
        put({local, newImageFileName}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({get({This, itemInterface}), '$class'})):setMediumImage(get({This, itemInterface}), get({local, newImageFileName})),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LARGE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, END),
        put({local, newImageFileName}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({get({This, itemInterface}), '$class'})):setLargeImage(get({This, itemInterface}), get({local, newImageFileName})).

