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
% package org.allbinary.emulator.device
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.eclipse.swt.SWT
% import org.eclipse.swt.graphics.ImageData
% import org.eclipse.swt.graphics.ImageLoader
% import org.microemu.device.swt.SwtMutableImage
% import org.allbinary.AvianUtil
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.opengles.OpenGLCapabilities
% import org.allbinary.image.PreResourceImageUtil
% import org.allbinary.image.opengles.OpenGLESImage
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('TrueTypeFontUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TrueTypeFontUtilBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'TrueTypeFontUtil':new()),
    ok.

init_fields(This) ->
    put({This, preResourceImageUtil}, 'PreResourceImageUtil':getInstance()),
    put({This, widthFloatArray}, undefined),
    put({This, fontImage}, get({'OpenGLESImage', 'NULL_OPENGL_IMAGE'})),
    put({This, widthScale}, 0.0),
    ok.


getInstance() ->
        get({'TrueTypeFontUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'TrueTypeFontUtilBase':init(This, 2),
        init_fields(This),
        case 'AvianUtil':isAvian() of
            true ->
            put({This, widthFloatArray}, array:from_list([1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 961.0, 961.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 952.0, 952.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0]));
            false ->
            put({This, widthFloatArray}, array:from_list([1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0]))
        end,
        put({This, widthScale}, case ((get({This, scale}) =:= 2)) of true -> 1.2; false -> 1.0 end).

getFontBitmapGL(This, Gl, Filename, CellSize, BasicColor) when (is_list(Filename) orelse Filename =:= undefined), is_integer(CellSize) ->
        try
        try
            case (get({This, fontImage}) =:= get({'OpenGLESImage', 'NULL_OPENGL_IMAGE'})) of
                true ->
                CanvasStrings = 'CanvasStrings':getInstance(),
                OpenGLCapabilities = 'OpenGLCapabilities':getInstance(),
                case ((get({OpenGLCapabilities, '$class'})):isTextureSizeValid(OpenGLCapabilities, 1024) andalso (get({This, scale}) =:= 2)) of
                    true ->
                    FONT_ATLAS_1024 = "/font_1024.png",
                    put({local, image}, 'Image':createImage((fun(Target_N68270) -> (get({Target_N68270, '$class'})):getResourceAsStream(Target_N68270, FONT_ATLAS_1024) end)('ResourceUtil':getInstance()))),
                    (get({get({local, image}), '$class'})):setName(get({local, image}), get({CanvasStrings, 'FONT_ATLAS'})),
                    put({This, fontImage}, (get({get({This, preResourceImageUtil}), '$class'})):encapsulate(get({This, preResourceImageUtil}), get({local, image})));
                    false ->
                    case (get({OpenGLCapabilities, '$class'})):isTextureSizeValid(OpenGLCapabilities, 512) of
                    true ->
                    put({local, 'FONT_ATLAS_512'}, "/font_512.png"),
                    put({local, image}, 'Image':createImage((fun(Target_N68035) -> (get({Target_N68035, '$class'})):getResourceAsStream(Target_N68035, get({local, 'FONT_ATLAS_512'})) end)('ResourceUtil':getInstance()))),
                    (get({get({local, image}), '$class'})):setName(get({local, image}), get({CanvasStrings, 'FONT_ATLAS'})),
                    put({This, fontImage}, (get({get({This, preResourceImageUtil}), '$class'})):encapsulate(get({This, preResourceImageUtil}), get({local, image})));
                    false ->
                    put({local, 'FONT_ATLAS_512'}, "/font_512.png"),
                    put({local, image}, 'Image':createImage((fun(Target_N67801) -> (get({Target_N67801, '$class'})):getResourceAsStream(Target_N67801, get({local, 'FONT_ATLAS_512'})) end)('ResourceUtil':getInstance()))),
                    (get({get({local, image}), '$class'})):setName(get({local, image}), get({CanvasStrings, 'FONT_ATLAS'})),
                    put({This, fontImage}, (get({get({This, preResourceImageUtil}), '$class'})):encapsulate(get({This, preResourceImageUtil}), get({local, image})))
                end
                end,
                throw({'$return', get({This, fontImage})});
                false ->
                throw({'$return', get({This, fontImage})})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':putOE(get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'EXCEPTION'}), E),
            erlang:error({'RuntimeException'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

saveFontAtlasAsFile(This) ->
        Image = (get({This, '$class'})):getFontBitmap(This, undefined, get({This, cellSize}), get({'BasicColorFactory':getInstance(), 'WHITE'})),
        ImageLoader = 'ImageLoader':new(),
        ImageData = (get({get({(Image), image}), '$class'})):getImageData(get({(Image), image})),
        put({ImageData, transparentPixel}, (get({ImageData, '$class'})):getPixel(ImageData, 0, 0)),
        put({ImageLoader, data}, array:from_list([ImageData])),
        (get({ImageLoader, '$class'})):save(ImageLoader, (get({'CommonSeps':getInstance(), 'PERIOD'}) + get({'CanvasStrings':getInstance(), 'FONT_ATLAS'})), get({'SWT', 'IMAGE_PNG'})).

getFontBitmap(This, Filename, CellSize, BasicColor) when (is_list(Filename) orelse Filename =:= undefined), is_integer(CellSize) ->
        CellsPerRow2 = (get({This, 'CELLS_PER_ROW'}) * 2),
        CellsPerRow3 = (get({This, 'CELLS_PER_ROW'}) * 3),
        CellsPerRow4 = (get({This, 'CELLS_PER_ROW'}) * 4),
        CellsPerRow5 = (get({This, 'CELLS_PER_ROW'}) * 5),
        CellsPerRow6 = (get({This, 'CELLS_PER_ROW'}) * 6),
        CellsPerRow7 = (get({This, 'CELLS_PER_ROW'}) * 7),
        Image = 'Image':createImage(get({This, textureSize}), get({This, textureSize})),
        Graphics = (get({Image, '$class'})):getGraphics(Image),
        (get({Graphics, '$class'})):setColor(Graphics, (get({BasicColor, '$class'})):intValue(BasicColor)),
        put({local, biggestHeight}, 0),
        Bounds = 'Rectangle':new((fun(Target_N69702) -> (get({Target_N69702, '$class'})):createXY(Target_N69702, 0, 0) end)('PointFactory':getInstance()), CellSize, CellSize),
        put({local, x}, 0),
        put({local, y}, 0),
        lists:foreach(fun(Index) ->
            put({This, characterArray}, array:set(0, (get({get({This, pattern}), '$class'})):charAt(get({This, pattern}), Index), get({This, characterArray}))),
            put({This, '_characterWidth'}, array:set(Index, (get({Bounds, '$class'})):getMaxX(Bounds), get({This, '_characterWidth'}))),
            case (((get({Bounds, '$class'})):getMaxY(Bounds) - (fun(Target_N69964) -> (get({Target_N69964, '$class'})):getX(Target_N69964) end)((get({Bounds, '$class'})):getPoint(Bounds))) > get({local, biggestHeight})) of
                true ->
                put({local, biggestHeight}, ((get({Bounds, '$class'})):getMaxY(Bounds) - (fun(Target_N70033) -> (get({Target_N70033, '$class'})):getX(Target_N70033) end)((get({Bounds, '$class'})):getPoint(Bounds))));
                false -> ok
            end,
            put({local, x}, (((Index rem get({This, 'CELLS_PER_ROW'}))) * CellSize)),
            put({local, x}, (get({local, x}) + ((CellSize bsr 1)))),
            put({local, x}, (get({local, x}) - ((array:get(Index, get({This, '_characterWidth'})) bsr 1)))),
            put({local, y}, (-((CellSize bsr 1)))),
            case (Index >= get({This, 'CELLS_PER_ROW'})) of
                true ->
                put({local, y}, (get({local, y}) + CellSize));
                false -> ok
            end,
            case (Index >= CellsPerRow2) of
                true ->
                put({local, y}, (get({local, y}) + CellSize));
                false -> ok
            end,
            case (Index >= CellsPerRow3) of
                true ->
                put({local, y}, (get({local, y}) + CellSize));
                false -> ok
            end,
            case (Index >= CellsPerRow4) of
                true ->
                put({local, y}, (get({local, y}) + CellSize));
                false -> ok
            end,
            case (Index >= CellsPerRow5) of
                true ->
                put({local, y}, (get({local, y}) + CellSize));
                false -> ok
            end,
            case (Index >= CellsPerRow6) of
                true ->
                put({local, y}, (get({local, y}) + CellSize));
                false -> ok
            end,
            case (Index >= CellsPerRow7) of
                true ->
                put({local, y}, (get({local, y}) + CellSize));
                false -> ok
            end,
            put({local, y}, (get({local, y}) + CellSize)),
            put({local, y}, (get({local, y}) - ((CellSize bsr 2)))),
            (get({Graphics, '$class'})):drawChar(Graphics, array:get(0, get({This, characterArray})), get({local, x}), get({local, y}), 0)
        end, lists:seq(0, get({This, size}) - 1)),
        Image.

getFontWidths(This, Filename, FontSize) when (is_list(Filename) orelse Filename =:= undefined), is_integer(FontSize) ->
        CommonStrings = 'CommonStrings':getInstance(),
        lists:foreach(fun(Index) ->
            put({This, characterArray}, array:set(0, (get({get({This, pattern}), '$class'})):charAt(get({This, pattern}), Index), get({This, characterArray}))),
            case (array:get(0, get({This, characterArray})) =:= $\s) of
                true ->
                put({This, '_characterWidth'}, array:set(Index, ((FontSize div 4)), get({This, '_characterWidth'})));
                false ->
                ShortPatternIndex = (get({get({This, shortPattern}), '$class'})):indexOf(get({This, shortPattern}), array:get(0, get({This, characterArray}))),
                W = (trunc(((array:get(ShortPatternIndex, get({This, widthFloatArray})) / 75.0))) + 19),
                put({This, '_characterWidth'}, array:set(Index, W, get({This, '_characterWidth'}))),
                case ((array:get(0, get({This, characterArray})) =:= $.) orelse (array:get(0, get({This, characterArray})) =:= $1)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (array:get(Index, get({This, '_characterWidth'})) + 4), get({This, '_characterWidth'})));
                    false -> ok
                end,
                case ((array:get(0, get({This, characterArray})) >= $a) andalso (array:get(0, get({This, characterArray})) < $k)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (array:get(Index, get({This, '_characterWidth'})) - 2), get({This, '_characterWidth'})));
                    false -> ok
                end,
                case ((array:get(0, get({This, characterArray})) >= $k) andalso (array:get(0, get({This, characterArray})) < $v)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (array:get(Index, get({This, '_characterWidth'})) - 4), get({This, '_characterWidth'})));
                    false -> ok
                end,
                case ((array:get(0, get({This, characterArray})) >= $v) andalso (array:get(0, get({This, characterArray})) < $z)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (array:get(Index, get({This, '_characterWidth'})) - 8), get({This, '_characterWidth'})));
                    false -> ok
                end,
                case (array:get(0, get({This, characterArray})) =:= $D) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (array:get(Index, get({This, '_characterWidth'})) - 4), get({This, '_characterWidth'})));
                    false -> ok
                end,
                case ((array:get(0, get({This, characterArray})) >= $A) andalso (array:get(0, get({This, characterArray})) =< $Z)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (array:get(Index, get({This, '_characterWidth'})) - 2), get({This, '_characterWidth'})));
                    false -> ok
                end
            end,
            put({This, '_characterWidth'}, array:set(Index, (array:get(Index, get({This, '_characterWidth'})) * get({This, widthScale})), get({This, '_characterWidth'})))
        end, lists:seq(0, get({This, size}) - 1)),
        get({This, '_characterWidth'}).

