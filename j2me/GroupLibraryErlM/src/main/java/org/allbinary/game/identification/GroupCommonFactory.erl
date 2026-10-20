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
% package org.allbinary.game.identification
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory

-module('GroupCommonFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'ID'}, (fun(Target_N65878) -> (get({Target_N65878, '$class'})):getAt(Target_N65878, 10) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, 'GROUP_NAME_LABEL'}, "Group Name: "),
    put({This, 'ID_LABEL'}, " Id: "),
    put({This, 'ADDING_LABEL'}, "Adding: "),
    put({This, 'TO_LABEL'}, " to: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        case (get({'GroupCommonFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GroupCommonFactory', instance}, 'GroupCommonFactory':new());
            false -> ok
        end,
        get({'GroupCommonFactory', instance}).

