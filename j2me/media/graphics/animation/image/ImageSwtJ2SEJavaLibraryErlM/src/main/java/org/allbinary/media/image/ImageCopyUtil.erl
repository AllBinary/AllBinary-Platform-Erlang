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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.graphics.opengles.OpenGLUtil
% import org.allbinary.image.opengles.OpenGLESDeviceImageTranslate
% import org.allbinary.image.opengles.OpenGLESImage
% import org.allbinary.image.opengles.OpenGLESImageExclusionUtil
% import org.allbinary.image.opengles.OpenGLESImageProperties
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.eclipse.swt.graphics.ImageData
% import org.microemu.app.ui.swt.SwtDeviceComponent
% import org.microemu.device.swt.PostLoadSwtImmutableImageProcessor
% import org.microemu.device.swt.PostLoadSwtMutableImageProcessor
% import org.microemu.device.swt.SwtImmutableImage
% import org.microemu.device.swt.SwtMutableImage

-module('ImageCopyUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageCopyUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, gameFeatureFactory}, 'GameFeatureFactory':getInstance()),
    put({This, features}, 'Features':getInstance()),
    put({This, openGLFeatureFactory}, 'OpenGLFeatureFactory':getInstance()),
    put({This, openGLUtil}, 'OpenGLUtil':getInstance()),
    put({This, openGLESImageExclusionUtil}, 'OpenGLESImageExclusionUtil':getInstance()),
    put({This, 'NO_COPY'}, "SWT should not copy images after initial loading as the alpha is not honored"),
    put({This, 'UNABLE'}, "Unable to scale image without dimensions"),
    put({This, 'INFORMATION'}, "about_"),
    put({This, 'LEADERBOARD'}, "leaderboard"),
    ok.


getInstance() ->
        get({'ImageCopyUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
createImageForRotation(This, OriginalImage) ->
        try
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, openGLFeatureFactory}), 'OPENGL'})) of
            true ->
            put({local, image}, OriginalImage),
            put({local, image}, (get({get({This, openGLUtil}), '$class'})):addImage(get({This, openGLUtil}), get({local, image}))),
            throw({'$return', get({local, image})});
            false ->
            throw({'$return', (get({This, '$class'})):createImage(This, OriginalImage)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createImage(This, OriginalImage) ->
        try
        case (not (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, gameFeatureFactory}), 'POST_IMAGE_LOADING_MODIFICATION'}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_COPY'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            throw({'$return', OriginalImage});
            false -> ok
        end,
        put({local, originalImage2}, OriginalImage),
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, openGLFeatureFactory}), 'OPENGL'})) of
            true ->
            case ((get({OriginalImage, '$class'})):getType(OriginalImage) >= get({'OpenGLESImage', 'TYPE'})) of
                true ->
                OpenGLESImage = (OriginalImage),
                put({local, originalImage2}, (get({get({OpenGLESImage, openGLBitmap}), '$class'})):getImage(get({OpenGLESImage, openGLBitmap})));
                false -> ok
            end;
            false -> ok
        end,
        put({local, image}, undefined),
        case (get({get({local, originalImage2}), '$class'})):isMutable(get({local, originalImage2})) of
            true ->
            OriginalMutableImage = get({local, originalImage2}),
            put({local, image}, 'SwtMutableImage':new('SwtDeviceComponent':createImage((get({get({OriginalMutableImage, image}), '$class'})):getImageData(get({OriginalMutableImage, image})))));
            false ->
            OriginalImmutableImage = get({local, originalImage2}),
            put({local, image}, 'SwtMutableImage':new('SwtDeviceComponent':createImage((get({get({OriginalImmutableImage, image}), '$class'})):getImageData(get({OriginalImmutableImage, image})))))
        end,
        put({local, image}, (get({get({This, openGLUtil}), '$class'})):addImage(get({This, openGLUtil}), get({local, image}))),
        get({local, image})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createImageWH(This, OriginalImage, Width, Height, Mutable) when is_integer(Width), is_integer(Height), is_boolean(Mutable) ->
        try
        put({local, originalImage2}, OriginalImage),
        case (not (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, gameFeatureFactory}), 'POST_IMAGE_LOADING_MODIFICATION'}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_COPY'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            throw({'$return', OriginalImage});
            false -> ok
        end,
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, openGLFeatureFactory}), 'OPENGL'})) of
            true ->
            case (get({get({This, openGLESImageExclusionUtil}), '$class'})):isCustomScaling(get({This, openGLESImageExclusionUtil}), OriginalImage) of
                true ->
                throw({'$return', (get({This, '$class'})):createImage2(This, OriginalImage, Width, Height, Mutable)});
                false -> ok
            end,
            case ((get({OriginalImage, '$class'})):getType(OriginalImage) >= get({'OpenGLESImage', 'TYPE'})) of
                true ->
                OpenGLESImage = (OriginalImage),
                put({local, originalImage2}, (get({get({OpenGLESImage, openGLBitmap}), '$class'})):getImage(get({OpenGLESImage, openGLBitmap})));
                false -> ok
            end;
            false -> ok
        end,
        put({local, image}, undefined),
        case ((get({get({local, originalImage2}), '$class'})):isMutable(get({local, originalImage2})) andalso Mutable) of
            true ->
            OriginalMutableImage = get({local, originalImage2}),
            case ((get({OriginalMutableImage, '$class'})):getImage(OriginalMutableImage) =/= undefined) of
                true ->
                put({local, imageData2}, (get({get({OriginalMutableImage, image}), '$class'})):getImageData(get({OriginalMutableImage, image}))),
                put({local, imageData}, (get({get({local, imageData2}), '$class'})):scaledTo(get({local, imageData2}), Width, Height)),
                put({local, image}, 'SwtMutableImage':new('SwtDeviceComponent':createImage(get({local, imageData}))));
                false ->
                put({local, image}, 'SwtMutableImage':new((get({OriginalMutableImage, '$class'})):getName(OriginalMutableImage), 'PostLoadSwtMutableImageProcessor':new(OriginalMutableImage)))
            end;
            false ->
            OriginalImmutableImage = get({local, originalImage2}),
            case ((get({OriginalImmutableImage, '$class'})):getImage(OriginalImmutableImage) =/= undefined) of
                true ->
                put({local, imageData2}, (get({get({OriginalImmutableImage, image}), '$class'})):getImageData(get({OriginalImmutableImage, image}))),
                case ((Width > 0) andalso (Height > 0)) of
                    true ->
                    put({local, imageData}, (get({get({local, imageData2}), '$class'})):scaledTo(get({local, imageData2}), Width, Height)),
                    put({local, image}, 'SwtImmutableImage':new((get({OriginalImage, '$class'})):getName(OriginalImage), 'SwtDeviceComponent':createImage(get({local, imageData}))));
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'UNABLE'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
                    put({local, image}, 'SwtImmutableImage':new((get({OriginalImmutableImage, '$class'})):getName(OriginalImmutableImage), 'PostLoadSwtImmutableImageProcessor':new(OriginalImmutableImage)))
                end;
                false ->
                put({local, image}, 'SwtImmutableImage':new((get({OriginalImmutableImage, '$class'})):getName(OriginalImmutableImage), 'PostLoadSwtImmutableImageProcessor':new(OriginalImmutableImage)))
            end
        end,
        put({local, image}, (get({get({This, openGLUtil}), '$class'})):addImage(get({This, openGLUtil}), get({local, image}))),
        get({local, image})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createImage2(This, OriginalImage, Width, Height, Mutable) when is_integer(Width), is_integer(Height), is_boolean(Mutable) ->
        try
        OriginalImage2 = OriginalImage,
        case (not (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, gameFeatureFactory}), 'POST_IMAGE_LOADING_MODIFICATION'}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_COPY'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            throw({'$return', OriginalImage});
            false -> ok
        end,
        put({local, image}, undefined),
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, openGLFeatureFactory}), 'OPENGL'})) of
            true ->
            DisplayInfoSingleton = 'DisplayInfoSingleton':getInstance(),
            case ((get({OriginalImage, '$class'})):getType(OriginalImage) >= get({'OpenGLESImage', 'TYPE'})) of
                true ->
                put({local, openGLESImage}, (OriginalImage)),
                put({local, openGLESImageProperties}, get({get({local, openGLESImage}), openGLESImageProperties})),
                OpenGLWidth = (get({get({get({local, openGLESImage}), openGLBitmap}), '$class'})):getWidth(get({get({local, openGLESImage}), openGLBitmap})),
                OpenGLHeight = (get({get({get({local, openGLESImage}), openGLBitmap}), '$class'})):getHeight(get({get({local, openGLESImage}), openGLBitmap})),
                put({get({local, openGLESImageProperties}), scaleX2}, (((float(Width)) / float(OpenGLWidth)))),
                put({get({local, openGLESImageProperties}), scaleX}, get({get({local, openGLESImageProperties}), scaleX2})),
                put({get({local, openGLESImageProperties}), scaleY2}, (((float(Height)) / float(OpenGLHeight)))),
                put({get({local, openGLESImageProperties}), scaleY}, get({get({local, openGLESImageProperties}), scaleY2})),
                put({get({local, openGLESImageProperties}), scaleX}, (get({get({local, openGLESImageProperties}), scaleX}) * 0.75)),
                put({get({local, openGLESImageProperties}), scaleY}, (get({get({local, openGLESImageProperties}), scaleY}) * 0.75)),
                case (((get({OriginalImage, '$class'})):getHeight(OriginalImage) rem 2) =/= 0) of
                    true ->
                    put({get({local, openGLESImageProperties}), scaleX2}, (get({get({local, openGLESImageProperties}), scaleX2}) + (1.0 / float(OpenGLWidth)))),
                    put({get({local, openGLESImageProperties}), scaleY2}, (get({get({local, openGLESImageProperties}), scaleY2}) + (1.0 / float(OpenGLHeight))));
                    false -> ok
                end,
                put({local, image}, get({local, openGLESImage}));
                false ->
                put({local, image}, OriginalImage),
                put({local, openGLESImage}, (get({get({This, openGLUtil}), '$class'})):addImage(get({This, openGLUtil}), get({local, image}))),
                put({local, openGLESImageProperties}, get({get({local, openGLESImage}), openGLESImageProperties})),
                put({get({local, openGLESImageProperties}), scaleX2}, float((((float(Width)) / (get({get({local, openGLESImage}), '$class'})):getWidth(get({local, openGLESImage})))))),
                put({get({local, openGLESImageProperties}), scaleX}, get({get({local, openGLESImageProperties}), scaleX2})),
                put({get({local, openGLESImageProperties}), scaleY2}, float((((float(Height)) / (get({get({local, openGLESImage}), '$class'})):getHeight(get({local, openGLESImage})))))),
                put({get({local, openGLESImageProperties}), scaleY}, get({get({local, openGLESImageProperties}), scaleY2})),
                case (fun(Target_N71034) -> (get({Target_N71034, '$class'})):startsWith(Target_N71034, get({This, 'INFORMATION'})) end)((get({get({local, image}), '$class'})):getName(get({local, image}))) of
                    true ->
                    put({get({local, openGLESImage}), openGLESImageTranslate}, 'OpenGLESDeviceImageTranslate':new()),
                    put({local, openGLESDeviceImageTranslate}, get({get({local, openGLESImage}), openGLESImageTranslate})),
                    put({get({local, openGLESDeviceImageTranslate}), translateX}, (((get({DisplayInfoSingleton, '$class'})):getLastWidth(DisplayInfoSingleton) / 1.4) / get({get({local, openGLESImageProperties}), scaleX}))),
                    put({get({local, openGLESDeviceImageTranslate}), translateY}, (((get({DisplayInfoSingleton, '$class'})):getLastHeight(DisplayInfoSingleton) / 4) / get({get({local, openGLESImageProperties}), scaleY}))),
                    put({get({local, openGLESImageProperties}), scaleX}, (get({get({local, openGLESImageProperties}), scaleX}) * 0.25)),
                    put({get({local, openGLESImageProperties}), scaleY}, (get({get({local, openGLESImageProperties}), scaleY}) * 0.25));
                    false ->
                    put({get({local, openGLESImageProperties}), scaleX}, (get({get({local, openGLESImageProperties}), scaleX}) * 0.75)),
                    put({get({local, openGLESImageProperties}), scaleY}, (get({get({local, openGLESImageProperties}), scaleY}) * 0.75)),
                    case (fun(Target_N71184) -> (get({Target_N71184, '$class'})):startsWith(Target_N71184, get({This, 'LEADERBOARD'})) end)((get({get({local, image}), '$class'})):getName(get({local, image}))) of
                        true ->
                        put({get({local, openGLESImage}), openGLESImageTranslate}, 'OpenGLESDeviceImageTranslate':new()),
                        put({local, openGLESDeviceImageTranslate}, get({get({local, openGLESImage}), openGLESImageTranslate})),
                        put({get({local, openGLESDeviceImageTranslate}), translateX}, (((-(get({DisplayInfoSingleton, '$class'})):getLastWidth(DisplayInfoSingleton)) / 40) / get({get({local, openGLESImageProperties}), scaleX})));
                        false -> ok
                    end,
                    case (fun(Target_N71412) -> (get({Target_N71412, '$class'})):startsWith(Target_N71412, get({This, 'LEADERBOARD'})) end)((get({get({local, image}), '$class'})):getName(get({local, image}))) of
                        true ->
                        ok;
                        false ->
                        put({get({local, openGLESImageProperties}), scaleX}, 1.0),
                        put({get({local, openGLESImageProperties}), scaleY}, 1.0)
                    end
                end,
                put({local, image}, get({local, openGLESImage}))
            end;
            false ->
            case ((get({OriginalImage2, '$class'})):isMutable(OriginalImage2) andalso Mutable) of
                true ->
                OriginalMutableImage = OriginalImage2,
                case ((get({OriginalMutableImage, '$class'})):getImage(OriginalMutableImage) =/= undefined) of
                    true ->
                    put({local, imageData2}, (get({get({OriginalMutableImage, image}), '$class'})):getImageData(get({OriginalMutableImage, image}))),
                    put({local, imageData}, (get({get({local, imageData2}), '$class'})):scaledTo(get({local, imageData2}), Width, Height)),
                    put({local, image}, 'SwtMutableImage':new('SwtDeviceComponent':createImage(get({local, imageData}))));
                    false ->
                    put({local, image}, 'SwtMutableImage':new((get({OriginalMutableImage, '$class'})):getName(OriginalMutableImage), 'PostLoadSwtMutableImageProcessor':new(OriginalMutableImage)))
                end;
                false ->
                OriginalImmutableImage = OriginalImage2,
                case ((get({OriginalImmutableImage, '$class'})):getImage(OriginalImmutableImage) =/= undefined) of
                    true ->
                    put({local, imageData2}, (get({get({OriginalImmutableImage, image}), '$class'})):getImageData(get({OriginalImmutableImage, image}))),
                    put({local, imageData}, (get({get({local, imageData2}), '$class'})):scaledTo(get({local, imageData2}), Width, Height)),
                    put({local, image}, 'SwtImmutableImage':new((get({OriginalImage, '$class'})):getName(OriginalImage), 'SwtDeviceComponent':createImage(get({local, imageData}))));
                    false ->
                    put({local, image}, 'SwtImmutableImage':new((get({OriginalImmutableImage, '$class'})):getName(OriginalImmutableImage), 'PostLoadSwtImmutableImageProcessor':new(OriginalImmutableImage)))
                end
            end,
            put({local, image}, (get({get({This, openGLUtil}), '$class'})):addImage(get({This, openGLUtil}), get({local, image})))
        end,
        get({local, image})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createImageScale(This, OriginalImage, CanvasScale, Resize) when is_number(CanvasScale), is_boolean(Resize) ->
        try
        case (not (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, gameFeatureFactory}), 'POST_IMAGE_LOADING_MODIFICATION'}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_COPY'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            throw({'$return', OriginalImage});
            false -> ok
        end,
        put({local, newWidth}, trunc((((get({OriginalImage, '$class'})):getWidth(OriginalImage) * CanvasScale)))),
        put({local, newHeight}, trunc((((get({OriginalImage, '$class'})):getHeight(OriginalImage) * CanvasScale)))),
        case Resize of
            true ->
            case (get({local, newWidth}) < get({local, newHeight})) of
                true ->
                put({local, newWidth}, get({local, newHeight}));
                false -> ok
            end,
            case (get({local, newHeight}) < get({local, newWidth})) of
                true ->
                put({local, newHeight}, get({local, newWidth}));
                false -> ok
            end;
            false -> ok
        end,
        Image = (get({This, '$class'})):createImageWH(This, OriginalImage, get({local, newWidth}), get({local, newHeight}), true),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, originalImageData}, (fun(Target_N74378) -> (get({Target_N74378, '$class'})):getImageData(Target_N74378) end)(((get({OriginalImage, '$class'})):getImage(OriginalImage)))),
            MutableImage2 = Image,
            put({local, halfWidthDelta}, (((get({local, newWidth}) - (get({OriginalImage, '$class'})):getWidth(OriginalImage))) / 2)),
            put({local, halfHeightDelta}, (((get({local, newHeight}) - (get({OriginalImage, '$class'})):getHeight(OriginalImage))) / 2)),
            put({local, originalPixelArray}, array:new(((get({OriginalImage, '$class'})):getWidth(OriginalImage) * (get({OriginalImage, '$class'})):getHeight(OriginalImage)), {default, 0})),
            put({local, newPixelArray}, array:new(((get({Image, '$class'})):getWidth(Image) * (get({Image, '$class'})):getHeight(Image)), {default, 0})),
            put({local, width}, (get({OriginalImage, '$class'})):getWidth(OriginalImage)),
            put({local, height}, (get({OriginalImage, '$class'})):getHeight(OriginalImage)),
            lists:foreach(fun(I) ->
                (get({get({local, originalImageData}), '$class'})):getPixels(get({local, originalImageData}), 0, I, get({local, width}), get({local, originalPixelArray}), ((I * get({local, width}))))
            end, lists:seq(0, get({local, height}) - 1)),
            lists:foreach(fun(Index) ->
                lists:foreach(fun(Index2) ->
                    put({local, newPixelArray}, array:set((Index + ((Index2 * get({local, width})))), array:get((((Index - get({local, halfWidthDelta}))) + ((((Index2 - get({local, halfHeightDelta}))) * get({local, width})))), get({local, originalPixelArray})), get({local, newPixelArray})))
                end, lists:seq(get({local, halfHeightDelta}), get({local, height}) - 1))
            end, lists:seq(get({local, halfWidthDelta}), get({local, width}) - 1)),
            (fun(Target_N75382) -> (get({Target_N75382, '$class'})):setPixels(Target_N75382, 0, 0, (get({Image, '$class'})):getWidth(Image), get({local, newPixelArray}), 0) end)((fun(Target_N75389) -> (get({Target_N75389, '$class'})):getImageData(Target_N75389) end)(((get({MutableImage2, '$class'})):getImage(MutableImage2)))),
            throw({'$return', Image});
            false ->
            OriginalImmutableImage = Image,
            put({local, originalImageData}, (fun(Target_N73278) -> (get({Target_N73278, '$class'})):getImageData(Target_N73278) end)(((get({OriginalImage, '$class'})):getImage(OriginalImage)))),
            put({local, halfWidthDelta}, (((get({local, newWidth}) - (get({OriginalImage, '$class'})):getWidth(OriginalImage))) / 2)),
            put({local, halfHeightDelta}, (((get({local, newHeight}) - (get({OriginalImage, '$class'})):getHeight(OriginalImage))) / 2)),
            put({local, originalPixelArray}, array:new(((get({OriginalImage, '$class'})):getWidth(OriginalImage) * (get({OriginalImage, '$class'})):getHeight(OriginalImage)), {default, 0})),
            put({local, newPixelArray}, array:new(((get({Image, '$class'})):getWidth(Image) * (get({Image, '$class'})):getHeight(Image)), {default, 0})),
            put({local, width}, (get({OriginalImage, '$class'})):getWidth(OriginalImage)),
            put({local, height}, (get({OriginalImage, '$class'})):getHeight(OriginalImage)),
            lists:foreach(fun(I) ->
                (get({get({local, originalImageData}), '$class'})):getPixels(get({local, originalImageData}), 0, I, get({local, width}), get({local, originalPixelArray}), ((I * get({local, width}))))
            end, lists:seq(0, get({local, height}) - 1)),
            lists:foreach(fun(Index) ->
                lists:foreach(fun(Index2) ->
                    put({local, newPixelArray}, array:set((Index + ((Index2 * get({local, width})))), array:get((((Index - get({local, halfWidthDelta}))) + ((((Index2 - get({local, halfHeightDelta}))) * get({local, width})))), get({local, originalPixelArray})), get({local, newPixelArray})))
                end, lists:seq(get({local, halfHeightDelta}), get({local, height}) - 1))
            end, lists:seq(get({local, halfWidthDelta}), get({local, width}) - 1)),
            (fun(Target_N74228) -> (get({Target_N74228, '$class'})):setPixels(Target_N74228, 0, 0, (get({Image, '$class'})):getWidth(Image), get({local, newPixelArray}), 0) end)((fun(Target_N74235) -> (get({Target_N74235, '$class'})):getImageData(Target_N74235) end)(((get({OriginalImmutableImage, '$class'})):getImage(OriginalImmutableImage)))),
            throw({'$return', Image})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

