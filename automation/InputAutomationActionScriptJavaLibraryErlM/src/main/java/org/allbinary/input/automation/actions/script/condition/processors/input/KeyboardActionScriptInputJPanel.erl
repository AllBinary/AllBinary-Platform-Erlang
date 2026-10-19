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
% package org.allbinary.input.automation.actions.script.condition.processors.input
% import javax.swing
% import org.allbinary.input.KeySingletonFactory
% import org.allbinary.input.automation.robot.InputRobot
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.TempInputRobotNames
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonStrings

-module('KeyboardActionScriptInputJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, keyActionScriptInputInterface}, undefined),
    put({This, addKeyJLabel}, undefined),
    put({This, delayBetweenJLabel}, undefined),
    put({This, delayJTextField}, undefined),
    put({This, holdTimeJLabel}, undefined),
    put({This, inputAutomationTypeJComboBox}, undefined),
    put({This, inputTypeJLabel}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jPanel1}, undefined),
    put({This, keyActionJButton}, undefined),
    put({This, keyActionJDialog}, undefined),
    put({This, keyIntegerJComboBox}, undefined),
    put({This, keyNameJComboBox}, undefined),
    put({This, normalJRadioButton}, undefined),
    put({This, okJButton}, undefined),
    put({This, pressJRadioButton}, undefined),
    put({This, releaseJRadioButton}, undefined),
    put({This, sequenceJRadioButton}, undefined),
    put({This, simultaneousJRadioButton}, undefined),
    put({This, testJLabel}, undefined),
    put({This, textJTextField}, undefined),
    put({This, timeJTextField}, undefined),
    put({This, titleJLabel}, undefined),
    ok.


new(KeyActionScriptInputInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, KeyActionScriptInputInterface),
    This.

init(This, KeyActionScriptInputInterface) ->
    'JPanel':init(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, keyActionScriptInputInterface}, KeyActionScriptInputInterface),
        DefaultComboBoxModel = 'DefaultComboBoxModel':new(),
        (get({DefaultComboBoxModel, '$class'})):addElement(DefaultComboBoxModel, get({'TempInputRobotNames', 'DX_NAME'})),
        (get({DefaultComboBoxModel, '$class'})):addElement(DefaultComboBoxModel, get({'InputRobot', 'NAME'})),
        (get({get({This, inputAutomationTypeJComboBox}), '$class'})):setModel(get({This, inputAutomationTypeJComboBox}), DefaultComboBoxModel),
        (get({get({This, keyNameJComboBox}), '$class'})):setModel(get({This, keyNameJComboBox}), 'KeyNameDefaultComboBoxModelFactory':getInstance()),
        (get({get({This, keyIntegerJComboBox}), '$class'})):setModel(get({This, keyIntegerJComboBox}), 'KeyCharDefaultComboBoxModelFactory':getInstance()),
        case (get({get({This, keyActionScriptInputInterface}), '$class'})):isNormal(get({This, keyActionScriptInputInterface})) of
            true ->
            (get({get({This, normalJRadioButton}), '$class'})):setSelected(get({This, normalJRadioButton}), true),
            (get({get({This, pressJRadioButton}), '$class'})):setSelected(get({This, pressJRadioButton}), false),
            (get({get({This, releaseJRadioButton}), '$class'})):setSelected(get({This, releaseJRadioButton}), false);
            false ->
            case (get({get({This, keyActionScriptInputInterface}), '$class'})):isPress(get({This, keyActionScriptInputInterface})) of
            true ->
            (get({get({This, normalJRadioButton}), '$class'})):setSelected(get({This, normalJRadioButton}), false),
            (get({get({This, pressJRadioButton}), '$class'})):setSelected(get({This, pressJRadioButton}), true),
            (get({get({This, releaseJRadioButton}), '$class'})):setSelected(get({This, releaseJRadioButton}), false);
            false ->
            case (get({get({This, keyActionScriptInputInterface}), '$class'})):isRelease(get({This, keyActionScriptInputInterface})) of
            true ->
            (get({get({This, normalJRadioButton}), '$class'})):setSelected(get({This, normalJRadioButton}), false),
            (get({get({This, pressJRadioButton}), '$class'})):setSelected(get({This, pressJRadioButton}), false),
            (get({get({This, releaseJRadioButton}), '$class'})):setSelected(get({This, releaseJRadioButton}), true);
            false -> ok
        end
        end
        end,
        (get({This, '$class'})):set(This).

