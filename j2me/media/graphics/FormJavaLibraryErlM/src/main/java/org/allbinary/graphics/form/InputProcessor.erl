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
% package org.allbinary.graphics.form
% import org.allbinary.canvas.Processor
% import org.allbinary.game.input.PlayerGameInputCompositeInterface

-module('InputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    put({This, playerGameInputCompositeInterface}, undefined),
    ok.


new(PlayerGameInputCompositeInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PlayerGameInputCompositeInterface),
    This.

init(This, PlayerGameInputCompositeInterface) ->
    'Processor':init(This),
    init_fields(This),
        put({This, playerGameInputCompositeInterface}, PlayerGameInputCompositeInterface).

% throws Exception
process(This) ->
        (fun(Target_N65768) -> (get({Target_N65768, '$class'})):update(Target_N65768) end)((get({get({This, playerGameInputCompositeInterface}), '$class'})):getPlayerGameInput(get({This, playerGameInputCompositeInterface}))).

