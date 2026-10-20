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
% package org.allbinary.game.score.displayable
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.game.GameInfo
% import org.allbinary.game.score.HighScore
% import org.allbinary.game.score.HighScoreNamePersistanceSingleton
% import org.allbinary.game.score.HighScores
% import org.allbinary.game.score.HighScoresFactoryInterface
% import org.allbinary.game.score.HighScoresHelperBaseInterface
% import org.allbinary.game.score.HighScoresResultsListener
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('HighScoreUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements HighScoresResultsListener

static_init() ->
    put({?MODULE, 'SUBMIT_TEXTBOX_COMMAND'}, 'Command':new("Submit", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, highScoresFactoryInterface}, undefined),
    put({This, highScoresArray}, undefined),
    put({This, highScore}, undefined),
    put({This, abeClientInformation}, undefined),
    put({This, gameInfo}, undefined),
    put({This, highScoresHelper}, undefined),
    put({This, firstTime}, true),
    ok.


new(HighScoresFactoryInterface, HighScoresHelper, AbeClientInformation, GameInfo, CmdListener, Name, HighScore) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HighScoresFactoryInterface, HighScoresHelper, AbeClientInformation, GameInfo, CmdListener, Name, HighScore),
    This.

'$init'(This, HighScoresFactoryInterface, HighScoresHelper, AbeClientInformation, GameInfo, CmdListener, Name, HighScore) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        put({This, highScoresFactoryInterface}, HighScoresFactoryInterface),
        put({This, highScoresHelper}, HighScoresHelper),
        put({This, highScoresArray}, (get({get({This, highScoresHelper}), '$class'})):getHighScoresArray(get({This, highScoresHelper}))),
        put({This, highScore}, HighScore),
        put({This, abeClientInformation}, AbeClientInformation),
        put({This, gameInfo}, GameInfo).

setHighScoresArray(This, HighScoresArray) when (is_tuple(HighScoresArray) orelse HighScoresArray =:= undefined) ->
        put({This, highScoresArray}, HighScoresArray),
        put({This, firstTime}, false),
        (get({This, '$class'})):saveHighScore(This).

update(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (fun(Target_N67009) -> (get({Target_N67009, '$class'})):save(Target_N67009, get({This, abeClientInformation}), get({This, gameInfo}), Name) end)('HighScoreNamePersistanceSingleton':getInstance()),
        (get({get({This, highScore}), '$class'})):setName(get({This, highScore}), Name).

saveHighScore(This) ->
        try
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67176) -> (get({Target_N67176, '$class'})):toString(Target_N67176) end)((fun(Target_N67183) -> (get({Target_N67183, '$class'})):append(Target_N67183, (fun(Target_N67234) -> (get({Target_N67234, '$class'})):toString(Target_N67234, get({This, highScore})) end)('StringUtil':getInstance())) end)((fun(Target_N67190) -> (get({Target_N67190, '$class'})):append(Target_N67190, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new()))), This, "saveHighScore"),
        Size = array:size(get({This, highScoresArray})),
        case (get({This, firstTime}) andalso (Size =:= 0)) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Games canvas did not give us any HighScores", This, "saveHighScore"),
            (get({get({This, highScoresFactoryInterface}), '$class'})):fetchHighScores(get({This, highScoresFactoryInterface}), get({This, gameInfo}), This),
            throw({'$return', ok});
            false -> ok
        end,
        put({local, highScores}, undefined),
        put({local, highScoresAsString}, undefined),
        lists:foreach(fun(Index) ->
            put({local, highScores}, array:get(Index, get({This, highScoresArray}))),
            (get({get({local, highScores}), '$class'})):addHighScore(get({local, highScores}), get({This, highScore})),
            put({local, highScoresAsString}, (get({get({local, highScores}), '$class'})):toString(get({local, highScores}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67650) -> (get({Target_N67650, '$class'})):toString(Target_N67650) end)((fun(Target_N67657) -> (get({Target_N67657, '$class'})):append(Target_N67657, get({local, highScoresAsString})) end)((fun(Target_N67664) -> (get({Target_N67664, '$class'})):append(Target_N67664, "Added/Adding Score: ") end)('StringMaker':new()))), This, "saveHighScore")
        end, lists:seq(0, Size - 1)),
        (get({get({This, highScoresHelper}), '$class'})):setHighScoresArray(get({This, highScoresHelper}), get({This, highScoresArray}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

submit(This, MyCanvas) ->
        CommandListener = (get({MyCanvas, '$class'})):getCustomCommandListener(MyCanvas),
        (get({CommandListener, '$class'})):commandAction(CommandListener, get({'HighScoreUtil', 'SUBMIT_TEXTBOX_COMMAND'}), MyCanvas).

