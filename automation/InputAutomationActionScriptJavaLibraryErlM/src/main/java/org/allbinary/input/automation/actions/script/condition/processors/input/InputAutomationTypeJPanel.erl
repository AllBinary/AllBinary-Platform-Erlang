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

-module('InputAutomationTypeJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, inputAutomationTypeJComboBox}, undefined),
    put({This, jLabel1}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'JPanel':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This).

getInputAutomationTypeJComboBox(This) ->
        get({This, inputAutomationTypeJComboBox}).

setInputAutomationTypeJComboBox(This, InputAutomationTypeJComboBox) ->
        put({This, inputAutomationTypeJComboBox}, InputAutomationTypeJComboBox).

initComponents(This) ->
        put({This, inputAutomationTypeJComboBox}, 'JComboBox':new()),
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, inputAutomationTypeJComboBox}), '$class'})):setModel(get({This, inputAutomationTypeJComboBox}), 'DefaultComboBoxModel':new(array:from_list(["DirectX", "DirectX 8", "Low Level", "Java Robot"]))),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Input Type:"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N66182) -> (get({Target_N66182, '$class'})):addGroup(Target_N66182, (fun(Target_N66250) -> (get({Target_N66250, '$class'})):addComponent(Target_N66250, get({This, inputAutomationTypeJComboBox}), 0, 98, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N66257) -> (get({Target_N66257, '$class'})):addPreferredGap(Target_N66257, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N66264) -> (get({Target_N66264, '$class'})):addComponent(Target_N66264, get({This, jLabel1})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N66404) -> (get({Target_N66404, '$class'})):addGroup(Target_N66404, (fun(Target_N66472) -> (get({Target_N66472, '$class'})):addComponent(Target_N66472, get({This, inputAutomationTypeJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N66479) -> (get({Target_N66479, '$class'})):addComponent(Target_N66479, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

