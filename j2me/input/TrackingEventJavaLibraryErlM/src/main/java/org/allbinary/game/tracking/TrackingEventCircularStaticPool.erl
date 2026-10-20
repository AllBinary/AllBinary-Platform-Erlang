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
% import org.allbinary.logic.util.event.AllBinaryEventCircularPool

-module('TrackingEventCircularStaticPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TrackingEventCircularStaticPool':new()),
    ok.

init_fields(This) ->
    put({This, 'EVENT_POOL'}, 'AllBinaryEventCircularPool':new(20)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'TrackingEventCircularStaticPool', instance}).

init(This) ->
        (get({get({This, 'EVENT_POOL'}), '$class'})):initAllBinaryEventCircularPool(get({This, 'EVENT_POOL'}), 'TrackingEventFactory':new()).

% throws Exception
getNextInstance(This, LayerInterface) ->
        TrackingEvent = (get({get({This, 'EVENT_POOL'}), '$class'})):getNextInstance(get({This, 'EVENT_POOL'})),
        (get({TrackingEvent, '$class'})):setLayerInterfaceForCircularStaticPool(TrackingEvent, LayerInterface),
        TrackingEvent.

