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
% package org.allbinary.graphics.canvas.transition.progress
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import android.app.Activity
% import org.allbinary.AndroidUtil
% import org.allbinary.image.GameFeatureImageCacheFactory
% import org.allbinary.image.PreResourceImageUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.java.exception.ExceptionUtil
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
% import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
% import org.allbinary.image.ImageCacheFactory
% import org.allbinary.media.image.ImageScaleUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.image.ImageAnimation
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.thread.ARunnable
% import org.allbinary.thread.NullRunnable

-module('AndroidBasicTitleProgressBar').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements DisplayChangeEventListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProgressCanvas', Function, Arguments).

static_init() ->
    put({?MODULE, 'RESOURCE'}, "ProgressImage"),
    put({?MODULE, background}, 0),
    ok.

init_fields(This) ->
    put({This, showTitleProgressBarRunnable}, 'NullRunnable':getInstance()),
    put({This, dismissTitleProgressBarRunnable}, 'NullRunnable':getInstance()),
    put({This, titleProgressDialogPortionSetProgressRunnable}, 'NullRunnable':getInstance()),
    put({This, titleProgressDialogSetProgressRunnable}, 'NullRunnable':getInstance()),
    put({This, midletActivity}, get({'AndroidUtil', 'NULL_ACTIVITY'})),
    put({This, portion}, 0),
    put({This, 'IMAGE'}, array:new(4, {default, undefined})),
    put({This, image}, get({'NullImage', 'NULL_IMAGE'})),
    put({This, animation}, (fun(Target_N66824) -> (get({Target_N66824, '$class'})):getInstance(Target_N66824, 0) end)('NullAnimationFactory':getFactoryInstance())),
    ok.


new(Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Title, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'ProgressCanvas':init(This, Title, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        (get({This, '$class'})):init(This),
        (fun(Target_N66958) -> (get({Target_N66958, '$class'})):addListenerInterface(Target_N66958, This) end)('DisplayChangeEventHandler':getInstance()),
        Size = array:size(get({This, 'IMAGE'})),
        lists:foreach(fun(Index) ->
            put({This, 'IMAGE'}, array:set(Index, get({'NullImage', 'NULL_IMAGE'}), get({This, 'IMAGE'})))
        end, lists:seq(0, Size - 1)).

init(This) ->
        try
            case (get({'AndroidBasicTitleProgressBar', background}) =/= 0) of
                true ->
                (fun(Target_N67277) -> (get({Target_N67277, '$class'})):addResource(Target_N67277, get({'AndroidBasicTitleProgressBar', 'RESOURCE'}), get({'AndroidBasicTitleProgressBar', background})) end)('ResourceUtil':getInstance()),
                'GameFeatureImageCacheFactory':init(),
                put({This, image}, (fun(Target_N67390) -> (get({Target_N67390, '$class'})):getWithKey(Target_N67390, get({'AndroidBasicTitleProgressBar', 'RESOURCE'})) end)('ImageCacheFactory':getInstance()));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E)
        end.

initActivity(This, Activity) ->
        try
            case (get({This, midletActivity}) =/= Activity) of
                true ->
                put({This, midletActivity}, Activity),
                put({This, showTitleProgressBarRunnable}, 'ShowTitleProgressBarRunnable':new(get({This, midletActivity}), This)),
                put({This, dismissTitleProgressBarRunnable}, 'DismissTitleProgressBarRunnable':new(get({This, midletActivity}), This)),
                put({This, titleProgressDialogSetProgressRunnable}, 'TitleProgressBarSetProgressRunnable':new(get({This, midletActivity}), This)),
                put({This, titleProgressDialogPortionSetProgressRunnable}, 'TitleProgressBarPortionSetProgressRunnable':new(get({This, midletActivity}), This)),
                (get({This, '$class'})):loadProgressImages(This);
                false -> ok
            end,
            (get({This, '$class'})):updateCurrent(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E)
        end.

updateCurrent(This) ->
        try
            case (not (get({This, '$class'})):isBackground(This)) of
                true ->
                put({This, animation}, (fun(Target_N68427) -> (get({Target_N68427, '$class'})):getInstance(Target_N68427, 0) end)('NullAnimationFactory':getFactoryInstance()));
                false ->
                case (get({'AndroidBasicTitleProgressBar', background}) =/= 0) of
                true ->
                DisplayInfo = 'DisplayInfoSingleton':getInstance(),
                put({local, currentImage}, undefined),
                case (get({DisplayInfo, '$class'})):isPortrait(DisplayInfo) of
                    true ->
                    put({local, currentImage}, (get({This, '$class'})):getImage(This, 0));
                    false ->
                    put({local, currentImage}, (get({This, '$class'})):getImage(This, 2))
                end,
                case (get({local, currentImage}) =:= undefined) of
                    true ->
                    put({This, animation}, (fun(Target_N68365) -> (get({Target_N68365, '$class'})):getInstance(Target_N68365, 0) end)('NullAnimationFactory':getFactoryInstance()));
                    false ->
                    put({This, animation}, 'ImageAnimation':new(get({local, currentImage}), 'AnimationBehavior':getInstance()))
                end;
                false -> ok
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'UPDATE'}), E)
        end.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onDisplayChangeEvent(This, DisplayChangeEvent) ->
        try
            (get({This, '$class'})):loadProgressImages(This),
            (get({This, '$class'})):updateCurrent(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({This, commonStrings}), 'EXCEPTION_LABEL'}) + (fun(Target_N68799) -> (get({Target_N68799, '$class'})):getStackTrace(Target_N68799, E) end)('ExceptionUtil':getInstance())), This, get({get({This, canvasStrings}), 'ON_DISPLAY_CHANGE_EVENT'})),
            put({This, animation}, (fun(Target_N68878) -> (get({Target_N68878, '$class'})):getInstance(Target_N68878, 0) end)('NullAnimationFactory':getFactoryInstance()))
        end.

