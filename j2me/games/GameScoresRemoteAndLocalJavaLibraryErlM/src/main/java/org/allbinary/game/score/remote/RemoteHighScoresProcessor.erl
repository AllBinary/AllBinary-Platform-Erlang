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
% import org.allbinary.game.GameInfo
% import org.allbinary.game.GameInfoData
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.HashtableUtil

-module('RemoteHighScoresProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RemoteHighScoresProcessorInterface

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

% throws Exception
process(This, RemoteHighScores, AbeClientInformation, GameInfo) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Begin Remote HighScores Retrieval", This, get({get({This, commonStrings}), 'PROCESS'})),
        GameInfoData = 'GameInfoData':getInstance(),
        Hashtable = (get({AbeClientInformation, '$class'})):toHashtable(AbeClientInformation),
        (fun(Target_N66324) -> (get({Target_N66324, '$class'})):putAll(Target_N66324, (get({GameInfo, '$class'})):toHashtable(GameInfo), Hashtable) end)('HashtableUtil':getInstance()),
        (get({Hashtable, '$class'})):put(Hashtable, get({GameInfoData, 'SOFTWARE_INFORMATION'}), (fun(Target_N66412) -> (get({Target_N66412, '$class'})):toString(Target_N66412) end)((get({RemoteHighScores, '$class'})):getSoftwareInformation(RemoteHighScores))),
        (get({Hashtable, '$class'})):put(Hashtable, get({RemoteHighScores, 'ASCENDING'}), (fun(Target_N66479) -> (get({Target_N66479, '$class'})):toString(Target_N66479) end)((get({RemoteHighScores, '$class'})):getAscending(RemoteHighScores))),
        DisplayInfoSingleton = 'DisplayInfoSingleton':getInstance(),
        (get({Hashtable, '$class'})):put(Hashtable, get({DisplayInfoSingleton, 'ORIENTATION'}), (fun(Target_N66592) -> (get({Target_N66592, '$class'})):toStringb(Target_N66592, (get({DisplayInfoSingleton, '$class'})):isPortrait(DisplayInfoSingleton)) end)('BooleanFactory':getInstance())),
        (get({Hashtable, '$class'})):put(Hashtable, get({'RemoteHighScoresData':getInstance(), 'GAME_CONFIGURATION'}), (fun(Target_N66682) -> (get({Target_N66682, '$class'})):toString(Target_N66682) end)('GameConfigurationCentral':getInstance())),
        case get({'XmlRpcAbeClient', isOnline}) of
            true ->
            ResultHashtable = (fun(Target_N66747) -> (get({Target_N66747, '$class'})):get(Target_N66747, Hashtable, get({This, noCrypt})) end)('XmlRpcRemoteHighScoresClient':new(AbeClientInformation, "highscoresservicessl.php", "HighScoresService.process")),
            (get({RemoteHighScores, '$class'})):update(RemoteHighScores, ResultHashtable);
            false -> ok
        end.

