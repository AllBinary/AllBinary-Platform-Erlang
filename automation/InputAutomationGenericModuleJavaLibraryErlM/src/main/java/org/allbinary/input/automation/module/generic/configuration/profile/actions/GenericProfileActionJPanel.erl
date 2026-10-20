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
% package org.allbinary.input.automation.module.generic.configuration.profile.actions
% import org.allbinary.input.automation.actions.script.JTreeInterfaceFactory
% import org.allbinary.input.automation.actions.script.condition.AlwaysActionScriptCondition
% import org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition
% import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface
% import org.allbinary.input.automation.actions.script.condition.TimeIntervalActionScriptCondition
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScriptJPanel
% import org.allbinary.logic.communication.log.LogUtil

-module('GenericProfileActionJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, genericProfileAction}, undefined),
    put({This, genericProfileActionScriptJPanel}, undefined),
    put({This, blankProfileActionScriptJPanel}, undefined),
    put({This, genericProfileActionScriptJScrollPane}, undefined),
    put({This, ifJLabel}, undefined),
    put({This, newAlwaysJButton}, undefined),
    put({This, newColorAtJButton}, undefined),
    put({This, newTimeIntervalJButton}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This).

updateProfileActionUI(This) ->
        (get({get({This, blankProfileActionScriptJPanel}), '$class'})):removeAll(get({This, blankProfileActionScriptJPanel})),
        GenericProfileActionScriptJPanel = 'GenericProfileActionScriptJPanel':new(),
        (fun(Target_N66185) -> (get({Target_N66185, '$class'})):set(Target_N66185, GenericProfileActionScriptJPanel) end)('JTreeInterfaceFactory':getInstance()),
        (get({This, '$class'})):setGenericProfileActionScriptJPanel(This, GenericProfileActionScriptJPanel),
        (fun(Target_N66250) -> (get({Target_N66250, '$class'})):setGenericProfileActionScript(Target_N66250, (fun(Target_N66270) -> (get({Target_N66270, '$class'})):getGenericProfileActionScript(Target_N66270) end)((get({This, '$class'})):getGenericProfileAction(This))) end)((get({This, '$class'})):getGenericProfileActionScriptJPanel(This)),
        (fun(Target_N66295) -> (get({Target_N66295, '$class'})):updateJTree(Target_N66295) end)((get({This, '$class'})):getGenericProfileActionScriptJPanel(This)),
        Layout = (get({get({This, blankProfileActionScriptJPanel}), '$class'})):getLayout(get({This, blankProfileActionScriptJPanel})),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N66425) -> (get({Target_N66425, '$class'})):addComponent(Target_N66425, (get({This, '$class'})):getGenericProfileActionScriptJPanel(This), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N66432) -> (get({Target_N66432, '$class'})):addGap(Target_N66432, 0, 395, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N66660) -> (get({Target_N66660, '$class'})):addComponent(Target_N66660, (get({This, '$class'})):getGenericProfileActionScriptJPanel(This), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N66667) -> (get({Target_N66667, '$class'})):addGap(Target_N66667, 0, 256, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Updated UI", This, "updateUI").

getGenericProfileAction(This) ->
        get({This, genericProfileAction}).

setGenericProfileAction(This, GenericProfileAction) ->
        put({This, genericProfileAction}, GenericProfileAction).

getGenericProfileActionScriptJPanel(This) ->
        get({This, genericProfileActionScriptJPanel}).

setGenericProfileActionScriptJPanel(This, GenericProfileActionScriptJPanel) ->
        put({This, genericProfileActionScriptJPanel}, GenericProfileActionScriptJPanel).

initComponents(This) ->
        put({This, genericProfileActionScriptJScrollPane}, 'JScrollPane':new()),
        put({This, blankProfileActionScriptJPanel}, 'JPanel':new()),
        put({This, ifJLabel}, 'JLabel':new()),
        put({This, newColorAtJButton}, 'JButton':new()),
        put({This, newTimeIntervalJButton}, 'JButton':new()),
        put({This, newAlwaysJButton}, 'JButton':new()),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(440, 275)),
        (get({This, '$class'})):setPreferredSize(This, 'Dimension':new(440, 275)),
        (get({get({This, genericProfileActionScriptJScrollPane}), '$class'})):setPreferredSize(get({This, genericProfileActionScriptJScrollPane}), 'Dimension':new(474, 270)),
        (get({get({This, blankProfileActionScriptJPanel}), '$class'})):setMinimumSize(get({This, blankProfileActionScriptJPanel}), 'Dimension':new(400, 200)),
        BlankProfileActionScriptJPanelLayout = 'GroupLayout':new(get({This, blankProfileActionScriptJPanel})),
        (get({get({This, blankProfileActionScriptJPanel}), '$class'})):setLayout(get({This, blankProfileActionScriptJPanel}), BlankProfileActionScriptJPanelLayout),
        (get({BlankProfileActionScriptJPanelLayout, '$class'})):setHorizontalGroup(BlankProfileActionScriptJPanelLayout, (fun(Target_N67838) -> (get({Target_N67838, '$class'})):addGap(Target_N67838, 0, 9996, get({'Short', 'MAX_VALUE'})) end)((get({BlankProfileActionScriptJPanelLayout, '$class'})):createParallelGroup(BlankProfileActionScriptJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({BlankProfileActionScriptJPanelLayout, '$class'})):setVerticalGroup(BlankProfileActionScriptJPanelLayout, (fun(Target_N67955) -> (get({Target_N67955, '$class'})):addGap(Target_N67955, 0, 9967, get({'Short', 'MAX_VALUE'})) end)((get({BlankProfileActionScriptJPanelLayout, '$class'})):createParallelGroup(BlankProfileActionScriptJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, genericProfileActionScriptJScrollPane}), '$class'})):setViewportView(get({This, genericProfileActionScriptJScrollPane}), get({This, blankProfileActionScriptJPanel})),
        (get({get({This, ifJLabel}), '$class'})):setText(get({This, ifJLabel}), "Conditions:"),
        (get({get({This, newColorAtJButton}), '$class'})):setText(get({This, newColorAtJButton}), "Color Range At"),
        (get({get({This, newColorAtJButton}), '$class'})):addActionListener(get({This, newColorAtJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, newTimeIntervalJButton}), '$class'})):setText(get({This, newTimeIntervalJButton}), "Time Interval"),
        (get({get({This, newTimeIntervalJButton}), '$class'})):addActionListener(get({This, newTimeIntervalJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, newAlwaysJButton}), '$class'})):setText(get({This, newAlwaysJButton}), "Always On/Off"),
        (get({get({This, newAlwaysJButton}), '$class'})):addActionListener(get({This, newAlwaysJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N68803) -> (get({Target_N68803, '$class'})):addComponent(Target_N68803, get({This, genericProfileActionScriptJScrollPane}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 440, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68810) -> (get({Target_N68810, '$class'})):addGroup(Target_N68810, (fun(Target_N68878) -> (get({Target_N68878, '$class'})):addContainerGap(Target_N68878, 61, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68885) -> (get({Target_N68885, '$class'})):addComponent(Target_N68885, get({This, newAlwaysJButton})) end)((fun(Target_N68892) -> (get({Target_N68892, '$class'})):addPreferredGap(Target_N68892, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68899) -> (get({Target_N68899, '$class'})):addComponent(Target_N68899, get({This, newTimeIntervalJButton})) end)((fun(Target_N68906) -> (get({Target_N68906, '$class'})):addPreferredGap(Target_N68906, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68913) -> (get({Target_N68913, '$class'})):addComponent(Target_N68913, get({This, newColorAtJButton})) end)((fun(Target_N68920) -> (get({Target_N68920, '$class'})):addPreferredGap(Target_N68920, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68927) -> (get({Target_N68927, '$class'})):addComponent(Target_N68927, get({This, ifJLabel})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N69243) -> (get({Target_N69243, '$class'})):addGroup(Target_N69243, (fun(Target_N69311) -> (get({Target_N69311, '$class'})):addComponent(Target_N69311, get({This, genericProfileActionScriptJScrollPane}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 246, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69318) -> (get({Target_N69318, '$class'})):addPreferredGap(Target_N69318, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69325) -> (get({Target_N69325, '$class'})):addGroup(Target_N69325, (fun(Target_N69350) -> (get({Target_N69350, '$class'})):addComponent(Target_N69350, get({This, newAlwaysJButton})) end)((fun(Target_N69357) -> (get({Target_N69357, '$class'})):addComponent(Target_N69357, get({This, newTimeIntervalJButton})) end)((fun(Target_N69364) -> (get({Target_N69364, '$class'})):addComponent(Target_N69364, get({This, newColorAtJButton})) end)((fun(Target_N69371) -> (get({Target_N69371, '$class'})):addComponent(Target_N69371, get({This, ifJLabel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 14, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

newTimeIntervalJButtonActionPerformed(This, Evt) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New Time Interval Action Condition", This, "newTimeIntervalJButtonActionPerformed"),
        (fun(Target_N69741) -> (get({Target_N69741, '$class'})):addCondition(Target_N69741, 'TimeIntervalActionScriptCondition':new()) end)((fun(Target_N69748) -> (get({Target_N69748, '$class'})):getGenericProfileActionScript(Target_N69748) end)((get({This, '$class'})):getGenericProfileAction(This))),
        (get({This, '$class'})):updateProfileActionUI(This).

newAlwaysJButtonActionPerformed(This, Evt) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New EveryTime Action Condition", This, "newEveryTimeJButtonActionPerformed"),
        (fun(Target_N69942) -> (get({Target_N69942, '$class'})):addCondition(Target_N69942, 'AlwaysActionScriptCondition':new()) end)((fun(Target_N69949) -> (get({Target_N69949, '$class'})):getGenericProfileActionScript(Target_N69949) end)((get({This, '$class'})):getGenericProfileAction(This))),
        (get({This, '$class'})):updateProfileActionUI(This).

newColorAtJButtonActionPerformed(This, Evt) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New Color At Action Condition", This, "newColorAtJButtonActionPerformed"),
        (fun(Target_N70143) -> (get({Target_N70143, '$class'})):addCondition(Target_N70143, 'ColorAtActionScriptCondition':new()) end)((fun(Target_N70150) -> (get({Target_N70150, '$class'})):getGenericProfileActionScript(Target_N70150) end)((get({This, '$class'})):getGenericProfileAction(This))),
        (get({This, '$class'})):updateProfileActionUI(This).

