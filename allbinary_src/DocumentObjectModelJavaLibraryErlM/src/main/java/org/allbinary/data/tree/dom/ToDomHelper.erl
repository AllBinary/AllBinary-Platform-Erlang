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
% package org.allbinary.data.tree.dom
% import org.allbinary.logic.string.StringUtil

-module('ToDomHelper').
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

convertNull(Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({local, value}, Value),
        case (get({local, value}) =:= undefined) of
            true ->
            put({local, value}, get({'StringUtil':getInstance(), 'NULL_STRING'}));
            false -> ok
        end,
        get({local, value}).

