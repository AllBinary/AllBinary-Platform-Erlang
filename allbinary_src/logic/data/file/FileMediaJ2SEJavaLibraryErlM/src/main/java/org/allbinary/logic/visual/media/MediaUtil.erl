% Generated Code Do Not Modify
% package org.allbinary.logic.visual.media
% import java.awt.image.BufferedImage
% import java.awt.image.RenderedImage
% import java.util.HashMap
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.image.ImageUtil
% import org.allbinary.string.CommonLabels

-module('MediaUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MediaUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'MediaUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
saveImageFile(This, OriginalImageFile, NewImageFileName, Category, MediaData, NewWidth, NewHeight) when (is_list(NewImageFileName) orelse NewImageFileName =:= undefined), (is_list(Category) orelse Category =:= undefined), is_integer(NewWidth), is_integer(NewHeight) ->
        case ((OriginalImageFile =:= undefined) orelse (not (get({OriginalImageFile, '$class'})):isFile(OriginalImageFile))) of
            true ->
            erlang:error({'Exception', "Original Image File Does Not Exist."});
            false -> ok
        end,
        BufferedImage = 'ImageIOUtil':read(OriginalImageFile),
        case (BufferedImage =:= undefined) of
            true ->
            erlang:error({'Exception', "Unable to find ImageReader for this file."});
            false -> ok
        end,
        case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'VIEW'})) of
            true ->
            HashMap = (get({This, '$class'})):getImageBufferPropertyHashMap(This, BufferedImage),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Image Properties: ", (get({HashMap, '$class'})):toString(HashMap)]), This, "saveImageFile()");
            false -> ok
        end,
        ImageFile = 'AbFile':createAbFile(lists:concat([Category, NewImageFileName])),
        (get({ImageFile, '$class'})):createNewFile(ImageFile),
        ImageUtil = 'ImageUtil':getInstance(),
        NewBufferedImage = (get({ImageUtil, '$class'})):createBufferedImageForSave(ImageUtil, BufferedImage, NewWidth, NewHeight),
        IsWritten = 'ImageIOUtil':write(NewBufferedImage, (get({MediaData, '$class'})):getName(MediaData), ImageFile),
        case (not IsWritten) of
            true ->
            erlang:error({'Exception', "Unable to write."});
            false -> ok
        end,
        case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'VIEW'})) of
            true ->
            CommonLabels = 'CommonLabels':getInstance(),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Get Path: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({OriginalImageFile, '$class'})):getPath(OriginalImageFile)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nNewImageFileName: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, NewImageFileName),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nCategory: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, Category),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nSave File Type: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({MediaData, '$class'})):getName(MediaData)),
            (fun(Target_N67210) -> (get({Target_N67210, '$class'})):append(Target_N67210, get({CommonLabels, 'WIDTH_LABEL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, "\nNew")),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, NewWidth),
            (fun(Target_N67299) -> (get({Target_N67299, '$class'})):append(Target_N67299, get({CommonLabels, 'HEIGHT_LABEL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, "\nNew")),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, NewHeight),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nFile Length: "),
            (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({OriginalImageFile, '$class'})):length(OriginalImageFile)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "\nNew File Length: "),
            (get({StringBuffer, '$class'})):appendlong(StringBuffer, (get({ImageFile, '$class'})):length(ImageFile)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "saveImageFile()");
            false -> ok
        end.

getImageBufferPropertyHashMap(BufferedImage) ->
        HashMap = (fun(Target_N67720) -> (get({Target_N67720, '$class'})):createHashMap(Target_N67720) end)('StdUtil':getInstance()),
        PropertyStringArray = (get({BufferedImage, '$class'})):getPropertyNames(BufferedImage),
        case (PropertyStringArray =/= undefined) of
            true ->
            lists:foreach(fun(Index) ->
                PropertyObject = (get({BufferedImage, '$class'})):getProperty(BufferedImage, array:get(Index, PropertyStringArray)),
                (get({HashMap, '$class'})):put(HashMap, array:get(Index, PropertyStringArray), (get({PropertyObject, '$class'})):toString(PropertyObject))
            end, lists:seq(0, array:size(PropertyStringArray) - 1));
            false -> ok
        end,
        HashMap.

