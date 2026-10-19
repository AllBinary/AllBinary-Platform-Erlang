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
% package org.allbinary.game.configuration
% import javax.microedition.lcdui.Gauge

-module('GameConfigurationGauge').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Gauge', Function, Arguments).

init_fields(This) ->
    ok.


new(GameConfiguration) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameConfiguration),
    This.

init(This, GameConfiguration) ->
        'Gauge':init(This, (get({GameConfiguration, '$class'})):getName(GameConfiguration), (fun(Target_N65649) -> (get({Target_N65649, '$class'})):booleanValue(Target_N65649) end)((get({GameConfiguration, '$class'})):isModifiable(GameConfiguration)), ((fun(Target_N65677) -> (get({Target_N65677, '$class'})):intValue(Target_N65677) end)((get({GameConfiguration, '$class'})):getMaxValue(GameConfiguration)) - (fun(Target_N65701) -> (get({Target_N65701, '$class'})):intValue(Target_N65701) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration))), ((fun(Target_N65730) -> (get({Target_N65730, '$class'})):intValue(Target_N65730) end)((get({GameConfiguration, '$class'})):getValue(GameConfiguration)) - (fun(Target_N65754) -> (get({Target_N65754, '$class'})):intValue(Target_N65754) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration)))).

