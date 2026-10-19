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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.AndroidUtil
% import org.allbinary.J2MEUtil
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.vector.RectangleFilledAnimation
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.layer.SWTUtil
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.BasicColorSetUtil
% import org.allbinary.graphics.draw.DrawVerticalStringUtil
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.threed.SWTJOGLProcessor

-module('BasicPopupMenuPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, "MENU"),
    ok.

init_fields(This) ->
    put({This, basicSetColorUtil}, 'BasicColorSetUtil':getInstance()),
    put({This, drawStringUtil}, 'DrawVerticalStringUtil':getInstance()),
    put({This, label}, undefined),
    put({This, foregroundBasicColor}, undefined),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, rectangle}, undefined),
    put({This, 'BORDER'}, 0),
    put({This, heightOffset}, 0),
    put({This, offset}, 0),
    put({This, animationInterface}, undefined),
    ok.


new(Rectangle, BackgroundBasicColor, ForegroundBasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Rectangle, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Rectangle, BackgroundBasicColor, ForegroundBasicColor) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, foregroundBasicColor}, ForegroundBasicColor),
        put({This, label}, get({'BasicPopupMenuPaintable', 'NAME'})),
        put({This, rectangle}, Rectangle),
        case ('J2MEUtil':isJ2ME() orelse 'J2MEUtil':isHTML()) of
            true ->
            put({This, animationInterface}, (fun(Target_N66896) -> (get({Target_N66896, '$class'})):getInstance(Target_N66896, 0) end)('NullAnimationFactory':getFactoryInstance()));
            false ->
            put({This, animationInterface}, 'RectangleFilledAnimation':new((get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})), (get({get({This, rectangle}), '$class'})):getHeight(get({This, rectangle})), get({'BasicColorFactory':getInstance(), 'TRANSPARENT_GREY'})))
        end,
        (get({This, '$class'})):init(This, Rectangle).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        Features = 'Features':getInstance(),
        IsOpenGL = (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})),
        (get({get({This, drawStringUtil}), '$class'})):updateMeasurement(get({This, drawStringUtil}), Graphics, get({This, label})),
        put({local, 'BORDER'}, 0),
        case ('J2MEUtil':isHTML() orelse IsOpenGL) of
            true ->
            put({local, 'BORDER'}, ('MyFontProcessor':defaultCharWidth(Font) / 2));
            false ->
            case (('AndroidUtil':isAndroid() orelse 'J2MEUtil':isJ2SE()) orelse get({'SWTUtil', isSWT})) of
            true ->
            put({local, 'BORDER'}, 'MyFontProcessor':defaultCharWidth(Font));
            false ->
            put({local, 'BORDER'}, ('MyFontProcessor':defaultCharWidth(Font) * 2))
        end
        end,
        put({This, 'BORDER'}, get({local, 'BORDER'})),
        put({This, heightOffset}, ((get({get({This, rectangle}), '$class'})):getHeight(get({This, rectangle})) - (((get({Font, '$class'})):getHeight(Font) * (get({get({'BasicPopupMenuPaintable', 'NAME'}), '$class'})):length(get({'BasicPopupMenuPaintable', 'NAME'})))))),
        case (fun(Target_N67709) -> (get({Target_N67709, '$class'})):isAnyThreed(Target_N67709) end)('OpenGLFeatureUtil':getInstance()) of
            true ->
            put({This, heightOffset}, (get({This, heightOffset}) - ((get({Font, '$class'})):getHeight(Font) + 2))),
            case 'AndroidUtil':isAndroid() of
                true ->
                put({This, heightOffset}, (get({Font, '$class'})):getHeight(Font));
                false ->
                put({This, heightOffset}, (get({This, heightOffset}) - ((get({Font, '$class'})):getHeight(Font) + 2)))
            end;
            false -> ok
        end,
        put({This, offset}, (((get({This, heightOffset}) bsr 1)) + (case (fun(Target_N67953) -> (get({Target_N67953, '$class'})):isJOGL(Target_N67953) end)('SWTJOGLProcessor':getInstance()) of true -> 4; false -> 0 end))),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

% throws Exception
init(This, Rectangle) ->
        put({This, rectangle}, Rectangle),
        Width = (get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})),
        Height = (get({get({This, rectangle}), '$class'})):getHeight(get({This, rectangle})),
        case ('J2MEUtil':isJ2ME() orelse 'J2MEUtil':isHTML()) of
            true ->
            ok;
            false ->
            RectangleFilledAnimation = get({This, animationInterface}),
            (get({RectangleFilledAnimation, '$class'})):setWidth(RectangleFilledAnimation, Width),
            (get({RectangleFilledAnimation, '$class'})):setHeight(RectangleFilledAnimation, Height)
        end.

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        Point = (get({get({This, rectangle}), '$class'})):getPoint(get({This, rectangle})),
        X = (get({Point, '$class'})):getX(Point),
        Y = (get({Point, '$class'})):getY(Point),
        Width = (get({get({This, rectangle}), '$class'})):getWidth(get({This, rectangle})),
        Height = (get({get({This, rectangle}), '$class'})):getHeight(get({This, rectangle})),
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, X, Y),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, get({This, foregroundBasicColor})),
        (get({get({This, drawStringUtil}), '$class'})):paintVerticle(get({This, drawStringUtil}), Graphics, get({This, label}), (X + get({This, 'BORDER'})), (Y + get({This, offset})), 0),
        (get({Graphics, '$class'})):drawRect(Graphics, X, Y, Width, Height).

