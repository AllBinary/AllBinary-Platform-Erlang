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
% import org.allbinary.thread.ARunnable
% import org.allbinary.game.BasicHighScoresGameInfoFactory
% import org.allbinary.game.GameInfo
% import org.allbinary.game.GameType
% import org.allbinary.game.GameTypeFactory
% import org.allbinary.game.score.remote.RemoteHighScores
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.system.SoftwareInformation
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.thread.SecondaryThreadPool

-module('BasicHighScoresFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HighScoresBase', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, undefined),
    put({This, softwareInformation}, undefined),
    put({This, highScoresArray}, array:new(2, {default, undefined})),
    put({This, 'TOP'}, "Top"),
    put({This, 'SCORES'}, "Scores"),
    put({This, 'PERSONAL_HIGH_SCORES'}, "Personal Top Scores"),
    put({This, 'WORLD_TOP_SCORES'}, "World Top Scores"),
    put({This, 'FETCH'}, "fetchHighScores"),
    ok.


new(AbeClientInformation, SoftwareInformation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, SoftwareInformation),
    This.

'$init'(This, AbeClientInformation, SoftwareInformation) ->
    'HighScoresBase':'$init'(This),
    init_fields(This),
        put({This, abeClientInformation}, AbeClientInformation),
        put({This, softwareInformation}, SoftwareInformation).

fetchHighScores(This, GameInfo, HighScoresResultsListener) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Getting Remote/Local HighScores", This, get({This, 'FETCH'})),
        (get({This, '$class'})):fetchHighScoresPreload(This, GameInfo, HighScoresResultsListener, true).

fetchHighScoresPreload(This, GameInfo, HighScoresResultsListener, Preload) when is_boolean(Preload) ->
        (fun(Target_N66587) -> (get({Target_N66587, '$class'})):runTask(Target_N66587, 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
) end)('SecondaryThreadPool':getInstance()).

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

