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
% package org.allbinary.game
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.StdUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.util.ABHashtable

-module('GameInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NONE'}, 'GameInfo':new(get({'GameTypeFactory':getInstance(), 'NONE'}), get({'GameMode', 'NONE'}), get({'PlayerTypesFactory':getInstance(), 'PLAYER_TYPE_ONE'}), (-1), (-1))),
    put({?MODULE, 'LEVEL_NAME'}, "LEVEL"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameInfoData}, 'GameInfoData':getInstance()),
    put({This, gameType}, undefined),
    put({This, gameMode}, undefined),
    put({This, playerType}, undefined),
    put({This, highestLevel}, 0),
    put({This, currentLevel}, 0),
    put({This, 'NEW_LEVEL'}, "New Level: "),
    put({This, 'SET_CURRENT_LEVEL'}, "setCurrentLevel"),
    put({This, 'NEXT_GAME_LEVEL'}, "nextGameLevel"),
    ok.


new(GameType, GameMode, PlayerType, HighestLevel, CurrentLevel) when is_integer(HighestLevel), is_integer(CurrentLevel) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameType, GameMode, PlayerType, HighestLevel, CurrentLevel),
    This.

init(This, GameType, GameMode, PlayerType, HighestLevel, CurrentLevel) when is_integer(HighestLevel), is_integer(CurrentLevel) ->
    init_fields(This),
        put({This, gameType}, GameType),
        put({This, gameMode}, GameMode),
        (get({This, '$class'})):setHighestLevel(This, HighestLevel),
        put({This, currentLevel}, CurrentLevel),
        put({This, playerType}, PlayerType).

getGameType(This) ->
        get({This, gameType}).

getGameMode(This) ->
        get({This, gameMode}).

getPlayerType(This) ->
        get({This, playerType}).

getHighestLevel(This) ->
        get({This, highestLevel}).

setHighestLevel(This, HighestLevel) when is_integer(HighestLevel) ->
        put({This, highestLevel}, HighestLevel).

getCurrentLevel(This) ->
        get({This, currentLevel}).

setCurrentLevel(This, CurrentLevel) when is_integer(CurrentLevel) ->
        put({This, currentLevel}, CurrentLevel),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66893) -> (get({Target_N66893, '$class'})):toString(Target_N66893) end)((fun(Target_N66900) -> (get({Target_N66900, '$class'})):appendint(Target_N66900, (get({This, '$class'})):getCurrentLevel(This)) end)((fun(Target_N66907) -> (get({Target_N66907, '$class'})):append(Target_N66907, get({This, 'NEW_LEVEL'})) end)('StringMaker':new()))), This, get({This, 'SET_CURRENT_LEVEL'})).

nextGameLevel(This) ->
        case ((get({This, '$class'})):getCurrentLevel(This) < (get({This, '$class'})):getHighestLevel(This)) of
            true ->
            put({This, currentLevel}, get({This, currentLevel}) + 1);
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67141) -> (get({Target_N67141, '$class'})):toString(Target_N67141) end)((fun(Target_N67148) -> (get({Target_N67148, '$class'})):appendint(Target_N67148, (get({This, '$class'})):getCurrentLevel(This)) end)((fun(Target_N67155) -> (get({Target_N67155, '$class'})):append(Target_N67155, get({This, 'NEW_LEVEL'})) end)((fun(Target_N67162) -> (get({Target_N67162, '$class'})):append(Target_N67162, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N67169) -> (get({Target_N67169, '$class'})):append(Target_N67169, get({'CommonLabels':getInstance(), 'NEXT'})) end)('StringMaker':new()))))), This, get({This, 'NEXT_GAME_LEVEL'})).

previousGameLevel(This) ->
        case ((get({This, '$class'})):getCurrentLevel(This) > 1) of
            true ->
            put({This, currentLevel}, get({This, currentLevel}) - 1);
            false -> ok
        end.

isLastLevel(This) ->
        try
        case ((get({This, '$class'})):getCurrentLevel(This) >= (get({This, '$class'})):getHighestLevel(This)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toHashtable(This) ->
        Hashtable = (fun(Target_N67491) -> (get({Target_N67491, '$class'})):createHashtable(Target_N67491) end)('StdUtil':getInstance()),
        (get({Hashtable, '$class'})):put(Hashtable, get({get({This, gameInfoData}), 'GAME_TYPE'}), (fun(Target_N67589) -> (get({Target_N67589, '$class'})):toString(Target_N67589) end)((get({This, '$class'})):getGameType(This))),
        (get({Hashtable, '$class'})):put(Hashtable, get({get({This, gameInfoData}), 'GAME_MODE'}), (get({get({This, gameMode}), '$class'})):toString(get({This, gameMode}))),
        (get({Hashtable, '$class'})):put(Hashtable, get({get({This, gameInfoData}), 'PLAYER_TYPE'}), (get({get({This, playerType}), '$class'})):toString(get({This, playerType}))),
        (get({Hashtable, '$class'})):put(Hashtable, get({get({This, gameInfoData}), 'HIGHEST_LEVEL'}), allbinary_java:to_string((get({This, '$class'})):getHighestLevel(This))),
        (get({Hashtable, '$class'})):put(Hashtable, get({get({This, gameInfoData}), 'CURRENT_LEVEL'}), allbinary_java:to_string(get({This, currentLevel}))),
        Hashtable.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        CommonSeps = 'CommonSeps':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, gameInfoData}), 'GAME_TYPE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'EQUALS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N68135) -> (get({Target_N68135, '$class'})):toString(Target_N68135) end)((get({This, '$class'})):getGameType(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, gameInfoData}), 'GAME_MODE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'EQUALS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, gameMode}), '$class'})):toString(get({This, gameMode}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, gameInfoData}), 'PLAYER_TYPE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'EQUALS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N68459) -> (get({Target_N68459, '$class'})):toString(Target_N68459, get({This, playerType})) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, gameInfoData}), 'HIGHEST_LEVEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getHighestLevel(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, gameInfoData}), 'CURRENT_LEVEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, currentLevel})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

