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
% package org.allbinary.game.displayable.canvas
% import org.allbinary.canvas.Processor
% import org.allbinary.game.score.HighScores
% import org.allbinary.game.score.HighScoresHelperBase
% import org.allbinary.game.score.NullHighScoresSingletonFactory
% import org.allbinary.game.state.GameStateFactory
% import org.allbinary.graphics.paint.NullPaintable

-module('EndGameProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    put({This, gameStateFactory}, 'GameStateFactory':getInstance()),
    put({This, gameCanvas}, undefined),
    put({This, 'WAIT'}, 5000),
    ok.


new(GameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameCanvas),
    This.

'$init'(This, GameCanvas) ->
    'Processor':'$init'(This),
    init_fields(This),
        put({This, gameCanvas}, GameCanvas).

% throws Exception
process(This) ->
        case (get({get({This, gameCanvas}), '$class'})):isHighScoreSubmitted(get({This, gameCanvas})) of
            true ->
            case (fun(Target_N66000) -> (get({Target_N66000, '$class'})):isElapsedTNT(Target_N66000, get({This, 'WAIT'})) end)((get({get({This, gameCanvas}), '$class'})):getGameStateTimeHelper(get({This, gameCanvas}))) of
                true ->
                case ((get({get({This, gameCanvas}), '$class'})):getGameState(get({This, gameCanvas})) =:= get({get({This, gameStateFactory}), 'SHOW_END_RESULT_GAME_STATE'})) of
                    true ->
                    HighScoresBase = get({get({This, gameCanvas}), highScoresHelper}),
                    HighScores = (get({HighScoresBase, '$class'})):getSelectedHighScores(HighScoresBase),
                    case (HighScores =/= 'NullHighScoresSingletonFactory':getInstance()) of
                        true ->
                        (get({HighScoresBase, '$class'})):selectHighScores(HighScoresBase),
                        (fun(Target_N66413) -> (get({Target_N66413, '$class'})):setHighScores(Target_N66413, HighScores) end)((get({get({This, gameCanvas}), '$class'})):getRealHighScoresPaintable(get({This, gameCanvas}))),
                        (get({get({This, gameCanvas}), '$class'})):setGameState(get({This, gameCanvas}), get({get({This, gameStateFactory}), 'SHOW_HIGH_SCORE_GAME_STATE'})),
                        (get({get({This, gameCanvas}), '$class'})):setHighScoresPaintable(get({This, gameCanvas}), (get({get({This, gameCanvas}), '$class'})):getRealHighScoresPaintable(get({This, gameCanvas})));
                        false -> ok
                    end;
                    false ->
                    case ((get({get({This, gameCanvas}), '$class'})):getGameState(get({This, gameCanvas})) =:= get({get({This, gameStateFactory}), 'SHOW_HIGH_SCORE_GAME_STATE'})) of
                    true ->
                    (get({get({This, gameCanvas}), '$class'})):setGameState(get({This, gameCanvas}), get({get({This, gameStateFactory}), 'SHOW_END_RESULT_GAME_STATE'})),
                    (get({get({This, gameCanvas}), '$class'})):setHighScoresPaintable(get({This, gameCanvas}), 'NullPaintable':getInstance());
                    false -> ok
                end
                end;
                false -> ok
            end;
            false -> ok
        end.

