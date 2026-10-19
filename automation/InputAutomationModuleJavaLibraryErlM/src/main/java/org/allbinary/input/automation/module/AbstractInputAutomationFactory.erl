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
% package org.allbinary.input.automation.module
% import java.net.URL
% import javax.help.HelpSet
% import javax.swing
% import org.allbinary.logic.java.help.JavaHelpUtil

-module('AbstractInputAutomationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InputAutomationModuleFactoryInterface', Function, Arguments).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, jPanel}, undefined),
    put({This, helpSet}, undefined),
    ok.


new(Name, JPanel, HelpSet) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, JPanel, HelpSet),
    This.

init(This, Name, JPanel, HelpSet) when (is_list(Name) orelse Name =:= undefined) ->
    'InputAutomationModuleFactoryInterface':init(This),
    init_fields(This),
        put({This, name}, Name),
        put({This, jPanel}, JPanel),
        put({This, helpSet}, HelpSet).

new(Name, JPanel) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, JPanel),
    This.

init(This, Name, JPanel) when (is_list(Name) orelse Name =:= undefined) ->
    'InputAutomationModuleFactoryInterface':init(This),
    init_fields(This),
        put({This, name}, Name),
        put({This, jPanel}, JPanel),
        Url = (get({get({This, '$class'}), '$class'})):getResource(get({This, '$class'}), "/help/Help.hs"),
        put({This, helpSet}, (fun(Target_N66074) -> (get({Target_N66074, '$class'})):getHelpSet(Target_N66074, Url) end)('JavaHelpUtil':getInstance())).

getName(This) ->
        get({This, name}).

getConfigurationJPanel(This) ->
        get({This, jPanel}).

getHelpSet(This) ->
        get({This, helpSet}).

