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
% package org.allbinary.game.input
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('Input').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, id}, 0),
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Id, Name) when is_integer(Id), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Id, Name),
    This.

'$init'(This, Id, Name) when is_integer(Id), (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setId(This, Id),
        (get({This, '$class'})):setName(This, Name).

getId(This) ->
        get({This, id}).

setId(This, Key) when is_integer(Key) ->
        put({This, id}, Key).

getName(This) ->
        get({This, name}).

setName(This, KeyName) when (is_list(KeyName) orelse KeyName =:= undefined) ->
        put({This, name}, KeyName).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Name: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Id: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getId(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

