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
% package org.allbinary.game.layer.hud.basic
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.game.graphics.hud.BasicHud
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.logic.math.PrimitiveLongSingleton
% import org.allbinary.logic.math.PrimitiveLongUtil

-module('VelocityWidget').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicHud', Function, Arguments).

init_fields(This) ->
    put({This, 'KILOMETERS_PER_HOUR_STR'}, array:from_list([$\s, $k, $m, $/, $h])),
    put({This, totalChars}, array:size(get({This, 'KILOMETERS_PER_HOUR_STR'}))),
    put({This, velocity}, 0),
    put({This, maxVelocity}, 0),
    put({This, string}, get({'PrimitiveLongSingleton':getInstance(), 'ZERO'})),
    put({This, totalDigits}, 1),
    put({This, powerOfTenVelocity}, 0),
    put({This, primitiveLongUtil}, undefined),
    put({This, offset}, 0),
    put({This, offset2}, 0),
    ok.


new(PowerOfTenVelocity, Location, Direction, BasicColor) when is_integer(PowerOfTenVelocity), is_integer(Location), is_integer(Direction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PowerOfTenVelocity, Location, Direction, BasicColor),
    This.

'$init'(This, PowerOfTenVelocity, Location, Direction, BasicColor) when is_integer(PowerOfTenVelocity), is_integer(Location), is_integer(Direction) ->
        'BasicHud':'$init'(This, Location, Direction, 2, BasicColor),
        init_fields(This),
        put({This, powerOfTenVelocity}, PowerOfTenVelocity),
        put({This, maxVelocity}, PowerOfTenVelocity),
        put({This, velocity}, 0),
        put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(PowerOfTenVelocity)),
        put({This, updateMaxHeight}, 14).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, updateMaxWidth}, ((get({Font, '$class'})):getSize(Font) * (((5 + (fun(Target_N66639) -> (get({Target_N66639, '$class'})):getTotalDigits(Target_N66639, get({This, powerOfTenVelocity})) end)('MathUtil':getInstance())) + 1)))),
        'BasicHud':updateMeasurement(This, Graphics),
        put({This, offset}, ('MyFontProcessor':defaultStringWidth(Font, (get({get({This, primitiveLongUtil}), '$class'})):getMaxDigits(get({This, primitiveLongUtil}))) + 'MyFontProcessor':defaultStringWidth(Font, 2))),
        put({This, offset2}, ((get({This, offset}) - 'MyFontProcessor':defaultStringWidth(Font, get({This, totalDigits}))) - 'MyFontProcessor':defaultStringWidth(Font, 2))).

get(This) ->
        get({This, velocity}).

add(This, Value) when is_integer(Value) ->
        (get({This, '$class'})):set(This, (get({This, velocity}) + Value)).

set(This, Value) when is_integer(Value) ->
        LastVelocity = get({This, velocity}),
        put({This, velocity}, Value),
        case (get({This, velocity}) > get({This, maxVelocity})) of
            true ->
            put({This, velocity}, 0);
            false -> ok
        end,
        case (LastVelocity =/= get({This, velocity})) of
            true ->
            put({This, string}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), (get({This, velocity}) * 18))),
            case (fun(Target_N67337) -> (get({Target_N67337, '$class'})):isAnyThreed(Target_N67337) end)('OpenGLFeatureUtil':getInstance()) of
                true ->
                put({This, totalDigits}, ((get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil})) + 1));
                false ->
                put({This, totalDigits}, (get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil})))
            end,
            put({This, myFontProcessor}, get({This, updateMyFontProcessor}));
            false -> ok
        end.

reduce(This, Value) when is_integer(Value) ->
        (get({This, '$class'})):set(This, (get({This, velocity}) - Value)).

paint(This, Graphics) ->
        'BasicHud':paintDXY(This, Graphics, get({This, string}), 0, get({This, totalDigits}), get({This, 'KILOMETERS_PER_HOUR_STR'}), 0, get({This, totalChars}), get({This, offset2}), get({This, offset})).

