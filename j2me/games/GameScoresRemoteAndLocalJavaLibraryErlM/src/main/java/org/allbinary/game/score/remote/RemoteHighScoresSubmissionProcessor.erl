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
% package org.allbinary.game.score.remote
% import org.allbinary.game.GameInfoData
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.game.score.HighScore
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.HashtableUtil

-module('RemoteHighScoresSubmissionProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RemoteHighScoresSubmissionProcessorInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, noCrypt}, 'NoCrypt':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

process(This, RemoteHighScores, AbeClientInformation, HighScore) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Begin Remote HighScores Submission", This, get({get({This, commonStrings}), 'PROCESS'})),
            GameInfoData = 'GameInfoData':getInstance(),
            Hashtable = (get({AbeClientInformation, '$class'})):toHashtable(AbeClientInformation),
            (fun(Target_N66333) -> (get({Target_N66333, '$class'})):putAll(Target_N66333, (fun(Target_N66358) -> (get({Target_N66358, '$class'})):toHashtable(Target_N66358) end)((get({HighScore, '$class'})):getGameInfo(HighScore)), Hashtable) end)('HashtableUtil':getInstance()),
            (get({Hashtable, '$class'})):put(Hashtable, get({'RemoteHighScoresData':getInstance(), 'CUSTOMER_USER_NAME'}), "None"),
            (get({Hashtable, '$class'})):put(Hashtable, get({'RemoteHighScoresData':getInstance(), 'DISPLAY_NAME'}), (get({HighScore, '$class'})):getName(HighScore)),
            (get({Hashtable, '$class'})):put(Hashtable, get({GameInfoData, 'SOFTWARE_INFORMATION'}), (fun(Target_N66551) -> (get({Target_N66551, '$class'})):toString(Target_N66551) end)((get({RemoteHighScores, '$class'})):getSoftwareInformation(RemoteHighScores))),
            (get({Hashtable, '$class'})):put(Hashtable, get({RemoteHighScores, 'ASCENDING'}), (fun(Target_N66614) -> (get({Target_N66614, '$class'})):toString(Target_N66614) end)((get({RemoteHighScores, '$class'})):getAscending(RemoteHighScores))),
            DisplayInfoSingleton = 'DisplayInfoSingleton':getInstance(),
            (get({Hashtable, '$class'})):put(Hashtable, get({DisplayInfoSingleton, 'ORIENTATION'}), (fun(Target_N66727) -> (get({Target_N66727, '$class'})):toStringb(Target_N66727, (get({DisplayInfoSingleton, '$class'})):isPortrait(DisplayInfoSingleton)) end)('BooleanFactory':getInstance())),
            (get({Hashtable, '$class'})):put(Hashtable, get({'RemoteHighScoresData':getInstance(), 'GAME_CONFIGURATION'}), (fun(Target_N66817) -> (get({Target_N66817, '$class'})):toString(Target_N66817) end)('GameConfigurationCentral':getInstance())),
            (get({Hashtable, '$class'})):put(Hashtable, get({'RemoteHighScoresData':getInstance(), 'SCORE'}), allbinary_java:to_string((get({HighScore, '$class'})):getScore(HighScore))),
            case get({'XmlRpcAbeClient', isOnline}) of
                true ->
                ResultHashtable = (fun(Target_N66975) -> (get({Target_N66975, '$class'})):get(Target_N66975, Hashtable, get({This, noCrypt})) end)('XmlRpcRemoteHighScoresClient':new(AbeClientInformation, "highscoresubmissionservicessl.php", "HighScoreSubmissionService.process")),
                (get({RemoteHighScores, '$class'})):update(RemoteHighScores, ResultHashtable);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'PROCESS'}), E)
        end.

