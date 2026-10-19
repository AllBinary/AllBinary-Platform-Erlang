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
% package org.allbinary.logic.java.bool
% import org.allbinary.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil

-module('BooleanUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BooleanUtil':new()),
    ok.

init_fields(This) ->
    put({This, tsUtil}, 'TsUtil':getInstance()),
    ok.


getInstance() ->
        get({'BooleanUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getFromString(This, BooleanString) when (is_list(BooleanString) orelse BooleanString =:= undefined) ->
        try
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        BooleanFactory = 'BooleanFactory':getInstance(),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, BooleanString) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        BooleanStringLowerCase = string:lowercase(BooleanString),
        case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), BooleanStringLowerCase, get({BooleanFactory, 'TRUE_STRING'})) =:= 0) of
            true ->
            throw({'$return', true});
            false ->
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), BooleanStringLowerCase, get({BooleanFactory, 'FALSE_STRING'})) =:= 0) of
            true ->
            throw({'$return', false});
            false ->
            erlang:error({'Exception', "Invalid booleanString - Must be true or false"})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isStringBoolean(This, BooleanString) when (is_list(BooleanString) orelse BooleanString =:= undefined) ->
        try
        BooleanFactory = 'BooleanFactory':getInstance(),
        BooleanStringLowerCase = string:lowercase(BooleanString),
        case (((get({BooleanStringLowerCase, '$class'})):compareTo(BooleanStringLowerCase, get({BooleanFactory, 'TRUE_STRING'})) =:= 0) orelse ((get({BooleanStringLowerCase, '$class'})):compareTo(BooleanStringLowerCase, get({BooleanFactory, 'FALSE_STRING'})) =:= 0)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toStringFromBooleanArray(This, BooleanArray) when (is_tuple(BooleanArray) orelse BooleanArray =:= undefined) ->
        StringMaker = 'StringMaker':new(),
        Size = array:size(BooleanArray),
        lists:foreach(fun(Index) ->
            (get({StringMaker, '$class'})):appendboolean(StringMaker, array:get(Index, BooleanArray))
        end, lists:seq(0, Size - 1)),
        (get({StringMaker, '$class'})):toString(StringMaker).

