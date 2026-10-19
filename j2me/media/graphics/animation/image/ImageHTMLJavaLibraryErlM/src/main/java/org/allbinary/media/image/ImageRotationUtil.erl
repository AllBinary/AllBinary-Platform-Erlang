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
% import javax.microedition.lcdui.Image
% import org.microemu.device.playn.PlaynImmutableImage
% import org.microemu.device.playn.PlaynMutableImage
% import playn.core.CanvasImage
% import playn.core.CanvasSurface

-module('ImageRotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageRotationUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageRotationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
createRotatedImage(This, OriginalImage, RotationInDegrees) when is_integer(RotationInDegrees) ->
        try
        Image = (fun(Target_N65860) -> (get({Target_N65860, '$class'})):getInstance(Target_N65860, (get({OriginalImage, '$class'})):getWidth(OriginalImage), (get({OriginalImage, '$class'})):getHeight(OriginalImage)) end)('ImageCreationUtil':getInstance()),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, originalPlayNImage}, undefined),
            case (get({OriginalImage, '$class'})):isMutable(OriginalImage) of
                true ->
                put({local, originalHTMLImage}, OriginalImage),
                put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})));
                false ->
                put({local, originalHTMLImage}, OriginalImage),
                put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})))
            end,
            HtmlImage = Image,
            CanvasImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
            CanvasSurface = (get({HtmlImage, '$class'})):getCanvasSurface(HtmlImage, CanvasImage),
            (get({CanvasSurface, '$class'})):translate(CanvasSurface, ((get({get({local, originalPlayNImage}), '$class'})):width(get({local, originalPlayNImage})) / 2), ((get({get({local, originalPlayNImage}), '$class'})):height(get({local, originalPlayNImage})) / 2)),
            (get({CanvasSurface, '$class'})):rotate(CanvasSurface, float(((RotationInDegrees) * math:pi() / 180))),
            (get({CanvasSurface, '$class'})):drawImage(CanvasSurface, get({local, originalPlayNImage}), ((-(get({get({local, originalPlayNImage}), '$class'})):width(get({local, originalPlayNImage}))) / 2), ((-(get({get({local, originalPlayNImage}), '$class'})):height(get({local, originalPlayNImage}))) / 2)),
            throw({'$return', Image});
            false ->
            erlang:error({'Exception', "Not Mutable"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

