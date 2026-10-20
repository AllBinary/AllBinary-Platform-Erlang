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
% package org.allbinary.input.automation.osgi
% import javax.swing
% import org.osgi.framework.Bundle
% import org.osgi.framework.BundleContext
% import bundle.input.automation.InputAutomationBundleActivator
% import org.allbinary.gui.dialog.BasicTextJDialog

-module('DesktopBundle').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'DESKTOP_SYMBOLIC_NAME'}, "org.knopflerfish.bundle.desktop"),
    ok.

init_fields(This) ->
    put({This, bundle}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        BundleContext = 'InputAutomationBundleActivator':getBundleContext(),
        case (BundleContext =/= undefined) of
            true ->
            BundleArray = (get({BundleContext, '$class'})):getBundles(BundleContext),
            lists:foreach(fun(Index) ->
                Bundle = array:get(Index, BundleArray),
                SymbolicName = (get({Bundle, '$class'})):getSymbolicName(Bundle),
                case ((get({SymbolicName, '$class'})):compareTo(SymbolicName, get({'DesktopBundle', 'DESKTOP_SYMBOLIC_NAME'})) =:= 0) of
                    true ->
                    put({This, bundle}, Bundle);
                    false -> ok
                end
            end, lists:seq(0, array:size(BundleArray) - 1));
            false ->
            TextJDialog = 'BasicTextJDialog':new("BundlContext is Null"),
            (get({TextJDialog, '$class'})):setVisible(TextJDialog, true)
        end.

% throws Exception
start(This) ->
        (get({get({This, bundle}), '$class'})):start(get({This, bundle})).