loadProgressImages(This) ->
        try
            DisplayInfo = 'DisplayInfoSingleton':getInstance(),
            LastWidth = (get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo),
            LastHeight = (get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo),
            case (get({DisplayInfo, '$class'})):isPortraitWH(DisplayInfo, LastWidth, LastHeight) of
                true ->
                (get({This, '$class'})):setImages(This, 0, LastWidth, LastHeight);
                false ->
                (get({This, '$class'})):setImages(This, 2, LastWidth, LastHeight)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["IllegalArgumentException ", (fun(Target_N69290) -> (get({Target_N69290, '$class'})):getStackTrace(Target_N69290, E) end)('ExceptionUtil':getInstance())]), This, "loadProgressImages"),
            put({This, animation}, (fun(Target_N69354) -> (get({Target_N69354, '$class'})):getInstance(Target_N69354, 0) end)('NullAnimationFactory':getFactoryInstance()))
        end.

isInitialized(This) ->
        try
        case (get({This, midletActivity}) =/= get({'AndroidUtil', 'NULL_ACTIVITY'})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

start(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'START_METHOD_NAME'})),
            'ProgressCanvas':start(This),
            (get({get({This, midletActivity}), '$class'})):runOnUiThread(get({This, midletActivity}), get({This, showTitleProgressBarRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'START_METHOD_NAME'}), E)
        end.

