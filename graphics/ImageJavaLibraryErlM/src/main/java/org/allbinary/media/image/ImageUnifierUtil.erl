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
% package org.allbinary.media.image
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonLabels

-module('ImageUnifierUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageUnifierUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    ok.


getInstance() ->
        get({'ImageUnifierUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getDefaultConfiguration(This) ->
        Ge = 'GraphicsEnvironment':getLocalGraphicsEnvironment(),
        Gd = (get({Ge, '$class'})):getDefaultScreenDevice(Ge),
        (get({Gd, '$class'})):getDefaultConfiguration(Gd).

getImage(This, BufferedImageArray, ImageUnifierProperties) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined) ->
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):create(get({This, imageUtil}), (get({ImageUnifierProperties, '$class'})):getWidth(ImageUnifierProperties), (get({ImageUnifierProperties, '$class'})):getHeight(ImageUnifierProperties)),
        CommonLabels = 'CommonLabels':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat(["Setting Image - ", get({CommonLabels, 'WIDTH_LABEL'})]), (get({NewBufferedImage, '$class'})):getWidth(NewBufferedImage)]), get({CommonLabels, 'HEIGHT_LABEL'})]), (get({NewBufferedImage, '$class'})):getHeight(NewBufferedImage)]), This, "getImage"),
        G = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        put({local, columnIndex}, 0),
        put({local, rowIndex}, 0),
        lists:foreach(fun(Index) ->
            X = ((fun(Target_N66425) -> (get({Target_N66425, '$class'})):intValue(Target_N66425) end)((fun(Target_N66432) -> (get({Target_N66432, '$class'})):getWidth(Target_N66432) end)((get({ImageUnifierProperties, '$class'})):getImageUnifierCell(ImageUnifierProperties))) * allbinary_java:first(get({local, columnIndex}), put({local, columnIndex}, get({local, columnIndex}) + 1))),
            Y = ((fun(Target_N66498) -> (get({Target_N66498, '$class'})):intValue(Target_N66498) end)((fun(Target_N66505) -> (get({Target_N66505, '$class'})):getHeight(Target_N66505) end)((get({ImageUnifierProperties, '$class'})):getImageUnifierCell(ImageUnifierProperties))) * get({local, rowIndex})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["Adding Image: ", Index]), " x: "]), X]), " y: "]), Y]), This, "getImage"),
            (get({G, '$class'})):drawImage(G, array:get(Index, BufferedImageArray), X, Y, (fun(Target_N66705) -> (get({Target_N66705, '$class'})):intValue(Target_N66705) end)((fun(Target_N66712) -> (get({Target_N66712, '$class'})):getWidth(Target_N66712) end)((get({ImageUnifierProperties, '$class'})):getImageUnifierCell(ImageUnifierProperties))), (fun(Target_N66737) -> (get({Target_N66737, '$class'})):intValue(Target_N66737) end)((fun(Target_N66744) -> (get({Target_N66744, '$class'})):getHeight(Target_N66744) end)((get({ImageUnifierProperties, '$class'})):getImageUnifierCell(ImageUnifierProperties))), undefined),
            TotalColumnsMinusOne = (((fun(Target_N66793) -> (get({Target_N66793, '$class'})):intValue(Target_N66793) end)((get({ImageUnifierProperties, '$class'})):getColumns(ImageUnifierProperties)) - 1)),
            case (get({local, columnIndex}) > TotalColumnsMinusOne) of
                true ->
                put({local, rowIndex}, get({local, rowIndex}) + 1),
                put({local, columnIndex}, 0);
                false -> ok
            end
        end, lists:seq(0, array:size(BufferedImageArray) - 1)),
        (get({G, '$class'})):dispose(G),
        NewBufferedImage.

