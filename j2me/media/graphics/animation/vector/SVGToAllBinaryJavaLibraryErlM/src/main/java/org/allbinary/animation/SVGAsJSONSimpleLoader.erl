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
% package org.allbinary.animation
% import java.util.Enumeration
% import org.allbinary.graphics.GraphicsStrings
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.json.me.JSONArray
% import org.json.me.JSONException
% import org.json.me.JSONObject

-module('SVGAsJSONSimpleLoader').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SVGAsJSONSimpleLoader':new()),
    ok.

init_fields(This) ->
    put({This, graphicsStrings}, 'GraphicsStrings':getInstance()),
    put({This, shapeTypeFactory}, 'ShapeTypeFactory':getInstance()),
    put({This, 'KEY_SVG'}, "svg"),
    put({This, 'KEY_X1'}, "x1"),
    put({This, 'KEY_Y1'}, "y1"),
    put({This, 'KEY_X2'}, "x2"),
    put({This, 'KEY_Y2'}, "y2"),
    put({This, 'KEY_CX'}, "cx"),
    put({This, 'KEY_CY'}, "cy"),
    put({This, 'KEY_R'}, "r"),
    put({This, 'KEY_X'}, get({'PositionStrings':getInstance(), 'X'})),
    put({This, 'KEY_Y'}, get({'PositionStrings':getInstance(), 'Y'})),
    put({This, 'ERROR_PARSE_SVG_JSON'}, "Unable to parse SVG JSON"),
    put({This, 'ERROR_MISSING_KEY_PREFIX'}, "Missing key: "),
    put({This, 'ERROR_INVALID_NUMBER_PREFIX'}, "Invalid number for key: "),
    put({This, 'ERROR_EXPECTED_OBJECT_PREFIX'}, "Expected object for: "),
    put({This, 'EMPTY_POINTS'}, 'PrimitiveIntUtil':getTwoDimensionalArrayInstance()),
    put({This, 'SHAPE_SEPARATOR'}, array:from_list([1000, 1000])),
    put({This, 'CIRCLE_SEGMENTS'}, 16),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'SVGAsJSONSimpleLoader', instance}).

% throws Exception
load(This, SvgAsJson) when (is_list(SvgAsJson) orelse SvgAsJson =:= undefined) ->
        try
        case (SvgAsJson =:= undefined) of
            true ->
            throw({'$return', get({This, 'EMPTY_POINTS'})});
            false -> ok
        end,
        try
            Root = 'JSONObject':new(SvgAsJson),
            SvgValue = (get({Root, '$class'})):opt(Root, get({This, 'KEY_SVG'})),
            Svg = case (SvgValue =:= undefined) of true -> Root; false -> (get({This, '$class'})):asObject(This, SvgValue, get({This, 'KEY_SVG'})) end,
            PointVector = 'BasicArrayListD':new(),
            Keys = (get({Svg, '$class'})):keys(Svg),
            (fun Loop() -> case (get({Keys, '$class'})):hasMoreElements(Keys) of true ->
                Key = (get({Keys, '$class'})):nextElement(Keys),
                Value = (get({Svg, '$class'})):opt(Svg, Key),
                case (get({get({get({This, shapeTypeFactory}), 'KEY_LINE'}), '$class'})):equals(get({get({This, shapeTypeFactory}), 'KEY_LINE'}), Key) of
                    true ->
                    (get({This, '$class'})):addShapes(This, PointVector, Value, get({get({This, shapeTypeFactory}), 'LINE'}));
                    false ->
                    case (get({get({This, shapeTypeFactory}), '$class'})):equals(get({This, shapeTypeFactory}), Key) of
                    true ->
                    (get({This, '$class'})):addShapes(This, PointVector, Value, get({get({This, shapeTypeFactory}), 'CIRCLE'}));
                    false ->
                    case ((get({get({get({This, shapeTypeFactory}), 'KEY_RECT'}), '$class'})):equals(get({get({This, shapeTypeFactory}), 'KEY_RECT'}), Key) orelse (get({get({get({This, shapeTypeFactory}), 'KEY_RECTANGLE'}), '$class'})):equals(get({get({This, shapeTypeFactory}), 'KEY_RECTANGLE'}), Key)) of
                    true ->
                    (get({This, '$class'})):addShapes(This, PointVector, Value, get({get({This, shapeTypeFactory}), 'RECTANGLE'}));
                    false -> ok
                end
                end
                end,
                Loop();
            false -> ok end end)(),
            (get({This, '$class'})):toPoints(This, PointVector)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error({'IllegalArgumentException', get({This, 'ERROR_PARSE_SVG_JSON'}), E})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addShapes(This, PointVector, Value, ShapeType) ->
        case allbinary_java:instance_of(Value, 'JSONArray') of
            true ->
            Array = Value,
            Size = (get({Array, '$class'})):length(Array),
            lists:foreach(fun(Index) ->
                (get({This, '$class'})):addShape(This, PointVector, (get({Array, '$class'})):opt(Array, Index), ShapeType)
            end, lists:seq(0, Size - 1));
            false ->
            (get({This, '$class'})):addShape(This, PointVector, Value, ShapeType)
        end.

