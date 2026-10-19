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
% import java.awt.event.InputEvent
% import javax.swing
% import org.allbinary.input.automation.robot.InputRobot
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.TempInputRobotNames
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonStrings

-module('MouseActionScriptInputJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, mouseActionScriptInputInterface}, undefined),
    put({This, button1JCheckBox}, undefined),
    put({This, button2JCheckBox}, undefined),
    put({This, inputAutomationTypeJComboBox}, undefined),
    put({This, inputTypeJLabel}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLabel3}, undefined),
    put({This, jLabel4}, undefined),
    put({This, jLabel5}, undefined),
    put({This, jLabel6}, undefined),
    put({This, mouseActionJButton}, undefined),
    put({This, mouseActionJDialog}, undefined),
    put({This, mouseDelayJTextField}, undefined),
    put({This, mouseXJTextField}, undefined),
    put({This, mouseYJTextField}, undefined),
    put({This, okJButton}, undefined),
    put({This, titleJLabel}, undefined),
    ok.


new(MouseActionScriptInputInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MouseActionScriptInputInterface),
    This.

init(This, MouseActionScriptInputInterface) ->
    'JPanel':init(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'START'}) + MouseActionScriptInputInterface), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, mouseActionScriptInputInterface}, MouseActionScriptInputInterface),
        DefaultComboBoxModel = 'DefaultComboBoxModel':new(),
        (get({DefaultComboBoxModel, '$class'})):addElement(DefaultComboBoxModel, get({'TempInputRobotNames', 'LOW_NAME'})),
        (get({DefaultComboBoxModel, '$class'})):addElement(DefaultComboBoxModel, get({'TempInputRobotNames', 'SYS_NAME'})),
        (get({DefaultComboBoxModel, '$class'})):addElement(DefaultComboBoxModel, get({'InputRobot', 'NAME'})),
        (get({get({This, inputAutomationTypeJComboBox}), '$class'})):setModel(get({This, inputAutomationTypeJComboBox}), DefaultComboBoxModel),
        (get({This, '$class'})):set(This).

set(This) ->
        InputTypeComboBoxModel = (get({get({This, inputAutomationTypeJComboBox}), '$class'})):getModel(get({This, inputAutomationTypeJComboBox})),
        (get({InputTypeComboBoxModel, '$class'})):setSelectedItem(InputTypeComboBoxModel, (fun(Target_N66543) -> (get({Target_N66543, '$class'})):getName(Target_N66543) end)((get({get({This, mouseActionScriptInputInterface}), '$class'})):getInputRobotInterface(get({This, mouseActionScriptInputInterface})))),
        case ((((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) band get({'InputEvent', 'BUTTON1_MASK'}))) =/= 0) of
            true ->
            (get({get({This, button1JCheckBox}), '$class'})):setSelected(get({This, button1JCheckBox}), true);
            false ->
            (get({get({This, button1JCheckBox}), '$class'})):setSelected(get({This, button1JCheckBox}), false)
        end,
        case ((((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) band get({'InputEvent', 'BUTTON2_MASK'}))) =/= 0) of
            true ->
            (get({get({This, button2JCheckBox}), '$class'})):setSelected(get({This, button2JCheckBox}), true);
            false ->
            (get({get({This, button2JCheckBox}), '$class'})):setSelected(get({This, button2JCheckBox}), false)
        end,
        (get({get({This, mouseDelayJTextField}), '$class'})):setText(get({This, mouseDelayJTextField}), allbinary_java:to_string((get({get({This, mouseActionScriptInputInterface}), '$class'})):getTime(get({This, mouseActionScriptInputInterface})))),
        (get({get({This, mouseXJTextField}), '$class'})):setText(get({This, mouseXJTextField}), allbinary_java:to_string(get({(get({get({This, mouseActionScriptInputInterface}), '$class'})):getPoint(get({This, mouseActionScriptInputInterface})), x}))),
        (get({get({This, mouseYJTextField}), '$class'})):setText(get({This, mouseYJTextField}), allbinary_java:to_string(get({(get({get({This, mouseActionScriptInputInterface}), '$class'})):getPoint(get({This, mouseActionScriptInputInterface})), y}))),
        (get({get({This, mouseActionScriptInputInterface}), '$class'})):log(get({This, mouseActionScriptInputInterface})).

