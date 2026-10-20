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
% import org.allbinary.input.automation.module.DefaultListModelHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('GenericProfileActionsJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, genericProfileActions}, undefined),
    put({This, genericProfileActionJPanel}, undefined),
    put({This, blankGenericProfileActionJPanel}, undefined),
    put({This, deleteActionJButton}, undefined),
    put({This, genericProfileActionsJList}, undefined),
    put({This, genericProfileActionsJPanel}, undefined),
    put({This, genericProfileActionsJScrollPane}, undefined),
    put({This, newActionJButton}, undefined),
    put({This, newProfileActionJDialog}, undefined),
    put({This, newProfileActionJLabel}, undefined),
    put({This, newProfileActionJTextField}, undefined),
    put({This, okNewProfileActionJButton}, undefined),
    put({This, saveJButton}, undefined),
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

initComponents(This) ->
        put({This, newProfileActionJDialog}, 'JDialog':new()),
        put({This, newProfileActionJLabel}, 'JLabel':new()),
        put({This, okNewProfileActionJButton}, 'JButton':new()),
        put({This, newProfileActionJTextField}, 'JTextField':new()),
        put({This, genericProfileActionsJPanel}, 'JPanel':new()),
        put({This, genericProfileActionsJScrollPane}, 'JScrollPane':new()),
        put({This, genericProfileActionsJList}, 'JList':new()),
        put({This, newActionJButton}, 'JButton':new()),
        put({This, deleteActionJButton}, 'JButton':new()),
        put({This, saveJButton}, 'JButton':new()),
        put({This, blankGenericProfileActionJPanel}, 'JPanel':new()),
        (get({get({This, newProfileActionJDialog}), '$class'})):setMinimumSize(get({This, newProfileActionJDialog}), 'Dimension':new(250, 150)),
        (get({get({This, newProfileActionJDialog}), '$class'})):setResizable(get({This, newProfileActionJDialog}), false),
        (get({get({This, newProfileActionJLabel}), '$class'})):setText(get({This, newProfileActionJLabel}), "New Action Name"),
        (get({get({This, okNewProfileActionJButton}), '$class'})):setText(get({This, okNewProfileActionJButton}), "Ok"),
        (get({get({This, okNewProfileActionJButton}), '$class'})):addActionListener(get({This, okNewProfileActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        NewProfileActionJDialogLayout = 'GroupLayout':new((get({get({This, newProfileActionJDialog}), '$class'})):getContentPane(get({This, newProfileActionJDialog}))),
        (fun(Target_N66890) -> (get({Target_N66890, '$class'})):setLayout(Target_N66890, NewProfileActionJDialogLayout) end)((get({get({This, newProfileActionJDialog}), '$class'})):getContentPane(get({This, newProfileActionJDialog}))),
        (get({NewProfileActionJDialogLayout, '$class'})):setHorizontalGroup(NewProfileActionJDialogLayout, (fun(Target_N66949) -> (get({Target_N66949, '$class'})):addGroup(Target_N66949, (fun(Target_N67017) -> (get({Target_N67017, '$class'})):addContainerGap(Target_N67017, 34, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67024) -> (get({Target_N67024, '$class'})):addGroup(Target_N67024, (fun(Target_N67049) -> (get({Target_N67049, '$class'})):addGroup(Target_N67049, (fun(Target_N67255) -> (get({Target_N67255, '$class'})):addComponent(Target_N67255, get({This, newProfileActionJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 178, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N67262) -> (get({Target_N67262, '$class'})):addGap(Target_N67262, 29, 29, 29) end)((get({NewProfileActionJDialogLayout, '$class'})):createSequentialGroup(NewProfileActionJDialogLayout)))) end)((fun(Target_N67056) -> (get({Target_N67056, '$class'})):addGroup(Target_N67056, (fun(Target_N67193) -> (get({Target_N67193, '$class'})):addComponent(Target_N67193, get({This, newProfileActionJLabel})) end)((fun(Target_N67200) -> (get({Target_N67200, '$class'})):addGap(Target_N67200, 75, 75, 75) end)((get({NewProfileActionJDialogLayout, '$class'})):createSequentialGroup(NewProfileActionJDialogLayout)))) end)((fun(Target_N67063) -> (get({Target_N67063, '$class'})):addGroup(Target_N67063, (fun(Target_N67131) -> (get({Target_N67131, '$class'})):addComponent(Target_N67131, get({This, okNewProfileActionJButton})) end)((fun(Target_N67138) -> (get({Target_N67138, '$class'})):addGap(Target_N67138, 93, 93, 93) end)((get({NewProfileActionJDialogLayout, '$class'})):createSequentialGroup(NewProfileActionJDialogLayout)))) end)((get({NewProfileActionJDialogLayout, '$class'})):createParallelGroup(NewProfileActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))) end)((get({NewProfileActionJDialogLayout, '$class'})):createSequentialGroup(NewProfileActionJDialogLayout)))) end)((get({NewProfileActionJDialogLayout, '$class'})):createParallelGroup(NewProfileActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({NewProfileActionJDialogLayout, '$class'})):setVerticalGroup(NewProfileActionJDialogLayout, (fun(Target_N67434) -> (get({Target_N67434, '$class'})):addGroup(Target_N67434, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N67542) -> (get({Target_N67542, '$class'})):addContainerGap(Target_N67542) end)((fun(Target_N67549) -> (get({Target_N67549, '$class'})):addComponent(Target_N67549, get({This, okNewProfileActionJButton})) end)((fun(Target_N67556) -> (get({Target_N67556, '$class'})):addPreferredGap(Target_N67556, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 20, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67563) -> (get({Target_N67563, '$class'})):addComponent(Target_N67563, get({This, newProfileActionJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N67570) -> (get({Target_N67570, '$class'})):addGap(Target_N67570, 21, 21, 21) end)((fun(Target_N67577) -> (get({Target_N67577, '$class'})):addComponent(Target_N67577, get({This, newProfileActionJLabel})) end)((fun(Target_N67584) -> (get({Target_N67584, '$class'})):addContainerGap(Target_N67584) end)((get({NewProfileActionJDialogLayout, '$class'})):createSequentialGroup(NewProfileActionJDialogLayout))))))))) end)((get({NewProfileActionJDialogLayout, '$class'})):createParallelGroup(NewProfileActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, genericProfileActionsJPanel}), '$class'})):setPreferredSize(get({This, genericProfileActionsJPanel}), 'Dimension':new(10000, 10000)),
        (get({get({This, genericProfileActionsJList}), '$class'})):addListSelectionListener(get({This, genericProfileActionsJList}), 'ListSelectionListener':new() % Java anonymous class body: implement it as a module
%             ok % valueChanged
),
        (get({get({This, genericProfileActionsJScrollPane}), '$class'})):setViewportView(get({This, genericProfileActionsJScrollPane}), get({This, genericProfileActionsJList})),
        (get({get({This, newActionJButton}), '$class'})):setText(get({This, newActionJButton}), "New"),
        (get({get({This, newActionJButton}), '$class'})):addActionListener(get({This, newActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, deleteActionJButton}), '$class'})):setText(get({This, deleteActionJButton}), "Delete"),
        (get({get({This, deleteActionJButton}), '$class'})):addActionListener(get({This, deleteActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, saveJButton}), '$class'})):setText(get({This, saveJButton}), "Save"),
        (get({get({This, saveJButton}), '$class'})):addActionListener(get({This, saveJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, blankGenericProfileActionJPanel}), '$class'})):setMinimumSize(get({This, blankGenericProfileActionJPanel}), 'Dimension':new(500, 300)),
        BlankGenericProfileActionJPanelLayout = 'GroupLayout':new(get({This, blankGenericProfileActionJPanel})),
        (get({get({This, blankGenericProfileActionJPanel}), '$class'})):setLayout(get({This, blankGenericProfileActionJPanel}), BlankGenericProfileActionJPanelLayout),
        (get({BlankGenericProfileActionJPanelLayout, '$class'})):setHorizontalGroup(BlankGenericProfileActionJPanelLayout, (fun(Target_N68850) -> (get({Target_N68850, '$class'})):addGap(Target_N68850, 0, 500, get({'Short', 'MAX_VALUE'})) end)((get({BlankGenericProfileActionJPanelLayout, '$class'})):createParallelGroup(BlankGenericProfileActionJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({BlankGenericProfileActionJPanelLayout, '$class'})):setVerticalGroup(BlankGenericProfileActionJPanelLayout, (fun(Target_N68967) -> (get({Target_N68967, '$class'})):addGap(Target_N68967, 0, 296, get({'Short', 'MAX_VALUE'})) end)((get({BlankGenericProfileActionJPanelLayout, '$class'})):createParallelGroup(BlankGenericProfileActionJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        GenericProfileActionsJPanelLayout = 'GroupLayout':new(get({This, genericProfileActionsJPanel})),
        (get({get({This, genericProfileActionsJPanel}), '$class'})):setLayout(get({This, genericProfileActionsJPanel}), GenericProfileActionsJPanelLayout),
        (get({GenericProfileActionsJPanelLayout, '$class'})):setHorizontalGroup(GenericProfileActionsJPanelLayout, (fun(Target_N69203) -> (get({Target_N69203, '$class'})):addGroup(Target_N69203, (fun(Target_N69535) -> (get({Target_N69535, '$class'})):addContainerGap(Target_N69535) end)((fun(Target_N69542) -> (get({Target_N69542, '$class'})):addComponent(Target_N69542, get({This, saveJButton})) end)((fun(Target_N69549) -> (get({Target_N69549, '$class'})):addPreferredGap(Target_N69549, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69556) -> (get({Target_N69556, '$class'})):addComponent(Target_N69556, get({This, deleteActionJButton})) end)((fun(Target_N69563) -> (get({Target_N69563, '$class'})):addPreferredGap(Target_N69563, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69570) -> (get({Target_N69570, '$class'})):addComponent(Target_N69570, get({This, newActionJButton})) end)((get({GenericProfileActionsJPanelLayout, '$class'})):createSequentialGroup(GenericProfileActionsJPanelLayout)))))))) end)((fun(Target_N69210) -> (get({Target_N69210, '$class'})):addGroup(Target_N69210, (fun(Target_N69278) -> (get({Target_N69278, '$class'})):addComponent(Target_N69278, get({This, blankGenericProfileActionJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69285) -> (get({Target_N69285, '$class'})):addPreferredGap(Target_N69285, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69292) -> (get({Target_N69292, '$class'})):addComponent(Target_N69292, get({This, genericProfileActionsJScrollPane}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 95, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({GenericProfileActionsJPanelLayout, '$class'})):createSequentialGroup(GenericProfileActionsJPanelLayout))))) end)((get({GenericProfileActionsJPanelLayout, '$class'})):createParallelGroup(GenericProfileActionsJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({GenericProfileActionsJPanelLayout, '$class'})):setVerticalGroup(GenericProfileActionsJPanelLayout, (fun(Target_N69743) -> (get({Target_N69743, '$class'})):addGroup(Target_N69743, (fun(Target_N69811) -> (get({Target_N69811, '$class'})):addContainerGap(Target_N69811, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69818) -> (get({Target_N69818, '$class'})):addGroup(Target_N69818, (fun(Target_N70021) -> (get({Target_N70021, '$class'})):addComponent(Target_N70021, get({This, genericProfileActionsJScrollPane}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 296, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70028) -> (get({Target_N70028, '$class'})):addComponent(Target_N70028, get({This, blankGenericProfileActionJPanel}), 0, 296, get({'Short', 'MAX_VALUE'})) end)((get({GenericProfileActionsJPanelLayout, '$class'})):createParallelGroup(GenericProfileActionsJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), false)))) end)((fun(Target_N69825) -> (get({Target_N69825, '$class'})):addPreferredGap(Target_N69825, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69832) -> (get({Target_N69832, '$class'})):addGroup(Target_N69832, (fun(Target_N69857) -> (get({Target_N69857, '$class'})):addComponent(Target_N69857, get({This, saveJButton})) end)((fun(Target_N69864) -> (get({Target_N69864, '$class'})):addComponent(Target_N69864, get({This, deleteActionJButton})) end)((fun(Target_N69871) -> (get({Target_N69871, '$class'})):addComponent(Target_N69871, get({This, newActionJButton})) end)((get({GenericProfileActionsJPanelLayout, '$class'})):createParallelGroup(GenericProfileActionsJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'})))))) end)((get({GenericProfileActionsJPanelLayout, '$class'})):createSequentialGroup(GenericProfileActionsJPanelLayout)))))) end)((get({GenericProfileActionsJPanelLayout, '$class'})):createParallelGroup(GenericProfileActionsJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N70380) -> (get({Target_N70380, '$class'})):addGroup(Target_N70380, (fun(Target_N70448) -> (get({Target_N70448, '$class'})):addContainerGap(Target_N70448, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70455) -> (get({Target_N70455, '$class'})):addComponent(Target_N70455, get({This, genericProfileActionsJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 596, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N70635) -> (get({Target_N70635, '$class'})):addComponent(Target_N70635, get({This, genericProfileActionsJPanel}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 336, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

setModel(This) ->
        DefaultListModelHelper = (fun(Target_N70824) -> (get({Target_N70824, '$class'})):getDefaultListModelHelper(Target_N70824) end)((get({This, '$class'})):getGenericProfileActions(This)),
        case ((fun(Target_N70866) -> (get({Target_N70866, '$class'})):getSize(Target_N70866) end)((get({DefaultListModelHelper, '$class'})):getListModel(DefaultListModelHelper)) > 0) of
            true ->
            (get({get({This, genericProfileActionsJList}), '$class'})):setModel(get({This, genericProfileActionsJList}), (get({DefaultListModelHelper, '$class'})):getListModel(DefaultListModelHelper));
            false -> ok
        end.

saveJButtonActionPerformed(This, Evt) ->
        try
            (fun(Target_N70985) -> (get({Target_N70985, '$class'})):save(Target_N70985) end)((get({This, '$class'})):getGenericProfileActions(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "saveJButtonActionPerformed", E)
        end.

updateProfileActionUI(This, ProfileActionNameString) when (is_list(ProfileActionNameString) orelse ProfileActionNameString =:= undefined) ->
        (get({get({This, blankGenericProfileActionJPanel}), '$class'})):removeAll(get({This, blankGenericProfileActionJPanel})),
        case (ProfileActionNameString =/= undefined) of
            true ->
            GenericProfileAction = (fun(Target_N71244) -> (get({Target_N71244, '$class'})):getAction(Target_N71244, ProfileActionNameString) end)((get({This, '$class'})):getGenericProfileActions(This)),
            (get({This, '$class'})):setGenericProfileActionJPanel(This, 'GenericProfileActionJPanel':new()),
            (fun(Target_N71323) -> (get({Target_N71323, '$class'})):setGenericProfileAction(Target_N71323, GenericProfileAction) end)((get({This, '$class'})):getGenericProfileActionJPanel(This)),
            (fun(Target_N71357) -> (get({Target_N71357, '$class'})):updateProfileActionUI(Target_N71357) end)((get({This, '$class'})):getGenericProfileActionJPanel(This)),
            Layout = (get({get({This, blankGenericProfileActionJPanel}), '$class'})):getLayout(get({This, blankGenericProfileActionJPanel})),
            (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N71487) -> (get({Target_N71487, '$class'})):addComponent(Target_N71487, (get({This, '$class'})):getGenericProfileActionJPanel(This), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71494) -> (get({Target_N71494, '$class'})):addGap(Target_N71494, 0, 395, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
            (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N71722) -> (get({Target_N71722, '$class'})):addComponent(Target_N71722, (get({This, '$class'})):getGenericProfileActionJPanel(This), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71729) -> (get({Target_N71729, '$class'})):addGap(Target_N71729, 0, 256, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Setting Configuration Profile Actions JPanel", This, "genericProfileActionsJListValueChanged");
            false -> ok
        end.

genericProfileActionsJListValueChanged(This, Evt) ->
        try
            ProfileActionNameString = (get({get({This, genericProfileActionsJList}), '$class'})):getSelectedValue(get({This, genericProfileActionsJList})),
            (get({This, '$class'})):updateProfileActionUI(This, ProfileActionNameString)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "genericProfileActionsJListValueChanged", E)
        end.

okNewProfileActionJButtonActionPerformed(This, Evt) ->
        try
            NewActionName = (get({get({This, newProfileActionJTextField}), '$class'})):getText(get({This, newProfileActionJTextField})),
            (fun(Target_N72356) -> (get({Target_N72356, '$class'})):add(Target_N72356, NewActionName) end)((get({This, '$class'})):getGenericProfileActions(This)),
            (get({This, '$class'})):setModel(This),
            (get({get({This, genericProfileActionsJList}), '$class'})):setSelectedValue(get({This, genericProfileActionsJList}), NewActionName, true),
            (get({get({This, newProfileActionJDialog}), '$class'})):setVisible(get({This, newProfileActionJDialog}), false),
            (get({This, '$class'})):updateProfileActionUI(This, NewActionName)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "okNewProfileActionJButtonActionPerformed", E)
        end.

deleteActionJButtonActionPerformed(This, Evt) ->
        try
            AnyType = (get({get({This, genericProfileActionsJList}), '$class'})):getSelectedValues(get({This, genericProfileActionsJList})),
            lists:foreach(fun(Index) ->
                NextSelectedValueString = array:get(Index, AnyType),
                (fun(Target_N72810) -> (get({Target_N72810, '$class'})):remove(Target_N72810, NextSelectedValueString) end)((get({This, '$class'})):getGenericProfileActions(This))
            end, lists:seq(0, array:size(AnyType) - 1)),
            (get({This, '$class'})):selectFirstElement(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "deleteActionJButtonActionPerformed", E)
        end.

% throws Exception
selectFirstElement(This) ->
        (get({This, '$class'})):setModel(This),
        case ((fun(Target_N73137) -> (get({Target_N73137, '$class'})):getSize(Target_N73137) end)((get({get({This, genericProfileActionsJList}), '$class'})):getModel(get({This, genericProfileActionsJList}))) > 0) of
            true ->
            (get({get({This, genericProfileActionsJList}), '$class'})):setSelectedValue(get({This, genericProfileActionsJList}), (fun(Target_N73254) -> (get({Target_N73254, '$class'})):getElementAt(Target_N73254, 0) end)((get({get({This, genericProfileActionsJList}), '$class'})):getModel(get({This, genericProfileActionsJList}))), true),
            (get({This, '$class'})):updateProfileActionUI(This, (fun(Target_N73313) -> (get({Target_N73313, '$class'})):getElementAt(Target_N73313, 0) end)((get({get({This, genericProfileActionsJList}), '$class'})):getModel(get({This, genericProfileActionsJList}))));
            false ->
            (get({get({This, blankGenericProfileActionJPanel}), '$class'})):removeAll(get({This, blankGenericProfileActionJPanel})),
            (get({get({This, blankGenericProfileActionJPanel}), '$class'})):repaint(get({This, blankGenericProfileActionJPanel}))
        end.

getGenericProfileActionJPanel(This) ->
        get({This, genericProfileActionJPanel}).

setGenericProfileActionJPanel(This, GenericProfileActionJPanel) ->
        put({This, genericProfileActionJPanel}, GenericProfileActionJPanel).

getGenericProfileActions(This) ->
        get({This, genericProfileActions}).

setGenericProfileActions(This, GenericProfileActions) ->
        put({This, genericProfileActions}, GenericProfileActions).

newActionJButtonActionPerformed(This, Evt) ->
        (get({get({This, newProfileActionJDialog}), '$class'})):setVisible(get({This, newProfileActionJDialog}), true).

