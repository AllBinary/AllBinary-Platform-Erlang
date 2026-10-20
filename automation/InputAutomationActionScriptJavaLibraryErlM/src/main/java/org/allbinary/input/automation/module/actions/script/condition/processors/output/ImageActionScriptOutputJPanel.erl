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
% package org.allbinary.input.automation.module.actions.script.condition.processors.output
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.swing
% import org.allbinary.input.media.image.InputImageType
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ImageActionScriptOutputJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, capturedImageActionScriptOutputInterface}, undefined),
    put({This, capturedImageActionJButton}, undefined),
    put({This, capturedImageActionJDialog}, undefined),
    put({This, displayJCheckBox}, undefined),
    put({This, itemTypesJList}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jScrollPane1}, undefined),
    put({This, okJButton}, undefined),
    put({This, saveJCheckBox}, undefined),
    put({This, titleJLabel}, undefined),
    ok.


new(CapturedImageActionScriptOutputInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CapturedImageActionScriptOutputInterface),
    This.

'$init'(This, CapturedImageActionScriptOutputInterface) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, capturedImageActionScriptOutputInterface}, CapturedImageActionScriptOutputInterface),
        (get({This, '$class'})):set(This).

set(This) ->
        (get({This, '$class'})):setImageTypeJlistModel(This),
        ImageTypes = (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):getImageTypes(get({This, capturedImageActionScriptOutputInterface})),
        Vector = (get({ImageTypes, '$class'})):getVector(ImageTypes),
        SelectedArray = array:new((get({Vector, '$class'})):size(Vector), {default, 0}),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            ImageType = (get({Vector, '$class'})):get(Vector, Index),
            array:set(allbinary_java:first(Index, Index = Index + 1), (get({ImageType, '$class'})):getIndex(ImageType), SelectedArray)
        end, lists:seq(0, Size - 1)),
        (get({get({This, itemTypesJList}), '$class'})):setSelectedIndices(get({This, itemTypesJList}), SelectedArray),
        case (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):isSaved(get({This, capturedImageActionScriptOutputInterface})) of
            true ->
            (get({get({This, saveJCheckBox}), '$class'})):setSelected(get({This, saveJCheckBox}), true);
            false -> ok
        end,
        case (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):isSaved(get({This, capturedImageActionScriptOutputInterface})) of
            true ->
            (get({get({This, displayJCheckBox}), '$class'})):setSelected(get({This, displayJCheckBox}), true);
            false -> ok
        end,
        (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):log(get({This, capturedImageActionScriptOutputInterface})).

update(This) ->
        AnyType = (get({get({This, itemTypesJList}), '$class'})):getSelectedValues(get({This, itemTypesJList})),
        ImageTypes = 'ImageTypes':valueOf(AnyType),
        (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):setImageTypes(get({This, capturedImageActionScriptOutputInterface}), ImageTypes),
        case (get({get({This, saveJCheckBox}), '$class'})):isSelected(get({This, saveJCheckBox})) of
            true ->
            (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):setSaved(get({This, capturedImageActionScriptOutputInterface}), true);
            false ->
            (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):setSaved(get({This, capturedImageActionScriptOutputInterface}), false)
        end,
        case (get({get({This, displayJCheckBox}), '$class'})):isSelected(get({This, displayJCheckBox})) of
            true ->
            (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):setDisplay(get({This, capturedImageActionScriptOutputInterface}), true);
            false ->
            (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):setDisplay(get({This, capturedImageActionScriptOutputInterface}), false)
        end,
        (get({get({This, capturedImageActionScriptOutputInterface}), '$class'})):log(get({This, capturedImageActionScriptOutputInterface})).

setImageTypeJlistModel(This) ->
        DefaultListModel = 'DefaultListModel':new(),
        Vector = 'InputImageType':getAllAsVector(),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            ImageType = (get({Vector, '$class'})):get(Vector, Index),
            (get({DefaultListModel, '$class'})):addElement(DefaultListModel, (get({ImageType, '$class'})):getName(ImageType))
        end, lists:seq(0, Size - 1)),
        (get({get({This, itemTypesJList}), '$class'})):setModel(get({This, itemTypesJList}), DefaultListModel).

getCapturedImageActionJDialog(This) ->
        get({This, capturedImageActionJDialog}).

setCapturedImageActionJDialog(This, CapturedImageActionJDialog) ->
        put({This, capturedImageActionJDialog}, CapturedImageActionJDialog).

