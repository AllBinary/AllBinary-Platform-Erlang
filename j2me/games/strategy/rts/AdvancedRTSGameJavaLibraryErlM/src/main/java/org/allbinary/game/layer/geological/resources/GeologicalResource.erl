% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.geological.resources

-module('GeologicalResource').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, total}, 0),
    put({This, initTotal}, 0),
    ok.


new(InitTotal) when is_integer(InitTotal) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InitTotal),
    This.

init(This, InitTotal) when is_integer(InitTotal) ->
    init_fields(This),
        put({This, initTotal}, InitTotal),
        (get({This, '$class'})):init(This).

init(This) ->
        (get({This, '$class'})):setTotal(This, get({This, initTotal})).

add(This, Value) when is_integer(Value) ->
        Max = get({'Integer', 'MAX_VALUE'}),
        case (((get({This, '$class'})):getTotal(This) + Value) > Max) of
            true ->
            (get({This, '$class'})):setTotal(This, Max);
            false ->
            (get({This, '$class'})):setTotal(This, ((get({This, '$class'})):getTotal(This) + Value))
        end.

remove(This, Value) when is_integer(Value) ->
        case (((get({This, '$class'})):getTotal(This) - Value) < 0) of
            true ->
            (get({This, '$class'})):setTotal(This, 0);
            false ->
            (get({This, '$class'})):setTotal(This, ((get({This, '$class'})):getTotal(This) - Value))
        end.

getTotal(This) ->
        get({This, total}).

setTotal(This, Total) when is_integer(Total) ->
        put({This, total}, Total).

