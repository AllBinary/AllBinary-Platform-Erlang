% Generated Code Do Not Modify
% package org.allbinary.animation

-module('PolygonRasterizer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PolygonRasterizer':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PolygonRasterizer', instance}).

getPixelBuffer(This, SvgPath, PathX, PathY, PixelBuffer, Width, Height) when (is_list(SvgPath) orelse SvgPath =:= undefined), (is_tuple(PathX) orelse PathX =:= undefined), (is_tuple(PathY) orelse PathY =:= undefined), (is_tuple(PixelBuffer) orelse PixelBuffer =:= undefined), is_integer(Width), is_integer(Height) ->
        PointCount = 'PathParser':parsePath(SvgPath, PathX, PathY, array:size(PathX)),
        lists:foreach(fun(I) ->
            array:set(I, 16#FFFFFFFF, PixelBuffer)
        end, lists:seq(0, array:size(PixelBuffer) - 1)),
        (fun(Target_N65894) -> (get({Target_N65894, '$class'})):fillPolygon(Target_N65894, PathX, PathY, PointCount, PixelBuffer, Width, Height, 16#FFFF00FF) end)('PolygonRasterizer':getInstance()),
        PixelBuffer.

fillPolygon(This, PolyX, PolyY, NumPoints, Buffer, Width, Height, ColorRGB) when (is_tuple(PolyX) orelse PolyX =:= undefined), (is_tuple(PolyY) orelse PolyY =:= undefined), is_integer(NumPoints), (is_tuple(Buffer) orelse Buffer =:= undefined), is_integer(Width), is_integer(Height), is_integer(ColorRGB) ->
        case (NumPoints < 3) of
            true ->
            ok;
            false -> ok
        end,
        FixedPoint = 'FixedPoint':getInstance(),
        X = array:new(NumPoints, {default, 0}),
        Y = array:new(NumPoints, {default, 0}),
        put({local, minY}, Height),
        put({local, maxY}, 0),
        lists:foreach(fun(I) ->
            array:set(I, (get({FixedPoint, '$class'})):toInt(FixedPoint, array:get(I, PolyX)), X),
            array:set(I, (get({FixedPoint, '$class'})):toInt(FixedPoint, array:get(I, PolyY)), Y),
            case (array:get(I, Y) < get({local, minY})) of
                true ->
                put({local, minY}, array:get(I, Y));
                false -> ok
            end,
            case (array:get(I, Y) > get({local, maxY})) of
                true ->
                put({local, maxY}, array:get(I, Y));
                false -> ok
            end
        end, lists:seq(0, NumPoints - 1)),
        case (get({local, minY}) < 0) of
            true ->
            put({local, minY}, 0);
            false -> ok
        end,
        case (get({local, maxY}) >= Height) of
            true ->
            put({local, maxY}, (Height - 1));
            false -> ok
        end,
        ScanlineX = array:new(NumPoints, {default, 0}),
        lists:foreach(fun(ScanY) ->
            put({local, intersectCount}, 0),
            lists:foreach(fun(I) ->
                Next = (((I + 1)) rem NumPoints),
                X1 = array:get(I, X),
                Y1 = array:get(I, Y),
                X2 = array:get(Next, X),
                Y2 = array:get(Next, Y),
                case ((((Y1 < ScanY) andalso (Y2 >= ScanY))) orelse (((Y2 < ScanY) andalso (Y1 >= ScanY)))) of
                    true ->
                    case (Y2 =/= Y1) of
                        true ->
                        InterX = (X1 + ((((ScanY - Y1)) * ((X2 - X1))) div ((Y2 - Y1)))),
                        array:set(allbinary_java:first(get({local, intersectCount}), put({local, intersectCount}, get({local, intersectCount}) + 1)), InterX, ScanlineX);
                        false -> ok
                    end;
                    false -> ok
                end
            end, lists:seq(0, NumPoints - 1)),
            lists:foreach(fun(I) ->
                lists:foreach(fun(J) ->
                    case (array:get(I, ScanlineX) > array:get(J, ScanlineX)) of
                        true ->
                        Temp = array:get(I, ScanlineX),
                        array:set(I, array:get(J, ScanlineX), ScanlineX),
                        array:set(J, Temp, ScanlineX);
                        false -> ok
                    end
                end, lists:seq((I + 1), get({local, intersectCount}) - 1))
            end, lists:seq(0, (get({local, intersectCount}) - 1) - 1)),
            lists:foreach(fun(I) ->
                case ((I + 1) >= get({local, intersectCount})) of
                    true ->
                    throw('$break');
                    false -> ok
                end,
                put({local, startX}, array:get(I, ScanlineX)),
                put({local, endX}, array:get((I + 1), ScanlineX)),
                case (get({local, startX}) < 0) of
                    true ->
                    put({local, startX}, 0);
                    false -> ok
                end,
                case (get({local, endX}) >= Width) of
                    true ->
                    put({local, endX}, (Width - 1));
                    false -> ok
                end,
                RowOffset = (ScanY * Width),
                lists:foreach(fun(PixelX) ->
                    array:set((RowOffset + PixelX), ColorRGB, Buffer)
                end, lists:seq(get({local, startX}), get({local, endX})))
            end, lists:seq(0, get({local, intersectCount}) - 1, 2))
        end, lists:seq(get({local, minY}), get({local, maxY}))).

main(This, Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        Width = 100,
        Height = 100,
        PathX = array:new(200, {default, 0}),
        PathY = array:new(200, {default, 0}),
        PixelBuffer = array:new((Width * Height), {default, 0}),
        SvgPath = "M 32.139812,81.554575 14.450128,74.294372 V 50.000034 25.705697 l 17.73231,-7.268329 C 41.935209,14.439788 49.953112,11.168898 50,11.168723 c 0.04689,-1.74e-4 8.064791,3.270238 17.817562,7.267583 l 17.73231,7.267899 V 50 74.295795 l -17.73231,7.2679 c -9.752771,3.997344 -17.789855,7.264116 -17.860188,7.259492 -0.07033,-0.0046 -8.088235,-3.275499 -17.817562,-7.268612 z",
        (fun(Target_N68932) -> (get({Target_N68932, '$class'})):getPixelBuffer(Target_N68932, SvgPath, PathX, PathY, PixelBuffer, Width, Height) end)('PolygonRasterizer':getInstance()).

