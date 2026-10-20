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
% package org.allbinary.logic.java.help
% import java.awt
% import java.awt.event.ActionEvent
% import java.io.File
% import java.net.URI
% import java.net.URL
% import javax.help.CSH
% import javax.help.HelpBroker
% import javax.help.HelpSet
% import javax.swing
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('JavaHelpUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'JavaHelpUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, point}, 'Point':new(0, 0)),
    put({This, dimension}, 'Dimension':new(640, 480)),
    put({This, contextSensitiveHelpActionEvent}, 'ActionEvent':new('JLabel':new(), get({'ActionEvent', 'ACTION_FIRST'}), undefined)),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


getInstance() ->
        get({'JavaHelpUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getHelpSet(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        try
            HelpSetURI = (fun(Target_N66270) -> (get({Target_N66270, '$class'})):toURI(Target_N66270) end)('File':new(FilePath)),
            HelpSetURL = (get({HelpSetURI, '$class'})):toURL(HelpSetURI),
            (get({This, '$class'})):getHelpSet(This, HelpSetURL)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), getInstance(), "set", E),
            undefined
        end;
getHelpSet(This, Url) ->
        try
            'HelpSet':new(undefined, Url)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), getInstance(), "set", E),
            undefined
        end.


show(This, HelpSet) ->
        try
            HelpBroker = (get({HelpSet, '$class'})):createHelpBroker(HelpSet),
            (get({HelpBroker, '$class'})):setLocation(HelpBroker, get({This, point})),
            (get({HelpBroker, '$class'})):setSize(HelpBroker, get({This, dimension})),
            (fun(Target_N66858) -> (get({Target_N66858, '$class'})):actionPerformed(Target_N66858, get({This, contextSensitiveHelpActionEvent})) end)('DisplayHelpFromSource':new(HelpBroker)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "CSH Action", getInstance(), "show")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), getInstance(), "show", E)
        end.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        try
            JavaHelpUtil = 'JavaHelpUtil':getInstance(),
            (get({JavaHelpUtil, '$class'})):show(JavaHelpUtil, (get({JavaHelpUtil, '$class'})):getHelpSet(JavaHelpUtil, "G:/mnt/bc/mydev/working/automation/InputAutomationJavaApplication/AllBinaryInputAutomationHelp/AllBinaryInputAutomation.hs"))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

