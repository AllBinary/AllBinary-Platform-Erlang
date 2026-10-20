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
% package org.allbinary.graphics.j2me.dialog
% import org.allbinary.thread.ARunnable
% import java.util.HashMap
% import org.allbinary.gui.dialog.HashMapJDialogListenerInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('RotateJDialog').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JDialog', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, hashMap}, (fun(Target_N65844) -> (get({Target_N65844, '$class'})):createHashMap(Target_N65844) end)('StdUtil':getInstance())),
    put({This, angleIncrementJTextField}, undefined),
    put({This, jButton1}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jPanel1}, undefined),
    put({This, totalRotationJTextField}, undefined),
    ok.


new(Parent, Modal) when is_boolean(Modal) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Parent, Modal),
    This.

'$init'(This, Parent, Modal) when is_boolean(Modal) ->
        'JDialog':'$init'(This, Parent, Modal),
        init_fields(This),
        (get({This, '$class'})):initComponents(This).

initComponents(This) ->
        put({This, angleIncrementJTextField}, 'JTextField':new()),
        put({This, jLabel1}, 'JLabel':new()),
        put({This, totalRotationJTextField}, 'JTextField':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, jPanel1}, 'JPanel':new()),
        put({This, jButton1}, 'JButton':new()),
        (get({This, '$class'})):setDefaultCloseOperation(This, get({get({get({'javax', swing}), 'WindowConstants'}), 'DISPOSE_ON_CLOSE'})),
        (get({get({This, angleIncrementJTextField}), '$class'})):setText(get({This, angleIncrementJTextField}), "36"),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Angle Increment:"),
        (get({get({This, totalRotationJTextField}), '$class'})):setText(get({This, totalRotationJTextField}), "360"),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Total Angular Rotation:"),
        (get({get({This, jButton1}), '$class'})):setText(get({This, jButton1}), "OK"),
        (get({get({This, jButton1}), '$class'})):addActionListener(get({This, jButton1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N66783) -> (get({Target_N66783, '$class'})):addGroup(Target_N66783, (fun(Target_N66851) -> (get({Target_N66851, '$class'})):addContainerGap(Target_N66851, 62, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N66858) -> (get({Target_N66858, '$class'})):addComponent(Target_N66858, get({This, jButton1})) end)((fun(Target_N66865) -> (get({Target_N66865, '$class'})):addGap(Target_N66865, 62, 62, 62) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout))))) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N66965) -> (get({Target_N66965, '$class'})):addComponent(Target_N66965, get({This, jButton1})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        Layout = 'GroupLayout':new((get({This, '$class'})):getContentPane(This)),
        (fun(Target_N67131) -> (get({Target_N67131, '$class'})):setLayout(Target_N67131, Layout) end)((get({This, '$class'})):getContentPane(This)),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N67179) -> (get({Target_N67179, '$class'})):addComponent(Target_N67179, get({This, jPanel1}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67186) -> (get({Target_N67186, '$class'})):addGroup(Target_N67186, (fun(Target_N67254) -> (get({Target_N67254, '$class'})):addContainerGap(Target_N67254) end)((fun(Target_N67261) -> (get({Target_N67261, '$class'})):addGroup(Target_N67261, (fun(Target_N67453) -> (get({Target_N67453, '$class'})):addComponent(Target_N67453, get({This, angleIncrementJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 31, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N67460) -> (get({Target_N67460, '$class'})):addComponent(Target_N67460, get({This, totalRotationJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 31, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N67268) -> (get({Target_N67268, '$class'})):addPreferredGap(Target_N67268, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'UNRELATED'})) end)((fun(Target_N67275) -> (get({Target_N67275, '$class'})):addGroup(Target_N67275, (fun(Target_N67308) -> (get({Target_N67308, '$class'})):addComponent(Target_N67308, get({This, jLabel2})) end)((fun(Target_N67315) -> (get({Target_N67315, '$class'})):addComponent(Target_N67315, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}))))) end)((fun(Target_N67282) -> (get({Target_N67282, '$class'})):addContainerGap(Target_N67282) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N67910) -> (get({Target_N67910, '$class'})):addGroup(Target_N67910, (fun(Target_N67978) -> (get({Target_N67978, '$class'})):addContainerGap(Target_N67978) end)((fun(Target_N67985) -> (get({Target_N67985, '$class'})):addComponent(Target_N67985, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N67992) -> (get({Target_N67992, '$class'})):addPreferredGap(Target_N67992, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 16, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67999) -> (get({Target_N67999, '$class'})):addGroup(Target_N67999, (fun(Target_N68287) -> (get({Target_N68287, '$class'})):addComponent(Target_N68287, get({This, jLabel2})) end)((fun(Target_N68294) -> (get({Target_N68294, '$class'})):addComponent(Target_N68294, get({This, totalRotationJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N68006) -> (get({Target_N68006, '$class'})):addPreferredGap(Target_N68006, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68013) -> (get({Target_N68013, '$class'})):addGroup(Target_N68013, (fun(Target_N68046) -> (get({Target_N68046, '$class'})):addComponent(Target_N68046, get({This, jLabel1})) end)((fun(Target_N68053) -> (get({Target_N68053, '$class'})):addComponent(Target_N68053, get({This, angleIncrementJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N68020) -> (get({Target_N68020, '$class'})):addContainerGap(Target_N68020) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):pack(This).

jButton1ActionPerformed(This, Evt) ->
        try
            (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), allbinary_java:to_string(0), allbinary_java:to_string((get({get({This, angleIncrementJTextField}), '$class'})):getText(get({This, angleIncrementJTextField})))),
            (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), allbinary_java:to_string(1), allbinary_java:to_string((get({get({This, totalRotationJTextField}), '$class'})):getText(get({This, totalRotationJTextField})))),
            (fun(Target_N68886) -> (get({Target_N68886, '$class'})):onHashMap(Target_N68886, get({This, hashMap})) end)(((get({This, '$class'})):getParent(This))),
            (get({This, '$class'})):setVisible(This, false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "jButton1ActionPerformed")
        end.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        (get({get({get({'java', awt}), 'EventQueue'}), '$class'})):invokeLater(get({get({'java', awt}), 'EventQueue'}), 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
).

