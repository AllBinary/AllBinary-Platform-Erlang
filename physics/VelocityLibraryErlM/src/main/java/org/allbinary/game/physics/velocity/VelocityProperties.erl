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
% package org.allbinary.game.physics.velocity

-module('VelocityProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements VelocityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicVelocityProperties', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_VELOCITY_PROPERTIES'}, 'VelocityProperties':new(0, 0)),
    ok.

init_fields(This) ->
    put({This, maxForwardVelocity}, 0),
    put({This, maxReverseVelocity}, 0),
    ok.


new(MaxForwardVelocity, MaxReverseVelocity) when is_integer(MaxForwardVelocity), is_integer(MaxReverseVelocity) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MaxForwardVelocity, MaxReverseVelocity),
    This.

init(This, MaxForwardVelocity, MaxReverseVelocity) when is_integer(MaxForwardVelocity), is_integer(MaxReverseVelocity) ->
    'BasicVelocityProperties':init(This),
    init_fields(This),
        (get({This, '$class'})):setMaxForwardVelocity(This, MaxForwardVelocity),
        (get({This, '$class'})):setMaxReverseVelocity(This, MaxReverseVelocity).

getMaxForwardVelocity(This) ->
        get({This, maxForwardVelocity}).

setMaxForwardVelocity(This, MaxForwardVelocity) when is_integer(MaxForwardVelocity) ->
        put({This, maxForwardVelocity}, MaxForwardVelocity).

getMaxReverseVelocity(This) ->
        get({This, maxReverseVelocity}).

setMaxReverseVelocity(This, MaxReverseVelocity) when is_integer(MaxReverseVelocity) ->
        put({This, maxReverseVelocity}, MaxReverseVelocity).

limitMaxXYForwardVelocity(This) ->
        (get({This, '$class'})):limitMaxXYVelocity(This, (get({This, '$class'})):getMaxForwardVelocity(This)).

limitMaxXYReverseVelocity(This) ->
        (get({This, '$class'})):limitMaxXYVelocity(This, (get({This, '$class'})):getMaxReverseVelocity(This)).

limitMaxYForwardVelocity(This) ->
        (get({This, '$class'})):limitMaxYVelocity(This, (get({This, '$class'})):getMaxForwardVelocity(This)).

limitMaxYReverseVelocity(This) ->
        (get({This, '$class'})):limitMaxYVelocity(This, (get({This, '$class'})):getMaxReverseVelocity(This)).

limitMaxXForwardVelocity(This) ->
        (get({This, '$class'})):limitMaxXVelocity(This, (get({This, '$class'})):getMaxForwardVelocity(This)).

limitMaxXReverseVelocity(This) ->
        (get({This, '$class'})):limitMaxXVelocity(This, (get({This, '$class'})):getMaxReverseVelocity(This)).

isOverXYMaxForwardVelocity(This) ->
        (get({This, '$class'})):isOverXYMaxVelocity(This, (get({This, '$class'})):getMaxForwardVelocity(This)).

isOverXYMaxReverseVelocity(This) ->
        (get({This, '$class'})):isOverXYMaxVelocity(This, (get({This, '$class'})):getMaxReverseVelocity(This)).

limitXYToForwardAndReverseMaxVelocity(This) ->
        (get({This, '$class'})):limitMaxXYForwardVelocity(This),
        (get({This, '$class'})):limitMaxXYReverseVelocity(This).

limitMaxXYVelocity(This, MaxVelocity) when is_integer(MaxVelocity) ->
        (get({This, '$class'})):limitMaxXVelocity(This, MaxVelocity),
        (get({This, '$class'})):limitMaxYVelocity(This, MaxVelocity).

limitMaxPositiveYVelocity(This, MaxVelocity) when is_integer(MaxVelocity) ->
        case ((get({get({This, velocityYBasicDecimal}), '$class'})):getUnscaled(get({This, velocityYBasicDecimal})) > MaxVelocity) of
            true ->
            (get({get({This, velocityYBasicDecimal}), '$class'})):setint(get({This, velocityYBasicDecimal}), MaxVelocity);
            false -> ok
        end.

limitMaxNegativeYVelocity(This, MaxVelocity) when is_integer(MaxVelocity) ->
        case ((get({get({This, velocityYBasicDecimal}), '$class'})):getUnscaled(get({This, velocityYBasicDecimal})) < (-MaxVelocity)) of
            true ->
            (get({get({This, velocityYBasicDecimal}), '$class'})):setint(get({This, velocityYBasicDecimal}), (-MaxVelocity));
            false -> ok
        end.

limitMaxYVelocity(This, MaxVelocity) when is_integer(MaxVelocity) ->
        (get({This, '$class'})):limitMaxPositiveYVelocity(This, MaxVelocity),
        (get({This, '$class'})):limitMaxNegativeYVelocity(This, MaxVelocity).

limitMaxXVelocity(This, MaxVelocity) when is_integer(MaxVelocity) ->
        case ((get({get({This, velocityXBasicDecimal}), '$class'})):getUnscaled(get({This, velocityXBasicDecimal})) > MaxVelocity) of
            true ->
            (get({get({This, velocityXBasicDecimal}), '$class'})):setint(get({This, velocityXBasicDecimal}), MaxVelocity);
            false -> ok
        end,
        case ((get({get({This, velocityXBasicDecimal}), '$class'})):getUnscaled(get({This, velocityXBasicDecimal})) < (-MaxVelocity)) of
            true ->
            (get({get({This, velocityXBasicDecimal}), '$class'})):setint(get({This, velocityXBasicDecimal}), (-MaxVelocity));
            false -> ok
        end.

isOverXYMaxVelocity(This, MaxVelocity) when is_integer(MaxVelocity) ->
        try
        case ((get({get({This, velocityXBasicDecimal}), '$class'})):getUnscaled(get({This, velocityXBasicDecimal})) > MaxVelocity) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        case ((get({get({This, velocityXBasicDecimal}), '$class'})):getUnscaled(get({This, velocityXBasicDecimal})) < (-MaxVelocity)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        case ((get({get({This, velocityYBasicDecimal}), '$class'})):getUnscaled(get({This, velocityYBasicDecimal})) > MaxVelocity) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        case ((get({get({This, velocityYBasicDecimal}), '$class'})):getUnscaled(get({This, velocityYBasicDecimal})) < (-MaxVelocity)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setVelocityi(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude), is_integer(Angle), is_integer(OtherAngle) ->
        'BasicVelocityProperties':setVelocityi(This, Magnitude, Angle, OtherAngle),
        (get({This, '$class'})):limitXYToForwardAndReverseMaxVelocity(This).

addVelocityi(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude), is_integer(Angle), is_integer(OtherAngle) ->
        'BasicVelocityProperties':addVelocityi(This, Magnitude, Angle, OtherAngle),
        (get({This, '$class'})):limitXYToForwardAndReverseMaxVelocity(This).

