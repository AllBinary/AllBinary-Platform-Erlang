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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.input.PlayerGameInput
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.score.displayable.HighScoresCanvas
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('HighScoresCanvasInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PlayerGameInput', Function, Arguments).

init_fields(This) ->
    put({This, highScoresCanvas}, undefined),
    ok.


new(HighScoresCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HighScoresCanvas),
    This.

init(This, HighScoresCanvas) ->
        'PlayerGameInput':init(This, 'BasicArrayListD':new(), 'BasicArrayListD':new(), (-1)),
        init_fields(This),
        put({This, highScoresCanvas}, HighScoresCanvas).

open(This) ->
        ok.

close(This) ->
        ok.

onPressGameKeyEvent(This, GameKeyEvent) ->
        'PlayerGameInput':onPressGameKeyEvent(This, GameKeyEvent),
        (get({This, '$class'})):update(This).

onDownGameKeyEvent(This, GameKeyEvent) ->
        'PlayerGameInput':onDownGameKeyEvent(This, GameKeyEvent),
        (get({This, '$class'})):update(This).

onUpGameKeyEvent(This, GameKeyEvent) ->
        'PlayerGameInput':onUpGameKeyEvent(This, GameKeyEvent),
        (get({This, '$class'})):update(This).

paint(This, Graphics) ->
        ok.

getHighScoresCanvas(This) ->
        get({This, highScoresCanvas}).

