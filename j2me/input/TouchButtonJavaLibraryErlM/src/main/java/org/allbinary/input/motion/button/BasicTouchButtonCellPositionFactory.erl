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
% import org.allbinary.graphics.CellPosition
% import org.allbinary.graphics.CellPositionFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('BasicTouchButtonCellPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'TOP_RIGHT'}, undefined),
    put({This, 'TOP_LEFT'}, undefined),
    put({This, 'SECOND_FROM_TOP_LEFT'}, undefined),
    put({This, 'SECOND_FROM_TOP_RIGHT'}, undefined),
    put({This, 'TOP_SECOND_FROM_LEFT'}, undefined),
    put({This, 'TOP_SECOND_FROM_RIGHT'}, undefined),
    put({This, 'BOTTOM_RIGHT'}, undefined),
    put({This, 'BOTTOM_SECOND_FROM_RIGHT'}, undefined),
    put({This, 'SECOND_FROM_BOTTOM_RIGHT'}, undefined),
    put({This, 'THIRD_FROM_BOTTOM_RIGHT'}, undefined),
    put({This, 'FOURTH_FROM_BOTTOM_RIGHT'}, undefined),
    put({This, 'SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT'}, undefined),
    put({This, 'SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT'}, undefined),
    put({This, 'SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT'}, undefined),
    put({This, 'BOTTOM_THIRD_FROM_RIGHT'}, undefined),
    put({This, 'BOTTOM_FOURTH_FROM_RIGHT'}, undefined),
    put({This, 'BOTTOM_SECOND_FROM_LEFT'}, undefined),
    put({This, 'SECOND_FROM_BOTTOM_LEFT'}, undefined),
    put({This, 'THIRD_FROM_BOTTOM_LEFT'}, undefined),
    put({This, 'BOTTOM_LEFT'}, undefined),
    put({This, 'SECOND_FROM_BOTTOM_SECOND_FROM_LEFT'}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        TouchButtonLocationHelper = 'TouchButtonLocationHelper':new(),
        CellPositionFactory = 'CellPositionFactory':getInstance(),
        (get({CellPositionFactory, '$class'})):init(CellPositionFactory, (get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper), (get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper)),
        put({This, 'TOP_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 0, 0)),
        put({This, 'TOP_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 1), 0)),
        put({This, 'BOTTOM_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 0, ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 1))),
        put({This, 'BOTTOM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 1), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 1))),
        put({This, 'BOTTOM_SECOND_FROM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 2), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 1))),
        put({This, 'SECOND_FROM_BOTTOM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 1), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 2))),
        put({This, 'SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 2), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 2))),
        put({This, 'BOTTOM_SECOND_FROM_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 1, ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 1))),
        put({This, 'SECOND_FROM_BOTTOM_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 0, ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 2))),
        put({This, 'SECOND_FROM_BOTTOM_SECOND_FROM_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 1, ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 2))),
        case ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) > 2) of
            true ->
            put({This, 'SECOND_FROM_TOP_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 0, 1)),
            put({This, 'SECOND_FROM_TOP_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 1), 1));
            false ->
            put({This, 'SECOND_FROM_TOP_LEFT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'SECOND_FROM_TOP_RIGHT'}, get({CellPositionFactory, 'NONE'}))
        end,
        case ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) >= 4) of
            true ->
            put({This, 'THIRD_FROM_BOTTOM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 1), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 3))),
            put({This, 'FOURTH_FROM_BOTTOM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 1), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 4))),
            put({This, 'THIRD_FROM_BOTTOM_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 0, ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 3)));
            false ->
            put({This, 'THIRD_FROM_BOTTOM_RIGHT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'FOURTH_FROM_BOTTOM_RIGHT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'THIRD_FROM_BOTTOM_LEFT'}, get({CellPositionFactory, 'NONE'}))
        end,
        case ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) >= 4) of
            true ->
            put({This, 'SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 3), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 2))),
            put({This, 'SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 4), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 2))),
            put({This, 'BOTTOM_THIRD_FROM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 3), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 1))),
            put({This, 'BOTTOM_FOURTH_FROM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 4), ((get({TouchButtonLocationHelper, '$class'})):getTotalRows(TouchButtonLocationHelper) - 1))),
            put({This, 'TOP_SECOND_FROM_LEFT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, 1, 0)),
            put({This, 'TOP_SECOND_FROM_RIGHT'}, (get({CellPositionFactory, '$class'})):getInstanceColRow(CellPositionFactory, ((get({TouchButtonLocationHelper, '$class'})):getTotalColumns(TouchButtonLocationHelper) - 2), 0));
            false ->
            put({This, 'SECOND_FROM_BOTTOM_THIRD_FROM_RIGHT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'SECOND_FROM_BOTTOM_FOURTH_FROM_RIGHT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'BOTTOM_THIRD_FROM_RIGHT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'BOTTOM_FOURTH_FROM_RIGHT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'TOP_SECOND_FROM_LEFT'}, get({CellPositionFactory, 'NONE'})),
            put({This, 'TOP_SECOND_FROM_RIGHT'}, get({CellPositionFactory, 'NONE'}))
        end.

