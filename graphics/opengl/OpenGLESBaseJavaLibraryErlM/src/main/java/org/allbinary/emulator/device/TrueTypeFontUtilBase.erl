% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import javax.microedition.lcdui.Font
% import org.allbinary.AvianUtil
% import org.allbinary.logic.string.StringUtil

-module('TrueTypeFontUtilBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, shortPattern}, undefined),
    put({This, patternAsBytes}, array:from_list([32, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 32, 32, 32, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 32, 32, 32, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 32, 32, 32, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 32, 32, 32, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 46, 63, 32, 32, 32, 33, 36, 37, 96, (-62), (-84), (-62), (-84), 34, (-62), (-93), (-62), (-93), 94, 38, 42, 40, 32, 32, 32, 41, 95, 43, 45, 61, 91, 93, 123, 125, 59, 39, 35, 58, 32, 32, 32, 64, 126, 44, 47, 60, 62, 92, 124, (-62), (-82), (-62), (-82), (-62), (-87), (-62), (-87)])),
    put({This, pattern}, allbinary_java:to_string(get({This, patternAsBytes}))),
    put({This, charArray}, array:from_list([16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#6f, 16#50, 16#56, 16#6b, 16#51, 16#52, 16#5a, 16#6a, 16#5c, 16#60, 16#5b, 16#62, 16#72, 16#63, 16#4b, 16#73, 16#1, 16#2, 16#3, 16#4, 16#5, 16#6, 16#7, 16#8, 16#9, 16#a, 16#6c, 16#69, 16#74, 16#64, 16#75, 16#4c, 16#70, 16#b, 16#c, 16#10, 16#11, 16#12, 16#13, 16#14, 16#15, 16#16, 16#17, 16#18, 16#19, 16#1a, 16#1b, 16#1c, 16#20, 16#21, 16#22, 16#23, 16#24, 16#25, 16#26, 16#27, 16#28, 16#29, 16#2a, 16#65, 16#76, 16#66, 16#59, 16#61, 16#53, 16#2b, 16#2c, 16#30, 16#31, 16#32, 16#33, 16#34, 16#35, 16#36, 16#37, 16#38, 16#39, 16#3a, 16#3b, 16#3c, 16#40, 16#41, 16#42, 16#43, 16#44, 16#45, 16#46, 16#47, 16#48, 16#49, 16#4a, 16#67, 16#77, 16#68, 16#71, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#58, 16#0, 16#0, 16#0, 16#0, 16#0, 16#7b, 16#0, 16#0, 16#55, 16#0, 16#79, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0, 16#0])),
    put({This, '_characterWidth'}, array:new(string:length(get({This, pattern})), {default, 0})),
    put({This, characterArray}, array:new(1, {default, 0})),
    put({This, size}, string:length(get({This, pattern}))),
    put({This, lastCapIndex}, allbinary_java:index_of(get({This, pattern}), $Z)),
    put({This, currentFont}, 'Font':getDefaultFont()),
    put({This, scale}, 0),
    put({This, 'CELLS_PER_ROW'}, 0),
    put({This, fontSize}, 0),
    put({This, baseCharWidth}, 0),
    put({This, cellSize}, 0),
    put({This, textureSize}, 0),
    put({This, actualCellsPerRow}, 0),
    ok.


new(Scale) when is_integer(Scale) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Scale),
    This.

'$init'(This, Scale) when is_integer(Scale) ->
    init_fields(This),
        put({local, shortPattern}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        case 'AvianUtil':isAvian() of
            true ->
            put({local, shortPatterAsByteArray}, array:from_list([32, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 46, 63, 33, 36, 37, 96, (-62), (-84), (-62), (-84), 34, (-62), (-93), (-62), (-93), 94, 38, 42, 40, 41, 95, 43, 45, 61, 91, 93, 123, 125, 59, 39, 35, 58, 64, 126, 44, 47, 60, 62, 92, 124, (-62), (-82), (-62), (-82), (-62), (-87), (-62), (-87)])),
            put({local, shortPattern}, allbinary_java:to_string(get({local, shortPatterAsByteArray})));
            false ->
            put({local, shortPatterAsByteArray}, array:from_list([32, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 46, 63, 33, 36, 37, 96, (-62), (-84), 34, (-62), (-93), 94, 38, 42, 40, 41, 95, 43, 45, 61, 91, 93, 123, 125, 59, 39, 35, 58, 64, 126, 44, 47, 60, 62, 92, 124, (-62), (-82), (-62), (-87)])),
            put({local, shortPattern}, allbinary_java:to_string(get({local, shortPatterAsByteArray})))
        end,
        put({This, shortPattern}, get({local, shortPattern})),
        put({This, scale}, Scale),
        put({This, 'CELLS_PER_ROW'}, 16),
        put({This, fontSize}, (((20 + 6)) * get({This, scale}))),
        put({This, baseCharWidth}, (get({This, fontSize}) + ((6 * get({This, scale}))))),
        put({This, cellSize}, (get({This, fontSize}) + ((6 * get({This, scale}))))),
        put({This, textureSize}, (get({This, '$class'})):getAsTextureSize(This, (get({This, 'CELLS_PER_ROW'}) * get({This, cellSize})))),
        put({This, actualCellsPerRow}, (get({This, textureSize}) div get({This, cellSize}))).

getAsTextureSize(This, TextureSize) when is_integer(TextureSize) ->
        put({local, textureSize}, TextureSize),
        case (get({local, textureSize}) =< 64) of
            true ->
            put({local, textureSize}, 64);
            false ->
            case (get({local, textureSize}) =< 128) of
            true ->
            put({local, textureSize}, 128);
            false ->
            case (get({local, textureSize}) =< 256) of
            true ->
            put({local, textureSize}, 256);
            false ->
            case (get({local, textureSize}) =< 512) of
            true ->
            put({local, textureSize}, 512);
            false ->
            case (get({local, textureSize}) =< 1024) of
            true ->
            put({local, textureSize}, 1024);
            false -> ok
        end
        end
        end
        end
        end,
        get({local, textureSize}).

getCellSize(This, CellSize) when is_integer(CellSize) ->
        put({local, cellSize}, CellSize),
        case (get({local, cellSize}) =< 16) of
            true ->
            put({local, cellSize}, 16);
            false ->
            case (get({local, cellSize}) =< 32) of
            true ->
            put({local, cellSize}, 32);
            false ->
            case (get({local, cellSize}) =< 64) of
            true ->
            put({local, cellSize}, 64);
            false ->
            case (get({local, cellSize}) =< 128) of
            true ->
            put({local, cellSize}, 128);
            false ->
            case (get({local, cellSize}) =< 256) of
            true ->
            put({local, cellSize}, 256);
            false -> ok
        end
        end
        end
        end
        end,
        get({local, cellSize}).

getYOffset(This) ->
        ((((get({This, scale}) - 1)) * get({This, cellSize}))).

