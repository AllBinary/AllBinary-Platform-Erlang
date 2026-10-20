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
% package org.allbinary.business.user.password
% import java.util.HashMap
% import java.util.Random
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.UserData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.SuperCrypt
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings

-module('Password').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, password}, undefined),
    ok.


new(Password) when (is_list(Password) orelse Password =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Password),
    This.

'$init'(This, Password) when (is_list(Password) orelse Password =:= undefined) ->
    init_fields(This),
        put({This, password}, Password).

set(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, password}, Value).

get(This) ->
        get({This, password}).

isValid(This) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            put({local, valid}, true),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VALIDATION'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Password: ", get({This, password})]), This, get({CommonStrings, 'IS_VALID'}));
                false -> ok
            end,
            case (not (fun(Target_N66545) -> (get({Target_N66545, '$class'})):isValidRequired(Target_N66545, get({This, password}), 6, get({'UserData', 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VALIDATION'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Password is invalid", This, get({CommonStrings, 'IS_VALID'}));
                    false -> ok
                end,
                put({local, valid}, false);
                false -> ok
            end,
            get({local, valid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VALIDATIONERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", "Password", get({CommonStrings, 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

getValidationInfo(This) ->
        try
        case (not (fun(Target_N67203) -> (get({Target_N67203, '$class'})):isValidRequired(Target_N67203, get({This, password}), 6, get({'UserData', 'MAXLEN'})) end)('StringValidationUtil':getInstance())) of
            true ->
            throw({'$return', "Please enter a Password with more than 6 characters.<br />"});
            false -> ok
        end,
        StringUtil = 'StringUtil':getInstance(),
        get({StringUtil, 'EMPTY_STRING'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toVector(This, Secret) when (is_list(Secret) orelse Secret =:= undefined) ->
        put({This, password}, (fun(Target_N67396) -> (get({Target_N67396, '$class'})):getNonNull(Target_N67396, get({This, password})) end)('StringUtil':getInstance())),
        Random = (fun(Target_N67447) -> (get({Target_N67447, '$class'})):nextInt(Target_N67447, get({'SuperCrypt', 'KEYMAX'})) end)('Random':new()),
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, (get({Random, '$class'})):toString(Random)),
        (get({Vector, '$class'})):add(Vector, Secret),
        (get({Vector, '$class'})):add(Vector, (fun(Target_N67642) -> (get({Target_N67642, '$class'})):encrypt(Target_N67642, get({This, password})) end)('SuperCrypt':new(Random))),
        Vector.

toHashMap(This, Secret) when (is_list(Secret) orelse Secret =:= undefined) ->
        put({This, password}, (fun(Target_N67770) -> (get({Target_N67770, '$class'})):getNonNull(Target_N67770, get({This, password})) end)('StringUtil':getInstance())),
        Values = (fun(Target_N67821) -> (get({Target_N67821, '$class'})):createHashMap(Target_N67821) end)('StdUtil':getInstance()),
        Random = (fun(Target_N67872) -> (get({Target_N67872, '$class'})):nextInt(Target_N67872, get({'SuperCrypt', 'KEYMAX'})) end)('Random':new()),
        (get({Values, '$class'})):put(Values, get({'EntryData':getInstance(), 'ENCRYPTION'}), (get({Random, '$class'})):toString(Random)),
        (get({Values, '$class'})):put(Values, get({'UserData', 'SECRET'}), Secret),
        (get({Values, '$class'})):put(Values, get({'UserData', 'PASSWORD'}), (fun(Target_N68084) -> (get({Target_N68084, '$class'})):encrypt(Target_N68084, get({This, password})) end)('SuperCrypt':new(Random))),
        Values.

