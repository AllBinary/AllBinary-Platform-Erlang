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
% package org.allbinary.game.displayable.canvas
% import org.allbinary.game.input.event.DownGameKeyEventHandler
% import org.allbinary.game.input.event.UpGameKeyEventHandler

-module('GameEventHandlerUtil').
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


removeAllListeners() ->
        (fun(Target_N65673) -> (get({Target_N65673, '$class'})):removeAllListeners(Target_N65673) end)('UpGameKeyEventHandler':getInstance()),
        (fun(Target_N65701) -> (get({Target_N65701, '$class'})):removeAllListeners(Target_N65701) end)('DownGameKeyEventHandler':getInstance()).

