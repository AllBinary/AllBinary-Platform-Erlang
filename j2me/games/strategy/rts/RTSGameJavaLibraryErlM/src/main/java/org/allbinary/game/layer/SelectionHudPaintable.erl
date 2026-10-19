% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.InitUpdatePaintable
% import org.allbinary.input.motion.button.CommonButtons
% import org.allbinary.input.motion.button.TouchButtonLocationHelper
% import org.allbinary.logic.math.PrimitiveLongUtil

-module('SelectionHudPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitUpdatePaintable', Function, Arguments).

init_fields(This) ->
    put({This, y}, (get({'CommonButtons':getInstance(), 'STANDARD_BUTTON_SIZE'}) + 17)),
    put({This, primitiveLongUtil}, undefined),
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    put({This, x}, 0),
    put({This, textX}, 0),
    put({This, imageX}, 0),
    put({This, basicColor}, get({'BasicColorFactory':getInstance(), 'BLACK'})),
    put({This, color}, 0),
    put({This, width}, 0),
    put({This, height}, 0),
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, animationInterface}, (fun(Target_N66519) -> (get({Target_N66519, '$class'})):getInstance(Target_N66519, 0) end)('NullAnimationFactory':getFactoryInstance())),
    put({This, backgroundColor}, (fun(Target_N66584) -> (get({Target_N66584, '$class'})):intValue(Target_N66584) end)(get({'BasicColorFactory':getInstance(), 'GREY'}))),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'InitUpdatePaintable':init(This),
    init_fields(This),
        (get({This, '$class'})):update(This),
        put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(10000)).

updateMeasurement(This, Graphics) ->
        CommonButtons = 'CommonButtons':getInstance(),
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        (get({This, '$class'})):setHeight(This, (get({CommonButtons, 'STANDARD_BUTTON_SIZE'}) + (get({Font, '$class'})):getHeight(Font))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

update(This) ->
        CommonButtons = 'CommonButtons':getInstance(),
        TouchButtonLocationHelper = 'TouchButtonLocationHelper':new(),
        DisplayInfoSingleton = 'DisplayInfoSingleton':getInstance(),
        put({This, x}, (get({CommonButtons, 'STANDARD_BUTTON_SIZE'}) + (get({TouchButtonLocationHelper, '$class'})):getColumnsRemainderHalf(TouchButtonLocationHelper))),
        put({This, textX}, ((get({This, '$class'})):getX(This) + 4)),
        put({This, width}, ((get({DisplayInfoSingleton, '$class'})):getLastWidth(DisplayInfoSingleton) - ((get({This, '$class'})):getX(This) * 2))),
        put({This, imageX}, (((get({This, '$class'})):getWidth(This) + (get({TouchButtonLocationHelper, '$class'})):getColumnsRemainderHalf(TouchButtonLocationHelper)) - 10)),
        put({This, myFontProcessor}, get({This, updateMyFontProcessor})).

updateSelectionInfo(This) ->
        ok.

updateInfo(This) ->
        ok.

getPrimitiveLongUtil(This) ->
        get({This, primitiveLongUtil}).

setAnimationInterface(This, AnimationInterface) ->
        put({This, animationInterface}, AnimationInterface).

getAnimationInterface(This) ->
        get({This, animationInterface}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getName(This) ->
        get({This, name}).

setBasicColorP(This, BasicColor) ->
        put({This, basicColor}, BasicColor),
        (get({This, '$class'})):setColor(This, (get({BasicColor, '$class'})):intValue(BasicColor)).

getBasicColorP(This) ->
        get({This, basicColor}).

setColor(This, Color) when is_integer(Color) ->
        put({This, color}, Color).

getColor(This) ->
        get({This, color}).

getWidth(This) ->
        get({This, width}).

setHeight(This, Height) when is_integer(Height) ->
        put({This, height}, Height).

getHeight(This) ->
        get({This, height}).

getX(This) ->
        get({This, x}).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({Graphics, '$class'})):setColor(Graphics, get({This, backgroundColor})),
        (get({Graphics, '$class'})):drawRect(Graphics, (get({This, '$class'})):getX(This), get({This, y}), (get({This, '$class'})):getWidth(This), (get({This, '$class'})):getHeight(This)),
        (get({Graphics, '$class'})):setColor(Graphics, (get({This, '$class'})):getColor(This)),
        (get({Graphics, '$class'})):drawString(Graphics, (get({This, '$class'})):getName(This), get({This, textX}), get({This, y}), 0).