'end'(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'})),
            (get({get({This, midletActivity}), '$class'})):runOnUiThread(get({This, midletActivity}), get({This, dismissTitleProgressBarRunnable})),
            'ProgressCanvas':'end'(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'}), E)
        end.

addEarlyPortion(This, Value, Text, Index) when is_integer(Value), (is_list(Text) orelse Text =:= undefined), is_integer(Index) ->
        try
            put({This, portion}, Value),
            'ProgressCanvas':addEarlyPortion(This, Value, Text, Index),
            case (get({This, midletActivity}) =/= get({'AndroidUtil', 'NULL_ACTIVITY'})) of
                true ->
                (get({get({This, midletActivity}), '$class'})):runOnUiThread(get({This, midletActivity}), get({This, titleProgressDialogPortionSetProgressRunnable}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'ADD_PORTION'}), E)
        end.

addPortion(This, Value, Text, Index) when is_integer(Value), (is_list(Text) orelse Text =:= undefined), is_integer(Index) ->
        try
            put({This, portion}, Value),
            'ProgressCanvas':addPortion(This, Value, Text, Index),
            (get({get({This, midletActivity}), '$class'})):runOnUiThread(get({This, midletActivity}), get({This, titleProgressDialogPortionSetProgressRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'ADD_PORTION'}), E)
        end.

addNormalPortion(This, Value, Text) when is_integer(Value), (is_list(Text) orelse Text =:= undefined) ->
        try
            put({This, portion}, Value),
            'ProgressCanvas':addNormalPortion(This, Value, Text),
            (get({get({This, midletActivity}), '$class'})):runOnUiThread(get({This, midletActivity}), get({This, titleProgressDialogPortionSetProgressRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'ADD_PORTION'}), E)
        end.

setValue(This, Value) when is_integer(Value) ->
        try
            'ProgressCanvas':setValue(This, Value),
            (get({get({This, midletActivity}), '$class'})):runOnUiThread(get({This, midletActivity}), get({This, titleProgressDialogSetProgressRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setValue", E)
        end.

waitUntilDisplayed(This) ->
        ok.

% throws Exception
setImages(This, Index, LastWidth, LastHeight) when is_integer(Index), is_integer(LastWidth), is_integer(LastHeight) ->
        Image = get({This, image}),
        case (Image =/= get({'NullImage', 'NULL_IMAGE'})) of
            true ->
            case (fun(Target_N71496) -> (get({Target_N71496, '$class'})):isFeature(Target_N71496, get({'MainFeatureFactory':getInstance(), 'FULL_SCREEN'})) end)('Features':getInstance()) of
                true ->
                case (array:get(Index, get({This, 'IMAGE'})) =:= get({'NullImage', 'NULL_IMAGE'})) of
                    true ->
                    put({This, 'IMAGE'}, array:set(Index, (fun(Target_N71912) -> (get({Target_N71912, '$class'})):createImage2(Target_N71912, 'ImageCacheFactory':getInstance(), Image, float(LastWidth), float((get({Image, '$class'})):getWidth(Image)), (float(LastHeight) - 20.0), float((get({Image, '$class'})):getHeight(Image)), false) end)('ImageScaleUtil':getInstance()), get({This, 'IMAGE'})));
                    false -> ok
                end;
                false ->
                NextIndex = (Index + 1),
                case (array:get(NextIndex, get({This, 'IMAGE'})) =:= get({'NullImage', 'NULL_IMAGE'})) of
                    true ->
                    put({This, 'IMAGE'}, array:set(NextIndex, (fun(Target_N71674) -> (get({Target_N71674, '$class'})):createImage2(Target_N71674, 'ImageCacheFactory':getInstance(), Image, float(LastWidth), float((get({Image, '$class'})):getWidth(Image)), (float(LastHeight) - 28.0), float((get({Image, '$class'})):getHeight(Image)), false) end)('ImageScaleUtil':getInstance()), get({This, 'IMAGE'})));
                    false -> ok
                end
            end;
            false -> ok
        end.

% throws Exception
initOpenGL(This, Graphics) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'INIT'})),
        put({This, image}, (fun(Target_N72234) -> (get({Target_N72234, '$class'})):getWithKey(Target_N72234, get({'AndroidBasicTitleProgressBar', 'RESOURCE'})) end)('GameFeatureImageCacheFactory':getInstance())),
        PreResourceImageUtil = 'PreResourceImageUtil':getInstance(),
        Size = array:size(get({This, 'IMAGE'})),
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, 'IMAGE'})) =/= get({'NullImage', 'NULL_IMAGE'})) of
                true ->
                put({This, 'IMAGE'}, array:set(Index, (get({PreResourceImageUtil, '$class'})):encapsulate(PreResourceImageUtil, array:get(Index, get({This, 'IMAGE'}))), get({This, 'IMAGE'})));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):updateCurrent(This).

% throws Exception
update(This, Graphics) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'UPDATE'})),
        (get({This, '$class'})):initOpenGL(This, Graphics),
        put({This, image}, (fun(Target_N72749) -> (get({Target_N72749, '$class'})):getWithKey(Target_N72749, get({'AndroidBasicTitleProgressBar', 'RESOURCE'})) end)('GameFeatureImageCacheFactory':getInstance())),
        PreResourceImageUtil = 'PreResourceImageUtil':getInstance(),
        Size = array:size(get({This, 'IMAGE'})),
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, 'IMAGE'})) =/= get({'NullImage', 'NULL_IMAGE'})) of
                true ->
                (get({PreResourceImageUtil, '$class'})):update(PreResourceImageUtil, Graphics, array:get(Index, get({This, 'IMAGE'})));
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
getImage(This, Index) when is_integer(Index) ->
        put({local, image}, get({'NullImage', 'NULL_IMAGE'})),
        case (fun(Target_N73175) -> (get({Target_N73175, '$class'})):isFeature(Target_N73175, get({'MainFeatureFactory':getInstance(), 'FULL_SCREEN'})) end)('Features':getInstance()) of
            true ->
            put({local, image}, array:get(Index, get({This, 'IMAGE'})));
            false ->
            put({local, image}, array:get((Index + 1), get({This, 'IMAGE'})))
        end,
        get({local, image}).

paint2(This, Graphics) ->
        try
            (get({get({This, animation}), '$class'})):paintXY(get({This, animation}), Graphics, 0, 20),
            'ProgressCanvas':paint2(This, Graphics)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, canvasStrings}), 'PAINT'}), E)
        end.

setBackgroundResource(Background) when is_integer(Background) ->
        put({'AndroidBasicTitleProgressBar', background}, Background).

setBackground(This, Background) when is_boolean(Background) ->
        'ProgressCanvas':setBackground(This, Background),
        (get({This, '$class'})):updateCurrent(This).

setPortion(This, Portion) when is_integer(Portion) ->
        put({This, portion}, Portion).

getPortion(This) ->
        get({This, portion}).

