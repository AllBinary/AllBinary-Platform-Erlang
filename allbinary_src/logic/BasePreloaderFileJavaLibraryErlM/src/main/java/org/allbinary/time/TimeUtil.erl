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
% package org.allbinary.time
% import java.util.Calendar

-module('TimeUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TimeUtil':new()),
    put({?MODULE, calendar}, 'Calendar':getInstance()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'TimeUtil', instance}).

setCalendar(This, Calendar, YearString, MonthString, DayString, HourString) when (is_list(YearString) orelse YearString =:= undefined), (is_list(MonthString) orelse MonthString =:= undefined), (is_list(DayString) orelse DayString =:= undefined), (is_list(HourString) orelse HourString =:= undefined) ->
        Year = (get({YearString, '$class'})):intValue(YearString),
        Month = (get({MonthString, '$class'})):intValue(MonthString),
        Day = (get({DayString, '$class'})):intValue(DayString),
        Hour = (get({HourString, '$class'})):intValue(HourString),
        (get({Calendar, '$class'})):set(Calendar, Year, Month, Day, Hour, 0).

setCalendar(This, Calendar, YearString, MonthString, DayString, HourString, MinuteString, SecondString) when (is_list(YearString) orelse YearString =:= undefined), (is_list(MonthString) orelse MonthString =:= undefined), (is_list(DayString) orelse DayString =:= undefined), (is_list(HourString) orelse HourString =:= undefined), (is_list(MinuteString) orelse MinuteString =:= undefined), (is_list(SecondString) orelse SecondString =:= undefined) ->
        Year = (get({YearString, '$class'})):intValue(YearString),
        Month = (get({MonthString, '$class'})):intValue(MonthString),
        Day = (get({DayString, '$class'})):intValue(DayString),
        Hour = (get({HourString, '$class'})):intValue(HourString),
        Minute = (get({MinuteString, '$class'})):intValue(MinuteString),
        Second = (get({SecondString, '$class'})):intValue(SecondString),
        (get({Calendar, '$class'})):set(Calendar, Year, Month, Day, Hour, Minute, Second).

setExpirationCalendar(This, Calendar, YearsString, MonthsString, DaysString, HoursString, MinutesString, SecondsString) when (is_list(YearsString) orelse YearsString =:= undefined), (is_list(MonthsString) orelse MonthsString =:= undefined), (is_list(DaysString) orelse DaysString =:= undefined), (is_list(HoursString) orelse HoursString =:= undefined), (is_list(MinutesString) orelse MinutesString =:= undefined), (is_list(SecondsString) orelse SecondsString =:= undefined) ->
        Year = ((get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'YEAR'})) + (get({YearsString, '$class'})):intValue(YearsString)),
        Month = ((get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'MONTH'})) + (get({MonthsString, '$class'})):intValue(MonthsString)),
        Day = ((get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'DAY_OF_MONTH'})) + (get({DaysString, '$class'})):intValue(DaysString)),
        Hour = ((get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'HOUR'})) + (get({HoursString, '$class'})):intValue(HoursString)),
        Minute = ((get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'MINUTE'})) + (get({MinutesString, '$class'})):intValue(MinutesString)),
        Second = ((get({Calendar, '$class'})):get(Calendar, get({'Calendar', 'SECOND'})) + (get({SecondsString, '$class'})):intValue(SecondsString)),
        (get({Calendar, '$class'})):set(Calendar, Year, Month, Day, Hour, Minute, Second).

getTotalTime(This, YearString, MonthString, DayString, HourString, MinuteString, SecondString) when (is_list(YearString) orelse YearString =:= undefined), (is_list(MonthString) orelse MonthString =:= undefined), (is_list(DayString) orelse DayString =:= undefined), (is_list(HourString) orelse HourString =:= undefined), (is_list(MinuteString) orelse MinuteString =:= undefined), (is_list(SecondString) orelse SecondString =:= undefined) ->
        Time = (get({get({'TimeUtil', calendar}), '$class'})):getTimeInMillis(get({'TimeUtil', calendar})),
        (get({This, '$class'})):setExpirationCalendar(This, get({'TimeUtil', calendar}), YearString, MonthString, DayString, HourString, MinuteString, SecondString),
        TimeDelta = (get({get({'TimeUtil', calendar}), '$class'})):getTimeInMillis(get({'TimeUtil', calendar})),
        (TimeDelta - Time).

