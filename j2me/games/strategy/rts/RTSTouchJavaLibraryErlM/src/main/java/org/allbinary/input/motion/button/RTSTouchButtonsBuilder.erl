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

-module('RTSTouchButtonsBuilder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseTouchInput', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BaseTouchInput':init(This),
    init_fields(This).


getList(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            List = 'BasicArrayListD':new(),
            (get({List, '$class'})):addAllList(List, (fun(Target_N65908) -> (get({Target_N65908, '$class'})):getList(Target_N65908) end)('BasicTouchButtonsBuilder':new())),
            (get({List, '$class'})):addAllList(List, (fun(Target_N65951) -> (get({Target_N65951, '$class'})):getList(Target_N65951) end)('BuildingScrollTouchButtonsBuilder':new())),
            (get({List, '$class'})):addAllList(List, (fun(Target_N65994) -> (get({Target_N65994, '$class'})):getList(Target_N65994) end)('UpgradeDowngradeTouchButtonsBuilder':new())),
            List
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E),
            (fun(Target_N66119) -> (get({Target_N66119, '$class'})):getImmutableInstance(Target_N66119) end)('BasicArrayListUtil':getInstance())
        end.

