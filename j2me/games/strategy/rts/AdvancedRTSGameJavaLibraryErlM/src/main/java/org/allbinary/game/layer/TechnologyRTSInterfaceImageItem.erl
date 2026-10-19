% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.form.item.ABCustomImageItem
% import org.allbinary.logic.java.character.CharArrayFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.logic.math.PrimitiveLongUtil

-module('TechnologyRTSInterfaceImageItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABCustomImageItem', Function, Arguments).

init_fields(This) ->
    put({This, rtsInterface}, undefined),
    put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(10000)),
    put({This, 'LEVEL'}, "Level"),
    put({This, 'COST'}, "Cost"),
    put({This, 'DOLLAR'}, "$"),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, costString}, (fun(Target_N66201) -> (get({Target_N66201, '$class'})):getZeroCharArray(Target_N66201) end)('CharArrayFactory':getInstance())),
    put({This, costLength}, 0),
    put({This, levelString}, (fun(Target_N66286) -> (get({Target_N66286, '$class'})):getZeroCharArray(Target_N66286) end)('CharArrayFactory':getInstance())),
    put({This, levelLength}, 0),
    put({This, adjustedCostLabelY}, 0),
    put({This, adjustedCostX}, 0),
    put({This, adjustedCostY}, 0),
    put({This, adjustedLevelX}, 0),
    put({This, adjustedLevelY}, 0),
    ok.


new(Label, Img, Layout, AltText, BasicColor, RtsInterface) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, Img, Layout, AltText, BasicColor, RtsInterface),
    This.

init(This, Label, Img, Layout, AltText, BasicColor, RtsInterface) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
        'ABCustomImageItem':init(This, Label, Img, Layout, AltText, BasicColor, 0),
        init_fields(This),
        put({This, rtsInterface}, RtsInterface),
        (get({This, '$class'})):update(This).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        FontHeight = (get({Font, '$class'})):getHeight(Font),
        put({local, imageHeight}, 0),
        Image = (get({This, '$class'})):getImage(This),
        case (Image =/= get({'NullImage', 'NULL_IMAGE'})) of
            true ->
            put({local, imageHeight}, (get({Image, '$class'})):getHeight(Image));
            false -> ok
        end,
        put({This, adjustedCostLabelY}, (((-get({This, yOffset})) + get({local, imageHeight})) - ((3 * FontHeight)))),
        put({This, adjustedCostY}, (((-get({This, yOffset})) + get({local, imageHeight})) - ((2 * FontHeight)))),
        put({This, adjustedCostX}, (2 + ((string:length(get({This, 'DOLLAR'})) * ((FontHeight - 1)))))),
        put({This, adjustedLevelY}, (((-get({This, yOffset})) + get({local, imageHeight})) - FontHeight)),
        put({This, adjustedLevelX}, (2 + ((string:length(get({This, 'LEVEL'})) * ((FontHeight - 1)))))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

getRtsInterface(This) ->
        get({This, rtsInterface}).

update(This) ->
        put({This, costString}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), (fun(Target_N67556) -> (get({Target_N67556, '$class'})):getUpgradeCost(Target_N67556) end)((get({This, '$class'})):getRtsInterface(This)))),
        put({This, levelString}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), (fun(Target_N67621) -> (get({Target_N67621, '$class'})):getLevel(Target_N67621) end)((get({This, '$class'})):getRtsInterface(This)))).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        'ABCustomImageItem':paintXY(This, Graphics, X, Y),
        Xa = (X + 2),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'COST'}), Xa, (Y + get({This, adjustedCostLabelY})), 0),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'DOLLAR'}), Xa, (Y + get({This, adjustedCostY})), 0),
        (get({Graphics, '$class'})):drawChars(Graphics, get({This, costString}), 0, get({This, costLength}), (X + get({This, adjustedCostX})), (Y + get({This, adjustedCostY})), 0),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'LEVEL'}), Xa, (Y + get({This, adjustedLevelY})), 0),
        (get({Graphics, '$class'})):drawChars(Graphics, get({This, levelString}), 0, get({This, levelLength}), (X + get({This, adjustedLevelX})), (Y + get({This, adjustedLevelY})), 0).

