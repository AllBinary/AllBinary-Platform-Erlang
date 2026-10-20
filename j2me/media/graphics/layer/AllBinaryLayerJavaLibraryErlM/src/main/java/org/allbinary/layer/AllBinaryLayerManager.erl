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
% import org.allbinary.layer.event.LayerManagerEvent
% import org.allbinary.layer.event.LayerManagerEventHandler

-module('AllBinaryLayerManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerManager', Function, Arguments).

init_fields(This) ->
    put({This, layerManagerEventHandler}, 'LayerManagerEventHandler':getInstance()),
    put({This, createLayerManagerEvent}, 'LayerManagerEvent':new(This, get({get({This, layerManagerEventHandler}), 'CREATE'}))),
    put({This, deleteLayerManagerEvent}, 'LayerManagerEvent':new(This, get({get({This, layerManagerEventHandler}), 'DELETE'}))),
    put({This, basicLayerProcessorArray}, array:new(0, {default, undefined})),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'LayerManager':'$init'(This, 'LayerManagerNoDebug':getInstance()),
        init_fields(This).

getLayerProcessorArray(This) ->
        get({This, basicLayerProcessorArray}).

setLayerProcessorArray(This, LayerProcessorArray) when (is_tuple(LayerProcessorArray) orelse LayerProcessorArray =:= undefined) ->
        put({This, basicLayerProcessorArray}, LayerProcessorArray).

log(This) ->
        Size = array:size(get({This, basicLayerProcessorArray})),
        lists:foreach(fun(Index) ->
            LayerProcessorInterface = array:get(Index, get({This, basicLayerProcessorArray}))
        end, lists:seq(0, Size - 1)).

% throws Exception
append(This, LayerInterface) ->
        case (not (get({This, '$class'})):contains(This, LayerInterface)) of
            true ->
            (get({This, '$class'})):appendProcessors(This, LayerInterface),
            'LayerManager':append(This, LayerInterface);
            false -> ok
        end.

% throws Exception
appendAt(This, LayerInterface, Index) when is_integer(Index) ->
        case (not (get({This, '$class'})):contains(This, LayerInterface)) of
            true ->
            (get({This, '$class'})):appendProcessors(This, LayerInterface),
            'LayerManager':appendAt(This, LayerInterface, Index);
            false -> ok
        end.

% throws Exception
appendProcessors(This, LayerInterface) ->
        (get({get({This, createLayerManagerEvent}), '$class'})):setLayerInterface(get({This, createLayerManagerEvent}), LayerInterface),
        (get({get({This, layerManagerEventHandler}), '$class'})):fireEvent(get({This, layerManagerEventHandler}), get({This, createLayerManagerEvent})),
        put({local, layerProcessorInterface}, undefined),
        put({local, index}, array:size(get({This, basicLayerProcessorArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, layerProcessorInterface}, array:get(get({local, index}), get({This, basicLayerProcessorArray}))),
            case (get({get({local, layerProcessorInterface}), '$class'})):isProcessorLayer(get({local, layerProcessorInterface}), LayerInterface) of
                true ->
                (fun(Target_N66843) -> (get({Target_N66843, '$class'})):append(Target_N66843, LayerInterface) end)((get({get({local, layerProcessorInterface}), '$class'})):getLayerManager(get({local, layerProcessorInterface})));
                false -> ok
            end,
            Loop();
        false -> ok end end)().

% throws Exception
remove(This, LayerInterface) ->
        (get({get({This, deleteLayerManagerEvent}), '$class'})):setLayerInterface(get({This, deleteLayerManagerEvent}), LayerInterface),
        (get({get({This, layerManagerEventHandler}), '$class'})):fireDeleteEvent(get({This, layerManagerEventHandler}), get({This, deleteLayerManagerEvent})),
        put({local, layerProcessorInterface}, undefined),
        put({local, index}, array:size(get({This, basicLayerProcessorArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, layerProcessorInterface}, array:get(get({local, index}), get({This, basicLayerProcessorArray}))),
            (fun(Target_N67176) -> (get({Target_N67176, '$class'})):remove(Target_N67176, LayerInterface) end)((get({get({local, layerProcessorInterface}), '$class'})):getLayerManager(get({local, layerProcessorInterface}))),
            Loop();
        false -> ok end end)(),
        'LayerManager':remove(This, LayerInterface).

% throws Exception
process(This) ->
        put({local, layerProcessorInterface}, undefined),
        Size = array:size(get({This, basicLayerProcessorArray})),
        lists:foreach(fun(Index) ->
            put({local, layerProcessorInterface}, array:get(Index, get({This, basicLayerProcessorArray}))),
            (get({get({local, layerProcessorInterface}), '$class'})):process(get({local, layerProcessorInterface}), This)
        end, lists:seq(0, Size - 1)).

% throws Exception
cleanup(This) ->
        put({local, layerProcessorInterface}, undefined),
        Size = array:size(get({This, basicLayerProcessorArray})),
        lists:foreach(fun(Index) ->
            put({local, layerProcessorInterface}, array:get(Index, get({This, basicLayerProcessorArray}))),
            (fun(Target_N67763) -> (get({Target_N67763, '$class'})):cleanup(Target_N67763) end)((get({get({local, layerProcessorInterface}), '$class'})):getLayerManager(get({local, layerProcessorInterface})))
        end, lists:seq(0, Size - 1)),
        'LayerManager':cleanup(This).

