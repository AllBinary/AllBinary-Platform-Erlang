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
% package org.allbinary.input.automation.module.generic.configuration
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType
% import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions
% import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionsJPanel
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('GenericModuleConfigurationJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GenericModuleConfigurationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, genericProfiles}, undefined),
    put({This, selectedGenericProfile}, undefined),
    put({This, blankGenericProfileActionsJPanel}, undefined),
    put({This, buttonGroup2}, undefined),
    put({This, captureComparisonJCheckBox}, undefined),
    put({This, captureMotionAnalysisJCheckBox}, undefined),
    put({This, deleteProfileJButton}, undefined),
    put({This, genericJTabbedPane}, undefined),
    put({This, genericProfilesJList}, undefined),
    put({This, genericProfilesJPanel}, undefined),
    put({This, genericProfilesJScrollPane}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLabel3}, undefined),
    put({This, jPanel1}, undefined),
    put({This, newProfileJButton}, undefined),
    put({This, newProfileJDialog}, undefined),
    put({This, newProfileNameJLabel}, undefined),
    put({This, newProfileNameJTextField}, undefined),
    put({This, okNewProfileJButton}, undefined),
    put({This, savedCaptureJRadioButton}, undefined),
    put({This, screenCaptureJRadioButton}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        (get({This, '$class'})):setGenericProfiles(This, 'GenericProfiles':new(get({'GenericProfiles', 'DEFAULT_FILE'}))),
        (get({This, '$class'})):selectFirstElement(This).

initComponents(This) ->
        put({This, newProfileJDialog}, 'JDialog':new()),
        put({This, okNewProfileJButton}, 'JButton':new()),
        put({This, newProfileNameJLabel}, 'JLabel':new()),
        put({This, newProfileNameJTextField}, 'JTextField':new()),
        put({This, buttonGroup2}, 'ButtonGroup':new()),
        put({This, genericJTabbedPane}, 'JTabbedPane':new()),
        put({This, genericProfilesJPanel}, 'JPanel':new()),
        put({This, genericProfilesJScrollPane}, 'JScrollPane':new()),
        put({This, genericProfilesJList}, 'JList':new()),
        put({This, newProfileJButton}, 'JButton':new()),
        put({This, deleteProfileJButton}, 'JButton':new()),
        put({This, jPanel1}, 'JPanel':new()),
        put({This, screenCaptureJRadioButton}, 'JRadioButton':new()),
        put({This, jLabel1}, 'JLabel':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, savedCaptureJRadioButton}, 'JRadioButton':new()),
        put({This, captureMotionAnalysisJCheckBox}, 'JCheckBox':new()),
        put({This, captureComparisonJCheckBox}, 'JCheckBox':new()),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, blankGenericProfileActionsJPanel}, 'JPanel':new()),
        (get({get({This, newProfileJDialog}), '$class'})):setMinimumSize(get({This, newProfileJDialog}), 'Dimension':new(250, 150)),
        (get({get({This, newProfileJDialog}), '$class'})):setResizable(get({This, newProfileJDialog}), false),
        (get({get({This, okNewProfileJButton}), '$class'})):setText(get({This, okNewProfileJButton}), "Ok"),
        (get({get({This, okNewProfileJButton}), '$class'})):addActionListener(get({This, okNewProfileJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, newProfileNameJLabel}), '$class'})):setText(get({This, newProfileNameJLabel}), "New Profile Name"),
        NewProfileJDialogLayout = 'GroupLayout':new((get({get({This, newProfileJDialog}), '$class'})):getContentPane(get({This, newProfileJDialog}))),
        (fun(Target_N67738) -> (get({Target_N67738, '$class'})):setLayout(Target_N67738, NewProfileJDialogLayout) end)((get({get({This, newProfileJDialog}), '$class'})):getContentPane(get({This, newProfileJDialog}))),
        (get({NewProfileJDialogLayout, '$class'})):setHorizontalGroup(NewProfileJDialogLayout, (fun(Target_N67797) -> (get({Target_N67797, '$class'})):addGroup(Target_N67797, (fun(Target_N67865) -> (get({Target_N67865, '$class'})):addContainerGap(Target_N67865, 35, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N67872) -> (get({Target_N67872, '$class'})):addGroup(Target_N67872, (fun(Target_N67897) -> (get({Target_N67897, '$class'})):addGroup(Target_N67897, (fun(Target_N68171) -> (get({Target_N68171, '$class'})):addComponent(Target_N68171, get({This, okNewProfileJButton})) end)((fun(Target_N68178) -> (get({Target_N68178, '$class'})):addGap(Target_N68178, 100, 100, 100) end)((get({NewProfileJDialogLayout, '$class'})):createSequentialGroup(NewProfileJDialogLayout)))) end)((fun(Target_N67904) -> (get({Target_N67904, '$class'})):addGroup(Target_N67904, (fun(Target_N68041) -> (get({Target_N68041, '$class'})):addComponent(Target_N68041, get({This, newProfileNameJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 180, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N68048) -> (get({Target_N68048, '$class'})):addGap(Target_N68048, 30, 30, 30) end)((get({NewProfileJDialogLayout, '$class'})):createSequentialGroup(NewProfileJDialogLayout)))) end)((fun(Target_N67911) -> (get({Target_N67911, '$class'})):addGroup(Target_N67911, (fun(Target_N67979) -> (get({Target_N67979, '$class'})):addComponent(Target_N67979, get({This, newProfileNameJLabel})) end)((fun(Target_N67986) -> (get({Target_N67986, '$class'})):addGap(Target_N67986, 80, 80, 80) end)((get({NewProfileJDialogLayout, '$class'})):createSequentialGroup(NewProfileJDialogLayout)))) end)((get({NewProfileJDialogLayout, '$class'})):createParallelGroup(NewProfileJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))) end)((get({NewProfileJDialogLayout, '$class'})):createSequentialGroup(NewProfileJDialogLayout)))) end)((get({NewProfileJDialogLayout, '$class'})):createParallelGroup(NewProfileJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({NewProfileJDialogLayout, '$class'})):setVerticalGroup(NewProfileJDialogLayout, (fun(Target_N68282) -> (get({Target_N68282, '$class'})):addGroup(Target_N68282, (fun(Target_N68350) -> (get({Target_N68350, '$class'})):addComponent(Target_N68350, get({This, okNewProfileJButton})) end)((fun(Target_N68357) -> (get({Target_N68357, '$class'})):addGap(Target_N68357, 20, 20, 20) end)((fun(Target_N68364) -> (get({Target_N68364, '$class'})):addComponent(Target_N68364, get({This, newProfileNameJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N68371) -> (get({Target_N68371, '$class'})):addGap(Target_N68371, 16, 16, 16) end)((fun(Target_N68378) -> (get({Target_N68378, '$class'})):addComponent(Target_N68378, get({This, newProfileNameJLabel})) end)((fun(Target_N68385) -> (get({Target_N68385, '$class'})):addGap(Target_N68385, 10, 10, 10) end)((get({NewProfileJDialogLayout, '$class'})):createSequentialGroup(NewProfileJDialogLayout)))))))) end)((get({NewProfileJDialogLayout, '$class'})):createParallelGroup(NewProfileJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setLayout(This, 'GridLayout':new(1, 0)),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(400, 300)),
        (get({This, '$class'})):setPreferredSize(This, 'Dimension':new(700, 700)),
        (get({get({This, genericJTabbedPane}), '$class'})):setToolTipText(get({This, genericJTabbedPane}), get({get({This, stringUtil}), 'EMPTY_STRING'})),
        (get({get({This, genericJTabbedPane}), '$class'})):setMinimumSize(get({This, genericJTabbedPane}), 'Dimension':new(800, 600)),
        (get({get({This, genericProfilesJPanel}), '$class'})):setMinimumSize(get({This, genericProfilesJPanel}), 'Dimension':new(400, 300)),
        (get({get({This, genericProfilesJPanel}), '$class'})):setPreferredSize(get({This, genericProfilesJPanel}), 'Dimension':new(0, 0)),
        (get({get({This, genericProfilesJList}), '$class'})):addListSelectionListener(get({This, genericProfilesJList}), 'ListSelectionListener':new() % Java anonymous class body: implement it as a module
%             ok % valueChanged
),
        (get({get({This, genericProfilesJScrollPane}), '$class'})):setViewportView(get({This, genericProfilesJScrollPane}), get({This, genericProfilesJList})),
        (get({get({This, newProfileJButton}), '$class'})):setText(get({This, newProfileJButton}), "New"),
        (get({get({This, newProfileJButton}), '$class'})):setToolTipText(get({This, newProfileJButton}), "Creates a new profile"),
        (get({get({This, newProfileJButton}), '$class'})):addActionListener(get({This, newProfileJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, deleteProfileJButton}), '$class'})):setText(get({This, deleteProfileJButton}), "Delete"),
        (get({get({This, deleteProfileJButton}), '$class'})):setToolTipText(get({This, deleteProfileJButton}), "Deletes the selected profile"),
        (get({get({This, deleteProfileJButton}), '$class'})):addActionListener(get({This, deleteProfileJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jPanel1}), '$class'})):setPreferredSize(get({This, jPanel1}), 'Dimension':new(1000, 100)),
        (get({get({This, screenCaptureJRadioButton}), '$class'})):setText(get({This, screenCaptureJRadioButton}), "Screen Captures"),
        (get({get({This, screenCaptureJRadioButton}), '$class'})):setToolTipText(get({This, screenCaptureJRadioButton}), "Records the screen into memory for logical processing"),
        (get({get({This, screenCaptureJRadioButton}), '$class'})):setBorder(get({This, screenCaptureJRadioButton}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, screenCaptureJRadioButton}), '$class'})):setMargin(get({This, screenCaptureJRadioButton}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, screenCaptureJRadioButton}), '$class'})):addActionListener(get({This, screenCaptureJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Profile Options"),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Process From:"),
        (get({get({This, savedCaptureJRadioButton}), '$class'})):setText(get({This, savedCaptureJRadioButton}), "Saved Images"),
        (get({get({This, savedCaptureJRadioButton}), '$class'})):setToolTipText(get({This, savedCaptureJRadioButton}), "Loads images from files for logical processing.  Usually for debugging your profile actions"),
        (get({get({This, savedCaptureJRadioButton}), '$class'})):setBorder(get({This, savedCaptureJRadioButton}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, savedCaptureJRadioButton}), '$class'})):setMargin(get({This, savedCaptureJRadioButton}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, savedCaptureJRadioButton}), '$class'})):addActionListener(get({This, savedCaptureJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):setText(get({This, captureMotionAnalysisJCheckBox}), "Motion Analysis"),
        (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):setToolTipText(get({This, captureMotionAnalysisJCheckBox}), "Uses image comparison and contraints to locate moving objects"),
        (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):setBorder(get({This, captureMotionAnalysisJCheckBox}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):setMargin(get({This, captureMotionAnalysisJCheckBox}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):addActionListener(get({This, captureMotionAnalysisJCheckBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, captureComparisonJCheckBox}), '$class'})):setText(get({This, captureComparisonJCheckBox}), "Comparison"),
        (get({get({This, captureComparisonJCheckBox}), '$class'})):setToolTipText(get({This, captureComparisonJCheckBox}), "Compares the last two input images for multi image logic"),
        (get({get({This, captureComparisonJCheckBox}), '$class'})):setBorder(get({This, captureComparisonJCheckBox}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, captureComparisonJCheckBox}), '$class'})):setMargin(get({This, captureComparisonJCheckBox}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, captureComparisonJCheckBox}), '$class'})):addActionListener(get({This, captureComparisonJCheckBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Image Processing:"),
        (get({get({This, jLabel3}), '$class'})):setToolTipText(get({This, jLabel3}), "Turns on/off various extended image processing"),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N71415) -> (get({Target_N71415, '$class'})):addGroup(Target_N71415, (fun(Target_N71483) -> (get({Target_N71483, '$class'})):addContainerGap(Target_N71483, 22, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71490) -> (get({Target_N71490, '$class'})):addGroup(Target_N71490, (fun(Target_N71515) -> (get({Target_N71515, '$class'})):addComponent(Target_N71515, get({This, jLabel3})) end)((fun(Target_N71522) -> (get({Target_N71522, '$class'})):addComponent(Target_N71522, get({This, captureComparisonJCheckBox})) end)((fun(Target_N71529) -> (get({Target_N71529, '$class'})):addComponent(Target_N71529, get({This, captureMotionAnalysisJCheckBox})) end)((fun(Target_N71536) -> (get({Target_N71536, '$class'})):addComponent(Target_N71536, get({This, savedCaptureJRadioButton})) end)((fun(Target_N71543) -> (get({Target_N71543, '$class'})):addComponent(Target_N71543, get({This, jLabel2})) end)((fun(Target_N71550) -> (get({Target_N71550, '$class'})):addComponent(Target_N71550, get({This, jLabel1})) end)((fun(Target_N71557) -> (get({Target_N71557, '$class'})):addComponent(Target_N71557, get({This, screenCaptureJRadioButton})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))))))) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout)))) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N71758) -> (get({Target_N71758, '$class'})):addGroup(Target_N71758, (fun(Target_N71826) -> (get({Target_N71826, '$class'})):addContainerGap(Target_N71826, 106, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71833) -> (get({Target_N71833, '$class'})):addComponent(Target_N71833, get({This, captureMotionAnalysisJCheckBox})) end)((fun(Target_N71840) -> (get({Target_N71840, '$class'})):addPreferredGap(Target_N71840, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71847) -> (get({Target_N71847, '$class'})):addComponent(Target_N71847, get({This, captureComparisonJCheckBox})) end)((fun(Target_N71854) -> (get({Target_N71854, '$class'})):addGap(Target_N71854, 7, 7, 7) end)((fun(Target_N71861) -> (get({Target_N71861, '$class'})):addComponent(Target_N71861, get({This, jLabel3})) end)((fun(Target_N71868) -> (get({Target_N71868, '$class'})):addPreferredGap(Target_N71868, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71875) -> (get({Target_N71875, '$class'})):addComponent(Target_N71875, get({This, savedCaptureJRadioButton})) end)((fun(Target_N71882) -> (get({Target_N71882, '$class'})):addPreferredGap(Target_N71882, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71889) -> (get({Target_N71889, '$class'})):addComponent(Target_N71889, get({This, screenCaptureJRadioButton})) end)((fun(Target_N71896) -> (get({Target_N71896, '$class'})):addGap(Target_N71896, 7, 7, 7) end)((fun(Target_N71903) -> (get({Target_N71903, '$class'})):addComponent(Target_N71903, get({This, jLabel2})) end)((fun(Target_N71910) -> (get({Target_N71910, '$class'})):addPreferredGap(Target_N71910, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71917) -> (get({Target_N71917, '$class'})):addComponent(Target_N71917, get({This, jLabel1})) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout)))))))))))))))) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        GenericProfilesJPanelLayout = 'GroupLayout':new(get({This, genericProfilesJPanel})),
        (get({get({This, genericProfilesJPanel}), '$class'})):setLayout(get({This, genericProfilesJPanel}), GenericProfilesJPanelLayout),
        (get({GenericProfilesJPanelLayout, '$class'})):setHorizontalGroup(GenericProfilesJPanelLayout, (fun(Target_N72400) -> (get({Target_N72400, '$class'})):addGroup(Target_N72400, (fun(Target_N72468) -> (get({Target_N72468, '$class'})):addContainerGap(Target_N72468) end)((fun(Target_N72475) -> (get({Target_N72475, '$class'})):addGroup(Target_N72475, (fun(Target_N72500) -> (get({Target_N72500, '$class'})):addGroup(Target_N72500, (fun(Target_N72684) -> (get({Target_N72684, '$class'})):addComponent(Target_N72684, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 119, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72691) -> (get({Target_N72691, '$class'})):addPreferredGap(Target_N72691, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72698) -> (get({Target_N72698, '$class'})):addComponent(Target_N72698, get({This, genericProfilesJScrollPane}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({GenericProfilesJPanelLayout, '$class'})):createSequentialGroup(GenericProfilesJPanelLayout))))) end)((fun(Target_N72507) -> (get({Target_N72507, '$class'})):addGroup(Target_N72507, (fun(Target_N72575) -> (get({Target_N72575, '$class'})):addComponent(Target_N72575, get({This, deleteProfileJButton})) end)((fun(Target_N72582) -> (get({Target_N72582, '$class'})):addPreferredGap(Target_N72582, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72589) -> (get({Target_N72589, '$class'})):addComponent(Target_N72589, get({This, newProfileJButton})) end)((get({GenericProfilesJPanelLayout, '$class'})):createSequentialGroup(GenericProfilesJPanelLayout))))) end)((get({GenericProfilesJPanelLayout, '$class'})):createParallelGroup(GenericProfilesJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({GenericProfilesJPanelLayout, '$class'})):createSequentialGroup(GenericProfilesJPanelLayout)))) end)((get({GenericProfilesJPanelLayout, '$class'})):createParallelGroup(GenericProfilesJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({GenericProfilesJPanelLayout, '$class'})):setVerticalGroup(GenericProfilesJPanelLayout, (fun(Target_N72967) -> (get({Target_N72967, '$class'})):addGroup(Target_N72967, (fun(Target_N73035) -> (get({Target_N73035, '$class'})):addGroup(Target_N73035, (fun(Target_N73219) -> (get({Target_N73219, '$class'})):addComponent(Target_N73219, get({This, genericProfilesJScrollPane}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 246, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N73226) -> (get({Target_N73226, '$class'})):addComponent(Target_N73226, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 246, get({'Short', 'MAX_VALUE'})) end)((get({GenericProfilesJPanelLayout, '$class'})):createParallelGroup(GenericProfilesJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N73042) -> (get({Target_N73042, '$class'})):addPreferredGap(Target_N73042, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73049) -> (get({Target_N73049, '$class'})):addGroup(Target_N73049, (fun(Target_N73074) -> (get({Target_N73074, '$class'})):addComponent(Target_N73074, get({This, deleteProfileJButton})) end)((fun(Target_N73081) -> (get({Target_N73081, '$class'})):addComponent(Target_N73081, get({This, newProfileJButton})) end)((get({GenericProfilesJPanelLayout, '$class'})):createParallelGroup(GenericProfilesJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({GenericProfilesJPanelLayout, '$class'})):createSequentialGroup(GenericProfilesJPanelLayout))))) end)((get({GenericProfilesJPanelLayout, '$class'})):createParallelGroup(GenericProfilesJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, genericJTabbedPane}), '$class'})):addTab(get({This, genericJTabbedPane}), "Profiles", get({This, genericProfilesJPanel})),
        BlankGenericProfileActionsJPanelLayout = 'GroupLayout':new(get({This, blankGenericProfileActionsJPanel})),
        (get({get({This, blankGenericProfileActionsJPanel}), '$class'})):setLayout(get({This, blankGenericProfileActionsJPanel}), BlankGenericProfileActionsJPanelLayout),
        (get({BlankGenericProfileActionsJPanelLayout, '$class'})):setHorizontalGroup(BlankGenericProfileActionsJPanelLayout, (fun(Target_N73604) -> (get({Target_N73604, '$class'})):addGap(Target_N73604, 0, 395, get({'Short', 'MAX_VALUE'})) end)((get({BlankGenericProfileActionsJPanelLayout, '$class'})):createParallelGroup(BlankGenericProfileActionsJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({BlankGenericProfileActionsJPanelLayout, '$class'})):setVerticalGroup(BlankGenericProfileActionsJPanelLayout, (fun(Target_N73721) -> (get({Target_N73721, '$class'})):addGap(Target_N73721, 0, 275, get({'Short', 'MAX_VALUE'})) end)((get({BlankGenericProfileActionsJPanelLayout, '$class'})):createParallelGroup(BlankGenericProfileActionsJPanelLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, genericJTabbedPane}), '$class'})):addTab(get({This, genericJTabbedPane}), "Actions", get({This, blankGenericProfileActionsJPanel})),
        (get({This, '$class'})):add(This, get({This, genericJTabbedPane})).

savedCaptureJRadioButtonActionPerformed(This, Evt) ->
        try
            case (get({get({This, savedCaptureJRadioButton}), '$class'})):isSelected(get({This, savedCaptureJRadioButton})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Selected", This, "savedCaptureJRadioButtonActionPerformed"),
                (fun(Target_N73986) -> (get({Target_N73986, '$class'})):add(Target_N73986, get({'GenericProfileDataWorkerType', 'SAVED_CAPTURE'})) end)((get({This, '$class'})):getSelectedGenericProfile(This)),
                (fun(Target_N74028) -> (get({Target_N74028, '$class'})):remove(Target_N74028, get({'GenericProfileDataWorkerType', 'SCREEN_CAPTURE'})) end)((get({This, '$class'})):getSelectedGenericProfile(This)),
                (get({get({This, screenCaptureJRadioButton}), '$class'})):setSelected(get({This, screenCaptureJRadioButton}), false),
                (fun(Target_N74100) -> (get({Target_N74100, '$class'})):save(Target_N74100) end)((get({This, '$class'})):getGenericProfiles(This));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "savedCaptureJRadioButtonActionPerformed", E)
        end.

screenCaptureJRadioButtonActionPerformed(This, Evt) ->
        try
            case (get({get({This, screenCaptureJRadioButton}), '$class'})):isSelected(get({This, screenCaptureJRadioButton})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Selected", This, "screenCaptureJRadioButtonActionPerformed"),
                (fun(Target_N74383) -> (get({Target_N74383, '$class'})):add(Target_N74383, get({'GenericProfileDataWorkerType', 'SCREEN_CAPTURE'})) end)((get({This, '$class'})):getSelectedGenericProfile(This)),
                (fun(Target_N74425) -> (get({Target_N74425, '$class'})):remove(Target_N74425, get({'GenericProfileDataWorkerType', 'SAVED_CAPTURE'})) end)((get({This, '$class'})):getSelectedGenericProfile(This)),
                (get({get({This, savedCaptureJRadioButton}), '$class'})):setSelected(get({This, savedCaptureJRadioButton}), false),
                (fun(Target_N74497) -> (get({Target_N74497, '$class'})):save(Target_N74497) end)((get({This, '$class'})):getGenericProfiles(This));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "screenCaptureJRadioButtonActionPerformed", E)
        end.

captureMotionAnalysisJCheckBoxActionPerformed(This, Evt) ->
        try
            case (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):isSelected(get({This, captureMotionAnalysisJCheckBox})) of
                true ->
                (fun(Target_N74792) -> (get({Target_N74792, '$class'})):add(Target_N74792, get({'GenericProfileDataWorkerType', 'MOTION'})) end)((get({This, '$class'})):getSelectedGenericProfile(This));
                false ->
                (fun(Target_N74743) -> (get({Target_N74743, '$class'})):remove(Target_N74743, get({'GenericProfileDataWorkerType', 'MOTION'})) end)((get({This, '$class'})):getSelectedGenericProfile(This))
            end,
            (fun(Target_N74837) -> (get({Target_N74837, '$class'})):save(Target_N74837) end)((get({This, '$class'})):getGenericProfiles(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "captureComparisonJCheckBoxActionPerformed", E)
        end.

captureComparisonJCheckBoxActionPerformed(This, Evt) ->
        try
            case (get({get({This, captureComparisonJCheckBox}), '$class'})):isSelected(get({This, captureComparisonJCheckBox})) of
                true ->
                (fun(Target_N75129) -> (get({Target_N75129, '$class'})):add(Target_N75129, get({'GenericProfileDataWorkerType', 'COMPARISON'})) end)((get({This, '$class'})):getSelectedGenericProfile(This));
                false ->
                (fun(Target_N75080) -> (get({Target_N75080, '$class'})):remove(Target_N75080, get({'GenericProfileDataWorkerType', 'COMPARISON'})) end)((get({This, '$class'})):getSelectedGenericProfile(This))
            end,
            (fun(Target_N75174) -> (get({Target_N75174, '$class'})):save(Target_N75174) end)((get({This, '$class'})):getGenericProfiles(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "captureComparisonJCheckBoxActionPerformed", E)
        end.

% throws Exception
updateProfileUI(This, ProfileNameString) when (is_list(ProfileNameString) orelse ProfileNameString =:= undefined) ->
        (fun(Target_N75382) -> (get({Target_N75382, '$class'})):removeAll(Target_N75382) end)((get({This, '$class'})):getBlankGenericProfileActionsJPanel(This)),
        case (ProfileNameString =/= undefined) of
            true ->
            GenericProfileActionsJPanel = 'GenericProfileActionsJPanel':new(),
            (get({This, '$class'})):setSelectedGenericProfile(This, (fun(Target_N75524) -> (get({Target_N75524, '$class'})):get(Target_N75524, ProfileNameString) end)((get({This, '$class'})):getGenericProfiles(This))),
            (fun(Target_N75564) -> (get({Target_N75564, '$class'})):setGenericProfileActions(Target_N75564, 'GenericProfileActions':new(GenericProfileActionsJPanel, ProfileNameString)) end)((get({This, '$class'})):getSelectedGenericProfile(This)),
            (get({GenericProfileActionsJPanel, '$class'})):setGenericProfileActions(GenericProfileActionsJPanel, (fun(Target_N75638) -> (get({Target_N75638, '$class'})):getGenericProfileActions(Target_N75638) end)((get({This, '$class'})):getSelectedGenericProfile(This))),
            (get({GenericProfileActionsJPanel, '$class'})):selectFirstElement(GenericProfileActionsJPanel),
            Layout = (fun(Target_N75698) -> (get({Target_N75698, '$class'})):getLayout(Target_N75698) end)((get({This, '$class'})):getBlankGenericProfileActionsJPanel(This)),
            (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N75794) -> (get({Target_N75794, '$class'})):addComponent(Target_N75794, GenericProfileActionsJPanel, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N75801) -> (get({Target_N75801, '$class'})):addGap(Target_N75801, 0, 395, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
            (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N76026) -> (get({Target_N76026, '$class'})):addComponent(Target_N76026, GenericProfileActionsJPanel, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N76033) -> (get({Target_N76033, '$class'})):addGap(Target_N76033, 0, 256, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
            (get({This, '$class'})):updateProfileOptions(This),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Setting Configuration Profile JPanel", This, "updateProfileUI");
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Null Configuration Profile", This, "updateProfileUI")
        end.

% throws Exception
selectFirstElement(This) ->
        (get({get({This, genericProfilesJList}), '$class'})):setModel(get({This, genericProfilesJList}), (fun(Target_N76380) -> (get({Target_N76380, '$class'})):getListModel(Target_N76380) end)((fun(Target_N76387) -> (get({Target_N76387, '$class'})):getDefaultListModelHelper(Target_N76387) end)((get({This, '$class'})):getGenericProfiles(This)))),
        case ((fun(Target_N76417) -> (get({Target_N76417, '$class'})):getSize(Target_N76417) end)((get({get({This, genericProfilesJList}), '$class'})):getModel(get({This, genericProfilesJList}))) > 0) of
            true ->
            (get({get({This, genericProfilesJList}), '$class'})):setSelectedValue(get({This, genericProfilesJList}), (fun(Target_N76477) -> (get({Target_N76477, '$class'})):getElementAt(Target_N76477, 0) end)((get({get({This, genericProfilesJList}), '$class'})):getModel(get({This, genericProfilesJList}))), true),
            (get({This, '$class'})):updateProfileUI(This, (fun(Target_N76536) -> (get({Target_N76536, '$class'})):getElementAt(Target_N76536, 0) end)((get({get({This, genericProfilesJList}), '$class'})):getModel(get({This, genericProfilesJList}))));
            false -> ok
        end.

% throws Exception
updateProfileOptions(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "updateProfileOptions"),
        GenericProfile = (get({This, '$class'})):getSelectedGenericProfile(This),
        Vector = (get({GenericProfile, '$class'})):getGenericProfileDataWorkerTypeVector(GenericProfile),
        (get({get({This, screenCaptureJRadioButton}), '$class'})):setSelected(get({This, screenCaptureJRadioButton}), false),
        (get({get({This, savedCaptureJRadioButton}), '$class'})):setSelected(get({This, savedCaptureJRadioButton}), false),
        (get({get({This, captureComparisonJCheckBox}), '$class'})):setSelected(get({This, captureComparisonJCheckBox}), false),
        (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):setSelected(get({This, captureMotionAnalysisJCheckBox}), false),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            GenericProfileDataWorkerType = (get({Vector, '$class'})):get(Vector, Index),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([(get({GenericProfile, '$class'})):getName(GenericProfile), " has GenericProfileDataWorkerType: "]), (get({GenericProfileDataWorkerType, '$class'})):toString(GenericProfileDataWorkerType)]), This, "updateProfileOptions"),
            case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'SCREEN_CAPTURE'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Screen Capture Selected", This, "updateProfileOptions"),
                (get({get({This, screenCaptureJRadioButton}), '$class'})):setSelected(get({This, screenCaptureJRadioButton}), true);
                false ->
                case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'SAVED_CAPTURE'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Saved Capture Selected", This, "updateProfileOptions"),
                (get({get({This, savedCaptureJRadioButton}), '$class'})):setSelected(get({This, savedCaptureJRadioButton}), true);
                false ->
                case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'COMPARISON'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Checking Comparison Box", This, "updateProfileOptions"),
                (get({get({This, captureComparisonJCheckBox}), '$class'})):setSelected(get({This, captureComparisonJCheckBox}), true);
                false ->
                case (GenericProfileDataWorkerType =:= get({'GenericProfileDataWorkerType', 'MOTION'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Checking Motion Box", This, "updateProfileOptions"),
                (get({get({This, captureMotionAnalysisJCheckBox}), '$class'})):setSelected(get({This, captureMotionAnalysisJCheckBox}), true);
                false -> ok
            end
            end
            end
            end
        end, lists:seq(0, Size - 1)),
        case ((not (get({get({This, screenCaptureJRadioButton}), '$class'})):isSelected(get({This, screenCaptureJRadioButton}))) andalso (not (get({get({This, savedCaptureJRadioButton}), '$class'})):isSelected(get({This, savedCaptureJRadioButton})))) of
            true ->
            (get({get({This, screenCaptureJRadioButton}), '$class'})):setSelected(get({This, screenCaptureJRadioButton}), true),
            (fun(Target_N77661) -> (get({Target_N77661, '$class'})):add(Target_N77661, get({'GenericProfileDataWorkerType', 'SCREEN_CAPTURE'})) end)((get({This, '$class'})):getSelectedGenericProfile(This));
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, "updateProfileOptions").

getBlankGenericProfileActionsJPanel(This) ->
        get({This, blankGenericProfileActionsJPanel}).

setBlankGenericProfileActionsJPanel(This, BlankGenericProfileActionsJPanel) ->
        put({This, blankGenericProfileActionsJPanel}, BlankGenericProfileActionsJPanel).

getGenericProfiles(This) ->
        get({This, genericProfiles}).

setGenericProfiles(This, GenericProfiles) ->
        put({This, genericProfiles}, GenericProfiles).

getSelectedGenericProfile(This) ->
        get({This, selectedGenericProfile}).

setSelectedGenericProfile(This, SelectedGenericProfile) ->
        put({This, selectedGenericProfile}, SelectedGenericProfile).

genericProfilesJListValueChanged(This, Evt) ->
        try
            ProfileNameString = (get({get({This, genericProfilesJList}), '$class'})):getSelectedValue(get({This, genericProfilesJList})),
            (get({This, '$class'})):updateProfileUI(This, ProfileNameString)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "genericProfilesJListValueChanged", E)
        end.

deleteProfileJButtonActionPerformed(This, Evt) ->
        try
            AnyType = (get({get({This, genericProfilesJList}), '$class'})):getSelectedValues(get({This, genericProfilesJList})),
            lists:foreach(fun(Index) ->
                NextSelectedValueString = array:get(Index, AnyType),
                (fun(Target_N78579) -> (get({Target_N78579, '$class'})):remove(Target_N78579, NextSelectedValueString) end)((get({This, '$class'})):getGenericProfiles(This))
            end, lists:seq(0, array:size(AnyType) - 1)),
            (get({This, '$class'})):selectFirstElement(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "deleteProfileJButtonActionPerformed", E)
        end.

okNewProfileJButtonActionPerformed(This, Evt) ->
        try
            NewProfileName = (get({get({This, newProfileNameJTextField}), '$class'})):getText(get({This, newProfileNameJTextField})),
            (fun(Target_N78941) -> (get({Target_N78941, '$class'})):add(Target_N78941, NewProfileName) end)((get({This, '$class'})):getGenericProfiles(This)),
            (get({get({This, genericProfilesJList}), '$class'})):setModel(get({This, genericProfilesJList}), (fun(Target_N78995) -> (get({Target_N78995, '$class'})):getListModel(Target_N78995) end)((fun(Target_N79002) -> (get({Target_N79002, '$class'})):getDefaultListModelHelper(Target_N79002) end)((get({This, '$class'})):getGenericProfiles(This)))),
            (get({get({This, genericProfilesJList}), '$class'})):setSelectedValue(get({This, genericProfilesJList}), NewProfileName, true),
            (get({get({This, newProfileJDialog}), '$class'})):setVisible(get({This, newProfileJDialog}), false),
            (get({This, '$class'})):updateProfileUI(This, NewProfileName)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "okNewProfileJButtonActionPerformed", E)
        end.

newProfileJButtonActionPerformed(This, Evt) ->
        (get({get({This, newProfileJDialog}), '$class'})):setVisible(get({This, newProfileJDialog}), true).

