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
% import org.allbinary.string.CommonSeps

-module('InterfaceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

viewAll(MyClass, LineBreak) when (is_list(LineBreak) orelse LineBreak =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        Interfaces = (get({MyClass, '$class'})):getInterfaces(MyClass),
        (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Interfaces: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Interface: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65914) -> (get({Target_N65914, '$class'})):getName(Target_N65914) end)(array:get(Index, Interfaces))),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak)
        end, lists:seq(0, array:size(Interfaces) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getClass(InterfaceName, Interfaces) when (is_list(InterfaceName) orelse InterfaceName =:= undefined), (is_tuple(Interfaces) orelse Interfaces =:= undefined) ->
        try
        case (((InterfaceName =/= undefined) andalso (Interfaces =/= undefined)) andalso (array:size(Interfaces) > 0)) of
            true ->
            lists:foreach(fun(Index) ->
                case ((fun(Target_N66245) -> (get({Target_N66245, '$class'})):indexOf(Target_N66245, InterfaceName) end)((fun(Target_N66252) -> (get({Target_N66252, '$class'})):getName(Target_N66252) end)(array:get(Index, Interfaces))) >= 0) of
                    true ->
                    throw({'$return', array:get(Index, Interfaces)});
                    false -> ok
                end
            end, lists:seq(0, array:size(Interfaces) - 1));
            false -> ok
        end,
        undefined
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isImplemented(ClassName, AnyType) when (is_list(ClassName) orelse ClassName =:= undefined) ->
        try
        Classes = (get({get({AnyType, '$class'}), '$class'})):getInterfaces(get({AnyType, '$class'})),
        lists:foreach(fun(Index) ->
            case ((fun(Target_N66863) -> (get({Target_N66863, '$class'})):indexOf(Target_N66863, ClassName) end)((fun(Target_N66870) -> (get({Target_N66870, '$class'})):getName(Target_N66870) end)(array:get(Index, Classes))) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, array:size(Classes) - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
isImplemented(Clazz, AnyType) ->
        Classes = (get({get({AnyType, '$class'}), '$class'})):getInterfaces(get({AnyType, '$class'})),
        lists:foreach(fun(Index) ->
            case ((fun(Target_N66574) -> (get({Target_N66574, '$class'})):compareTo(Target_N66574, (fun(Target_N66599) -> (get({Target_N66599, '$class'})):getName(Target_N66599) end)(array:get(Index, Classes))) end)((get({Clazz, '$class'})):getName(Clazz)) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, array:size(Classes) - 1)),
        false.


isImplementedView(Clazz, AnyType) ->
        StringBuffer = 'StringMaker':new(),
        Classes = (get({get({AnyType, '$class'}), '$class'})):getInterfaces(get({AnyType, '$class'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "isImplementedView: \n"),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({Clazz, '$class'})):getName(Clazz)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " should be = "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N67296) -> (get({Target_N67296, '$class'})):getName(Target_N67296) end)(array:get(Index, Classes))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N67347) -> (get({Target_N67347, '$class'})):getName(Target_N67347) end)(array:get(Index, Classes))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'}))
        end, lists:seq(0, array:size(Classes) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

