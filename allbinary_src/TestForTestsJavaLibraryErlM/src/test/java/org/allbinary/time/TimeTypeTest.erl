% Generated Code Do Not Modify
% package org.allbinary.time
% import java.util.Calendar
% import org.junit.jupiter.api.Assertions
% import org.junit.jupiter.api.DisplayName
% import org.junit.jupiter.api.Test

-module('TimeTypeTest').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


millisForHourLocal(Hour) when is_integer(Hour) ->
        Cal = 'Calendar':getInstance(),
        (get({Cal, '$class'})):set(Cal, get({'Calendar', 'HOUR_OF_DAY'}), Hour),
        (get({Cal, '$class'})):set(Cal, get({'Calendar', 'MINUTE'}), 0),
        (get({Cal, '$class'})):set(Cal, get({'Calendar', 'SECOND'}), 0),
        (get({Cal, '$class'})):set(Cal, get({'Calendar', 'MILLISECOND'}), 0),
        (get({Cal, '$class'})):getTimeInMillis(Cal).

isNight_returnsTrue_for_hours_less_than_6(This) ->
        ok % Otherwise - statement - ForEachStmt
.

isNight_returnsTrue_for_hours_greater_than_18(This) ->
        ok % Otherwise - statement - ForEachStmt
.

isNight_returnsFalse_for_boundary_hours_6_and_18(This) ->
        ok % Otherwise - statement - ForEachStmt
.

getNightOrDay_returns_expected_label(This) ->
        NightUtil = 'TestableTimeTypeUtil':new(0),
        'Assertions':assertEquals(get({NightUtil, 'NIGHT'}), (get({NightUtil, '$class'})):getNightOrDay(NightUtil)),
        DayUtil = 'TestableTimeTypeUtil':new(12),
        'Assertions':assertEquals(get({DayUtil, 'DAY'}), (get({DayUtil, '$class'})):getNightOrDay(DayUtil)).

getHourOfDay_long_converts_epoch_to_local_hour(This) ->
        Util = 'TimeTypeUtil':new(),
        ok % Otherwise - statement - ForEachStmt
.

isNight_long_expected_ranges(This) ->
        Util = 'TimeTypeUtil':new(),
        ok % Otherwise - statement - ForEachStmt
,
        ok % Otherwise - statement - ForEachStmt
.

getNightOrDay_long_consistency(This) ->
        Util = 'TimeTypeUtil':new(),
        NightMillis = 'TimeTypeTest':millisForHourLocal(0),
        DayMillis = 'TimeTypeTest':millisForHourLocal(12),
        'Assertions':assertEquals(get({Util, 'NIGHT'}), (get({Util, '$class'})):getNightOrDay(Util, NightMillis)),
        'Assertions':assertEquals(get({Util, 'DAY'}), (get({Util, '$class'})):getNightOrDay(Util, DayMillis)).

boundaries_day_for_long_based_api(This) ->
        Util = 'TimeTypeUtil':new(),
        ok % Otherwise - statement - ForEachStmt
.

constants_accessible_and_stable(This) ->
        Util = 'TimeTypeUtil':new(),
        'Assertions':assertEquals("Night", get({Util, 'NIGHT'})),
        'Assertions':assertEquals("Day", get({Util, 'DAY'})).

getInstance_returns_same_singleton(This) ->
        A = 'TimeTypeUtil':getInstance(),
        B = 'TimeTypeUtil':getInstance(),
        'Assertions':assertSame(A, B).
% Java nested class TestableTimeTypeUtil: move it to its own module 'TestableTimeTypeUtil'

