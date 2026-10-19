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
% package org.allbinary.game.tick
% import org.allbinary.layer.AllBinaryLayerManager

-module('NullTickable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TickableInterface

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'NullTickable':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "NulLTickable"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'NullTickable', 'SINGLETON'}).

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        ok.

getName(This) ->
        get({This, 'NAME'}).

