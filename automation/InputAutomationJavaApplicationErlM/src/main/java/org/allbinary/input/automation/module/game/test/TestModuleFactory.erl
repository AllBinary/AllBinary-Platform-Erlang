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
% package org.allbinary.input.automation.module.game.test
% import javax.swing
% import org.allbinary.input.automation.module.AbstractInputAutomationFactory
% import org.allbinary.input.automation.module.InputAutomationModuleData
% import org.allbinary.input.automation.module.configuration.BlankModuleConfigurationJPanel
% import org.allbinary.thread.RunnableInterface

-module('TestModuleFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractInputAutomationFactory', Function, Arguments).

static_init() ->
    put({?MODULE, 'NAME'}, lists:concat(["Test New Game", get({'InputAutomationModuleData', 'MODULE_NAME_END'})])),
    ok.

init_fields(This) ->
    put({This, blankModuleConfigurationJPanel}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbstractInputAutomationFactory':init(This, get({'TestModuleFactory', 'NAME'}), 'BlankModuleConfigurationJPanel':new()),
        init_fields(This).

getName(This) ->
        get({'TestModuleFactory', 'NAME'}).

getConfigurationJPanel(This) ->
        get({This, blankModuleConfigurationJPanel}).

% throws Exception
getInstance(This) ->
        undefined.

