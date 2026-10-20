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
% import java.lang.reflect.Constructor
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('ConstructorUtil').
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

viewAll(MyClass, LineBreak) when (is_list(LineBreak) orelse LineBreak =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        Constructor = (get({MyClass, '$class'})):getConstructors(MyClass),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Constructors: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, 'ConstructorUtil':view(array:get(Index, Constructor), LineBreak))
        end, lists:seq(0, array:size(Constructor) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

view(Constructor, LineBreak) when (is_list(LineBreak) orelse LineBreak =:= undefined) ->
        try
        case (Constructor =/= undefined) of
            true ->
            CommonSeps = 'CommonSeps':getInstance(),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({Constructor, '$class'})):getName(Constructor)),
            Classes = (get({Constructor, '$class'})):getParameterTypes(Constructor),
            lists:foreach(fun(Index) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66399) -> (get({Target_N66399, '$class'})):getName(Target_N66399) end)(array:get(Index, Classes))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COLON'})),
                (get({StringBuffer, '$class'})):appendint(StringBuffer, Index)
            end, lists:seq(0, array:size(Classes) - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, LineBreak),
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false ->
            "Constructor Null"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

