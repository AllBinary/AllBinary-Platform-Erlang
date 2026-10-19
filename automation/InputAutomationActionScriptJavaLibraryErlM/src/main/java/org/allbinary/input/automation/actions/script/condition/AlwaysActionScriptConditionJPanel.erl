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

-module('AlwaysActionScriptConditionJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, alwaysActionScriptConditionInterface}, undefined),
    put({This, alwaysActionJButton}, undefined),
    put({This, alwaysActionJDialog}, undefined),
    put({This, alwaysJComboBox}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, okJButton}, undefined),
    put({This, titleJLabel}, undefined),
    ok.


new(AlwaysActionScriptConditionInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AlwaysActionScriptConditionInterface),
    This.

init(This, AlwaysActionScriptConditionInterface) ->
    'JPanel':init(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, alwaysActionScriptConditionInterface}, AlwaysActionScriptConditionInterface),
        (get({This, '$class'})):set(This).

set(This) ->
        case (get({get({This, alwaysActionScriptConditionInterface}), '$class'})):isIsOn(get({This, alwaysActionScriptConditionInterface})) of
            true ->
            (get({get({This, alwaysJComboBox}), '$class'})):setSelectedIndex(get({This, alwaysJComboBox}), 0);
            false ->
            (get({get({This, alwaysJComboBox}), '$class'})):setSelectedIndex(get({This, alwaysJComboBox}), 1)
        end,
        (get({get({This, alwaysActionScriptConditionInterface}), '$class'})):log(get({This, alwaysActionScriptConditionInterface})).

update(This) ->
        case ((get({get({This, alwaysJComboBox}), '$class'})):getSelectedIndex(get({This, alwaysJComboBox})) =:= 0) of
            true ->
            (get({get({This, alwaysActionScriptConditionInterface}), '$class'})):setIsOn(get({This, alwaysActionScriptConditionInterface}), true);
            false ->
            (get({get({This, alwaysActionScriptConditionInterface}), '$class'})):setIsOn(get({This, alwaysActionScriptConditionInterface}), false)
        end,
        (get({get({This, alwaysActionScriptConditionInterface}), '$class'})):log(get({This, alwaysActionScriptConditionInterface})).

getAlwaysActionJDialog(This) ->
        get({This, alwaysActionJDialog}).

setAlwaysActionJDialog(This, AlwaysActionJDialog) ->
        put({This, alwaysActionJDialog}, AlwaysActionJDialog).

