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
% import java.lang.reflect.Method
% import org.allbinary.logic.string.StringMaker

-module('MethodUtil').
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
        Method = (get({MyClass, '$class'})):getMethods(MyClass),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Methods: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65842) -> (get({Target_N65842, '$class'})):getName(Target_N65842) end)((fun(Target_N65849) -> (get({Target_N65849, '$class'})):getReturnType(Target_N65849) end)(array:get(Index, Method)))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65928) -> (get({Target_N65928, '$class'})):getName(Target_N65928) end)(array:get(Index, Method))),
            (get({StringBuffer, '$class'})):append(StringBuffer, "("),
            'ParamsUtil':viewParams((fun(Target_N66006) -> (get({Target_N66006, '$class'})):getParameterTypes(Target_N66006) end)(array:get(Index, Method))),
            (get({StringBuffer, '$class'})):append(StringBuffer, ")"),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak)
        end, lists:seq(0, array:size(Method) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

