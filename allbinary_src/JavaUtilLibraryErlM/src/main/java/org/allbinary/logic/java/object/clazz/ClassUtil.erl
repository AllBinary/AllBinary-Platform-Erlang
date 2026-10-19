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
% package org.allbinary.logic.java.anyType.clazz
% import org.allbinary.logic.java.anyType.ConstructorUtil
% import org.allbinary.logic.java.anyType.InterfaceUtil
% import org.allbinary.logic.java.anyType.MethodUtil
% import org.allbinary.logic.string.StringMaker

-module('ClassUtil').
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

viewAll(AnyType, LineBreak) when (is_list(LineBreak) orelse LineBreak =:= undefined) ->
        try
        case (AnyType =/= undefined) of
            true ->
            throw({'$return', 'ClassUtil':viewAll(get({AnyType, '$class'}), LineBreak)});
            false ->
            "Object Null"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
viewAll(MyClass, LineBreak) when (is_list(LineBreak) orelse LineBreak =:= undefined) ->
        try
        case (MyClass =/= undefined) of
            true ->
            StringBuffer = 'StringMaker':new(),
            Classes = (get({MyClass, '$class'})):getClasses(MyClass),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Class: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({MyClass, '$class'})):getName(MyClass)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " uses "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, array:size(Classes)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " other classes"),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Classes: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
            lists:foreach(fun(Index) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "Class: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66395) -> (get({Target_N66395, '$class'})):getName(Target_N66395) end)(array:get(Index, Classes))),
                (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak)
            end, lists:seq(0, array:size(Classes) - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'InterfaceUtil':viewAll(MyClass, LineBreak)),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'ConstructorUtil':viewAll(MyClass, LineBreak)),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'MethodUtil':viewAll(MyClass, LineBreak)),
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false ->
            "Class Null"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.


