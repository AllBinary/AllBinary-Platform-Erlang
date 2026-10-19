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
% package org.allbinary.android.input.motion
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.time.TimeDelayHelper

-module('AnalogControllerHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, reduceTimeFactor}, 0),
    put({This, 'SCALE_VALUE'}, get({'AnalogControllerConfigurationFactory':getInstance(), 'SCALE_VALUE'})),
    put({This, rightTimeElapsedHelper}, 'TimeDelayHelper':new(0)),
    put({This, leftTimeElapsedHelper}, 'TimeDelayHelper':new(0)),
    put({This, downTimeElapsedHelper}, 'TimeDelayHelper':new(0)),
    put({This, upTimeElapsedHelper}, 'TimeDelayHelper':new(0)),
    ok.


new(ReduceTimeFactor) when is_integer(ReduceTimeFactor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ReduceTimeFactor),
    This.

init(This, ReduceTimeFactor) when is_integer(ReduceTimeFactor) ->
    init_fields(This),
        put({This, reduceTimeFactor}, ReduceTimeFactor).

% throws Exception
right(This, CollidableDestroyableDamageableLayer, XAnalogValue) when is_integer(XAnalogValue) ->
        put({get({This, rightTimeElapsedHelper}), delay}, ((((get({This, 'SCALE_VALUE'}) - XAnalogValue)) bsr get({This, reduceTimeFactor})))),
        case (get({get({This, rightTimeElapsedHelper}), '$class'})):isTimeTNT(get({This, rightTimeElapsedHelper})) of
            true ->
            (get({CollidableDestroyableDamageableLayer, '$class'})):right(CollidableDestroyableDamageableLayer);
            false -> ok
        end.

% throws Exception
left(This, CollidableDestroyableDamageableLayer, XAnalogValue) when is_integer(XAnalogValue) ->
        put({get({This, leftTimeElapsedHelper}), delay}, ((((get({This, 'SCALE_VALUE'}) + XAnalogValue)) bsr get({This, reduceTimeFactor})))),
        case (get({get({This, leftTimeElapsedHelper}), '$class'})):isTimeTNT(get({This, leftTimeElapsedHelper})) of
            true ->
            (get({CollidableDestroyableDamageableLayer, '$class'})):left(CollidableDestroyableDamageableLayer);
            false -> ok
        end.

% throws Exception
up(This, CollidableDestroyableDamageableLayer, XAnalogValue) when is_integer(XAnalogValue) ->
        put({get({This, upTimeElapsedHelper}), delay}, ((((get({This, 'SCALE_VALUE'}) - XAnalogValue)) bsr get({This, reduceTimeFactor})))),
        case (get({get({This, upTimeElapsedHelper}), '$class'})):isTimeTNT(get({This, upTimeElapsedHelper})) of
            true ->
            (get({CollidableDestroyableDamageableLayer, '$class'})):up(CollidableDestroyableDamageableLayer);
            false -> ok
        end.

% throws Exception
down(This, CollidableDestroyableDamageableLayer, XAnalogValue) when is_integer(XAnalogValue) ->
        put({get({This, downTimeElapsedHelper}), delay}, ((((get({This, 'SCALE_VALUE'}) + XAnalogValue)) bsr get({This, reduceTimeFactor})))),
        case (get({get({This, downTimeElapsedHelper}), '$class'})):isTimeTNT(get({This, downTimeElapsedHelper})) of
            true ->
            (get({CollidableDestroyableDamageableLayer, '$class'})):down(CollidableDestroyableDamageableLayer);
            false -> ok
        end.

