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
% package org.allbinary.input.automation.actions.script.condition
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('TimeIntervalActionScriptConditionJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, timeIntervalActionScriptConditionInterface}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, okJButton}, undefined),
    put({This, timeIntervalActionJButton}, undefined),
    put({This, timeIntervalActionJDialog}, undefined),
    put({This, timeIntervalJTextField}, undefined),
    put({This, titleJLabel}, undefined),
    ok.


new(TimeIntervalActionScriptConditionInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TimeIntervalActionScriptConditionInterface),
    This.

'$init'(This, TimeIntervalActionScriptConditionInterface) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, timeIntervalActionScriptConditionInterface}, TimeIntervalActionScriptConditionInterface),
        (get({This, '$class'})):set(This).

set(This) ->
        (fun(Target_N66001) -> (get({Target_N66001, '$class'})):setText(Target_N66001, allbinary_java:to_string(get({(get({get({This, timeIntervalActionScriptConditionInterface}), '$class'})):getTimeDelayHelper(get({This, timeIntervalActionScriptConditionInterface})), delay}))) end)((get({This, '$class'})):getTimeIntervalJTextField(This)),
        (get({get({This, timeIntervalActionScriptConditionInterface}), '$class'})):log(get({This, timeIntervalActionScriptConditionInterface})).

update(This) ->
        put({(get({get({This, timeIntervalActionScriptConditionInterface}), '$class'})):getTimeDelayHelper(get({This, timeIntervalActionScriptConditionInterface})), delay}, allbinary_java:to_string((fun(Target_N66169) -> (get({Target_N66169, '$class'})):getText(Target_N66169) end)((get({This, '$class'})):getTimeIntervalJTextField(This)))),
        (get({get({This, timeIntervalActionScriptConditionInterface}), '$class'})):log(get({This, timeIntervalActionScriptConditionInterface})).

getTimeIntervalJTextField(This) ->
        get({This, timeIntervalJTextField}).

setTimeIntervalJTextField(This, TimeIntervalJTextField) ->
        put({This, timeIntervalJTextField}, TimeIntervalJTextField).

getTimeIntervalActionJDialog(This) ->
        get({This, timeIntervalActionJDialog}).

setTimeIntervalActionJDialog(This, TimeIntervalActionJDialog) ->
        put({This, timeIntervalActionJDialog}, TimeIntervalActionJDialog).

