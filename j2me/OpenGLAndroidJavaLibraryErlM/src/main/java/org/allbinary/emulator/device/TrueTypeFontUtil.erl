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
% import java.io.File
% import java.io.FileOutputStream
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import android.graphics.Bitmap
% import android.graphics.Canvas
% import android.graphics.Paint
% import android.graphics.Rect
% import android.graphics.Typeface
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.image.PreResourceImageUtil
% import org.allbinary.image.opengles.OpenGLESImage
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings
% import org.microemu.android.device.AndroidImageInterface
% import org.microemu.android.device.AndroidImmutableImage

-module('TrueTypeFontUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TrueTypeFontUtilBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'TrueTypeFontUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, preResourceImageUtil}, 'PreResourceImageUtil':getInstance()),
    put({This, realFontSize}, 18),
    put({This, fontImage}, get({'OpenGLESImage', 'NULL_OPENGL_IMAGE'})),
    ok.


getInstance() ->
        get({'TrueTypeFontUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'TrueTypeFontUtilBase':init(This, 1),
        init_fields(This).

saveFontAtlasAsFile(This) ->
        try
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            File = (fun(Target_N66495) -> (get({Target_N66495, '$class'})):getFilesDir(Target_N66495) end)((fun(Target_N66502) -> (get({Target_N66502, '$class'})):getContext(Target_N66502) end)('ResourceUtil':getInstance())),
            Path = ((get({File, '$class'})):getAbsolutePath(File) + get({'CanvasStrings':getInstance(), 'FONT_ATLAS'})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Path, This, get({get({local, commonStrings}), 'CONSTRUCTOR'})),
            Fos = 'FileOutputStream':new(Path),
            Bitmap = (fun(Target_N66750) -> (get({Target_N66750, '$class'})):getBitmap(Target_N66750) end)(((get({get({get({This, fontImage}), openGLBitmap}), '$class'})):getImage(get({get({This, fontImage}), openGLBitmap})))),
            (get({Bitmap, '$class'})):compress(Bitmap, get({get({'Bitmap', 'CompressFormat'}), 'PNG'}), 100, Fos)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            'PreLogUtil':putOE(get({get({local, commonStrings}), 'EXCEPTION'}), This, get({get({local, commonStrings}), 'EXCEPTION'}), E)
        end.

getFontBitmapGL(This, Gl, Filename, CellSize, BasicColor) when (is_list(Filename) orelse Filename =:= undefined), is_integer(CellSize) ->
        try
        case (get({This, fontImage}) =:= get({'OpenGLESImage', 'NULL_OPENGL_IMAGE'})) of
            true ->
            CellsPerRow2 = (get({This, 'CELLS_PER_ROW'}) * 2),
            CellsPerRow3 = (get({This, 'CELLS_PER_ROW'}) * 3),
            CellsPerRow4 = (get({This, 'CELLS_PER_ROW'}) * 4),
            CellsPerRow5 = (get({This, 'CELLS_PER_ROW'}) * 5),
            CellsPerRow6 = (get({This, 'CELLS_PER_ROW'}) * 6),
            CellsPerRow7 = (get({This, 'CELLS_PER_ROW'}) * 7),
            Typeface = get({'Typeface', 'DEFAULT'}),
            TextureSize = (get({This, '$class'})):getAsTextureSize(This, (get({This, 'CELLS_PER_ROW'}) * CellSize)),
            Bitmap = 'Bitmap':createBitmap(TextureSize, TextureSize, get({get({'Bitmap', 'Config'}), 'ARGB_8888'})),
            Canvas = 'Canvas':new(Bitmap),
            Paint = 'Paint':new(),
            (get({Paint, '$class'})):setTypeface(Paint, Typeface),
            (get({Paint, '$class'})):setTextSize(Paint, float(get({This, realFontSize}))),
            (get({Paint, '$class'})):setAlpha(Paint, trunc(get({BasicColor, alpha}))),
            (get({Paint, '$class'})):setColor(Paint, (get({BasicColor, '$class'})):intValue(BasicColor)),
            put({local, biggestHeight}, 0),
            Bounds = 'Rect':new(),
            put({local, x}, 0),
            put({local, y}, 0),
            lists:foreach(fun(Index) ->
                put({This, characterArray}, array:set(0, (get({get({This, pattern}), '$class'})):charAt(get({This, pattern}), Index), get({This, characterArray}))),
                (get({Paint, '$class'})):getTextBounds(Paint, get({This, characterArray}), 0, 1, Bounds),
                put({This, '_characterWidth'}, array:set(Index, get({Bounds, right}), get({This, '_characterWidth'}))),
                case ((get({Bounds, bottom}) - get({Bounds, top})) > get({local, biggestHeight})) of
                    true ->
                    put({local, biggestHeight}, (get({Bounds, bottom}) - get({Bounds, top})));
                    false -> ok
                end,
                put({local, x}, (((Index rem get({This, 'CELLS_PER_ROW'}))) * CellSize)),
                put({local, x}, (get({local, x}) + ((CellSize bsr 1)))),
                put({local, x}, (get({local, x}) - ((array:get(Index, get({This, '_characterWidth'})) bsr 1)))),
                put({local, y}, 0),
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
                (get({Canvas, '$class'})):drawText(Canvas, get({This, characterArray}), 0, 1, (float(get({local, x})) - 3.0), (float(get({local, y})) - 6.0), Paint)
            end, lists:seq(0, get({This, size}) - 1)),
            (get({Canvas, '$class'})):save(Canvas),
            Image = 'AndroidImmutableImage':create(Bitmap),
            put({This, fontImage}, (get({get({This, preResourceImageUtil}), '$class'})):encapsulate(get({This, preResourceImageUtil}), Image)),
            throw({'$return', get({This, fontImage})});
            false ->
            throw({'$return', get({This, fontImage})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getFontWidths(This, Filename, FontSize) when (is_list(Filename) orelse Filename =:= undefined), is_integer(FontSize) ->
        Typeface = get({'Typeface', 'DEFAULT'}),
        Paint = 'Paint':new(),
        (get({Paint, '$class'})):setTypeface(Paint, Typeface),
        (get({Paint, '$class'})):setTextSize(Paint, float(FontSize)),
        (get({Paint, '$class'})):setARGB(Paint, 255, 255, 255, 255),
        Bounds = 'Rect':new(),
        lists:foreach(fun(Index) ->
            put({This, characterArray}, array:set(0, (get({get({This, pattern}), '$class'})):charAt(get({This, pattern}), Index), get({This, characterArray}))),
            (get({Paint, '$class'})):getTextBounds(Paint, get({This, characterArray}), 0, 1, Bounds),
            case (Index < get({This, lastCapIndex})) of
                true ->
                case (array:get(0, get({This, characterArray})) =:= $1) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) + 3), get({This, '_characterWidth'})));
                    false ->
                    case (((((((array:get(0, get({This, characterArray})) =:= $J) orelse (array:get(0, get({This, characterArray})) =:= $V)) orelse (array:get(0, get({This, characterArray})) =:= $2)) orelse (array:get(0, get({This, characterArray})) =:= $9)) orelse (array:get(0, get({This, characterArray})) =:= $I)) orelse (array:get(0, get({This, characterArray})) =:= $N)) orelse (array:get(0, get({This, characterArray})) =:= $U)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) + 1), get({This, '_characterWidth'})));
                    false ->
                    case ((((array:get(0, get({This, characterArray})) =:= $4) orelse (array:get(0, get({This, characterArray})) =:= $C)) orelse (array:get(0, get({This, characterArray})) =:= $E)) orelse (array:get(0, get({This, characterArray})) =:= $O)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 2), get({This, '_characterWidth'})));
                    false ->
                    case ((((((array:get(0, get({This, characterArray})) =:= $B) orelse (array:get(0, get({This, characterArray})) =:= $D)) orelse (array:get(0, get({This, characterArray})) =:= $G)) orelse (array:get(0, get({This, characterArray})) =:= $H)) orelse (array:get(0, get({This, characterArray})) =:= $T)) orelse (array:get(0, get({This, characterArray})) =:= $W)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 3), get({This, '_characterWidth'})));
                    false ->
                    case (((array:get(0, get({This, characterArray})) =:= $A) orelse (array:get(0, get({This, characterArray})) =:= $Q)) orelse (array:get(0, get({This, characterArray})) =:= $R)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 5), get({This, '_characterWidth'})));
                    false ->
                    case (array:get(0, get({This, characterArray})) =:= $M) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 6), get({This, '_characterWidth'})));
                    false ->
                    case (array:get(0, get({This, characterArray})) =:= $m) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 8), get({This, '_characterWidth'})));
                    false ->
                    put({This, '_characterWidth'}, array:set(Index, get({Bounds, right}), get({This, '_characterWidth'})))
                end
                end
                end
                end
                end
                end
                end;
                false ->
                case (array:get(0, get({This, characterArray})) =:= $\s) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) + 10), get({This, '_characterWidth'})));
                    false ->
                    case ((((((array:get(0, get({This, characterArray})) =:= $l) orelse (array:get(0, get({This, characterArray})) =:= $i)) orelse (array:get(0, get({This, characterArray})) =:= $j)) orelse (array:get(0, get({This, characterArray})) =:= $.)) orelse (array:get(0, get({This, characterArray})) =:= $!)) orelse (array:get(0, get({This, characterArray})) =:= $|)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) + 6), get({This, '_characterWidth'})));
                    false ->
                    case ((((array:get(0, get({This, characterArray})) =:= $f) orelse (array:get(0, get({This, characterArray})) =:= $t)) orelse (array:get(0, get({This, characterArray})) =:= $u)) orelse (array:get(0, get({This, characterArray})) =:= $v)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) + 1), get({This, '_characterWidth'})));
                    false ->
                    case (array:get(0, get({This, characterArray})) =:= $r) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) + 2), get({This, '_characterWidth'})));
                    false ->
                    case ((((array:get(0, get({This, characterArray})) =:= $a) orelse (array:get(0, get({This, characterArray})) =:= $b)) orelse (array:get(0, get({This, characterArray})) =:= $g)) orelse (array:get(0, get({This, characterArray})) =:= $u)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 1), get({This, '_characterWidth'})));
                    false ->
                    case ((array:get(0, get({This, characterArray})) =:= $o) orelse (array:get(0, get({This, characterArray})) =:= $e)) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 2), get({This, '_characterWidth'})));
                    false ->
                    case (array:get(0, get({This, characterArray})) =:= $m) of
                    true ->
                    put({This, '_characterWidth'}, array:set(Index, (get({Bounds, right}) - 7), get({This, '_characterWidth'})));
                    false ->
                    put({This, '_characterWidth'}, array:set(Index, get({Bounds, right}), get({This, '_characterWidth'})))
                end
                end
                end
                end
                end
                end
                end
            end
        end, lists:seq(0, get({This, size}) - 1)),
        put({This, '_characterWidth'}, array:set(0, (((FontSize bsr 1)) - 2), get({This, '_characterWidth'}))),
        get({This, '_characterWidth'}).

