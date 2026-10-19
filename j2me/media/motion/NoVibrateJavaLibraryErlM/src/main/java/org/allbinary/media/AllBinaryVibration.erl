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
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'AllBinaryVibrationME':init(This),
    init_fields(This),
        ok.

getInstance() ->
        get({'AllBinaryVibration', 'VIBRATION'}).

init() ->
        case ((fun(Target_N65756) -> (get({Target_N65756, '$class'})):intValue(Target_N65756) end)((fun(Target_N65763) -> (get({Target_N65763, '$class'})):getValue(Target_N65763) end)(get({'GameConfigurationCentral':getInstance(), 'VIBRATION'}))) =:= 0) of
            true ->
            put({'AllBinaryVibration', 'VIBRATION'}, get({'AllBinaryNoVibration', 'NO_VIBRATION'}));
            false ->
            put({'AllBinaryVibration', 'VIBRATION'}, 'AllBinaryVibration':new())
        end.

vibrate(This, Duration, Type, Volume) when is_integer(Duration), is_integer(Type), is_integer(Volume) ->
        ok.

