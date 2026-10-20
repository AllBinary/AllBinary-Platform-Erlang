% Generated Code Do Not Modify
% package org.allbinary.time
% import java.util.Calendar
% import java.util.TimeZone

-module('TimeTypeUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TimeTypeUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'NIGHT'}, "Night"),
    put({This, 'DAY'}, "Day"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'TimeTypeUtil', instance}).

isNight(This) ->
        HoursOfDay = (get({This, '$class'})):getHourOfDay(This),
        ((HoursOfDay < 6) orelse (HoursOfDay > 18)).

getHourOfDay(This) ->
        Calendar = 'Calendar':getInstance(),
        (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'HOUR_OF_DAY'})).

getNightOrDay(This) ->
        case (get({This, '$class'})):isNight(This) of true -> get({This, 'NIGHT'}); false -> get({This, 'DAY'}) end.

getHourOfDay(This, TimeInMillis) when is_integer(TimeInMillis) ->
        Calendar = 'Calendar':getInstance(),
        (get({Calendar, '$class'})):setTimeInMillis(Calendar, TimeInMillis),
        (get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'HOUR_OF_DAY'})).

isNight(This, TimeInMillis) when is_integer(TimeInMillis) ->
        HoursOfDay = (get({This, '$class'})):getHourOfDay(This, TimeInMillis),
        ((HoursOfDay < 6) orelse (HoursOfDay > 18)).

getNightOrDay(This, TimeInMillis) when is_integer(TimeInMillis) ->
        case (get({This, '$class'})):isNight(This, TimeInMillis) of true -> get({This, 'NIGHT'}); false -> get({This, 'DAY'}) end.