set(This) ->
        InputTypeComboBoxModel = (get({get({This, inputAutomationTypeJComboBox}), '$class'})):getModel(get({This, inputAutomationTypeJComboBox})),
        (get({InputTypeComboBoxModel, '$class'})):setSelectedItem(InputTypeComboBoxModel, (fun(Target_N66884) -> (get({Target_N66884, '$class'})):getName(Target_N66884) end)((get({get({This, keyActionScriptInputInterface}), '$class'})):getInputRobotInterface(get({This, keyActionScriptInputInterface})))),
        (get({get({This, textJTextField}), '$class'})):setText(get({This, textJTextField}), (get({get({This, keyActionScriptInputInterface}), '$class'})):getText(get({This, keyActionScriptInputInterface}))),
        (get({get({This, delayJTextField}), '$class'})):setText(get({This, delayJTextField}), allbinary_java:to_string((get({get({This, keyActionScriptInputInterface}), '$class'})):getDelayBetweenKeys(get({This, keyActionScriptInputInterface})))),
        (get({get({This, timeJTextField}), '$class'})):setText(get({This, timeJTextField}), allbinary_java:to_string((get({get({This, keyActionScriptInputInterface}), '$class'})):getTime(get({This, keyActionScriptInputInterface})))),
        (get({get({This, keyActionScriptInputInterface}), '$class'})):log(get({This, keyActionScriptInputInterface})).

% throws Exception
updateInputType(This) ->
        ComboBoxModel = (get({get({This, inputAutomationTypeJComboBox}), '$class'})):getModel(get({This, inputAutomationTypeJComboBox})),
        SelectedItem = (get({ComboBoxModel, '$class'})):getSelectedItem(ComboBoxModel),
        case (not (fun(Target_N67243) -> (get({Target_N67243, '$class'})):isEmpty(Target_N67243, SelectedItem) end)('StringValidationUtil':getInstance())) of
            true ->
            (get({get({This, keyActionScriptInputInterface}), '$class'})):setInputRobotInterface(get({This, keyActionScriptInputInterface}), (fun(Target_N67307) -> (get({Target_N67307, '$class'})):get(Target_N67307, SelectedItem) end)('InputRobotFactory':getInstance()));
            false -> ok
        end.

getSelectedKey(This) ->
        try
        ComboBoxModel = (get({get({This, keyNameJComboBox}), '$class'})):getModel(get({This, keyNameJComboBox})),
        SelectedItem = (get({ComboBoxModel, '$class'})):getSelectedItem(ComboBoxModel),
        case (not (fun(Target_N67492) -> (get({Target_N67492, '$class'})):isEmpty(Target_N67492, SelectedItem) end)('StringValidationUtil':getInstance())) of
            true ->
            throw({'$return', (fun(Target_N67539) -> (get({Target_N67539, '$class'})):get(Target_N67539, SelectedItem) end)('KeySingletonFactory':getHashtable())});
            false -> ok
        end,
        undefined
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

updateKeys(This) ->
        Text = (get({get({This, textJTextField}), '$class'})):getText(get({This, textJTextField})),
        (get({get({This, keyActionScriptInputInterface}), '$class'})):setText(get({This, keyActionScriptInputInterface}), Text).

% throws Exception
update(This) ->
        (get({This, '$class'})):updateInputType(This),
        (get({This, '$class'})):updateKeys(This),
        (get({get({This, keyActionScriptInputInterface}), '$class'})):setTime(get({This, keyActionScriptInputInterface}), (fun(Target_N67782) -> (get({Target_N67782, '$class'})):intValue(Target_N67782) end)(allbinary_java:to_string((get({get({This, timeJTextField}), '$class'})):getText(get({This, timeJTextField}))))),
        (get({get({This, keyActionScriptInputInterface}), '$class'})):log(get({This, keyActionScriptInputInterface})).

getKeyActionJDialog(This) ->
        get({This, keyActionJDialog}).

setKeyActionJDialog(This, KeyActionJDialog) ->
        put({This, keyActionJDialog}, KeyActionJDialog).

