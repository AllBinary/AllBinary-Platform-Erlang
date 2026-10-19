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
% package org.allbinary.logic.math.permutations
% import org.allbinary.TsUtil

-module('ComparableObject').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Comparable

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


compareTo(This, AnyType) ->
        try
        case ((fun(Target_N65649) -> (get({Target_N65649, '$class'})):hashCode(Target_N65649, This) end)('TsUtil':getInstance()) < (fun(Target_N65679) -> (get({Target_N65679, '$class'})):hashCode(Target_N65679, AnyType) end)('TsUtil':getInstance())) of
            true ->
            throw({'$return', (-1)});
            false ->
            case ((fun(Target_N65722) -> (get({Target_N65722, '$class'})):hashCode(Target_N65722, This) end)('TsUtil':getInstance()) > (fun(Target_N65752) -> (get({Target_N65752, '$class'})):hashCode(Target_N65752, AnyType) end)('TsUtil':getInstance())) of
            true ->
            throw({'$return', 1});
            false -> ok
        end
        end,
        0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

