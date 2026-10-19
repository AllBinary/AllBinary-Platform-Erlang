% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('HighScoresHelperBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HighScoresHelperBaseInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, highScoresArrayP}, get({'LastFetchHighScoresFactory':getInstance(), highScoresArray})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


setHighScoresArray(This, HighScoresArrayP) when (is_tuple(HighScoresArrayP) orelse HighScoresArrayP =:= undefined) ->
        case (HighScoresArrayP =/= undefined) of
            true ->
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66008) -> (get({Target_N66008, '$class'})):toString(Target_N66008) end)((fun(Target_N66015) -> (get({Target_N66015, '$class'})):appendint(Target_N66015, array:size(HighScoresArrayP)) end)((fun(Target_N66022) -> (get({Target_N66022, '$class'})):append(Target_N66022, get({get({local, commonStrings}), 'START'})) end)('StringMaker':new()))), This, "setHighScoresArray");
            false ->
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({local, commonStrings}), 'START'}), This, "setHighScoresArray")
        end,
        put({This, highScoresArrayP}, HighScoresArrayP).

getNextHighScores(This) ->
        'NullHighScoresSingletonFactory':getInstance().

isAnyHighScores(This) ->
        erlang:error({'RuntimeException'}).

setSelectedHighScores(This, SelectedHighScores) ->
        ok.

getSelectedHighScores(This) ->
        'NullHighScoresSingletonFactory':getInstance().

getHighScoresArray(This) ->
        get({This, highScoresArrayP}).

selectHighScores(This) ->
        ok.

