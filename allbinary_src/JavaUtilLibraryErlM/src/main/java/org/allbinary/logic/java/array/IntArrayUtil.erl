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
% package org.allbinary.logic.java.array
% import org.allbinary.logic.string.StringMaker

-module('IntArrayUtil').
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

toString(Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(Index, Array)),
            case (Index < array:size(Array)) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, ", ");
                false -> ok
            end
        end, lists:seq(0, array:size(Array) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer);
toString(Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "{"),
            lists:foreach(fun(Index2) ->
                (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(array:get(Index2, array:get(Index, Array)))),
                case (Index2 < (array:size(array:get(Index, Array)) - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, ", ");
                    false -> ok
                end
            end, lists:seq(0, array:size(array:get(Index, Array)) - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "}"),
            case (Index < (array:size(Array) - 1)) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, ", \n");
                false -> ok
            end
        end, lists:seq(0, array:size(Array) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer);
toString(Array) when (is_tuple(Array) orelse Array =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "{"),
            lists:foreach(fun(Index2) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, "{"),
                lists:foreach(fun(Index3) ->
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc(array:get(Index3, array:get(Index2, array:get(Index, Array))))),
                    case (Index3 < (array:size(array:get(Index2, array:get(Index, Array))) - 1)) of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, ", ");
                        false -> ok
                    end
                end, lists:seq(0, array:size(array:get(Index2, array:get(Index, Array))) - 1)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "}"),
                case (Index2 < (array:size(array:get(Index, Array)) - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, ", ");
                    false -> ok
                end
            end, lists:seq(0, array:size(array:get(Index, Array)) - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "}"),
            case (Index < (array:size(Array) - 1)) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, ", \n");
                false -> ok
            end
        end, lists:seq(0, array:size(Array) - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).



