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

-module('ScrollMapGameInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameInputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, scrollMapPlayerGameInput}, undefined),
    ok.


new(ScrollMapPlayerGameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ScrollMapPlayerGameInput),
    This.

'$init'(This, ScrollMapPlayerGameInput) ->
    'GameInputProcessor':'$init'(This),
    init_fields(This),
        put({This, scrollMapPlayerGameInput}, ScrollMapPlayerGameInput).

