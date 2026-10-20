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
% import org.allbinary.game.GameTypeFactory
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('DemoGameBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DemoGameBehavior':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'DemoGameBehavior', instance}).

% throws Exception
init(This) ->
        ok.

pause(This, AllBinaryGameCanvas) ->
        ok.

unPause(This, AllBinaryGameCanvas) ->
        ok.

% throws Exception
updateTouch(This, AllBinaryGameCanvas) ->
        ok.

% throws Exception
updateScreenButtonPaintable(This, AllBinaryGameCanvas) ->
        (get({AllBinaryGameCanvas, '$class'})):setTouchPaintableP(AllBinaryGameCanvas, 'NullPaintable':getInstance()).

% throws Exception
setGameState(This, AllBinaryGameCanvas) ->
        ok.

removeAllGameKeyInputListeners(This, AllBinaryGameCanvas) ->
        ok.

% throws Exception
updateEndGameProcessor(This, AllBinaryGameCanvas) ->
        ok.

% throws Exception
buildGame(This, AllBinaryGameCanvas) ->
        ok.

% throws Exception
run(This, AllBinaryGameCanvas) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66504) -> (get({Target_N66504, '$class'})):toString(Target_N66504) end)(get({'GameTypeFactory':getInstance(), 'BOT'})), This, get({CommonStrings, 'RUN'})).

% throws Exception
setHighScore(This, AbeClientInformation, AllBinaryGameCanvas, Name, Score, AutoSubmit, IsLast) when (is_list(Name) orelse Name =:= undefined), is_integer(Score), is_boolean(AutoSubmit), is_boolean(IsLast) ->
        ok.

