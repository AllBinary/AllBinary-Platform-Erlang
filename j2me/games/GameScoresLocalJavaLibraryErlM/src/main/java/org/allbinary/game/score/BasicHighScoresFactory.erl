% Generated Code Do Not Modify
% package org.allbinary.game.score
% import org.allbinary.game.GameInfo
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.SoftwareInformation
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('BasicHighScoresFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScoresBase', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, undefined),
    put({This, highScoresArray}, array:new(1, {default, undefined})),
    put({This, 'TOP'}, "Top"),
    put({This, 'SCORES'}, "Scores"),
    put({This, 'PERSONAL_HIGH_SCORES'}, "Personal Top Scores"),
    put({This, 'FETCH'}, "fetchHighScores"),
    ok.


new(AbeClientInformation, SoftwareInformation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, SoftwareInformation),
    This.

init(This, AbeClientInformation, SoftwareInformation) ->
    'HighScoresBase':init(This),
    init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation).

fetchHighScores(This, GameInfo, HighScoresResultsListener) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Getting Local HighScores", This, get({This, 'FETCH'})),
        (get({This, '$class'})):fetchHighScoresPreload(This, GameInfo, HighScoresResultsListener, true).

fetchHighScoresPreload(This, GameInfo, HighScoresResultsListener, Preload) when is_boolean(Preload) ->
        try
            put({This, highScoresArray}, array:set(0, 'RecordStoreHighScores':getInstance(get({This, abeClientInformation}), GameInfo, get({This, 'TOP'}), get({This, 'PERSONAL_HIGH_SCORES'}), get({This, 'SCORES'}), 'ScoreComparator':new(true)), get({This, highScoresArray}))),
            (get({HighScoresResultsListener, '$class'})):setHighScoresArray(HighScoresResultsListener, get({This, highScoresArray}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'FETCH'}), E)
        end.

createHighScoresHelper(This) ->
        'HighScoresHelper2':new().

loaded(Index2) when is_integer(Index2) ->
        try
        case (Index2 >= 0) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

