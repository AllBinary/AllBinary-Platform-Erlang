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
% import org.allbinary.canvas.GameStatisticsFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.graphics.paint.InitUpdatePaintable

-module('GamePerformanceInitUpdatePaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitUpdatePaintable', Function, Arguments).

init_fields(This) ->
    put({This, halfHeight}, (fun(Target_N65888) -> (get({Target_N65888, '$class'})):getLastHalfHeight(Target_N65888) end)('DisplayInfoSingleton':getInstance())),
    put({This, yArray}, array:from_list([(get({This, halfHeight}) + 30), (get({This, halfHeight}) + 30), ((get({This, halfHeight}) + 30) + 15), ((get({This, halfHeight}) + 30) + 15), ((get({This, halfHeight}) + 30) + 30), ((get({This, halfHeight}) + 30) + 30), ((get({This, halfHeight}) + 30) + 45), ((get({This, halfHeight}) + 30) + 45)])),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, baseRefreshHelperCharArray}, array:new(0, {default, array:new(0, {default, 0})})),
    put({This, defaultStringWidth}, 0),
    put({This, 'RED'}, (fun(Target_N66655) -> (get({Target_N66655, '$class'})):intValue(Target_N66655) end)(get({'BasicColorFactory':getInstance(), 'RED'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'InitUpdatePaintable':'$init'(This),
    init_fields(This).


updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, defaultStringWidth}, 'MyFontProcessor':defaultStringWidth(Font, 2)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

init(This) ->
        ok.

update(This) ->
        put({This, baseRefreshHelperCharArray}, (fun(Target_N66578) -> (get({Target_N66578, '$class'})):to2DCharArray(Target_N66578) end)('GameStatisticsFactory':getInstance())).

paint(This, Graphics) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        (get({Graphics, '$class'})):setColor(Graphics, get({This, 'RED'})),
        put({local, charArray}, undefined),
        put({local, charArray2}, undefined),
        put({local, size2}, 0),
        put({local, size3}, 0),
        Size = (array:size(get({This, baseRefreshHelperCharArray})) - 2),
        lists:foreach(fun(Index) ->
            put({local, charArray}, array:get(Index, get({This, baseRefreshHelperCharArray}))),
            put({local, charArray2}, array:get((Index + 1), get({This, baseRefreshHelperCharArray}))),
            put({local, size2}, array:size(get({local, charArray}))),
            put({local, size3}, array:size(get({local, charArray2}))),
            (get({Graphics, '$class'})):drawChars(Graphics, get({local, charArray}), 0, get({local, size2}), 0, array:get(Index, get({This, yArray})), 0),
            (get({Graphics, '$class'})):drawChars(Graphics, get({local, charArray2}), 0, get({local, size3}), (get({local, size2}) * get({This, defaultStringWidth})), array:get((Index + 1), get({This, yArray})), 0)
        end, lists:seq(Size, 0, -2)).

