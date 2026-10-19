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
% package org.allbinary.game.input
% import javax.microedition.lcdui.Graphics

-module('TestInputExample').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TestInputInterface

init_fields(This) ->
    put({This, testValue}, 0),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


up(This) ->
        ok.

down(This) ->
        ok.

left(This) ->
        put({This, testValue}, get({This, testValue}) + 1).

right(This) ->
        put({This, testValue}, get({This, testValue}) - 1).

strafeLeft(This) ->
        ok.

strafeRight(This) ->
        ok.

paint(This, Graphics) ->
        ok.

paintThreed(This, Graphics) ->
        ok.