% throws Exception
updateInputType(This) ->
        ComboBoxModel = (get({get({This, inputAutomationTypeJComboBox}), '$class'})):getModel(get({This, inputAutomationTypeJComboBox})),
        SelectedItem = (get({ComboBoxModel, '$class'})):getSelectedItem(ComboBoxModel),
        case (not (fun(Target_N67213) -> (get({Target_N67213, '$class'})):isEmpty(Target_N67213, SelectedItem) end)('StringValidationUtil':getInstance())) of
            true ->
            (get({get({This, mouseActionScriptInputInterface}), '$class'})):setInputRobotInterface(get({This, mouseActionScriptInputInterface}), (fun(Target_N67277) -> (get({Target_N67277, '$class'})):get(Target_N67277, SelectedItem) end)('InputRobotFactory':getInstance()));
            false -> ok
        end.

% throws Exception
update(This) ->
        (get({This, '$class'})):updateInputType(This),
        (get({get({This, mouseActionScriptInputInterface}), '$class'})):setTime(get({This, mouseActionScriptInputInterface}), allbinary_java:to_string((get({get({This, mouseDelayJTextField}), '$class'})):getText(get({This, mouseDelayJTextField})))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Button State: ", (get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface}))]), This, "update"),
        case (get({get({This, button1JCheckBox}), '$class'})):isSelected(get({This, button1JCheckBox})) of
            true ->
            case ((((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) band get({'InputEvent', 'BUTTON1_MASK'}))) =:= 0) of
                true ->
                (get({get({This, mouseActionScriptInputInterface}), '$class'})):setButtonClicks(get({This, mouseActionScriptInputInterface}), ((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) bor get({'InputEvent', 'BUTTON1_MASK'}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Button 1 Selected: ", (get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface}))]), This, "update");
                false -> ok
            end;
            false ->
            case ((((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) band get({'InputEvent', 'BUTTON1_MASK'}))) =/= 0) of
                true ->
                (get({get({This, mouseActionScriptInputInterface}), '$class'})):setButtonClicks(get({This, mouseActionScriptInputInterface}), ((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) bxor get({'InputEvent', 'BUTTON1_MASK'}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Button 1 Deselected: ", (get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface}))]), This, "update");
                false -> ok
            end
        end,
        case (get({get({This, button2JCheckBox}), '$class'})):isSelected(get({This, button2JCheckBox})) of
            true ->
            case ((((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) band get({'InputEvent', 'BUTTON2_MASK'}))) =:= 0) of
                true ->
                (get({get({This, mouseActionScriptInputInterface}), '$class'})):setButtonClicks(get({This, mouseActionScriptInputInterface}), ((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) bor get({'InputEvent', 'BUTTON2_MASK'}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Button 2 Selected: ", (get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface}))]), This, "update");
                false -> ok
            end;
            false ->
            case ((((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) band get({'InputEvent', 'BUTTON2_MASK'}))) =/= 0) of
                true ->
                (get({get({This, mouseActionScriptInputInterface}), '$class'})):setButtonClicks(get({This, mouseActionScriptInputInterface}), ((get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface})) bxor get({'InputEvent', 'BUTTON2_MASK'}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Button 2 Deselected: ", (get({get({This, mouseActionScriptInputInterface}), '$class'})):getButtonClicks(get({This, mouseActionScriptInputInterface}))]), This, "update");
                false -> ok
            end
        end,
        MouseXString = (get({get({This, mouseXJTextField}), '$class'})):getText(get({This, mouseXJTextField})),
        case ((not (fun(Target_N68389) -> (get({Target_N68389, '$class'})):isEmpty(Target_N68389, MouseXString) end)('StringValidationUtil':getInstance())) andalso (fun(Target_N68425) -> (get({Target_N68425, '$class'})):isNumber(Target_N68425, MouseXString) end)('StringValidationUtil':getInstance())) of
            true ->
            put({(get({get({This, mouseActionScriptInputInterface}), '$class'})):getPoint(get({This, mouseActionScriptInputInterface})), x}, list_to_integer(MouseXString));
            false -> ok
        end,
        MouseYString = (get({get({This, mouseYJTextField}), '$class'})):getText(get({This, mouseYJTextField})),
        case ((not (fun(Target_N68589) -> (get({Target_N68589, '$class'})):isEmpty(Target_N68589, MouseYString) end)('StringValidationUtil':getInstance())) andalso (fun(Target_N68625) -> (get({Target_N68625, '$class'})):isNumber(Target_N68625, MouseYString) end)('StringValidationUtil':getInstance())) of
            true ->
            put({(get({get({This, mouseActionScriptInputInterface}), '$class'})):getPoint(get({This, mouseActionScriptInputInterface})), y}, list_to_integer(MouseYString));
            false -> ok
        end,
        (get({get({This, mouseActionScriptInputInterface}), '$class'})):log(get({This, mouseActionScriptInputInterface})).

getMouseActionJDialog(This) ->
        get({This, mouseActionJDialog}).

setMouseActionJDialog(This, MouseActionJDialog) ->
        put({This, mouseActionJDialog}, MouseActionJDialog).

initComponents(This) ->
        put({This, mouseActionJDialog}, 'JDialog':new()),
        put({This, titleJLabel}, 'JLabel':new()),
        put({This, okJButton}, 'JButton':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, button1JCheckBox}, 'JCheckBox':new()),
        put({This, button2JCheckBox}, 'JCheckBox':new()),
        put({This, jLabel4}, 'JLabel':new()),
        put({This, mouseXJTextField}, 'JTextField':new()),
        put({This, jLabel5}, 'JLabel':new()),
        put({This, mouseYJTextField}, 'JTextField':new()),
        put({This, inputTypeJLabel}, 'JLabel':new()),
        put({This, inputAutomationTypeJComboBox}, 'JComboBox':new()),
        put({This, jLabel6}, 'JLabel':new()),
        put({This, mouseDelayJTextField}, 'JTextField':new()),
        put({This, mouseActionJButton}, 'JButton':new()),
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, mouseActionJDialog}), '$class'})):setMinimumSize(get({This, mouseActionJDialog}), 'Dimension':new(275, 185)),
        (get({get({This, titleJLabel}), '$class'})):setText(get({This, titleJLabel}), "Mouse Input Options"),
        (get({get({This, okJButton}), '$class'})):setText(get({This, okJButton}), "OK"),
        (get({get({This, okJButton}), '$class'})):addActionListener(get({This, okJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Buttons:"),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Move To:"),
        (get({get({This, button1JCheckBox}), '$class'})):setText(get({This, button1JCheckBox}), get({'CommonPhoneStrings':getInstance(), 'ONE'})),
        (get({get({This, button1JCheckBox}), '$class'})):setBorder(get({This, button1JCheckBox}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, button1JCheckBox}), '$class'})):setMargin(get({This, button1JCheckBox}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, button2JCheckBox}), '$class'})):setText(get({This, button2JCheckBox}), get({'CommonPhoneStrings':getInstance(), 'TWO'})),
        (get({get({This, button2JCheckBox}), '$class'})):setBorder(get({This, button2JCheckBox}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, button2JCheckBox}), '$class'})):setMargin(get({This, button2JCheckBox}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, button2JCheckBox}), '$class'})):addActionListener(get({This, button2JCheckBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel4}), '$class'})):setText(get({This, jLabel4}), "x:"),
        (get({get({This, mouseXJTextField}), '$class'})):setText(get({This, mouseXJTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, jLabel5}), '$class'})):setText(get({This, jLabel5}), "y:"),
        (get({get({This, mouseYJTextField}), '$class'})):setText(get({This, mouseYJTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, inputTypeJLabel}), '$class'})):setText(get({This, inputTypeJLabel}), "Input Type:"),
        (get({get({This, jLabel6}), '$class'})):setText(get({This, jLabel6}), "Delay:"),
        (get({get({This, mouseDelayJTextField}), '$class'})):setText(get({This, mouseDelayJTextField}), "100"),
        MouseActionJDialogLayout = 'GroupLayout':new((get({get({This, mouseActionJDialog}), '$class'})):getContentPane(get({This, mouseActionJDialog}))),
        (fun(Target_N71002) -> (get({Target_N71002, '$class'})):setLayout(Target_N71002, MouseActionJDialogLayout) end)((get({get({This, mouseActionJDialog}), '$class'})):getContentPane(get({This, mouseActionJDialog}))),
        (get({MouseActionJDialogLayout, '$class'})):setHorizontalGroup(MouseActionJDialogLayout, (fun(Target_N71061) -> (get({Target_N71061, '$class'})):addGroup(Target_N71061, (fun(Target_N71129) -> (get({Target_N71129, '$class'})):addContainerGap(Target_N71129) end)((fun(Target_N71136) -> (get({Target_N71136, '$class'})):addGroup(Target_N71136, (fun(Target_N71169) -> (get({Target_N71169, '$class'})):addGroup(Target_N71169, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N71296) -> (get({Target_N71296, '$class'})):addGroup(Target_N71296, (fun(Target_N71686) -> (get({Target_N71686, '$class'})):addGroup(Target_N71686, (fun(Target_N72211) -> (get({Target_N72211, '$class'})):addComponent(Target_N72211, get({This, mouseYJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 62, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72218) -> (get({Target_N72218, '$class'})):addPreferredGap(Target_N72218, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72225) -> (get({Target_N72225, '$class'})):addComponent(Target_N72225, get({This, jLabel5})) end)((fun(Target_N72232) -> (get({Target_N72232, '$class'})):addPreferredGap(Target_N72232, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72239) -> (get({Target_N72239, '$class'})):addGroup(Target_N72239, (fun(Target_N72264) -> (get({Target_N72264, '$class'})):addGroup(Target_N72264, (fun(Target_N72429) -> (get({Target_N72429, '$class'})):addComponent(Target_N72429, get({This, mouseXJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 59, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72436) -> (get({Target_N72436, '$class'})):addPreferredGap(Target_N72436, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 5, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72443) -> (get({Target_N72443, '$class'})):addComponent(Target_N72443, get({This, jLabel4})) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout))))) end)((fun(Target_N72271) -> (get({Target_N72271, '$class'})):addGroup(Target_N72271, (fun(Target_N72339) -> (get({Target_N72339, '$class'})):addComponent(Target_N72339, get({This, okJButton})) end)((fun(Target_N72346) -> (get({Target_N72346, '$class'})):addPreferredGap(Target_N72346, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout)))) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}))))) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout))))))) end)((fun(Target_N71693) -> (get({Target_N71693, '$class'})):addGroup(Target_N71693, (fun(Target_N72102) -> (get({Target_N72102, '$class'})):addComponent(Target_N72102, get({This, button2JCheckBox})) end)((fun(Target_N72109) -> (get({Target_N72109, '$class'})):addPreferredGap(Target_N72109, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72116) -> (get({Target_N72116, '$class'})):addComponent(Target_N72116, get({This, button1JCheckBox})) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout))))) end)((fun(Target_N71700) -> (get({Target_N71700, '$class'})):addGroup(Target_N71700, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N71988) -> (get({Target_N71988, '$class'})):addComponent(Target_N71988, get({This, inputAutomationTypeJComboBox}), 0, 154, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71995) -> (get({Target_N71995, '$class'})):addPreferredGap(Target_N71995, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout)))) end)((fun(Target_N71707) -> (get({Target_N71707, '$class'})):addGroup(Target_N71707, (fun(Target_N71886) -> (get({Target_N71886, '$class'})):addGap(Target_N71886, 45, 45, 45) end)((fun(Target_N71893) -> (get({Target_N71893, '$class'})):addComponent(Target_N71893, get({This, titleJLabel})) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout)))) end)((fun(Target_N71714) -> (get({Target_N71714, '$class'})):addComponent(Target_N71714, get({This, mouseDelayJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 154, get({'Short', 'MAX_VALUE'})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))))) end)((fun(Target_N71303) -> (get({Target_N71303, '$class'})):addGroup(Target_N71303, (fun(Target_N71328) -> (get({Target_N71328, '$class'})):addGroup(Target_N71328, (fun(Target_N71505) -> (get({Target_N71505, '$class'})):addPreferredGap(Target_N71505, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71512) -> (get({Target_N71512, '$class'})):addGroup(Target_N71512, (fun(Target_N71537) -> (get({Target_N71537, '$class'})):addComponent(Target_N71537, get({This, jLabel6})) end)((fun(Target_N71544) -> (get({Target_N71544, '$class'})):addComponent(Target_N71544, get({This, jLabel3})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout)))) end)((fun(Target_N71335) -> (get({Target_N71335, '$class'})):addGroup(Target_N71335, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N71443) -> (get({Target_N71443, '$class'})):addGap(Target_N71443, 25, 25, 25) end)((fun(Target_N71450) -> (get({Target_N71450, '$class'})):addComponent(Target_N71450, get({This, jLabel2})) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout)))) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout)))) end)((fun(Target_N71176) -> (get({Target_N71176, '$class'})):addComponent(Target_N71176, get({This, inputTypeJLabel})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N71143) -> (get({Target_N71143, '$class'})):addContainerGap(Target_N71143) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout))))) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({MouseActionJDialogLayout, '$class'})):setVerticalGroup(MouseActionJDialogLayout, (fun(Target_N72824) -> (get({Target_N72824, '$class'})):addGroup(Target_N72824, (fun(Target_N72892) -> (get({Target_N72892, '$class'})):addContainerGap(Target_N72892) end)((fun(Target_N72899) -> (get({Target_N72899, '$class'})):addComponent(Target_N72899, get({This, okJButton})) end)((fun(Target_N72906) -> (get({Target_N72906, '$class'})):addPreferredGap(Target_N72906, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72913) -> (get({Target_N72913, '$class'})):addGroup(Target_N72913, (fun(Target_N73834) -> (get({Target_N73834, '$class'})):addComponent(Target_N73834, get({This, mouseXJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73841) -> (get({Target_N73841, '$class'})):addComponent(Target_N73841, get({This, mouseYJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73848) -> (get({Target_N73848, '$class'})):addComponent(Target_N73848, get({This, jLabel5})) end)((fun(Target_N73855) -> (get({Target_N73855, '$class'})):addComponent(Target_N73855, get({This, jLabel4})) end)((fun(Target_N73862) -> (get({Target_N73862, '$class'})):addComponent(Target_N73862, get({This, jLabel3})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'})))))))) end)((fun(Target_N72920) -> (get({Target_N72920, '$class'})):addPreferredGap(Target_N72920, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72927) -> (get({Target_N72927, '$class'})):addGroup(Target_N72927, (fun(Target_N73593) -> (get({Target_N73593, '$class'})):addComponent(Target_N73593, get({This, mouseDelayJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73600) -> (get({Target_N73600, '$class'})):addComponent(Target_N73600, get({This, jLabel6})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N72934) -> (get({Target_N72934, '$class'})):addPreferredGap(Target_N72934, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72941) -> (get({Target_N72941, '$class'})):addGroup(Target_N72941, (fun(Target_N73291) -> (get({Target_N73291, '$class'})):addGroup(Target_N73291, (fun(Target_N73446) -> (get({Target_N73446, '$class'})):addComponent(Target_N73446, get({This, button2JCheckBox})) end)((fun(Target_N73453) -> (get({Target_N73453, '$class'})):addComponent(Target_N73453, get({This, button1JCheckBox})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N73298) -> (get({Target_N73298, '$class'})):addComponent(Target_N73298, get({This, jLabel2}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 15, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N72948) -> (get({Target_N72948, '$class'})):addPreferredGap(Target_N72948, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72955) -> (get({Target_N72955, '$class'})):addGroup(Target_N72955, (fun(Target_N73050) -> (get({Target_N73050, '$class'})):addComponent(Target_N73050, get({This, inputAutomationTypeJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73057) -> (get({Target_N73057, '$class'})):addComponent(Target_N73057, get({This, inputTypeJLabel})) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N72962) -> (get({Target_N72962, '$class'})):addPreferredGap(Target_N72962, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72969) -> (get({Target_N72969, '$class'})):addComponent(Target_N72969, get({This, titleJLabel})) end)((get({MouseActionJDialogLayout, '$class'})):createSequentialGroup(MouseActionJDialogLayout)))))))))))))) end)((get({MouseActionJDialogLayout, '$class'})):createParallelGroup(MouseActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(100, 0)),
        (get({get({This, mouseActionJButton}), '$class'})):setText(get({This, mouseActionJButton}), "Edit"),
        (get({get({This, mouseActionJButton}), '$class'})):addActionListener(get({This, mouseActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Mouse:"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N74686) -> (get({Target_N74686, '$class'})):addGroup(Target_N74686, (fun(Target_N74754) -> (get({Target_N74754, '$class'})):addComponent(Target_N74754, get({This, mouseActionJButton})) end)((fun(Target_N74761) -> (get({Target_N74761, '$class'})):addPreferredGap(Target_N74761, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 36, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74768) -> (get({Target_N74768, '$class'})):addComponent(Target_N74768, get({This, jLabel1})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N74904) -> (get({Target_N74904, '$class'})):addGroup(Target_N74904, (fun(Target_N74972) -> (get({Target_N74972, '$class'})):addComponent(Target_N74972, get({This, mouseActionJButton})) end)((fun(Target_N74979) -> (get({Target_N74979, '$class'})):addComponent(Target_N74979, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

button2JCheckBoxActionPerformed(This, Evt) ->
        ok.

okJButtonActionPerformed(This, Evt) ->
        try
            (get({This, '$class'})):update(This),
            (fun(Target_N75212) -> (get({Target_N75212, '$class'})):setVisible(Target_N75212, false) end)((get({This, '$class'})):getMouseActionJDialog(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "okButtonActionPerformed", E)
        end.

mouseActionJButtonActionPerformed(This, Evt) ->
        (fun(Target_N75427) -> (get({Target_N75427, '$class'})):setVisible(Target_N75427, true) end)((get({This, '$class'})):getMouseActionJDialog(This)).

