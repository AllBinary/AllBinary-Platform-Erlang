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
% package org.allbinary.game.combat.destroy
% import org.allbinary.game.combat.destroy.event.DestroyEventCircularStaticPool
% import org.allbinary.game.combat.destroy.event.DestroyedEvent
% import org.allbinary.game.combat.destroy.event.DestroyedEventHandler
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.BasicLayerProcessor
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('DestroyedLayerProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicLayerProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, 'DESTROYED_LAYER_PROCESSOR'}, get({'BasicLayerProcessor', 'NULL_LAYER_PROCESSOR'})),
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

init() ->
        put({'DestroyedLayerProcessor', 'DESTROYED_LAYER_PROCESSOR'}, 'DestroyedLayerProcessor':new()).

getInstance() ->
        get({'DestroyedLayerProcessor', 'DESTROYED_LAYER_PROCESSOR'}).

% throws Exception
process(This, AllBinaryLayerManager) ->
        List = (get({This, '$class'})):getList(This),
        Size = (get({List, '$class'})):size(List),
        DestroyedEventHandler = 'DestroyedEventHandler':getInstance(),
        DestroyEventCircularStaticPool = 'DestroyEventCircularStaticPool':getInstance(),
        put({local, destroyedEvent}, undefined),
        put({local, layerInterface}, undefined),
        lists:foreach(fun(Index) ->
            LayerInterfaceCanBeNull = array:get(Index, get({List, objectArray})),
            case (LayerInterfaceCanBeNull =/= undefined) of
                true ->
                put({local, layerInterface}, LayerInterfaceCanBeNull),
                (get({AllBinaryLayerManager, '$class'})):remove(AllBinaryLayerManager, get({local, layerInterface})),
                put({local, destroyedEvent}, (get({DestroyEventCircularStaticPool, '$class'})):getInstanceForLayer(DestroyEventCircularStaticPool, get({local, layerInterface}))),
                (get({DestroyedEventHandler, '$class'})):fireEvent(DestroyedEventHandler, get({local, destroyedEvent}));
                false ->
                CommonStrings = 'CommonStrings':getInstance()
            end
        end, lists:seq(0, Size - 1)),
        (get({List, '$class'})):clear(List).

