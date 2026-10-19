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
% import org.allbinary.TsUtil

-module('StringValidationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StringValidationUtil':new()),
    ok.

init_fields(This) ->
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    ok.


getInstance() ->
        get({'StringValidationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

containsSpaces(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
        case (allbinary_java:index_of(Value, $\s) >= 0) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isNumber(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
        put({local, numberOfDecimalPoints}, 0),
        lists:foreach(fun(Index) ->
            Digit = lists:nth((Index) + 1, Value),
            case ((not (get({This, '$class'})):isNumberFromChar(This, Digit)) andalso (Digit =/= $.)) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case (Digit =:= $.) of
                true ->
                put({local, numberOfDecimalPoints}, get({local, numberOfDecimalPoints}) + 1),
                case (get({local, numberOfDecimalPoints}) > 1) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, string:length(Value) - 1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isNumberFromChar(This, Digit) when is_integer(Digit) ->
        try
        case ((((((((((Digit =/= $0) andalso (Digit =/= $1)) andalso (Digit =/= $2)) andalso (Digit =/= $3)) andalso (Digit =/= $4)) andalso (Digit =/= $5)) andalso (Digit =/= $6)) andalso (Digit =/= $7)) andalso (Digit =/= $8)) andalso (Digit =/= $9)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValidRequired(This, Value, Min, Max) when (is_list(Value) orelse Value =:= undefined), is_integer(Min), is_integer(Max) ->
        try
        case (((Value =:= undefined) orelse (string:length(Value) < Min)) orelse (string:length(Value) > Max)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValidRequiredNumber(This, Value, Min, Max) when (is_list(Value) orelse Value =:= undefined), is_integer(Min), is_integer(Max) ->
        try
        case (((get({This, '$class'})):isEmpty(This, Value) orelse (string:length(Value) < Min)) orelse (string:length(Value) > Max)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        case (not (get({This, '$class'})):isNumber(This, Value)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValidNotRequired(This, Value, Min, Max) when (is_list(Value) orelse Value =:= undefined), is_integer(Min), is_integer(Max) ->
        try
        case (Value =/= undefined) of
            true ->
            case ((string:length(Value) < Min) orelse (string:length(Value) > Max)) of
                true ->
                throw({'$return', false});
                false -> ok
            end;
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValidNotRequiredNumber(This, Value, Min, Max) when (is_list(Value) orelse Value =:= undefined), is_integer(Min), is_integer(Max) ->
        try
        case (Value =/= undefined) of
            true ->
            case ((((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Value, get({get({This, stringUtil}), 'NULL_STRING'})) =:= 0) orelse (string:length(Value) < Min)) orelse (string:length(Value) > Max)) of
                true ->
                throw({'$return', false});
                false -> ok
            end,
            case (not (get({This, '$class'})):isNumber(This, Value)) of
                true ->
                throw({'$return', false});
                false -> ok
            end;
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isEmpty(This, String) when (is_list(String) orelse String =:= undefined) ->
        try
        case (((String =/= undefined) andalso ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), String, get({get({This, stringUtil}), 'NULL_STRING'})) =/= 0)) andalso ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), String, get({get({This, stringUtil}), 'EMPTY_STRING'})) =/= 0)) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