initComponents(This) ->
        put({This, timeIntervalActionJDialog}, 'JDialog':new()),
        put({This, titleJLabel}, 'JLabel':new()),
        put({This, okJButton}, 'JButton':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, timeIntervalJTextField}, 'JTextField':new()),
        put({This, timeIntervalActionJButton}, 'JButton':new()),
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, timeIntervalActionJDialog}), '$class'})):setMinimumSize(get({This, timeIntervalActionJDialog}), 'Dimension':new(250, 150)),
        (get({get({This, titleJLabel}), '$class'})):setText(get({This, titleJLabel}), "Time Interval Condition Options"),
        (get({get({This, okJButton}), '$class'})):setText(get({This, okJButton}), "OK"),
        (get({get({This, okJButton}), '$class'})):addActionListener(get({This, okJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Time (ms):"),
        TimeIntervalActionJDialogLayout = 'GroupLayout':new((get({get({This, timeIntervalActionJDialog}), '$class'})):getContentPane(get({This, timeIntervalActionJDialog}))),
        (fun(Target_N67284) -> (get({Target_N67284, '$class'})):setLayout(Target_N67284, TimeIntervalActionJDialogLayout) end)((get({get({This, timeIntervalActionJDialog}), '$class'})):getContentPane(get({This, timeIntervalActionJDialog}))),
        (get({TimeIntervalActionJDialogLayout, '$class'})):setHorizontalGroup(TimeIntervalActionJDialogLayout, (fun(Target_N67343) -> (get({Target_N67343, '$class'})):addGroup(Target_N67343, (fun(Target_N67411) -> (get({Target_N67411, '$class'})):addContainerGap(Target_N67411, 36, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67418) -> (get({Target_N67418, '$class'})):addGroup(Target_N67418, (fun(Target_N67443) -> (get({Target_N67443, '$class'})):addGroup(Target_N67443, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), (fun(Target_N67660) -> (get({Target_N67660, '$class'})):addGroup(Target_N67660, (fun(Target_N67708) -> (get({Target_N67708, '$class'})):addComponent(Target_N67708, get({This, titleJLabel})) end)((fun(Target_N67715) -> (get({Target_N67715, '$class'})):addGroup(Target_N67715, (fun(Target_N67783) -> (get({Target_N67783, '$class'})):addComponent(Target_N67783, get({This, timeIntervalJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 85, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67790) -> (get({Target_N67790, '$class'})):addGap(Target_N67790, 16, 16, 16) end)((fun(Target_N67797) -> (get({Target_N67797, '$class'})):addComponent(Target_N67797, get({This, jLabel2})) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createSequentialGroup(TimeIntervalActionJDialogLayout))))) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createParallelGroup(TimeIntervalActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N67667) -> (get({Target_N67667, '$class'})):addGap(Target_N67667, 32, 32, 32) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createSequentialGroup(TimeIntervalActionJDialogLayout)))) end)((fun(Target_N67450) -> (get({Target_N67450, '$class'})):addGroup(Target_N67450, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), (fun(Target_N67558) -> (get({Target_N67558, '$class'})):addComponent(Target_N67558, get({This, okJButton})) end)((fun(Target_N67565) -> (get({Target_N67565, '$class'})):addGap(Target_N67565, 82, 82, 82) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createSequentialGroup(TimeIntervalActionJDialogLayout)))) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createParallelGroup(TimeIntervalActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}))))) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createSequentialGroup(TimeIntervalActionJDialogLayout)))) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createParallelGroup(TimeIntervalActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({TimeIntervalActionJDialogLayout, '$class'})):setVerticalGroup(TimeIntervalActionJDialogLayout, (fun(Target_N67981) -> (get({Target_N67981, '$class'})):addGroup(Target_N67981, (fun(Target_N68049) -> (get({Target_N68049, '$class'})):addContainerGap(Target_N68049) end)((fun(Target_N68056) -> (get({Target_N68056, '$class'})):addComponent(Target_N68056, get({This, okJButton})) end)((fun(Target_N68063) -> (get({Target_N68063, '$class'})):addGap(Target_N68063, 15, 15, 15) end)((fun(Target_N68070) -> (get({Target_N68070, '$class'})):addGroup(Target_N68070, (fun(Target_N68145) -> (get({Target_N68145, '$class'})):addComponent(Target_N68145, get({This, timeIntervalJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N68152) -> (get({Target_N68152, '$class'})):addComponent(Target_N68152, get({This, jLabel2})) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createParallelGroup(TimeIntervalActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N68077) -> (get({Target_N68077, '$class'})):addGap(Target_N68077, 20, 20, 20) end)((fun(Target_N68084) -> (get({Target_N68084, '$class'})):addComponent(Target_N68084, get({This, titleJLabel})) end)((fun(Target_N68091) -> (get({Target_N68091, '$class'})):addContainerGap(Target_N68091) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createSequentialGroup(TimeIntervalActionJDialogLayout))))))))) end)((get({TimeIntervalActionJDialogLayout, '$class'})):createParallelGroup(TimeIntervalActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(100, 0)),
        (get({get({This, timeIntervalActionJButton}), '$class'})):setText(get({This, timeIntervalActionJButton}), "Edit"),
        (get({get({This, timeIntervalActionJButton}), '$class'})):addActionListener(get({This, timeIntervalActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Time Interval:"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N68768) -> (get({Target_N68768, '$class'})):addGroup(Target_N68768, (fun(Target_N68836) -> (get({Target_N68836, '$class'})):addComponent(Target_N68836, get({This, timeIntervalActionJButton})) end)((fun(Target_N68843) -> (get({Target_N68843, '$class'})):addPreferredGap(Target_N68843, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68850) -> (get({Target_N68850, '$class'})):addComponent(Target_N68850, get({This, jLabel1})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N69014) -> (get({Target_N69014, '$class'})):addGroup(Target_N69014, (fun(Target_N69082) -> (get({Target_N69082, '$class'})):addComponent(Target_N69082, get({This, timeIntervalActionJButton})) end)((fun(Target_N69089) -> (get({Target_N69089, '$class'})):addComponent(Target_N69089, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

okJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):update(This),
        (fun(Target_N69235) -> (get({Target_N69235, '$class'})):setVisible(Target_N69235, false) end)((get({This, '$class'})):getTimeIntervalActionJDialog(This)).

timeIntervalActionJButtonActionPerformed(This, Evt) ->
        (fun(Target_N69352) -> (get({Target_N69352, '$class'})):setVisible(Target_N69352, true) end)((get({This, '$class'})):getTimeIntervalActionJDialog(This)).

