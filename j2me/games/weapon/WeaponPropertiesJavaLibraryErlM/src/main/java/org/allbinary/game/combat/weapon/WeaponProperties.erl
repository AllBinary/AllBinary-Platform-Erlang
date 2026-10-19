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
% package org.allbinary.game.combat.weapon
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('WeaponProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SimpleWeaponProperties', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_WEAPON_PROPERTIES'}, 'WeaponProperties':new(0, 0, 0, 0, 0)),
    put({?MODULE, messageSent}, false),
    put({?MODULE, 'DAMAGE'}, "Damage: "),
    put({?MODULE, 'RANGE'}, "Range: "),
    put({?MODULE, 'RELOAD'}, "Reload: "),
    ok.

init_fields(This) ->
    put({This, reloadTime}, 0),
    put({This, targetingTime}, 0),
    put({This, speed}, get({'BasicDecimal', 'ZERO_BIGDECIMAL'})),
    put({This, 'MAX'}, 10240),
    put({This, 'ZERO'}, 0),
    ok.


new(ReloadTime, TargetingTime, Speed, Damage, Dissipation) when is_integer(ReloadTime), is_integer(TargetingTime), is_integer(Speed), is_integer(Damage), is_integer(Dissipation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ReloadTime, TargetingTime, Speed, Damage, Dissipation),
    This.

init(This, ReloadTime, TargetingTime, Speed, Damage, Dissipation) when is_integer(ReloadTime), is_integer(TargetingTime), is_integer(Speed), is_integer(Damage), is_integer(Dissipation) ->
    'SimpleWeaponProperties':init(This),
    init_fields(This),
        case (((Speed < get({This, 'MAX'})) andalso (Speed =/= 0)) andalso (not get({'WeaponProperties', messageSent}))) of
            true ->
            MESSAGE = "Danger Danger Danger: Speed probably to slow if using 1 degree calculations as velocity for a single axis could be below 1024: ",
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':put((fun(Target_N66229) -> (get({Target_N66229, '$class'})):toString(Target_N66229) end)((fun(Target_N66236) -> (get({Target_N66236, '$class'})):appendlong(Target_N66236, Speed) end)((fun(Target_N66243) -> (get({Target_N66243, '$class'})):append(Target_N66243, MESSAGE) end)('StringMaker':new()))), This, get({CommonStrings, 'CONSTRUCTOR'})),
            put({'WeaponProperties', messageSent}, true);
            false -> ok
        end,
        (get({This, '$class'})):setReloadTime(This, ReloadTime),
        (get({This, '$class'})):setTargetingTime(This, TargetingTime),
        (get({This, '$class'})):setDamage(This, Damage),
        (get({This, '$class'})):setDissipation(This, Dissipation),
        (get({This, '$class'})):setSpeed(This, 'BasicDecimal':new(Speed)),
        case (Dissipation =/= get({This, 'ZERO'})) of
            true ->
            UnscaledDamage = ((get({get({This, speed}), '$class'})):getUnscaled(get({This, speed})) * Damage),
            ScaledDissipation = (Dissipation * (get({get({This, speed}), '$class'})):getScaledFactorValue(get({This, speed}))),
            Value = ((UnscaledDamage div ScaledDissipation)),
            (get({This, '$class'})):setRange(This, (((Value * 9)) div 10));
            false -> ok
        end.

setReloadTime(This, ReloadTime) when is_integer(ReloadTime) ->
        put({This, reloadTime}, ReloadTime).

getReloadTime(This) ->
        get({This, reloadTime}).

setTargetingTime(This, TargetingTime) when is_integer(TargetingTime) ->
        put({This, targetingTime}, TargetingTime).

getTargetingTime(This) ->
        get({This, targetingTime}).

getSpeed(This) ->
        get({This, speed}).

setSpeed(This, Speed) ->
        put({This, speed}, Speed).

getDamageI(This, Range) when is_integer(Range) ->
        ((get({This, '$class'})):getDamage(This) - (((((get({This, '$class'})):getDissipation(This) * Range)) / (get({get({This, speed}), '$class'})):getScaled(get({This, speed}))))).

toStringArray(This) ->
        put({local, index}, 0),
        StringArray = array:new(3, {default, undefined}),
        StringBuffer = 'StringMaker':new(),
        array:set(allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1)), (fun(Target_N67607) -> (get({Target_N67607, '$class'})):toString(Target_N67607) end)((fun(Target_N67614) -> (get({Target_N67614, '$class'})):appendint(Target_N67614, trunc((get({This, '$class'})):getDamage(This))) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'WeaponProperties', 'DAMAGE'})))), StringArray),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        array:set(allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1)), (fun(Target_N67749) -> (get({Target_N67749, '$class'})):toString(Target_N67749) end)((fun(Target_N67756) -> (get({Target_N67756, '$class'})):appendint(Target_N67756, trunc((get({This, '$class'})):getRange(This))) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'WeaponProperties', 'RANGE'})))), StringArray),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        array:set(allbinary_java:first(get({local, index}), put({local, index}, get({local, index}) + 1)), (fun(Target_N67895) -> (get({Target_N67895, '$class'})):toString(Target_N67895) end)((fun(Target_N67902) -> (get({Target_N67902, '$class'})):appendlong(Target_N67902, (get({This, '$class'})):getReloadTime(This)) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'WeaponProperties', 'RELOAD'})))), StringArray),
        StringArray.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N68058) -> (get({Target_N68058, '$class'})):appendint(Target_N68058, trunc((get({This, '$class'})):getDamage(This))) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'WeaponProperties', 'DAMAGE'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (fun(Target_N68166) -> (get({Target_N68166, '$class'})):appendint(Target_N68166, trunc((get({This, '$class'})):getRange(This))) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'WeaponProperties', 'RANGE'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (fun(Target_N68274) -> (get({Target_N68274, '$class'})):appendlong(Target_N68274, (get({This, '$class'})):getReloadTime(This)) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'WeaponProperties', 'RELOAD'}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

