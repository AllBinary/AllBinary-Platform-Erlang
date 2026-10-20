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
% import org.allbinary.graphics.Rectangle

-module('RectangleLayerBounds').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerBounds', Function, Arguments).

init_fields(This) ->
    ok.


new(Rectangle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Rectangle),
    This.

'$init'(This, Rectangle) ->
        'LayerBounds':'$init'(This, Rectangle).

visit(This, BoundsVisitorInterface) ->
        case ((get({BoundsVisitorInterface, '$class'})):getX(BoundsVisitorInterface) > (get({get({This, rectangle}), '$class'})):getMaxX(get({This, rectangle}))) of
            true ->
            (get({BoundsVisitorInterface, '$class'})):maxX(BoundsVisitorInterface);
            false -> ok
        end,
        case ((get({BoundsVisitorInterface, '$class'})):getY(BoundsVisitorInterface) > (get({get({This, rectangle}), '$class'})):getMaxY(get({This, rectangle}))) of
            true ->
            (get({BoundsVisitorInterface, '$class'})):maxY(BoundsVisitorInterface);
            false -> ok
        end,
        case ((get({BoundsVisitorInterface, '$class'})):getX(BoundsVisitorInterface) < (fun(Target_N65845) -> (get({Target_N65845, '$class'})):getX(Target_N65845) end)((get({get({This, rectangle}), '$class'})):getPoint(get({This, rectangle})))) of
            true ->
            (get({BoundsVisitorInterface, '$class'})):minX(BoundsVisitorInterface);
            false -> ok
        end,
        case ((get({BoundsVisitorInterface, '$class'})):getY(BoundsVisitorInterface) < (fun(Target_N65924) -> (get({Target_N65924, '$class'})):getY(Target_N65924) end)((get({get({This, rectangle}), '$class'})):getPoint(get({This, rectangle})))) of
            true ->
            (get({BoundsVisitorInterface, '$class'})):minY(BoundsVisitorInterface);
            false -> ok
        end.