% throws Exception
addShape(This, PointVector, Value, ShapeType) ->
        Shape = (get({This, '$class'})):asObject(This, Value, (get({ShapeType, '$class'})):getName(ShapeType)),
        case (ShapeType =:= get({get({This, shapeTypeFactory}), 'LINE'})) of
            true ->
            (get({This, '$class'})):addLine(This, PointVector, Shape);
            false ->
            case (ShapeType =:= get({get({This, shapeTypeFactory}), 'CIRCLE'})) of
            true ->
            (get({This, '$class'})):addCircle(This, PointVector, Shape);
            false ->
            (get({This, '$class'})):addRectangle(This, PointVector, Shape)
        end
        end.

% throws Exception
addLine(This, PointVector, Line) ->
        (get({This, '$class'})):addPoint(This, PointVector, (get({This, '$class'})):readInt(This, Line, get({This, 'KEY_X1'})), (get({This, '$class'})):readInt(This, Line, get({This, 'KEY_Y1'}))),
        (get({This, '$class'})):addPoint(This, PointVector, (get({This, '$class'})):readInt(This, Line, get({This, 'KEY_X2'})), (get({This, '$class'})):readInt(This, Line, get({This, 'KEY_Y2'}))),
        (get({This, '$class'})):addSeparator(This, PointVector).

% throws Exception
addCircle(This, PointVector, Circle) ->
        Cx = (get({This, '$class'})):readInt(This, Circle, get({This, 'KEY_CX'})),
        Cy = (get({This, '$class'})):readInt(This, Circle, get({This, 'KEY_CY'})),
        Radius = (get({This, '$class'})):readInt(This, Circle, get({This, 'KEY_R'})),
        lists:foreach(fun(Index) ->
            Angle = ((((get({'Math', 'PI'}) * 2.0) * Index)) / get({This, 'CIRCLE_SEGMENTS'})),
            X = trunc(erlang:round((Cx + ((math:cos(Angle) * Radius))))),
            Y = trunc(erlang:round((Cy + ((math:sin(Angle) * Radius))))),
            (get({This, '$class'})):addPoint(This, PointVector, X, Y)
        end, lists:seq(0, get({This, 'CIRCLE_SEGMENTS'}))),
        (get({This, '$class'})):addSeparator(This, PointVector).

% throws Exception
addRectangle(This, PointVector, Rectangle) ->
        X = (get({This, '$class'})):readInt(This, Rectangle, get({This, 'KEY_X'}), 0),
        Y = (get({This, '$class'})):readInt(This, Rectangle, get({This, 'KEY_Y'}), 0),
        Width = (get({This, '$class'})):readInt(This, Rectangle, get({get({This, graphicsStrings}), 'WIDTH'})),
        Height = (get({This, '$class'})):readInt(This, Rectangle, get({get({This, graphicsStrings}), 'HEIGHT'})),
        (get({This, '$class'})):addPoint(This, PointVector, X, Y),
        (get({This, '$class'})):addPoint(This, PointVector, (X + Width), Y),
        (get({This, '$class'})):addPoint(This, PointVector, (X + Width), (Y + Height)),
        (get({This, '$class'})):addPoint(This, PointVector, X, (Y + Height)),
        (get({This, '$class'})):addPoint(This, PointVector, X, Y),
        (get({This, '$class'})):addSeparator(This, PointVector).

