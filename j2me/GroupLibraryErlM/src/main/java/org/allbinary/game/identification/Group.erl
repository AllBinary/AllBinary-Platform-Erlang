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
% package org.allbinary.game.identification
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('Group').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GroupInterface

init_fields(This) ->
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, teamId}, 0),
    put({This, string}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(TeamName, TeamId) when (is_list(TeamName) orelse TeamName =:= undefined), is_integer(TeamId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TeamName, TeamId),
    This.

'$init'(This, TeamName, TeamId) when (is_list(TeamName) orelse TeamName =:= undefined), is_integer(TeamId) ->
    init_fields(This),
        put({This, teamId}, TeamId),
        (get({This, '$class'})):setName(This, TeamName).

getGroupName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name),
        GroupCommonFactory = 'GroupCommonFactory':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({GroupCommonFactory, 'GROUP_NAME_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, name})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({GroupCommonFactory, 'ID_LABEL'})),
        (get({StringBuffer, '$class'})):appendshort(StringBuffer, get({This, teamId})),
        put({This, string}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

getGroupId(This) ->
        get({This, teamId}).

toString(This) ->
        get({This, string}).

