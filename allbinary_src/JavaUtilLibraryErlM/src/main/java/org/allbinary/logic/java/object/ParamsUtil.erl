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
% package org.allbinary.logic.java.anyType
% import org.allbinary.logic.string.StringMaker

-module('ParamsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

viewParams(Params) when (is_tuple(Params) orelse Params =:= undefined) ->
        try
        case (Params =/= undefined) of
            true ->
            StringBuffer = 'StringMaker':new(),
            lists:foreach(fun(Index) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, " "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65770) -> (get({Target_N65770, '$class'})):getName(Target_N65770) end)(array:get(Index, Params)))
            end, lists:seq(0, array:size(Params) - 1)),
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false ->
            "Params Null"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

