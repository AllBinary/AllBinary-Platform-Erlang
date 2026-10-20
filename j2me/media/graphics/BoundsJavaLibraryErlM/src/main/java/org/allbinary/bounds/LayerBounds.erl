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
% package org.allbinary.bounds
% import org.allbinary.bounds.event.BoundsChangeEvent
% import org.allbinary.bounds.event.BoundsChangeEventListener
% import org.allbinary.graphics.Rectangle
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('LayerBounds').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BoundsChangeEventListener

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, rectangle}, undefined),
    ok.


new(Rectangle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Rectangle),
    This.

'$init'(This, Rectangle) ->
    init_fields(This),
        put({This, rectangle}, Rectangle).

getRectangleP(This) ->
        get({This, rectangle}).

visit(This, BoundsVisitorInterface) ->
        ok.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onBoundsChangeEvent(This, BoundsChangeEvent) ->
        put({This, rectangle}, (get({BoundsChangeEvent, '$class'})):getRectangle(BoundsChangeEvent)).

