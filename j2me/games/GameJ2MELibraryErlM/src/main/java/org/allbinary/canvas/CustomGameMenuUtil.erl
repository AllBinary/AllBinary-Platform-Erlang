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
% package org.allbinary.canvas
% import org.allbinary.AppletUtil
% import org.allbinary.J2MEUtil
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.graphics.displayable.MyCanvas

-module('CustomGameMenuUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


add(Canvas) ->
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        case 'AppletUtil':isAppletLoader(Canvas) of
            true ->
            ok;
            false ->
            case 'J2MEUtil':isHTML() of
            true ->
            ok;
            false ->
            (get({Canvas, '$class'})):addCommand(Canvas, get({GameCommandsFactory, 'EXIT_COMMAND'}))
        end
        end.

