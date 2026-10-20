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
% package org.allbinary.android.input.motion
% import org.allbinary.android.input.motion.event.AnalogControllerConfigurationEvent
% import org.allbinary.android.input.motion.event.AnalogControllerConfigurationEventHandler
% import org.allbinary.logic.math.ScaleFactorFactory

-module('AnalogControllerConfigurationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AnalogControllerConfigurationFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'SCALE_FACTOR'}, get({'ScaleFactorFactory':getInstance(), 'DEFAULT_SCALE_FACTOR'})),
    put({This, 'SCALE_VALUE'}, get({'ScaleFactorFactory':getInstance(), 'DEFAULT_SCALE_VALUE'})),
    put({This, available}, false),
    put({This, analogControllerConfigurationEvent}, 'AnalogControllerConfigurationEvent':new(This)),
    ok.


getInstance() ->
        get({'AnalogControllerConfigurationFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

isAvailable(This) ->
        get({This, available}).

% throws Exception
setAvailable(This, Available) when is_boolean(Available) ->
        put({This, available}, Available),
        (fun(Target_N66094) -> (get({Target_N66094, '$class'})):fireEvent(Target_N66094, get({This, analogControllerConfigurationEvent})) end)('AnalogControllerConfigurationEventHandler':getInstance()).

