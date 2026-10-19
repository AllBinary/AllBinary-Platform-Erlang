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
% import org.allbinary.logic.math.BasicDecimal

-module('DragVelocityBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('VelocityBehaviorBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'DragVelocityBehavior':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'VelocityBehaviorBase':init(This),
    init_fields(This).


reduce(This, VelocityProperties, Nominator, Denominator) when is_integer(Nominator), is_integer(Denominator) ->
        case ((fun(Target_N65702) -> (get({Target_N65702, '$class'})):getUnscaled(Target_N65702) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties)) =/= 0) of
            true ->
            put({local, basicDecimal}, (get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties)),
            (get({get({local, basicDecimal}), '$class'})):multiplyint(get({local, basicDecimal}), Nominator),
            (get({get({local, basicDecimal}), '$class'})):divideint(get({local, basicDecimal}), Denominator);
            false -> ok
        end,
        case ((fun(Target_N65862) -> (get({Target_N65862, '$class'})):getUnscaled(Target_N65862) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)) =/= 0) of
            true ->
            put({local, basicDecimal}, (get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)),
            (get({get({local, basicDecimal}), '$class'})):multiplyint(get({local, basicDecimal}), Nominator),
            (get({get({local, basicDecimal}), '$class'})):divideint(get({local, basicDecimal}), Denominator);
            false -> ok
        end.

reduceX(This, VelocityProperties, Nominator, Denominator) when is_integer(Nominator), is_integer(Denominator) ->
        BasicDecimal = (get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties),
        case ((get({BasicDecimal, '$class'})):getUnscaled(BasicDecimal) =/= 0) of
            true ->
            (get({BasicDecimal, '$class'})):multiplyint(BasicDecimal, Nominator),
            (get({BasicDecimal, '$class'})):divideint(BasicDecimal, Denominator);
            false -> ok
        end.

reduceY(This, VelocityProperties, Nominator, Denominator) when is_integer(Nominator), is_integer(Denominator) ->
        case ((fun(Target_N66372) -> (get({Target_N66372, '$class'})):getUnscaled(Target_N66372) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)) =/= 0) of
            true ->
            BasicDecimal = (get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties),
            (get({BasicDecimal, '$class'})):multiplyint(BasicDecimal, Nominator),
            (get({BasicDecimal, '$class'})):divideint(BasicDecimal, Denominator);
            false -> ok
        end.

