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
% import org.allbinary.util.CircularIndexUtil

-module('HighScoresHelper2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScoresHelperBase', Function, Arguments).

init_fields(This) ->
    put({This, circularIndexUtil}, 'CircularIndexUtil':createInstanceAt(0, 0)),
    put({This, selectedHighScores}, 'NullHighScoresSingletonFactory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'HighScoresHelperBase':'$init'(This),
    init_fields(This).


setSelectedHighScores(This, SelectedHighScores) ->
        put({This, selectedHighScores}, SelectedHighScores).

getSelectedHighScores(This) ->
        get({This, selectedHighScores}).

setHighScoresArray(This, HighScoresArrayP) when (is_tuple(HighScoresArrayP) orelse HighScoresArrayP =:= undefined) ->
        'HighScoresHelperBase':setHighScoresArray(This, HighScoresArrayP),
        (get({get({This, circularIndexUtil}), '$class'})):setSize(get({This, circularIndexUtil}), array:size(get({This, highScoresArrayP}))),
        (get({This, '$class'})):selectHighScores(This).

selectHighScores(This) ->
        try
        case (array:size(get({This, highScoresArrayP})) =:= 0) of
            true ->
            (get({This, '$class'})):setSelectedHighScores(This, 'NullHighScoresSingletonFactory':getInstance()),
            throw({'$return', ok});
            false -> ok
        end,
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
        put({local, highScores}, array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, highScoresArrayP}))),
        put({local, index}, 0),
        (fun Loop() -> case (((get({get({local, highScores}), '$class'})):getTotal(get({local, highScores})) < 1) andalso (get({local, index}) < array:size(get({This, highScoresArrayP})))) of true ->
            put({local, highScores}, array:get((get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})), get({This, highScoresArrayP}))),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        (get({This, '$class'})):setSelectedHighScores(This, get({local, highScores}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

