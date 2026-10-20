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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('HighScores').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements HighScoresInterface

init_fields(This) ->
    put({This, orderedHighScoresList}, 'BasicArrayListD':new()),
    put({This, name}, undefined),
    put({This, heading}, undefined),
    put({This, columnOneHeading}, "Name"),
    put({This, columnTwoHeading}, undefined),
    ok.


new(Name, Heading, ColumnTwoHeading) when (is_list(Name) orelse Name =:= undefined), (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, Heading, ColumnTwoHeading),
    This.

'$init'(This, Name, Heading, ColumnTwoHeading) when (is_list(Name) orelse Name =:= undefined), (is_list(Heading) orelse Heading =:= undefined), (is_list(ColumnTwoHeading) orelse ColumnTwoHeading =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, heading}, Heading),
        put({This, columnTwoHeading}, ColumnTwoHeading).

setList(This, OrderedHighScoresList) ->
        put({This, orderedHighScoresList}, OrderedHighScoresList).

getList(This) ->
        get({This, orderedHighScoresList}).

getName(This) ->
        get({This, name}).

getTotal(This) ->
        (fun(Target_N66255) -> (get({Target_N66255, '$class'})):size(Target_N66255) end)((get({This, '$class'})):getList(This)).

addHighScore(This, NewHighScore) ->
        (get({get({This, orderedHighScoresList}), '$class'})):add(get({This, orderedHighScoresList}), NewHighScore).

getHeading(This) ->
        get({This, heading}).

getColumnOneHeading(This) ->
        get({This, columnOneHeading}).

getColumnTwoHeading(This) ->
        get({This, columnTwoHeading}).

% throws Exception
isBestScore(This, NewHighScore) ->
        false.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "HighScores: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, heading})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'TOTAL_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({This, orderedHighScoresList}), '$class'})):size(get({This, orderedHighScoresList}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

