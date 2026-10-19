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
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.layer.AllBinaryLayerManager

-module('ScrollMapUpGameInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ScrollMapGameInputProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new(ScrollMapPlayerGameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ScrollMapPlayerGameInput),
    This.

init(This, ScrollMapPlayerGameInput) ->
        'ScrollMapGameInputProcessor':init(This, ScrollMapPlayerGameInput).

% throws Exception
processEvent(This, AllbinaryLayerManager, GameKeyEvent) ->
        (get({get({This, scrollMapPlayerGameInput}), '$class'})):up(get({This, scrollMapPlayerGameInput})).

