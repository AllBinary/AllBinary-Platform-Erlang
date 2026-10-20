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
% package org.allbinary.logic.string

-module('StringValidationJSEUtil').
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

isBlank(String) when (is_list(String) orelse String =:= undefined) ->
        try
        Len = string:length(String),
        lists:foreach(fun(I) ->
            C = lists:nth((I) + 1, String),
            case ('Character':isWhitespace(C) =:= false) of
                true ->
                throw({'$return', false});
                false -> ok
            end
        end, lists:seq(0, Len - 1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

