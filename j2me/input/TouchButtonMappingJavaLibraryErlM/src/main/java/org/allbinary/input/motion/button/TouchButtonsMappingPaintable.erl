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
% package org.allbinary.input.motion.button
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.CellPositionFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('TouchButtonsMappingPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Paintable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, foregroundColor}, 0),
    put({This, paintableTable}, array:new(0, {default, array:new(0, {default, undefined})})),
    put({This, touchButtonLocationHelper}, 'TouchButtonLocationHelper':new()),
    ok.


new(BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BasicColor),
    This.

init(This, BasicColor) ->
    'Paintable':init(This),
    init_fields(This),
        put({This, foregroundColor}, (get({BasicColor, '$class'})):intValue(BasicColor)),
        (get({This, '$class'})):init(This).

init(This) ->
        try
            put({This, paintableTable}, (get({This, '$class'})):createPaintableTable(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "updateRectangle", E)
        end.

% throws Exception
createPaintableTable(This) ->
        TotalColumns = (get({get({This, touchButtonLocationHelper}), '$class'})):getTotalColumns(get({This, touchButtonLocationHelper})),
        TotalRows = (get({get({This, touchButtonLocationHelper}), '$class'})):getTotalRows(get({This, touchButtonLocationHelper})),
        PaintableTable = array:new(TotalColumns, {default, array:new(TotalRows, {default, undefined})}),
        CellPositionFactory = 'CellPositionFactory':getInstance(),
        CommonButtons = 'CommonButtons':getInstance(),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(RowIndex) ->
                put({This, paintableTable}, array:set(Index, array:set(RowIndex, 'TouchButton':createButton(get({'BasicTouchInputFactory':getInstance(), 'NONE'}), 'TouchButtonBlankResource':getInstance(), get({CommonButtons, 'NORMAL_BUTTON'}), (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, Index, RowIndex), (get({get({This, touchButtonLocationHelper}), '$class'})):getColumnsRemainderHalf(get({This, touchButtonLocationHelper})), (get({get({This, touchButtonLocationHelper}), '$class'})):getRowsRemainderHalf(get({This, touchButtonLocationHelper}))), array:get(Index, get({This, paintableTable}))), get({This, paintableTable})))
            end, lists:seq((TotalRows - 1), 0, -1))
        end, lists:seq((TotalColumns - 1), 0, -1)),
        PaintableTable.

paint(This, Graphics) ->
        TotalColumns = (get({get({This, touchButtonLocationHelper}), '$class'})):getTotalColumns(get({This, touchButtonLocationHelper})),
        TotalRows = (get({get({This, touchButtonLocationHelper}), '$class'})):getTotalRows(get({This, touchButtonLocationHelper})),
        lists:foreach(fun(Index) ->
            lists:foreach(fun(RowIndex) ->
                (fun(Target_N67034) -> (get({Target_N67034, '$class'})):paint(Target_N67034, Graphics) end)(array:get(RowIndex, array:get(Index, get({This, paintableTable}))))
            end, lists:seq((TotalRows - 1), 0, -1))
        end, lists:seq((TotalColumns - 1), 0, -1)).

