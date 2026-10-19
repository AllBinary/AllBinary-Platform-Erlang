% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.animation.text
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.TextField
% import org.allbinary.graphics.form.item.CustomTextBox
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.game.canvas.ABToGBUtil
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.ScaleProperties

-module('CustomTextBoxIndexedAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, scaleProperties}, undefined),
    put({This, maxLength}, 0),
    ok.


new(FontSize, MaxLength) when is_integer(FontSize), is_integer(MaxLength) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FontSize, MaxLength),
    This.

init(This, FontSize, MaxLength) when is_integer(FontSize), is_integer(MaxLength) ->
    init_fields(This),
        put({This, scaleProperties}, 'ScaleProperties':new()),
        put({get({This, scaleProperties}), scaleHeight}, FontSize),
        put({This, maxLength}, MaxLength).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        AbToGBUtil = 'ABToGBUtil':getInstance(),
        AbCanvas = get({AbToGBUtil, abCanvas}),
        Font = 'Font':getFont(get({'Font', 'FACE_SYSTEM'}), get({'Font', 'STYLE_PLAIN'}), get({get({This, scaleProperties}), scaleHeight})),
        CustomTextBox = 'CustomTextBox2':new((get({AbCanvas, '$class'})):getCustomCommandListener(AbCanvas), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, maxLength}), get({'TextField', 'ANY'}), Font, (fun(Target_N66550) -> (get({Target_N66550, '$class'})):getBackgroundBasicColor(Target_N66550) end)((get({AbCanvas, '$class'})):getLayerManager(AbCanvas)), (fun(Target_N66574) -> (get({Target_N66574, '$class'})):getForegroundBasicColor(Target_N66574) end)((get({AbCanvas, '$class'})):getLayerManager(AbCanvas))),
        'CustomTextBoxIndexedAnimation':new(CustomTextBox).

setInitialScale(This, ScaleProperties) ->
        FontSize = get({get({This, scaleProperties}), scaleHeight}),
        put({This, scaleProperties}, ScaleProperties),
        case (get({get({This, scaleProperties}), scaleHeight}) < 6) of
            true ->
            put({get({This, scaleProperties}), scaleHeight}, FontSize);
            false -> ok
        end.

