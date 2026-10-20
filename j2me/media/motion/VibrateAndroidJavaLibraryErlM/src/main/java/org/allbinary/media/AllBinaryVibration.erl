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
% package org.allbinary.media
% import android.content.Context
% import android.os.Vibrator
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.game.configuration.GameConfigurationCentral

-module('AllBinaryVibration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryVibrationME', Function, Arguments).

static_init() ->
    put({?MODULE, 'VIBRATION'}, get({'AllBinaryNoVibration', 'NO_VIBRATION'})),
    ok.

init_fields(This) ->
    put({This, vibrator}, (fun(Target_N65761) -> (get({Target_N65761, '$class'})):getSystemService(Target_N65761, get({'Context', 'VIBRATOR_SERVICE'})) end)((fun(Target_N65768) -> (get({Target_N65768, '$class'})):getContext(Target_N65768) end)('ResourceUtil':getInstance()))),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'AllBinaryVibrationME':'$init'(This),
    init_fields(This),
        ok.

getInstance() ->
        get({'AllBinaryVibration', 'VIBRATION'}).

init() ->
        case ((fun(Target_N65927) -> (get({Target_N65927, '$class'})):intValue(Target_N65927) end)((fun(Target_N65934) -> (get({Target_N65934, '$class'})):getValue(Target_N65934) end)(get({'GameConfigurationCentral':getInstance(), 'VIBRATION'}))) =:= 0) of
            true ->
            put({'AllBinaryVibration', 'VIBRATION'}, get({'AllBinaryNoVibration', 'NO_VIBRATION'}));
            false ->
            put({'AllBinaryVibration', 'VIBRATION'}, 'AllBinaryVibration':new())
        end.

vibrate(This, Duration, Type, Volume) when is_integer(Duration), is_integer(Type), is_integer(Volume) ->
        (get({get({This, vibrator}), '$class'})):vibrate(get({This, vibrator}), Duration).