addPoint(This, PointVector, X, Y) when is_integer(X), is_integer(Y) ->
        (get({PointVector, '$class'})):add(PointVector, array:from_list([X, Y])).

addSeparator(This, PointVector) ->
        (get({PointVector, '$class'})):add(PointVector, array:from_list([array:get(0, get({This, 'SHAPE_SEPARATOR'})), array:get(1, get({This, 'SHAPE_SEPARATOR'}))])).

% throws Exception
readInt(This, AnyType, Key) when (is_list(Key) orelse Key =:= undefined) ->
        Value = (get({AnyType, '$class'})):get(AnyType, Key),
        case (Value =:= undefined) of
            true ->
            erlang:error({'IllegalArgumentException', lists:concat([get({This, 'ERROR_MISSING_KEY_PREFIX'}), Key])});
            false -> ok
        end,
        (get({This, '$class'})):toInt(This, Value, Key).

readInt(This, AnyType, Key, DefaultValue) when (is_list(Key) orelse Key =:= undefined), is_integer(DefaultValue) ->
        try
        try
            case (get({AnyType, '$class'})):has(AnyType, Key) of
                true ->
                Value = (get({AnyType, '$class'})):get(AnyType, Key),
                throw({'$return', (get({This, '$class'})):toInt(This, Value, Key)});
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~p~n", [E])
        end,
        DefaultValue
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toInt(This, Value, Key) when (is_list(Key) orelse Key =:= undefined) ->
        try
        case allbinary_java:instance_of(Value, 'Number') of
            true ->
            throw({'$return', trunc(erlang:round((get({(Value), '$class'})):doubleValue((Value))))});
            false -> ok
        end,
        case allbinary_java:instance_of(Value, 'String') of
            true ->
            throw({'$return', trunc(erlang:round(list_to_float(Value)))});
            false -> ok
        end,
        erlang:error({'IllegalArgumentException', lists:concat([get({This, 'ERROR_INVALID_NUMBER_PREFIX'}), Key])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

asObject(This, Value, Name) when (is_list(Name) orelse Name =:= undefined) ->
        try
        case allbinary_java:instance_of(Value, 'JSONObject') of
            true ->
            throw({'$return', Value});
            false -> ok
        end,
        erlang:error({'IllegalArgumentException', lists:concat([get({This, 'ERROR_EXPECTED_OBJECT_PREFIX'}), Name])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toPoints(This, PointVector) ->
        try
        case ((get({PointVector, '$class'})):size(PointVector) =:= 0) of
            true ->
            throw({'$return', get({This, 'EMPTY_POINTS'})});
            false -> ok
        end,
        Points = array:new((get({PointVector, '$class'})):size(PointVector), {default, array:new(2, {default, 0})}),
        lists:foreach(fun(Index) ->
            Point = (get({PointVector, '$class'})):get(PointVector, Index),
            array:set(Index, Point, Points)
        end, lists:seq(0, (get({PointVector, '$class'})):size(PointVector) - 1)),
        Points
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        SvgAsJson = lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["{\"svg\": {\n", "    \"rect\": {\n"]), "        \"width\": 20,\n"]), "        \"fill\": \"#008c00\",\n"]), "        \"height\": 20\n"]), "    },\n"]), "    \"xmlns\": \"http://www.w3.org/2000/svg\",\n"]), "    \"width\": 20,\n"]), "    \"height\": 20\n"]), "}}\n"]),
        Points = (fun(Target_N72111) -> (get({Target_N72111, '$class'})):load(Target_N72111, SvgAsJson) end)('SVGAsJSONSimpleLoader':getInstance()),
        StringBuilder = 'StringMaker':new(),
        Size = array:size(Points),
        lists:foreach(fun(Index) ->
            Size2 = array:size(array:get(Index, Points)),
            lists:foreach(fun(Index2) ->
                (get({StringBuilder, '$class'})):appendint(StringBuilder, trunc(array:get(Index2, array:get(Index, Points)))),
                (get({StringBuilder, '$class'})):append(StringBuilder, get({'CommonSeps':getInstance(), 'COMMA'}))
            end, lists:seq(0, Size2 - 1))
        end, lists:seq(0, Size - 1)),
        io:format("~ts~n", [allbinary_java:to_string((get({StringBuilder, '$class'})):toString(StringBuilder))]).

