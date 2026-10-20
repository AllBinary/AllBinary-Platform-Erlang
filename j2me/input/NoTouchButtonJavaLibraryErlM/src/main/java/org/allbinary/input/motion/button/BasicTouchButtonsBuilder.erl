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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('BasicTouchButtonsBuilder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseTouchInput', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'BasicTouchButtonsBuilder':new()),
    ok.

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


getInstance() ->
        get({'BasicTouchButtonsBuilder', 'SINGLETON'}).

getList(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'GET_LIST'})),
            List = 'BasicArrayListD':new(),
            List
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'GET_LIST'}), E),
            (fun(Target_N66123) -> (get({Target_N66123, '$class'})):getImmutableInstance(Target_N66123) end)('BasicArrayListUtil':getInstance())
        end.

