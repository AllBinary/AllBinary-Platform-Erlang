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
% package org.allbinary.game.combat.destroy.event
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.util.event.AllBinaryEventCircularPool

-module('DestroyEventCircularStaticPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DestroyEventCircularStaticPool':new()),
    ok.

init_fields(This) ->
    put({This, 'EVENT_POOL'}, 'AllBinaryEventCircularPool':new(20)),
    ok.


getInstance() ->
        get({'DestroyEventCircularStaticPool', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

init(This, CombatGameCanvas) ->
        (get({get({This, 'EVENT_POOL'}), '$class'})):initAllBinaryEventCircularPool(get({This, 'EVENT_POOL'}), 'DestroyEventFactory':new(CombatGameCanvas)).

% throws Exception
getInstanceForLayer(This, LayerInterface) ->
        DestroyedEvent = (get({get({This, 'EVENT_POOL'}), '$class'})):getNextInstance(get({This, 'EVENT_POOL'})),
        (get({DestroyedEvent, '$class'})):setLayerInterfaceForCircularStaticPool(DestroyedEvent, LayerInterface),
        DestroyedEvent.

