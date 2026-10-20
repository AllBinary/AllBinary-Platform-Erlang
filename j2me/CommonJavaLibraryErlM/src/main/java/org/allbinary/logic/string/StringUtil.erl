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
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('StringUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StringUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'INIT_STRING'}, allbinary_java:to_string("")),
    put({This, 'NULL_STRING'}, "null"),
    put({This, 'EMPTY_STRING'}, ""),
    put({This, 'ONE_EMPTY_STRING_ARRAY'}, array:from_list([get({This, 'EMPTY_STRING'})])),
    put({This, stringArray}, array:new(0, {default, undefined})),
    ok.


getInstance() ->
        get({'StringUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getNonNull(This, String) when (is_list(String) orelse String =:= undefined) ->
        try
        case (String =:= undefined) of
            true ->
            throw({'$return', get({This, 'EMPTY_STRING'})});
            false ->
            throw({'$return', String})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getArrayInstance(This) ->
        get({This, stringArray}).

count(This, String, AChar) when (is_list(String) orelse String =:= undefined), is_integer(AChar) ->
        put({local, count}, 0),
        Size = string:length(String),
        lists:foreach(fun(Index) ->
            case (lists:nth((Index) + 1, String) =:= AChar) of
                true ->
                put({local, count}, get({local, count}) + 1);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        get({local, count}).

toString(This, AnyType) ->
        try
        case (AnyType =/= undefined) of
            true ->
            throw({'$return', (get({AnyType, '$class'})):toString(AnyType)});
            false ->
            throw({'$return', get({This, 'NULL_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

