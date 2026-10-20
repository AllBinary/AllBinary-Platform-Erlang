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
% package org.allbinary.game.tracking
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('TrackingEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, layerInterface}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    ok.


new(AllBinaryLayerInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AllBinaryLayerInterface),
    This.

'$init'(This, AllBinaryLayerInterface) ->
        'AllBinaryEventObject':'$init'(This, AllBinaryLayerInterface),
        init_fields(This),
        case (AllBinaryLayerInterface =/= 'TrackingEventHandler':getInstance()) of
            true ->
            (get({This, '$class'})):setLayerInterface(This, AllBinaryLayerInterface);
            false -> ok
        end.

init(This, AnyType) ->
        (get({This, '$class'})):setSource(This, AnyType).

getLayerInterface(This) ->
        get({This, layerInterface}).

setLayerInterface(This, LayerInterface) ->
        put({This, layerInterface}, LayerInterface).

setLayerInterfaceForCircularStaticPool(This, LayerInterface) ->
        put({This, layerInterface}, LayerInterface).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "TrackingEvent: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "LayerInterface: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, layerInterface}), '$class'})):toString(get({This, layerInterface}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

