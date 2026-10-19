% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.string.StringUtil

-module('NullPlayerGameInputComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PlayerGameInputCompositeInterface

static_init() ->
    put({?MODULE, 'NULL_PLAYER_GAME_INPUT_COMPOSITE'}, 'NullPlayerGameInputComposite':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getName(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

% throws Exception
processInput(This, LayerManager) ->
        ok.

initInputProcessors(This) ->
        ok.

getPlayerGameInput(This) ->
        'NoPlayerGameInput':getInstance().

