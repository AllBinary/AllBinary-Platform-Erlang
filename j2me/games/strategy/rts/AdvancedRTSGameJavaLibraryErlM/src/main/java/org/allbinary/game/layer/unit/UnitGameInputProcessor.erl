% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.unit
% import org.allbinary.game.input.GameInputProcessor

-module('UnitGameInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameInputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, unitLayer}, undefined),
    ok.


new(UnitLayer) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UnitLayer),
    This.

'$init'(This, UnitLayer) ->
    'GameInputProcessor':'$init'(This),
    init_fields(This),
        put({This, unitLayer}, UnitLayer).

