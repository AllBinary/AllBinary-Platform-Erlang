% 
% AllBinary Open License Version 1 
% Copyright (c) 2007 AllBinary 
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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('PreGameScrollSelectionTouchButtonsBuilder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseTouchInput', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BaseTouchInput':'$init'(This),
    init_fields(This).


getList(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'GET_LIST'})),
            List = 'BasicArrayListD':new(),
            TouchButtonLocationHelper = 'TouchButtonLocationHelper':new(),
            CommonButtons = 'CommonButtons':getInstance(),
            BasicTouchButtonCellPositionFactory = 'BasicTouchButtonCellPositionFactory':new(),
            LEFT = 'TouchButton':createButton(get({'BasicTouchInputFactory':getInstance(), 'LEFT'}), 'TouchButtonStrafeLeftResource':getInstance(), get({CommonButtons, 'NORMAL_BUTTON'}), get({BasicTouchButtonCellPositionFactory, 'TOP_LEFT'}), (get({TouchButtonLocationHelper, '$class'})):getColumnsRemainderHalf(TouchButtonLocationHelper), (get({TouchButtonLocationHelper, '$class'})):getRowsRemainderHalf(TouchButtonLocationHelper)),
            RIGHT = 'TouchButton':createButton(get({'BasicTouchInputFactory':getInstance(), 'RIGHT'}), 'TouchButtonStrafeRightResource':getInstance(), get({CommonButtons, 'NORMAL_BUTTON'}), get({BasicTouchButtonCellPositionFactory, 'TOP_RIGHT'}), (get({TouchButtonLocationHelper, '$class'})):getColumnsRemainderHalf(TouchButtonLocationHelper), (get({TouchButtonLocationHelper, '$class'})):getRowsRemainderHalf(TouchButtonLocationHelper)),
            START = 'TouchButton':createButton(get({'BasicTouchInputFactory':getInstance(), 'SPECIAL_BUTTON_FIVE'}), 'TouchButtonStartResource':getInstance(), get({CommonButtons, 'NORMAL_BUTTON'}), get({BasicTouchButtonCellPositionFactory, 'BOTTOM_RIGHT'}), (get({TouchButtonLocationHelper, '$class'})):getColumnsRemainderHalf(TouchButtonLocationHelper), (get({TouchButtonLocationHelper, '$class'})):getRowsRemainderHalf(TouchButtonLocationHelper)),
            (get({List, '$class'})):add(List, LEFT),
            (get({List, '$class'})):add(List, RIGHT),
            (get({List, '$class'})):add(List, START),
            List
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'GET_LIST'}), E),
            (fun(Target_N66687) -> (get({Target_N66687, '$class'})):getImmutableInstance(Target_N66687) end)('BasicArrayListUtil':getInstance())
        end.

