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
% package org.allbinary.media.image
% import java.awt.image.BufferedImage
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('SpriteSplitterUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SpriteSplitterUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'ANIMATIONS_LABELS'}, array:from_list(["Row Total:", "Column Total:", "Column Total:", "Row Total:", "Column Total:", "Row Total:"])),
    put({This, 'DIRECTIONAL_ANIMATIONS'}, "Directional DLRU"),
    put({This, 'HORIZONTAL_ANIMATIONS'}, "Horizontal Animations"),
    put({This, 'HORIZONTAL_SPRITE'}, "Horizontal A=R=Y F=C=X"),
    put({This, 'ROW_NAME'}, array:from_list(["idle", "walk", "attack", "defeat"])),
    put({This, '_ROW'}, "_row"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'SpriteSplitterUtil', instance}).

% throws Exception
process(This, ImageProcessorInput, TotalFrames, TotalAnimations, WidthReduction, HeightReduction, IncreaseWidth, IncreaseHeight, SpriteType, Visitor) when is_integer(TotalFrames), is_integer(TotalAnimations), is_integer(WidthReduction), is_integer(HeightReduction), is_integer(IncreaseWidth), is_integer(IncreaseHeight), (is_list(SpriteType) orelse SpriteType =:= undefined) ->
        put({local, bufferedImage}, undefined),
        put({local, generatedBufferedImageArray}, undefined),
        BufferedImageArray = (get({ImageProcessorInput, '$class'})):getBufferedImageArray(ImageProcessorInput),
        lists:foreach(fun(Index) ->
            put({local, bufferedImage}, array:get(Index, BufferedImageArray)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), SpriteType, This, get({get({This, commonStrings}), 'RUN'})),
            case (SpriteType =:= get({This, 'HORIZONTAL_SPRITE'})) of
                true ->
                put({local, cellHeight}, ((get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage})) / TotalAnimations)),
                put({local, cellWidth}, ((get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage})) / TotalFrames)),
                put({local, columns}, TotalFrames),
                put({local, rows}, TotalAnimations),
                put({local, generatedBufferedImageArray}, array:new(get({local, rows}), {default, array:new(get({local, columns}), {default, undefined})})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Processing Individual Cells columns: ", get({local, columns})]), " rows: "]), get({local, rows})]), This, get({get({This, commonStrings}), 'RUN'})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Processing Individual Cells cellHeight: ", get({local, cellHeight})]), " cellWidth: "]), get({local, cellWidth})]), This, get({get({This, commonStrings}), 'RUN'})),
                ImageUtil = 'ImageUtil':getInstance(),
                put({local, nameEnding}, undefined),
                put({local, x}, 0),
                put({local, y}, 0),
                lists:foreach(fun(Index2) ->
                    put({local, y}, (get({local, cellHeight}) * Index2)),
                    lists:foreach(fun(Index3) ->
                        put({local, x}, (get({local, cellWidth}) * Index3)),
                        put({local, generatedBufferedImageArray}, array:set(Index2, array:set(Index3, (get({get({local, bufferedImage}), '$class'})):getSubimage(get({local, bufferedImage}), (get({local, x}) + WidthReduction), (get({local, y}) + HeightReduction), (get({local, cellWidth}) - ((WidthReduction * 2))), (get({local, cellHeight}) - ((HeightReduction * 2)))), array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, generatedBufferedImageArray}))),
                        case ((IncreaseWidth =/= 0) orelse (IncreaseHeight =/= 0)) of
                            true ->
                            put({local, generatedBufferedImageArray}, array:set(Index2, array:set(Index3, (get({ImageUtil, '$class'})):createBufferedImageAllowTranslate(ImageUtil, array:get(Index3, array:get(Index2, get({local, generatedBufferedImageArray}))), (get({local, cellWidth}) + IncreaseWidth), (get({local, cellHeight}) + IncreaseHeight), false, true), array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, generatedBufferedImageArray})));
                            false -> ok
                        end,
                        put({local, nameEnding}, (fun(Target_N69837) -> (get({Target_N69837, '$class'})):toString(Target_N69837) end)((fun(Target_N69844) -> (get({Target_N69844, '$class'})):appendint(Target_N69844, Index3) end)((fun(Target_N69851) -> (get({Target_N69851, '$class'})):append(Target_N69851, get({get({This, commonSeps}), 'UNDERSCORE'})) end)((fun(Target_N69858) -> (get({Target_N69858, '$class'})):appendint(Target_N69858, Index2) end)('StringMaker':new()))))),
                        (get({Visitor, '$class'})):visit(Visitor, array:get(Index3, array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, nameEnding}), Index)
                    end, lists:seq(0, get({local, columns}) - 1))
                end, lists:seq(0, get({local, rows}) - 1)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Processing Rows from Cells", This, get({get({This, commonStrings}), 'RUN'})),
                put({local, imageUnifierProperties}, 'ImageUnifierProperties':new()),
                (get({get({local, imageUnifierProperties}), '$class'})):setRows(get({local, imageUnifierProperties}), allbinary_java:to_string(1)),
                (get({get({local, imageUnifierProperties}), '$class'})):setColumns(get({local, imageUnifierProperties}), allbinary_java:to_string(get({local, columns}))),
                put({local, imageUnifierCell}, 'ImageUnifierCell':new(allbinary_java:to_string((get({local, cellWidth}) - ((2 * WidthReduction)))), allbinary_java:to_string((get({local, cellHeight}) - ((2 * HeightReduction)))))),
                (get({get({local, imageUnifierProperties}), '$class'})):setImageUnifierCell(get({local, imageUnifierProperties}), get({local, imageUnifierCell})),
                lists:foreach(fun(Index2) ->
                    put({local, y}, (get({local, cellHeight}) * Index2)),
                    put({local, tempBufferedImageArray}, array:new(get({local, columns}), {default, undefined})),
                    lists:foreach(fun(Index3) ->
                        put({local, tempBufferedImageArray}, array:set(Index3, array:get(Index3, array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, tempBufferedImageArray}))),
                        put({local, nameEnding}, (fun(Target_N70710) -> (get({Target_N70710, '$class'})):toString(Target_N70710) end)((fun(Target_N70717) -> (get({Target_N70717, '$class'})):append(Target_N70717, get({This, '_ROW'})) end)((fun(Target_N70724) -> (get({Target_N70724, '$class'})):appendint(Target_N70724, 1) end)((fun(Target_N70731) -> (get({Target_N70731, '$class'})):append(Target_N70731, get({get({This, commonSeps}), 'UNDERSCORE'})) end)((fun(Target_N70738) -> (get({Target_N70738, '$class'})):appendint(Target_N70738, Index2) end)('StringMaker':new()))))))
                    end, lists:seq(0, get({local, columns}) - 1)),
                    put({local, generatedBufferedImage}, (fun(Target_N70906) -> (get({Target_N70906, '$class'})):getImage(Target_N70906, get({local, tempBufferedImageArray}), get({local, imageUnifierProperties})) end)('ImageUnifierUtil':getInstance())),
                    (get({Visitor, '$class'})):visit(Visitor, get({local, generatedBufferedImage}), get({local, nameEnding}), Index)
                end, lists:seq(0, get({local, rows}) - 1));
                false ->
                case (SpriteType =:= get({This, 'HORIZONTAL_ANIMATIONS'})) of
                true ->
                ok;
                false ->
                case (SpriteType =:= get({This, 'DIRECTIONAL_ANIMATIONS'})) of
                true ->
                TotalFrames2 = 4,
                put({local, cellHeight}, ((get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage})) / TotalFrames2)),
                put({local, cellWidth}, ((get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage})) / TotalAnimations)),
                put({local, columns}, TotalAnimations),
                put({local, rows}, TotalFrames2),
                put({local, generatedBufferedImageArray}, array:new(get({local, rows}), {default, array:new(get({local, columns}), {default, undefined})})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Processing Individual Cells for each Direction", This, get({get({This, commonStrings}), 'RUN'})),
                put({local, nameEnding}, undefined),
                put({local, x}, 0),
                put({local, y}, 0),
                lists:foreach(fun(Index2) ->
                    put({local, y}, (get({local, cellHeight}) * Index2)),
                    lists:foreach(fun(Index3) ->
                        put({local, x}, (get({local, cellWidth}) * Index3)),
                        put({local, generatedBufferedImageArray}, array:set(Index2, array:set(Index3, (get({get({local, bufferedImage}), '$class'})):getSubimage(get({local, bufferedImage}), (get({local, x}) + WidthReduction), (get({local, y}) + HeightReduction), (get({local, cellWidth}) - ((WidthReduction * 2))), (get({local, cellHeight}) - ((HeightReduction * 2)))), array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, generatedBufferedImageArray}))),
                        case ((IncreaseWidth =/= 0) orelse (IncreaseHeight =/= 0)) of
                            true ->
                            put({local, generatedBufferedImageArray}, array:set(Index2, array:set(Index3, (fun(Target_N67356) -> (get({Target_N67356, '$class'})):createBufferedImageAllowTranslate(Target_N67356, array:get(Index3, array:get(Index2, get({local, generatedBufferedImageArray}))), (get({local, cellWidth}) + IncreaseWidth), (get({local, cellHeight}) + IncreaseHeight), false, true) end)('ImageUtil':getInstance()), array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, generatedBufferedImageArray})));
                            false -> ok
                        end,
                        put({local, nameEnding}, (fun(Target_N67485) -> (get({Target_N67485, '$class'})):toString(Target_N67485) end)((fun(Target_N67492) -> (get({Target_N67492, '$class'})):appendint(Target_N67492, Index3) end)((fun(Target_N67499) -> (get({Target_N67499, '$class'})):append(Target_N67499, get({get({This, commonSeps}), 'UNDERSCORE'})) end)((fun(Target_N67506) -> (get({Target_N67506, '$class'})):append(Target_N67506, array:get(Index2, get({get({This, commonStrings}), 'DIRECTION_NAME'}))) end)('StringMaker':new()))))),
                        (get({Visitor, '$class'})):visit(Visitor, array:get(Index3, array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, nameEnding}), Index)
                    end, lists:seq(0, get({local, columns}) - 1))
                end, lists:seq(0, get({local, rows}) - 1)),
                put({local, imageUnifierProperties}, 'ImageUnifierProperties':new()),
                (get({get({local, imageUnifierProperties}), '$class'})):setRows(get({local, imageUnifierProperties}), allbinary_java:to_string(1)),
                (get({get({local, imageUnifierProperties}), '$class'})):setColumns(get({local, imageUnifierProperties}), allbinary_java:to_string(get({local, columns}))),
                put({local, imageUnifierCell}, 'ImageUnifierCell':new((allbinary_java:to_string((get({local, cellWidth}) - ((2 * WidthReduction)))) + IncreaseWidth), allbinary_java:to_string(((get({local, cellHeight}) - ((2 * HeightReduction))) + IncreaseHeight)))),
                (get({get({local, imageUnifierProperties}), '$class'})):setImageUnifierCell(get({local, imageUnifierProperties}), get({local, imageUnifierCell})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Processing Rows from Cells for each Direction", This, get({get({This, commonStrings}), 'RUN'})),
                lists:foreach(fun(Index2) ->
                    put({local, y}, (get({local, cellHeight}) * Index2)),
                    put({local, tempBufferedImageArray}, array:new(get({local, columns}), {default, undefined})),
                    lists:foreach(fun(Index3) ->
                        put({local, tempBufferedImageArray}, array:set(Index3, array:get(Index3, array:get(Index2, get({local, generatedBufferedImageArray}))), get({local, tempBufferedImageArray}))),
                        put({local, nameEnding}, (fun(Target_N68407) -> (get({Target_N68407, '$class'})):toString(Target_N68407) end)((fun(Target_N68414) -> (get({Target_N68414, '$class'})):append(Target_N68414, get({This, '_ROW'})) end)((fun(Target_N68421) -> (get({Target_N68421, '$class'})):appendint(Target_N68421, 1) end)((fun(Target_N68428) -> (get({Target_N68428, '$class'})):append(Target_N68428, get({get({This, commonSeps}), 'UNDERSCORE'})) end)((fun(Target_N68435) -> (get({Target_N68435, '$class'})):append(Target_N68435, array:get(Index2, get({get({This, commonStrings}), 'DIRECTION_NAME'}))) end)('StringMaker':new()))))))
                    end, lists:seq(0, get({local, columns}) - 1)),
                    put({local, generatedBufferedImage}, (fun(Target_N68626) -> (get({Target_N68626, '$class'})):getImage(Target_N68626, get({local, tempBufferedImageArray}), get({local, imageUnifierProperties})) end)('ImageUnifierUtil':getInstance())),
                    (get({Visitor, '$class'})):visit(Visitor, get({local, generatedBufferedImage}), get({local, nameEnding}), Index)
                end, lists:seq(0, get({local, rows}) - 1));
                false -> ok
            end
            end
            end
        end, lists:seq(0, array:size(BufferedImageArray) - 1)).

