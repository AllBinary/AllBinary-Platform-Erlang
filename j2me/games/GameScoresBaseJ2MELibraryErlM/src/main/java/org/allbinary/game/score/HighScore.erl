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
% package org.allbinary.game.score
% import java.io.ByteArrayOutputStream
% import java.io.DataOutputStream
% import org.allbinary.game.GameInfo
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('HighScore').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, id}, 0),
    put({This, name}, undefined),
    put({This, gameInfo}, undefined),
    put({This, score}, 0),
    put({This, scoreString}, undefined),
    ok.


new(Id, Name, GameInfo, Score) when is_integer(Id), (is_list(Name) orelse Name =:= undefined), is_integer(Score) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Id, Name, GameInfo, Score),
    This.

init(This, Id, Name, GameInfo, Score) when is_integer(Id), (is_list(Name) orelse Name =:= undefined), is_integer(Score) ->
    init_fields(This),
        put({This, id}, Id),
        put({This, name}, Name),
        put({This, gameInfo}, GameInfo),
        put({This, score}, Score),
        put({This, scoreString}, allbinary_java:to_string(get({This, score}))).

getId(This) ->
        get({This, id}).

getName(This) ->
        get({This, name}).

getScore(This) ->
        get({This, score}).

% throws Exception
getAsBytes(This) ->
        ByteArrayOutputStream = 'ByteArrayOutputStream':new(),
        OutputStream = 'DataOutputStream':new(ByteArrayOutputStream),
        (get({OutputStream, '$class'})):writeUTF(OutputStream, (get({This, '$class'})):getName(This)),
        (get({OutputStream, '$class'})):writeLong(OutputStream, (get({This, '$class'})):getScore(This)),
        (get({ByteArrayOutputStream, '$class'})):toByteArray(ByteArrayOutputStream).

getGameInfo(This) ->
        get({This, gameInfo}).

getScoreString(This) ->
        get({This, scoreString}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        (fun(Target_N66700) -> (get({Target_N66700, '$class'})):toString(Target_N66700) end)((fun(Target_N66707) -> (get({Target_N66707, '$class'})):append(Target_N66707, get({This, scoreString})) end)((fun(Target_N66714) -> (get({Target_N66714, '$class'})):append(Target_N66714, get({CommonSeps, 'FORWARD_SLASH'})) end)((fun(Target_N66721) -> (get({Target_N66721, '$class'})):appendlong(Target_N66721, get({This, score})) end)((fun(Target_N66728) -> (get({Target_N66728, '$class'})):append(Target_N66728, get({CommonSeps, 'COLON'})) end)((fun(Target_N66735) -> (get({Target_N66735, '$class'})):append(Target_N66735, get({This, name})) end)('StringMaker':new())))))).

