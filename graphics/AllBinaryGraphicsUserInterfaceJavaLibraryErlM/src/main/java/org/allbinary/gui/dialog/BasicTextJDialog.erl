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

-module('BasicTextJDialog').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JDialog', Function, Arguments).

init_fields(This) ->
    put({This, closeListenerInterface}, undefined),
    put({This, jButton1}, undefined),
    put({This, textJLabel}, undefined),
    ok.


new(Parent, Modal, Text) when is_boolean(Modal), (is_list(Text) orelse Text =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Parent, Modal, Text),
    This.

init(This, Parent, Modal, Text) when is_boolean(Modal), (is_list(Text) orelse Text =:= undefined) ->
        'JDialog':init(This, Parent, Modal),
        init_fields(This),
        (get({This, '$class'})):initComponents(This),
        (get({This, '$class'})):setText(This, Text).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        (get({get({This, textJLabel}), '$class'})):setText(get({This, textJLabel}), Text).

addCloseListener(This, CloseListenerInterface) ->
        put({This, closeListenerInterface}, CloseListenerInterface).

new(Text) when (is_list(Text) orelse Text =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Text),
    This.

init(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
    'JDialog':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        (get({get({This, textJLabel}), '$class'})):setText(get({This, textJLabel}), Text).

initComponents(This) ->
        put({This, jButton1}, 'JButton':new()),
        put({This, textJLabel}, 'JLabel':new()),
        (get({This, '$class'})):setDefaultCloseOperation(This, get({get({get({'javax', swing}), 'WindowConstants'}), 'DISPOSE_ON_CLOSE'})),
        (get({get({This, jButton1}), '$class'})):setText(get({This, jButton1}), "OK"),
        (get({get({This, jButton1}), '$class'})):addActionListener(get({This, jButton1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, textJLabel}), '$class'})):setText(get({This, textJLabel}), "No Text Set"),
        Layout = 'GroupLayout':new((get({This, '$class'})):getContentPane(This)),
        (fun(Target_N66519) -> (get({Target_N66519, '$class'})):setLayout(Target_N66519, Layout) end)((get({This, '$class'})):getContentPane(This)),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N66567) -> (get({Target_N66567, '$class'})):addGroup(Target_N66567, (fun(Target_N66635) -> (get({Target_N66635, '$class'})):addContainerGap(Target_N66635) end)((fun(Target_N66642) -> (get({Target_N66642, '$class'})):addGroup(Target_N66642, (fun(Target_N66667) -> (get({Target_N66667, '$class'})):addGroup(Target_N66667, (fun(Target_N66804) -> (get({Target_N66804, '$class'})):addComponent(Target_N66804, get({This, textJLabel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 184, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N66811) -> (get({Target_N66811, '$class'})):addContainerGap(Target_N66811) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((fun(Target_N66674) -> (get({Target_N66674, '$class'})):addGroup(Target_N66674, (fun(Target_N66742) -> (get({Target_N66742, '$class'})):addComponent(Target_N66742, get({This, jButton1})) end)((fun(Target_N66749) -> (get({Target_N66749, '$class'})):addGap(Target_N66749, 80, 80, 80) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N66929) -> (get({Target_N66929, '$class'})):addGroup(Target_N66929, (fun(Target_N66997) -> (get({Target_N66997, '$class'})):addComponent(Target_N66997, get({This, jButton1})) end)((fun(Target_N67004) -> (get({Target_N67004, '$class'})):addGap(Target_N67004, 30, 30, 30) end)((fun(Target_N67011) -> (get({Target_N67011, '$class'})):addComponent(Target_N67011, get({This, textJLabel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 20, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N67018) -> (get({Target_N67018, '$class'})):addGap(Target_N67018, 20, 20, 20) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):pack(This).

jButton1ActionPerformed(This, Evt) ->
        (get({This, '$class'})):setVisible(This, false),
        case (get({This, closeListenerInterface}) =/= undefined) of
            true ->
            (get({get({This, closeListenerInterface}), '$class'})):onClose(get({This, closeListenerInterface}));
            false -> ok
        end.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        (get({get({get({'java', awt}), 'EventQueue'}), '$class'})):invokeLater(get({get({'java', awt}), 'EventQueue'}), 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
).