initComponents(This) ->
        put({This, keyActionJDialog}, 'JDialog':new()),
        put({This, titleJLabel}, 'JLabel':new()),
        put({This, addKeyJLabel}, 'JLabel':new()),
        put({This, keyNameJComboBox}, 'JComboBox':new()),
        put({This, timeJTextField}, 'JTextField':new()),
        put({This, holdTimeJLabel}, 'JLabel':new()),
        put({This, inputAutomationTypeJComboBox}, 'JComboBox':new()),
        put({This, inputTypeJLabel}, 'JLabel':new()),
        put({This, delayJTextField}, 'JTextField':new()),
        put({This, delayBetweenJLabel}, 'JLabel':new()),
        put({This, testJLabel}, 'JLabel':new()),
        put({This, textJTextField}, 'JTextField':new()),
        put({This, pressJRadioButton}, 'JRadioButton':new()),
        put({This, releaseJRadioButton}, 'JRadioButton':new()),
        put({This, normalJRadioButton}, 'JRadioButton':new()),
        put({This, simultaneousJRadioButton}, 'JRadioButton':new()),
        put({This, sequenceJRadioButton}, 'JRadioButton':new()),
        put({This, jPanel1}, 'JPanel':new()),
        put({This, okJButton}, 'JButton':new()),
        put({This, keyIntegerJComboBox}, 'JComboBox':new()),
        put({This, keyActionJButton}, 'JButton':new()),
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, keyActionJDialog}), '$class'})):setMinimumSize(get({This, keyActionJDialog}), 'Dimension':new(255, 280)),
        (get({get({This, titleJLabel}), '$class'})):setHorizontalAlignment(get({This, titleJLabel}), get({get({get({'javax', swing}), 'SwingConstants'}), 'CENTER'})),
        (get({get({This, titleJLabel}), '$class'})):setText(get({This, titleJLabel}), "Keyboard Input Options"),
        (get({get({This, addKeyJLabel}), '$class'})):setText(get({This, addKeyJLabel}), "Add Key:"),
        (get({get({This, keyNameJComboBox}), '$class'})):addActionListener(get({This, keyNameJComboBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, timeJTextField}), '$class'})):setText(get({This, timeJTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, holdTimeJLabel}), '$class'})):setText(get({This, holdTimeJLabel}), "Hold Time (ms):"),
        (get({get({This, inputTypeJLabel}), '$class'})):setText(get({This, inputTypeJLabel}), "Input Type:"),
        (get({get({This, delayJTextField}), '$class'})):setText(get({This, delayJTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, delayBetweenJLabel}), '$class'})):setText(get({This, delayBetweenJLabel}), "Delay Between Keys (ms):"),
        (get({get({This, testJLabel}), '$class'})):setText(get({This, testJLabel}), "Text:"),
        (get({get({This, textJTextField}), '$class'})):setText(get({This, textJTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, pressJRadioButton}), '$class'})):setText(get({This, pressJRadioButton}), "Press"),
        (get({get({This, pressJRadioButton}), '$class'})):setBorder(get({This, pressJRadioButton}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, pressJRadioButton}), '$class'})):setMargin(get({This, pressJRadioButton}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, pressJRadioButton}), '$class'})):addActionListener(get({This, pressJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, releaseJRadioButton}), '$class'})):setText(get({This, releaseJRadioButton}), "Release"),
        (get({get({This, releaseJRadioButton}), '$class'})):setBorder(get({This, releaseJRadioButton}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, releaseJRadioButton}), '$class'})):setMargin(get({This, releaseJRadioButton}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, releaseJRadioButton}), '$class'})):addActionListener(get({This, releaseJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, normalJRadioButton}), '$class'})):setSelected(get({This, normalJRadioButton}), true),
        (get({get({This, normalJRadioButton}), '$class'})):setText(get({This, normalJRadioButton}), "Normal"),
        (get({get({This, normalJRadioButton}), '$class'})):setBorder(get({This, normalJRadioButton}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, normalJRadioButton}), '$class'})):setMargin(get({This, normalJRadioButton}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, normalJRadioButton}), '$class'})):addActionListener(get({This, normalJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, simultaneousJRadioButton}), '$class'})):setSelected(get({This, simultaneousJRadioButton}), true),
        (get({get({This, simultaneousJRadioButton}), '$class'})):setText(get({This, simultaneousJRadioButton}), "Simultaneous"),
        (get({get({This, simultaneousJRadioButton}), '$class'})):setBorder(get({This, simultaneousJRadioButton}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, simultaneousJRadioButton}), '$class'})):setMargin(get({This, simultaneousJRadioButton}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, simultaneousJRadioButton}), '$class'})):addActionListener(get({This, simultaneousJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, sequenceJRadioButton}), '$class'})):setText(get({This, sequenceJRadioButton}), "Sequence"),
        (get({get({This, sequenceJRadioButton}), '$class'})):setBorder(get({This, sequenceJRadioButton}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, sequenceJRadioButton}), '$class'})):setMargin(get({This, sequenceJRadioButton}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, sequenceJRadioButton}), '$class'})):addActionListener(get({This, sequenceJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, okJButton}), '$class'})):setText(get({This, okJButton}), "OK"),
        (get({get({This, okJButton}), '$class'})):setHorizontalTextPosition(get({This, okJButton}), get({get({get({'javax', swing}), 'SwingConstants'}), 'CENTER'})),
        (get({get({This, okJButton}), '$class'})):addActionListener(get({This, okJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), get({This, okJButton})),
        (get({get({This, keyIntegerJComboBox}), '$class'})):addActionListener(get({This, keyIntegerJComboBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        KeyActionJDialogLayout = 'GroupLayout':new((get({get({This, keyActionJDialog}), '$class'})):getContentPane(get({This, keyActionJDialog}))),
        (fun(Target_N71986) -> (get({Target_N71986, '$class'})):setLayout(Target_N71986, KeyActionJDialogLayout) end)((get({get({This, keyActionJDialog}), '$class'})):getContentPane(get({This, keyActionJDialog}))),
        (get({KeyActionJDialogLayout, '$class'})):setHorizontalGroup(KeyActionJDialogLayout, (fun(Target_N72045) -> (get({Target_N72045, '$class'})):addComponent(Target_N72045, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 229, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72052) -> (get({Target_N72052, '$class'})):addComponent(Target_N72052, get({This, titleJLabel}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 229, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72059) -> (get({Target_N72059, '$class'})):addGroup(Target_N72059, (fun(Target_N72127) -> (get({Target_N72127, '$class'})):addContainerGap(Target_N72127) end)((fun(Target_N72134) -> (get({Target_N72134, '$class'})):addGroup(Target_N72134, (fun(Target_N72167) -> (get({Target_N72167, '$class'})):addGroup(Target_N72167, (fun(Target_N73761) -> (get({Target_N73761, '$class'})):addComponent(Target_N73761, get({This, sequenceJRadioButton})) end)((fun(Target_N73768) -> (get({Target_N73768, '$class'})):addPreferredGap(Target_N73768, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73775) -> (get({Target_N73775, '$class'})):addComponent(Target_N73775, get({This, simultaneousJRadioButton})) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout))))) end)((fun(Target_N72174) -> (get({Target_N72174, '$class'})):addGroup(Target_N72174, (fun(Target_N73564) -> (get({Target_N73564, '$class'})):addComponent(Target_N73564, get({This, delayJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 68, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73571) -> (get({Target_N73571, '$class'})):addPreferredGap(Target_N73571, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 15, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N73578) -> (get({Target_N73578, '$class'})):addComponent(Target_N73578, get({This, delayBetweenJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout))))) end)((fun(Target_N72181) -> (get({Target_N72181, '$class'})):addGroup(Target_N72181, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N73431) -> (get({Target_N73431, '$class'})):addComponent(Target_N73431, get({This, timeJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 113, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N73438) -> (get({Target_N73438, '$class'})):addGap(Target_N73438, 22, 22, 22) end)((fun(Target_N73445) -> (get({Target_N73445, '$class'})):addComponent(Target_N73445, get({This, holdTimeJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout))))) end)((fun(Target_N72188) -> (get({Target_N72188, '$class'})):addGroup(Target_N72188, (fun(Target_N73125) -> (get({Target_N73125, '$class'})):addPreferredGap(Target_N73125, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 48, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73132) -> (get({Target_N73132, '$class'})):addComponent(Target_N73132, get({This, releaseJRadioButton})) end)((fun(Target_N73139) -> (get({Target_N73139, '$class'})):addPreferredGap(Target_N73139, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73146) -> (get({Target_N73146, '$class'})):addComponent(Target_N73146, get({This, pressJRadioButton})) end)((fun(Target_N73153) -> (get({Target_N73153, '$class'})):addPreferredGap(Target_N73153, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73160) -> (get({Target_N73160, '$class'})):addComponent(Target_N73160, get({This, normalJRadioButton})) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout)))))))) end)((fun(Target_N72195) -> (get({Target_N72195, '$class'})):addComponent(Target_N72195, get({This, testJLabel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 60, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72202) -> (get({Target_N72202, '$class'})):addGroup(Target_N72202, (fun(Target_N72270) -> (get({Target_N72270, '$class'})):addGroup(Target_N72270, (fun(Target_N72618) -> (get({Target_N72618, '$class'})):addGroup(Target_N72618, (fun(Target_N72840) -> (get({Target_N72840, '$class'})):addComponent(Target_N72840, get({This, keyIntegerJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 41, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72847) -> (get({Target_N72847, '$class'})):addPreferredGap(Target_N72847, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72854) -> (get({Target_N72854, '$class'})):addComponent(Target_N72854, get({This, keyNameJComboBox}), 0, 101, get({'Short', 'MAX_VALUE'})) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout))))) end)((fun(Target_N72625) -> (get({Target_N72625, '$class'})):addComponent(Target_N72625, get({This, textJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 148, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72632) -> (get({Target_N72632, '$class'})):addComponent(Target_N72632, get({This, inputAutomationTypeJComboBox}), 0, 148, get({'Short', 'MAX_VALUE'})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'})))))) end)((fun(Target_N72277) -> (get({Target_N72277, '$class'})):addPreferredGap(Target_N72277, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72284) -> (get({Target_N72284, '$class'})):addGroup(Target_N72284, (fun(Target_N72309) -> (get({Target_N72309, '$class'})):addComponent(Target_N72309, get({This, inputTypeJLabel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72316) -> (get({Target_N72316, '$class'})):addComponent(Target_N72316, get({This, addKeyJLabel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), false)))) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout))))) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))))))) end)((fun(Target_N72141) -> (get({Target_N72141, '$class'})):addContainerGap(Target_N72141) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout))))) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))),
        (get({KeyActionJDialogLayout, '$class'})):setVerticalGroup(KeyActionJDialogLayout, (fun(Target_N74064) -> (get({Target_N74064, '$class'})):addGroup(Target_N74064, (fun(Target_N74132) -> (get({Target_N74132, '$class'})):addContainerGap(Target_N74132) end)((fun(Target_N74139) -> (get({Target_N74139, '$class'})):addComponent(Target_N74139, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74146) -> (get({Target_N74146, '$class'})):addPreferredGap(Target_N74146, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74153) -> (get({Target_N74153, '$class'})):addGroup(Target_N74153, (fun(Target_N75816) -> (get({Target_N75816, '$class'})):addComponent(Target_N75816, get({This, sequenceJRadioButton})) end)((fun(Target_N75823) -> (get({Target_N75823, '$class'})):addComponent(Target_N75823, get({This, simultaneousJRadioButton})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N74160) -> (get({Target_N74160, '$class'})):addPreferredGap(Target_N74160, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74167) -> (get({Target_N74167, '$class'})):addGroup(Target_N74167, (fun(Target_N75575) -> (get({Target_N75575, '$class'})):addComponent(Target_N75575, get({This, delayJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N75582) -> (get({Target_N75582, '$class'})):addComponent(Target_N75582, get({This, delayBetweenJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N74174) -> (get({Target_N74174, '$class'})):addPreferredGap(Target_N74174, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74181) -> (get({Target_N74181, '$class'})):addGroup(Target_N74181, (fun(Target_N75334) -> (get({Target_N75334, '$class'})):addComponent(Target_N75334, get({This, timeJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N75341) -> (get({Target_N75341, '$class'})):addComponent(Target_N75341, get({This, holdTimeJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N74188) -> (get({Target_N74188, '$class'})):addPreferredGap(Target_N74188, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74195) -> (get({Target_N74195, '$class'})):addGroup(Target_N74195, (fun(Target_N75170) -> (get({Target_N75170, '$class'})):addComponent(Target_N75170, get({This, releaseJRadioButton})) end)((fun(Target_N75177) -> (get({Target_N75177, '$class'})):addComponent(Target_N75177, get({This, normalJRadioButton})) end)((fun(Target_N75184) -> (get({Target_N75184, '$class'})):addComponent(Target_N75184, get({This, pressJRadioButton})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'})))))) end)((fun(Target_N74202) -> (get({Target_N74202, '$class'})):addPreferredGap(Target_N74202, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74209) -> (get({Target_N74209, '$class'})):addGroup(Target_N74209, (fun(Target_N74929) -> (get({Target_N74929, '$class'})):addComponent(Target_N74929, get({This, textJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74936) -> (get({Target_N74936, '$class'})):addComponent(Target_N74936, get({This, testJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N74216) -> (get({Target_N74216, '$class'})):addPreferredGap(Target_N74216, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74223) -> (get({Target_N74223, '$class'})):addGroup(Target_N74223, (fun(Target_N74573) -> (get({Target_N74573, '$class'})):addComponent(Target_N74573, get({This, keyNameJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74580) -> (get({Target_N74580, '$class'})):addComponent(Target_N74580, get({This, keyIntegerJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74587) -> (get({Target_N74587, '$class'})):addComponent(Target_N74587, get({This, addKeyJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'})))))) end)((fun(Target_N74230) -> (get({Target_N74230, '$class'})):addPreferredGap(Target_N74230, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74237) -> (get({Target_N74237, '$class'})):addGroup(Target_N74237, (fun(Target_N74332) -> (get({Target_N74332, '$class'})):addComponent(Target_N74332, get({This, inputAutomationTypeJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74339) -> (get({Target_N74339, '$class'})):addComponent(Target_N74339, get({This, inputTypeJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N74244) -> (get({Target_N74244, '$class'})):addPreferredGap(Target_N74244, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74251) -> (get({Target_N74251, '$class'})):addComponent(Target_N74251, get({This, titleJLabel})) end)((get({KeyActionJDialogLayout, '$class'})):createSequentialGroup(KeyActionJDialogLayout)))))))))))))))))))) end)((get({KeyActionJDialogLayout, '$class'})):createParallelGroup(KeyActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(100, 0)),
        (get({get({This, keyActionJButton}), '$class'})):setText(get({This, keyActionJButton}), "Edit"),
        (get({get({This, keyActionJButton}), '$class'})):addActionListener(get({This, keyActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Key:"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N76467) -> (get({Target_N76467, '$class'})):addGroup(Target_N76467, (fun(Target_N76535) -> (get({Target_N76535, '$class'})):addComponent(Target_N76535, get({This, keyActionJButton})) end)((fun(Target_N76542) -> (get({Target_N76542, '$class'})):addPreferredGap(Target_N76542, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 49, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N76549) -> (get({Target_N76549, '$class'})):addComponent(Target_N76549, get({This, jLabel1})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N76685) -> (get({Target_N76685, '$class'})):addGroup(Target_N76685, (fun(Target_N76753) -> (get({Target_N76753, '$class'})):addComponent(Target_N76753, get({This, keyActionJButton})) end)((fun(Target_N76760) -> (get({Target_N76760, '$class'})):addComponent(Target_N76760, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

prependText(This, Integer) ->
        case (Integer =/= undefined) of
            true ->
            NewKey = lists:concat([lists:concat(["&#", (get({Integer, '$class'})):toString(Integer)]), ";"]),
            (get({get({This, textJTextField}), '$class'})):setText(get({This, textJTextField}), lists:concat([NewKey, (get({get({This, textJTextField}), '$class'})):getText(get({This, textJTextField}))]));
            false -> ok
        end.

keyIntegerJComboBoxActionPerformed(This, Evt) ->
        (get({get({This, keyIntegerJComboBox}), '$class'})):getSelectedIndex(get({This, keyIntegerJComboBox})),
        (get({get({This, keyNameJComboBox}), '$class'})):setSelectedIndex(get({This, keyNameJComboBox}), (get({get({This, keyIntegerJComboBox}), '$class'})):getSelectedIndex(get({This, keyIntegerJComboBox}))).

sequenceJRadioButtonActionPerformed(This, Evt) ->
        case (get({get({This, sequenceJRadioButton}), '$class'})):isSelected(get({This, sequenceJRadioButton})) of
            true ->
            (get({get({This, delayJTextField}), '$class'})):setText(get({This, delayJTextField}), get({'CommonPhoneStrings':getInstance(), 'ONE'})),
            (get({get({This, simultaneousJRadioButton}), '$class'})):setSelected(get({This, simultaneousJRadioButton}), false);
            false -> ok
        end.

simultaneousJRadioButtonActionPerformed(This, Evt) ->
        case (get({get({This, simultaneousJRadioButton}), '$class'})):isSelected(get({This, simultaneousJRadioButton})) of
            true ->
            (get({get({This, delayJTextField}), '$class'})):setText(get({This, delayJTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
            (get({get({This, sequenceJRadioButton}), '$class'})):setSelected(get({This, sequenceJRadioButton}), false);
            false -> ok
        end.

keyNameJComboBoxActionPerformed(This, Evt) ->
        Integer = (get({This, '$class'})):getSelectedKey(This),
        (get({This, '$class'})):prependText(This, Integer),
        (get({get({This, keyIntegerJComboBox}), '$class'})):setSelectedIndex(get({This, keyIntegerJComboBox}), (get({get({This, keyNameJComboBox}), '$class'})):getSelectedIndex(get({This, keyNameJComboBox}))).

okJButtonActionPerformed(This, Evt) ->
        try
            (get({This, '$class'})):update(This),
            (fun(Target_N77862) -> (get({Target_N77862, '$class'})):setVisible(Target_N77862, false) end)((get({This, '$class'})):getKeyActionJDialog(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "okButtonActionPerformed", E)
        end.

keyActionJButtonActionPerformed(This, Evt) ->
        (fun(Target_N78077) -> (get({Target_N78077, '$class'})):setVisible(Target_N78077, true) end)((get({This, '$class'})):getKeyActionJDialog(This)).

normalJRadioButtonActionPerformed(This, Evt) ->
        case (get({get({This, normalJRadioButton}), '$class'})):isSelected(get({This, normalJRadioButton})) of
            true ->
            (get({get({This, keyActionScriptInputInterface}), '$class'})):setNormal(get({This, keyActionScriptInputInterface})),
            (get({get({This, pressJRadioButton}), '$class'})):setSelected(get({This, pressJRadioButton}), false),
            (get({get({This, releaseJRadioButton}), '$class'})):setSelected(get({This, releaseJRadioButton}), false);
            false -> ok
        end.

releaseJRadioButtonActionPerformed(This, Evt) ->
        case (get({get({This, releaseJRadioButton}), '$class'})):isSelected(get({This, releaseJRadioButton})) of
            true ->
            (get({get({This, keyActionScriptInputInterface}), '$class'})):setRelease(get({This, keyActionScriptInputInterface}), true),
            (get({get({This, keyActionScriptInputInterface}), '$class'})):setPress(get({This, keyActionScriptInputInterface}), false),
            (get({get({This, pressJRadioButton}), '$class'})):setSelected(get({This, pressJRadioButton}), false),
            (get({get({This, normalJRadioButton}), '$class'})):setSelected(get({This, normalJRadioButton}), false);
            false -> ok
        end.

pressJRadioButtonActionPerformed(This, Evt) ->
        case (get({get({This, pressJRadioButton}), '$class'})):isSelected(get({This, pressJRadioButton})) of
            true ->
            (get({get({This, keyActionScriptInputInterface}), '$class'})):setPress(get({This, keyActionScriptInputInterface}), true),
            (get({get({This, keyActionScriptInputInterface}), '$class'})):setRelease(get({This, keyActionScriptInputInterface}), false),
            (get({get({This, releaseJRadioButton}), '$class'})):setSelected(get({This, releaseJRadioButton}), false),
            (get({get({This, normalJRadioButton}), '$class'})):setSelected(get({This, normalJRadioButton}), false);
            false -> ok
        end.