initComponents(This) ->
        put({This, alwaysActionJDialog}, 'JDialog':new()),
        put({This, titleJLabel}, 'JLabel':new()),
        put({This, okJButton}, 'JButton':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, alwaysJComboBox}, 'JComboBox':new()),
        put({This, alwaysActionJButton}, 'JButton':new()),
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, alwaysActionJDialog}), '$class'})):setMinimumSize(get({This, alwaysActionJDialog}), 'Dimension':new(250, 150)),
        (get({get({This, titleJLabel}), '$class'})):setText(get({This, titleJLabel}), "Always Condition Options"),
        (get({get({This, okJButton}), '$class'})):setText(get({This, okJButton}), "OK"),
        (get({get({This, okJButton}), '$class'})):addActionListener(get({This, okJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "On:"),
        (get({get({This, alwaysJComboBox}), '$class'})):setModel(get({This, alwaysJComboBox}), 'DefaultComboBoxModel':new(array:from_list(["true", "false"]))),
        AlwaysActionJDialogLayout = 'GroupLayout':new((get({get({This, alwaysActionJDialog}), '$class'})):getContentPane(get({This, alwaysActionJDialog}))),
        (fun(Target_N67281) -> (get({Target_N67281, '$class'})):setLayout(Target_N67281, AlwaysActionJDialogLayout) end)((get({get({This, alwaysActionJDialog}), '$class'})):getContentPane(get({This, alwaysActionJDialog}))),
        (get({AlwaysActionJDialogLayout, '$class'})):setHorizontalGroup(AlwaysActionJDialogLayout, (fun(Target_N67340) -> (get({Target_N67340, '$class'})):addGroup(Target_N67340, (fun(Target_N67408) -> (get({Target_N67408, '$class'})):addContainerGap(Target_N67408, 45, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67415) -> (get({Target_N67415, '$class'})):addGroup(Target_N67415, (fun(Target_N67440) -> (get({Target_N67440, '$class'})):addGroup(Target_N67440, (fun(Target_N67951) -> (get({Target_N67951, '$class'})):addComponent(Target_N67951, get({This, okJButton})) end)((fun(Target_N67958) -> (get({Target_N67958, '$class'})):addGap(Target_N67958, 79, 79, 79) end)((get({AlwaysActionJDialogLayout, '$class'})):createSequentialGroup(AlwaysActionJDialogLayout)))) end)((fun(Target_N67447) -> (get({Target_N67447, '$class'})):addGroup(Target_N67447, (fun(Target_N67515) -> (get({Target_N67515, '$class'})):addGroup(Target_N67515, (fun(Target_N67563) -> (get({Target_N67563, '$class'})):addComponent(Target_N67563, get({This, titleJLabel})) end)((fun(Target_N67570) -> (get({Target_N67570, '$class'})):addGroup(Target_N67570, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N67682) -> (get({Target_N67682, '$class'})):addComponent(Target_N67682, get({This, alwaysJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N67689) -> (get({Target_N67689, '$class'})):addPreferredGap(Target_N67689, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67696) -> (get({Target_N67696, '$class'})):addComponent(Target_N67696, get({This, jLabel2})) end)((get({AlwaysActionJDialogLayout, '$class'})):createSequentialGroup(AlwaysActionJDialogLayout))))) end)((get({AlwaysActionJDialogLayout, '$class'})):createParallelGroup(AlwaysActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), false)))) end)((fun(Target_N67522) -> (get({Target_N67522, '$class'})):addGap(Target_N67522, 47, 47, 47) end)((get({AlwaysActionJDialogLayout, '$class'})):createSequentialGroup(AlwaysActionJDialogLayout)))) end)((get({AlwaysActionJDialogLayout, '$class'})):createParallelGroup(AlwaysActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({AlwaysActionJDialogLayout, '$class'})):createSequentialGroup(AlwaysActionJDialogLayout)))) end)((get({AlwaysActionJDialogLayout, '$class'})):createParallelGroup(AlwaysActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({AlwaysActionJDialogLayout, '$class'})):setVerticalGroup(AlwaysActionJDialogLayout, (fun(Target_N68062) -> (get({Target_N68062, '$class'})):addGroup(Target_N68062, (fun(Target_N68130) -> (get({Target_N68130, '$class'})):addContainerGap(Target_N68130) end)((fun(Target_N68137) -> (get({Target_N68137, '$class'})):addComponent(Target_N68137, get({This, okJButton})) end)((fun(Target_N68144) -> (get({Target_N68144, '$class'})):addGap(Target_N68144, 15, 15, 15) end)((fun(Target_N68151) -> (get({Target_N68151, '$class'})):addGroup(Target_N68151, (fun(Target_N68226) -> (get({Target_N68226, '$class'})):addComponent(Target_N68226, get({This, jLabel2})) end)((fun(Target_N68233) -> (get({Target_N68233, '$class'})):addComponent(Target_N68233, get({This, alwaysJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({AlwaysActionJDialogLayout, '$class'})):createParallelGroup(AlwaysActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N68158) -> (get({Target_N68158, '$class'})):addGap(Target_N68158, 20, 20, 20) end)((fun(Target_N68165) -> (get({Target_N68165, '$class'})):addComponent(Target_N68165, get({This, titleJLabel})) end)((fun(Target_N68172) -> (get({Target_N68172, '$class'})):addContainerGap(Target_N68172) end)((get({AlwaysActionJDialogLayout, '$class'})):createSequentialGroup(AlwaysActionJDialogLayout))))))))) end)((get({AlwaysActionJDialogLayout, '$class'})):createParallelGroup(AlwaysActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(100, 0)),
        (get({get({This, alwaysActionJButton}), '$class'})):setText(get({This, alwaysActionJButton}), "Edit"),
        (get({get({This, alwaysActionJButton}), '$class'})):addActionListener(get({This, alwaysActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Always:"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N68849) -> (get({Target_N68849, '$class'})):addGroup(Target_N68849, (fun(Target_N68917) -> (get({Target_N68917, '$class'})):addComponent(Target_N68917, get({This, alwaysActionJButton})) end)((fun(Target_N68924) -> (get({Target_N68924, '$class'})):addPreferredGap(Target_N68924, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 33, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68931) -> (get({Target_N68931, '$class'})):addComponent(Target_N68931, get({This, jLabel1})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N69067) -> (get({Target_N69067, '$class'})):addGroup(Target_N69067, (fun(Target_N69135) -> (get({Target_N69135, '$class'})):addComponent(Target_N69135, get({This, alwaysActionJButton})) end)((fun(Target_N69142) -> (get({Target_N69142, '$class'})):addComponent(Target_N69142, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

okJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):update(This),
        (fun(Target_N69288) -> (get({Target_N69288, '$class'})):setVisible(Target_N69288, false) end)((get({This, '$class'})):getAlwaysActionJDialog(This)).

alwaysActionJButtonActionPerformed(This, Evt) ->
        (fun(Target_N69405) -> (get({Target_N69405, '$class'})):setVisible(Target_N69405, true) end)((get({This, '$class'})):getAlwaysActionJDialog(This)).

