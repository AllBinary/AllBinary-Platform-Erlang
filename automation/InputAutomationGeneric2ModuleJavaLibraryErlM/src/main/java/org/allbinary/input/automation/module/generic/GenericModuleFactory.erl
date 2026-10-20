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
% package org.allbinary.input.automation.module.generic
% import org.allbinary.input.automation.module.AbstractInputAutomationFactory
% import org.allbinary.input.automation.module.InputAutomationActionInterface
% import org.allbinary.input.automation.module.InputAutomationModuleData
% import org.allbinary.input.automation.module.generic.configuration.GenericModuleConfigurationJPanel
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile
% import org.allbinary.input.automation.module.generic.constraints.NoImageComparatorConstraints
% import org.allbinary.input.automation.module.generic.constraints.NoMotionRectangleConstraints
% import org.allbinary.thread.RunnableInterface

-module('GenericModuleFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractInputAutomationFactory', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, lists:concat(["Generic", get({'InputAutomationModuleData', 'MODULE_NAME_END'})])),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AbstractInputAutomationFactory':'$init'(This, get({'GenericModuleFactory', 'NAME'}), 'GenericModuleConfigurationJPanel':new()).

% throws Exception
getInstance(This) ->
        GenericProfile = (fun(Target_N66062) -> (get({Target_N66062, '$class'})):getSelectedGenericProfile(Target_N66062) end)(((get({This, '$class'})):getConfigurationJPanel(This))),
        InputAutomationActionInterface = 'GenericInputAutomationAction':new(),
        'GenericInputAutomationWorker':new(InputAutomationActionInterface, GenericProfile, 'NoMotionRectangleConstraints':new(), 'NoImageComparatorConstraints':new()).

