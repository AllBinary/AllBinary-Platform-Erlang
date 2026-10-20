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
% package org.allbinary.game.health
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('Health').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements HealthInterface

static_init() ->
    put({?MODULE, 'NULL_HEALTH'}, 'Health':new(0)),
    put({?MODULE, 'NAME'}, "Health Resource"),
    put({?MODULE, 'HEALTH_LABEL'}, "Health: "),
    put({?MODULE, 'MAX_HEALTH_LABEL'}, " Max: "),
    ok.

init_fields(This) ->
    put({This, health}, 0),
    put({This, maxHealth}, 0),
    put({This, healthListenerInterface}, get({'NullHealthListener', 'NULL_HEALTH_LISTENER'})),
    ok.


new(MaxHealth) when is_integer(MaxHealth) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MaxHealth),
    This.

'$init'(This, MaxHealth) when is_integer(MaxHealth) ->
    init_fields(This),
        (get({This, '$class'})):setMaxHealth(This, MaxHealth),
        (get({This, '$class'})):setHealth(This, MaxHealth).

heal(This, Ahealth) when is_integer(Ahealth) ->
        NewHealth = ((get({This, '$class'})):getHealth(This) + Ahealth),
        case (NewHealth > (get({This, '$class'})):getMaxHealth(This)) of
            true ->
            (get({This, '$class'})):setHealth(This, (get({This, '$class'})):getMaxHealth(This));
            false ->
            (get({This, '$class'})):setHealth(This, NewHealth)
        end.

healMax(This) ->
        (get({This, '$class'})):setHealth(This, (get({This, '$class'})):getMaxHealth(This)).

isDamaged(This) ->
        try
        case ((get({This, '$class'})):getHealth(This) =/= (get({This, '$class'})):getMaxHealth(This)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

damage(This, Ahealth) when is_integer(Ahealth) ->
        try
        case (Ahealth < 0) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "******* Trying to heal when damaging. Damage: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Ahealth),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):toString(This)),
            'ForcedLogUtil':log((get({StringBuffer, '$class'})):toString(StringBuffer), This),
            throw({'$return', ok});
            false -> ok
        end,
        Health = ((get({This, '$class'})):getHealth(This) - Ahealth),
        (get({This, '$class'})):setHealth(This, Health)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isAlive(This) ->
        try
        case ((get({This, '$class'})):getHealth(This) =< 0) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getMaxHealth(This) ->
        get({This, maxHealth}).

setMaxHealth(This, MaxHealth) when is_integer(MaxHealth) ->
        put({This, maxHealth}, MaxHealth).

setHealth(This, Health) when is_integer(Health) ->
        case (Health > (get({This, '$class'})):getMaxHealth(This)) of
            true ->
            put({This, health}, (get({This, '$class'})):getMaxHealth(This));
            false ->
            case (Health < 0) of
            true ->
            put({This, health}, 0);
            false ->
            put({This, health}, Health)
        end
        end,
        case (get({This, healthListenerInterface}) =/= undefined) of
            true ->
            (get({get({This, healthListenerInterface}), '$class'})):onHealthChange(get({This, healthListenerInterface}));
            false -> ok
        end.

getHealth(This) ->
        get({This, health}).

addListener(This, HealthGraphic) ->
        put({This, healthListenerInterface}, HealthGraphic).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'Health', 'HEALTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, health})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'Health', 'MAX_HEALTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, maxHealth})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

