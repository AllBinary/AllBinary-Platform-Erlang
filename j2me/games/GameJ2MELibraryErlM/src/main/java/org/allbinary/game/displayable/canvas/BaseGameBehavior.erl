% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.business.advertisement.GameAdStateFactory
% import org.allbinary.game.GameAdState
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.opengles.CurrentDisplayableFactory
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('BaseGameBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DemoGameBehavior', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'BaseGameBehavior':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'DemoGameBehavior':init(This),
    init_fields(This).


getInstance() ->
        get({'BaseGameBehavior', instanceC}).

% throws Exception
init(This) ->
        GameAdState = (fun(Target_N65931) -> (get({Target_N65931, '$class'})):getCurrentInstance(Target_N65931) end)('GameAdStateFactory':getInstance()),
        (get({GameAdState, '$class'})):playingAdState(GameAdState).

pause(This, AllBinaryGameCanvas) ->
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL_AS_GAME_THREAD'})) of
            true ->
            CurrentDisplayableFactory = 'CurrentDisplayableFactory':getInstance(),
            (get({CurrentDisplayableFactory, '$class'})):setRunnable(CurrentDisplayableFactory, get({AllBinaryGameCanvas, gamePauseRunnable}));
            false -> ok
        end.

unPause(This, AllBinaryGameCanvas) ->
        case (fun(Target_N66309) -> (get({Target_N66309, '$class'})):isDefault(Target_N66309, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL_AS_GAME_THREAD'})) end)('Features':getInstance()) of
            true ->
            CurrentDisplayableFactory = 'CurrentDisplayableFactory':getInstance(),
            (get({CurrentDisplayableFactory, '$class'})):setRunnable(CurrentDisplayableFactory, get({AllBinaryGameCanvas, gameRunnable})),
            (get({CurrentDisplayableFactory, '$class'})):setDisplayable(CurrentDisplayableFactory, AllBinaryGameCanvas);
            false -> ok
        end.

% throws Exception
updateTouch(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):updateTouch2(AllBinaryGameCanvas).

% throws Exception
updateScreenButtonPaintable(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):updateScreenButtonPaintable2(AllBinaryGameCanvas).

% throws Exception
setGameState(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):updateGameState(AllBinaryGameCanvas).

removeAllGameKeyInputListeners(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):removeAllGameKeyInputListeners2(AllBinaryGameCanvas).

% throws Exception
updateEndGameProcessor(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):updateEndGameProcessor2(AllBinaryGameCanvas).

% throws Exception
buildGame(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):buildGame2(AllBinaryGameCanvas).

% throws Exception
run(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):run2(AllBinaryGameCanvas).

% throws Exception
setHighScore(This, AbeClientInformation, AllBinaryGameCanvas, Name, Score, AutoSubmit, IsLast) when (is_list(Name) orelse Name =:= undefined), is_integer(Score), is_boolean(AutoSubmit), is_boolean(IsLast) ->
        (get({AllBinaryGameCanvas, '$class'})):setHighScore2(AllBinaryGameCanvas, AbeClientInformation, Name, Score, AutoSubmit, IsLast).

