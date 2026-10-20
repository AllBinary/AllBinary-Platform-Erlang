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
% package org.allbinary.game.layer.drop
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.BasicLayerProcessor
% import org.allbinary.util.BasicArrayList

-module('DropLayerProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicLayerProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, 'LAYER_PROCESSOR'}, 'DropLayerProcessor':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicLayerProcessor':'$init'(This),
    init_fields(This),
        ok.

getInstance() ->
        get({'DropLayerProcessor', 'LAYER_PROCESSOR'}).

% throws Exception
process(This, AllBinaryLayerManager) ->
        List = (get({This, '$class'})):getList(This),
        Size = (get({List, '$class'})):size(List),
        put({local, layerInterface}, undefined),
        put({local, dropLayerInterface}, undefined),
        lists:foreach(fun(Index) ->
            put({local, layerInterface}, array:get(Index, get({List, objectArray}))),
            put({local, dropLayerInterface}, get({local, layerInterface})),
            put({local, layerInterface}, (get({get({local, dropLayerInterface}), '$class'})):getDroppedLayer(get({local, dropLayerInterface}))),
            (get({AllBinaryLayerManager, '$class'})):append(AllBinaryLayerManager, get({local, layerInterface}))
        end, lists:seq(0, Size - 1)),
        (get({List, '$class'})):clear(List).

