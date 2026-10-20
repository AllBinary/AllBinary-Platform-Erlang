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

-module('HighScoresHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScoresHelperBase', Function, Arguments).

init_fields(This) ->
    put({This, circularIndexUtil}, 'CircularIndexUtil':createInstanceAt(0, 0)),
    put({This, lastIndex}, (-1)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'HighScoresHelperBase':'$init'(This),
    init_fields(This).


setHighScoresArray(This, HighScoresArrayP) when (is_tuple(HighScoresArrayP) orelse HighScoresArrayP =:= undefined) ->
        'HighScoresHelperBase':setHighScoresArray(This, HighScoresArrayP),
        (get({get({This, circularIndexUtil}), '$class'})):setSize(get({This, circularIndexUtil}), array:size(get({This, highScoresArrayP}))).

getNextHighScores(This) ->
        put({local, highScores}, array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, highScoresArrayP}))),
        put({local, index}, 0),
        (fun Loop() -> case (((((get({get({local, highScores}), '$class'})):getTotal(get({local, highScores})) < 1) orelse (get({This, lastIndex}) =:= (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil}))))) andalso (get({local, index}) < array:size(get({This, highScoresArrayP})))) of true ->
            (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
            put({local, highScores}, array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, highScoresArrayP}))),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)(),
        put({This, lastIndex}, (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil}))),
        get({local, highScores}).

isAnyHighScores(This) ->
        try
        case (array:size(get({This, highScoresArrayP})) < 1) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        put({local, anyScores}, false),
        put({local, highScores}, undefined),
        lists:foreach(fun(Index) ->
            put({local, highScores}, array:get(Index, get({This, highScoresArrayP}))),
            case ((get({get({local, highScores}), '$class'})):getTotal(get({local, highScores})) > 0) of
                true ->
                put({local, anyScores}, true);
                false -> ok
            end
        end, lists:seq((array:size(get({This, highScoresArrayP})) - 1), 0, -1)),
        get({local, anyScores})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

