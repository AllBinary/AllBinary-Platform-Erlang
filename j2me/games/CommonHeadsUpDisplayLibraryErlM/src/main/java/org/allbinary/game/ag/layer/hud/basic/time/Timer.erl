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
% package org.allbinary.game.ag.layer.hud.basic.time
% import org.allbinary.logic.math.PrimitiveLongSingleton
% import org.allbinary.logic.math.PrimitiveLongUtil
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory

-module('Timer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, startTime}, (-1)),
    put({This, hundredthTime}, 0),
    put({This, maxTime}, 0),
    put({This, modifier}, 0),
    put({This, hundrethsString}, get({'PrimitiveLongSingleton':getInstance(), 'ZERO'})),
    put({This, totalDigits}, 1),
    put({This, primitiveLongUtil}, undefined),
    put({This, 'MAX'}, array:from_list([$L, $O, $L])),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    ok.


new(MaxTime) when is_integer(MaxTime) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MaxTime),
    This.

'$init'(This, MaxTime) when is_integer(MaxTime) ->
    init_fields(This),
        put({This, primitiveLongUtil}, 'PrimitiveLongUtil':createPowerOfTen(MaxTime)),
        put({This, maxTime}, MaxTime).

start(This) ->
        put({This, hundredthTime}, 0),
        put({This, startTime}, get({get({This, gameTickTimeDelayHelper}), startTime})).

get(This) ->
        get({This, hundredthTime}).

update(This) ->
        LastLowerTime = get({This, hundredthTime}),
        put({local, currentTime}, ((((get({This, modifier}) + get({get({This, gameTickTimeDelayHelper}), startTime}))) - get({This, startTime})))),
        case (get({local, currentTime}) < 0) of
            true ->
            put({local, currentTime}, 0);
            false -> ok
        end,
        put({This, hundredthTime}, (get({local, currentTime}) div 100)),
        case (get({This, hundredthTime}) >= get({This, maxTime})) of
            true ->
            case (get({This, startTime}) > 0) of
                true ->
                put({This, hundrethsString}, get({This, 'MAX'}));
                false -> ok
            end;
            false ->
            case (LastLowerTime =/= get({This, hundredthTime})) of
            true ->
            put({This, hundrethsString}, (get({get({This, primitiveLongUtil}), '$class'})):getCharArray(get({This, primitiveLongUtil}), get({This, hundredthTime}))),
            put({This, totalDigits}, (get({get({This, primitiveLongUtil}), '$class'})):getCurrentTotalDigits(get({This, primitiveLongUtil})));
            false -> ok
        end
        end.

reduce(This, Value) when is_integer(Value) ->
        put({This, modifier}, (get({This, modifier}) - Value)).

add(This, Value) when is_integer(Value) ->
        put({This, modifier}, (get({This, modifier}) + Value)).

getTimeChars(This) ->
        get({This, hundrethsString}).

getCurrentTotalDigits(This) ->
        get({This, totalDigits}).

