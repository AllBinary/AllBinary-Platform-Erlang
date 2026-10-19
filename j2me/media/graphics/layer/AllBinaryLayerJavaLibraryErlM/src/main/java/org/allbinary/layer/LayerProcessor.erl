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
% package org.allbinary.layer
% import org.allbinary.string.CommonStrings

-module('LayerProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements LayerProcessorInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, layerManager}, undefined),
    ok.


new(LayerManager) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayerManager),
    This.

init(This, LayerManager) ->
    init_fields(This),
        put({This, layerManager}, LayerManager).

% throws Exception
processAt(This, AllBinaryLayerManager, LayerInterface, Index) when is_integer(Index) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
isProcessorLayer(This, LayerInterface) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

getLayerManager(This) ->
        get({This, layerManager}).

% throws Exception
process(This, AllBinaryLayerManager) ->
        LayerManager = (get({This, '$class'})):getLayerManager(This),
        Size = (get({LayerManager, '$class'})):getSize(LayerManager),
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):processAt(This, AllBinaryLayerManager, (get({LayerManager, '$class'})):getLayerAt(LayerManager, Index), Index)
        end, lists:seq(0, Size - 1)).

