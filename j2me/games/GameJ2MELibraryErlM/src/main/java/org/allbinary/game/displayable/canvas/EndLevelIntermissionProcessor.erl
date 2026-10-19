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
% import org.allbinary.canvas.Processor

-module('EndLevelIntermissionProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    put({This, gameCanvas}, undefined),
    ok.


new(GameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameCanvas),
    This.

init(This, GameCanvas) ->
    'Processor':init(This),
    init_fields(This),
        put({This, gameCanvas}, GameCanvas).

% throws Exception
process(This) ->
        (get({get({This, gameCanvas}), '$class'})):processEndLevelIntermissionGameState(get({This, gameCanvas})).

