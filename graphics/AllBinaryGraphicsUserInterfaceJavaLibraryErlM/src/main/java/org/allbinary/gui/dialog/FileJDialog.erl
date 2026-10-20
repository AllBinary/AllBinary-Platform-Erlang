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
% package org.allbinary.gui.dialog
% import org.allbinary.thread.ARunnable
% import java.io.File
% import org.allbinary.logic.communication.log.LogUtil

-module('FileJDialog').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JDialog', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, finishedListenerInterface}, undefined),
    put({This, jFileChooser1}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'JDialog':'$init'(This),
        init_fields(This),
        (get({This, '$class'})):initComponents(This),
        (fun(Target_N65804) -> (get({Target_N65804, '$class'})):setMultiSelectionEnabled(Target_N65804, true) end)((get({This, '$class'})):getJFileChooser1(This)).

new(Parent, Modal) when is_boolean(Modal) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Parent, Modal),
    This.

'$init'(This, Parent, Modal) when is_boolean(Modal) ->
        'JDialog':'$init'(This, Parent, Modal),
        init_fields(This),
        (get({This, '$class'})):initComponents(This),
        (fun(Target_N65899) -> (get({Target_N65899, '$class'})):setMultiSelectionEnabled(Target_N65899, true) end)((get({This, '$class'})):getJFileChooser1(This)).

addFinishedListener(This, FinishedListenerInterface) ->
        put({This, finishedListenerInterface}, FinishedListenerInterface).

initComponents(This) ->
        put({This, jFileChooser1}, 'JFileChooser':new()),
        (get({This, '$class'})):setDefaultCloseOperation(This, get({get({get({'javax', swing}), 'WindowConstants'}), 'DISPOSE_ON_CLOSE'})),
        (get({get({This, jFileChooser1}), '$class'})):addActionListener(get({This, jFileChooser1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        Layout = 'GroupLayout':new((get({This, '$class'})):getContentPane(This)),
        (fun(Target_N66423) -> (get({Target_N66423, '$class'})):setLayout(Target_N66423, Layout) end)((get({This, '$class'})):getContentPane(This)),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N66471) -> (get({Target_N66471, '$class'})):add(Target_N66471, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), (fun(Target_N66579) -> (get({Target_N66579, '$class'})):addContainerGap(Target_N66579) end)((fun(Target_N66586) -> (get({Target_N66586, '$class'})):add(Target_N66586, get({This, jFileChooser1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N66593) -> (get({Target_N66593, '$class'})):addContainerGap(Target_N66593, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N66834) -> (get({Target_N66834, '$class'})):add(Target_N66834, (fun(Target_N66902) -> (get({Target_N66902, '$class'})):addContainerGap(Target_N66902, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N66909) -> (get({Target_N66909, '$class'})):add(Target_N66909, get({This, jFileChooser1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 357, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N66916) -> (get({Target_N66916, '$class'})):addContainerGap(Target_N66916) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({This, '$class'})):pack(This).

jFileChooser1ActionPerformed(This, Evt) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Starting Action Command: ", (get({Evt, '$class'})):getActionCommand(Evt)]), This, "ActionPerformed"),
        Files = (fun(Target_N67215) -> (get({Target_N67215, '$class'})):getSelectedFiles(Target_N67215) end)((get({This, '$class'})):getJFileChooser1(This)),
        case ((get({Evt, '$class'})):getActionCommand(Evt) =:= get({(get({This, '$class'})):getJFileChooser1(This), 'CANCEL_SELECTION'})) of
            true ->
            (get({This, '$class'})):setVisible(This, false);
            false -> ok
        end,
        case ((get({Evt, '$class'})):getActionCommand(Evt) =:= get({(get({This, '$class'})):getJFileChooser1(This), 'APPROVE_SELECTION'})) of
            true ->
            case ((Files =/= undefined) andalso (array:size(Files) > 0)) of
                true ->
                (get({get({This, finishedListenerInterface}), '$class'})):onFiles(get({This, finishedListenerInterface}), Files);
                false -> ok
            end;
            false -> ok
        end.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        (get({get({get({'java', awt}), 'EventQueue'}), '$class'})):invokeLater(get({get({'java', awt}), 'EventQueue'}), 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
).

getJFileChooser1(This) ->
        get({This, jFileChooser1}).

setJFileChooser1(This, JFileChooser1) ->
        put({This, jFileChooser1}, JFileChooser1).