initComponents(This) ->
        put({This, capturedImageActionJDialog}, 'JDialog':new()),
        put({This, titleJLabel}, 'JLabel':new()),
        put({This, okJButton}, 'JButton':new()),
        put({This, saveJCheckBox}, 'JCheckBox':new()),
        put({This, displayJCheckBox}, 'JCheckBox':new()),
        put({This, jScrollPane1}, 'JScrollPane':new()),
        put({This, itemTypesJList}, 'JList':new()),
        put({This, capturedImageActionJButton}, 'JButton':new()),
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, capturedImageActionJDialog}), '$class'})):setMinimumSize(get({This, capturedImageActionJDialog}), 'Dimension':new(250, 250)),
        (get({get({This, titleJLabel}), '$class'})):setText(get({This, titleJLabel}), "Image Output Options"),
        (get({get({This, okJButton}), '$class'})):setText(get({This, okJButton}), "OK"),
        (get({get({This, okJButton}), '$class'})):addActionListener(get({This, okJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, saveJCheckBox}), '$class'})):setText(get({This, saveJCheckBox}), "Save To File"),
        (get({get({This, saveJCheckBox}), '$class'})):setBorder(get({This, saveJCheckBox}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, saveJCheckBox}), '$class'})):setMargin(get({This, saveJCheckBox}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, displayJCheckBox}), '$class'})):setText(get({This, displayJCheckBox}), "Display"),
        (get({get({This, displayJCheckBox}), '$class'})):setBorder(get({This, displayJCheckBox}), (get({get({get({'javax', swing}), 'BorderFactory'}), '$class'})):createEmptyBorder(get({get({'javax', swing}), 'BorderFactory'}), 0, 0, 0, 0)),
        (get({get({This, displayJCheckBox}), '$class'})):setMargin(get({This, displayJCheckBox}), 'Insets':new(0, 0, 0, 0)),
        (get({get({This, displayJCheckBox}), '$class'})):addActionListener(get({This, displayJCheckBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, itemTypesJList}), '$class'})):setModel(get({This, itemTypesJList}), 'AbstractListModel':new() % Java anonymous class body: implement it as a module
%             put({This, strings}, array:from_list(["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]))
%             ok % getSize
%             ok % getElementAt
),
        (get({get({This, jScrollPane1}), '$class'})):setViewportView(get({This, jScrollPane1}), get({This, itemTypesJList})),
        CapturedImageActionJDialogLayout = 'GroupLayout':new((get({get({This, capturedImageActionJDialog}), '$class'})):getContentPane(get({This, capturedImageActionJDialog}))),
        (fun(Target_N69214) -> (get({Target_N69214, '$class'})):setLayout(Target_N69214, CapturedImageActionJDialogLayout) end)((get({get({This, capturedImageActionJDialog}), '$class'})):getContentPane(get({This, capturedImageActionJDialog}))),
        (get({CapturedImageActionJDialogLayout, '$class'})):setHorizontalGroup(CapturedImageActionJDialogLayout, (fun(Target_N69273) -> (get({Target_N69273, '$class'})):addGroup(Target_N69273, (fun(Target_N69341) -> (get({Target_N69341, '$class'})):addContainerGap(Target_N69341) end)((fun(Target_N69348) -> (get({Target_N69348, '$class'})):addGroup(Target_N69348, (fun(Target_N69373) -> (get({Target_N69373, '$class'})):addGroup(Target_N69373, (fun(Target_N69832) -> (get({Target_N69832, '$class'})):addComponent(Target_N69832, get({This, jScrollPane1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 216, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69839) -> (get({Target_N69839, '$class'})):addContainerGap(Target_N69839) end)((get({CapturedImageActionJDialogLayout, '$class'})):createSequentialGroup(CapturedImageActionJDialogLayout)))) end)((fun(Target_N69380) -> (get({Target_N69380, '$class'})):addGroup(Target_N69380, (fun(Target_N69517) -> (get({Target_N69517, '$class'})):addGroup(Target_N69517, (fun(Target_N69550) -> (get({Target_N69550, '$class'})):addGroup(Target_N69550, (fun(Target_N69766) -> (get({Target_N69766, '$class'})):addComponent(Target_N69766, get({This, okJButton})) end)((fun(Target_N69773) -> (get({Target_N69773, '$class'})):addGap(Target_N69773, 84, 84, 84) end)((get({CapturedImageActionJDialogLayout, '$class'})):createSequentialGroup(CapturedImageActionJDialogLayout)))) end)((fun(Target_N69557) -> (get({Target_N69557, '$class'})):addGroup(Target_N69557, (fun(Target_N69625) -> (get({Target_N69625, '$class'})):addComponent(Target_N69625, get({This, saveJCheckBox}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'})) end)((fun(Target_N69632) -> (get({Target_N69632, '$class'})):addComponent(Target_N69632, get({This, displayJCheckBox})) end)((get({CapturedImageActionJDialogLayout, '$class'})):createParallelGroup(CapturedImageActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({CapturedImageActionJDialogLayout, '$class'})):createParallelGroup(CapturedImageActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N69524) -> (get({Target_N69524, '$class'})):addContainerGap(Target_N69524) end)((get({CapturedImageActionJDialogLayout, '$class'})):createSequentialGroup(CapturedImageActionJDialogLayout)))) end)((fun(Target_N69387) -> (get({Target_N69387, '$class'})):addGroup(Target_N69387, (fun(Target_N69455) -> (get({Target_N69455, '$class'})):addComponent(Target_N69455, get({This, titleJLabel})) end)((fun(Target_N69462) -> (get({Target_N69462, '$class'})):addGap(Target_N69462, 61, 61, 61) end)((get({CapturedImageActionJDialogLayout, '$class'})):createSequentialGroup(CapturedImageActionJDialogLayout)))) end)((get({CapturedImageActionJDialogLayout, '$class'})):createParallelGroup(CapturedImageActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))) end)((get({CapturedImageActionJDialogLayout, '$class'})):createSequentialGroup(CapturedImageActionJDialogLayout)))) end)((get({CapturedImageActionJDialogLayout, '$class'})):createParallelGroup(CapturedImageActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({CapturedImageActionJDialogLayout, '$class'})):setVerticalGroup(CapturedImageActionJDialogLayout, (fun(Target_N69957) -> (get({Target_N69957, '$class'})):addGroup(Target_N69957, (fun(Target_N70025) -> (get({Target_N70025, '$class'})):addContainerGap(Target_N70025) end)((fun(Target_N70032) -> (get({Target_N70032, '$class'})):addComponent(Target_N70032, get({This, okJButton})) end)((fun(Target_N70039) -> (get({Target_N70039, '$class'})):addGap(Target_N70039, 9, 9, 9) end)((fun(Target_N70046) -> (get({Target_N70046, '$class'})):addComponent(Target_N70046, get({This, displayJCheckBox})) end)((fun(Target_N70053) -> (get({Target_N70053, '$class'})):addPreferredGap(Target_N70053, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70060) -> (get({Target_N70060, '$class'})):addComponent(Target_N70060, get({This, saveJCheckBox})) end)((fun(Target_N70067) -> (get({Target_N70067, '$class'})):addPreferredGap(Target_N70067, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70074) -> (get({Target_N70074, '$class'})):addComponent(Target_N70074, get({This, jScrollPane1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 105, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70081) -> (get({Target_N70081, '$class'})):addGap(Target_N70081, 5, 5, 5) end)((fun(Target_N70088) -> (get({Target_N70088, '$class'})):addComponent(Target_N70088, get({This, titleJLabel})) end)((get({CapturedImageActionJDialogLayout, '$class'})):createSequentialGroup(CapturedImageActionJDialogLayout)))))))))))) end)((get({CapturedImageActionJDialogLayout, '$class'})):createParallelGroup(CapturedImageActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(100, 0)),
        (get({get({This, capturedImageActionJButton}), '$class'})):setText(get({This, capturedImageActionJButton}), "Edit"),
        (get({get({This, capturedImageActionJButton}), '$class'})):addActionListener(get({This, capturedImageActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Capture Image:"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N70743) -> (get({Target_N70743, '$class'})):addGroup(Target_N70743, (fun(Target_N70811) -> (get({Target_N70811, '$class'})):addComponent(Target_N70811, get({This, capturedImageActionJButton})) end)((fun(Target_N70818) -> (get({Target_N70818, '$class'})):addPreferredGap(Target_N70818, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70825) -> (get({Target_N70825, '$class'})):addComponent(Target_N70825, get({This, jLabel1})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N70989) -> (get({Target_N70989, '$class'})):addGroup(Target_N70989, (fun(Target_N71057) -> (get({Target_N71057, '$class'})):addComponent(Target_N71057, get({This, capturedImageActionJButton})) end)((fun(Target_N71064) -> (get({Target_N71064, '$class'})):addComponent(Target_N71064, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

displayJCheckBoxActionPerformed(This, Evt) ->
        ok.

okJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):update(This),
        (fun(Target_N71293) -> (get({Target_N71293, '$class'})):setVisible(Target_N71293, false) end)((get({This, '$class'})):getCapturedImageActionJDialog(This)).

capturedImageActionJButtonActionPerformed(This, Evt) ->
        (fun(Target_N71410) -> (get({Target_N71410, '$class'})):setVisible(Target_N71410, true) end)((get({This, '$class'})):getCapturedImageActionJDialog(This)).

