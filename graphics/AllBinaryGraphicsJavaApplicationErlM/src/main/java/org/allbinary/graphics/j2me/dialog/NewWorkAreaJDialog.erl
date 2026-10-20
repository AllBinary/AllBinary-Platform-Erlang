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
% import java.awt
% import java.awt.event.ActionEvent
% import java.awt.event.ActionListener
% import javax.swing
% import org.allbinary.graphics.j2me.GraphicsException
% import org.allbinary.graphics.j2me.MyFrame
% import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel
% import org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface

-module('NewWorkAreaJDialog').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JDialog', Function, Arguments).

init_fields(This) ->
    put({This, parent}, undefined),
    put({This, dimension}, undefined),
    put({This, xSizeJTextField}, undefined),
    put({This, ySizeJTextField}, undefined),
    put({This, nameJTextField}, undefined),
    ok.


new(Parent, Modal, Dimension, NewName) when is_boolean(Modal), (is_list(NewName) orelse NewName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Parent, Modal, Dimension, NewName),
    This.

'$init'(This, Parent, Modal, Dimension, NewName) when is_boolean(Modal), (is_list(NewName) orelse NewName =:= undefined) ->
        'JDialog':'$init'(This, Parent, Modal),
        init_fields(This),
        try
            (get({This, '$class'})):initComponents(This),
            put({This, parent}, Parent),
            put({This, xSizeJTextField}, 'JTextField':new("12")),
            put({This, ySizeJTextField}, 'JTextField':new("12")),
            put({This, nameJTextField}, 'JTextField':new(NewName)),
            put({This, dimension}, Dimension),
            SubmitButton = 'JButton':new("Ok"),
            (get({SubmitButton, '$class'})):addActionListener(SubmitButton, 'ActionListener':new() % Java anonymous class body: implement it as a module
%                 ok % actionPerformed
),
            (get({This, '$class'})):setSize(This, 150, 100),
            (fun(Target_N66443) -> (get({Target_N66443, '$class'})):setLayout(Target_N66443, 'GridLayout':new(5, 2)) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66492) -> (get({Target_N66492, '$class'})):add(Target_N66492, 'JLabel':new("Please enter")) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66537) -> (get({Target_N66537, '$class'})):add(Target_N66537, 'JLabel':new(" the size.")) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66582) -> (get({Target_N66582, '$class'})):add(Target_N66582, 'JLabel':new("Name:")) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66627) -> (get({Target_N66627, '$class'})):add(Target_N66627, get({This, nameJTextField})) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66664) -> (get({Target_N66664, '$class'})):add(Target_N66664, 'JLabel':new("X: ")) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66709) -> (get({Target_N66709, '$class'})):add(Target_N66709, get({This, xSizeJTextField})) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66746) -> (get({Target_N66746, '$class'})):add(Target_N66746, 'JLabel':new("Y: ")) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66791) -> (get({Target_N66791, '$class'})):add(Target_N66791, get({This, ySizeJTextField})) end)((get({This, '$class'})):getContentPane(This)),
            (fun(Target_N66828) -> (get({Target_N66828, '$class'})):add(Target_N66828, SubmitButton) end)((get({This, '$class'})):getContentPane(This)),
            (get({This, '$class'})):show(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

% throws Exception
disposeNewDialog(This) ->
        try
            CanvasWidth = (get({get({This, xSizeJTextField}), '$class'})):getText(get({This, xSizeJTextField})),
            CanvasHeight = (get({get({This, ySizeJTextField}), '$class'})):getText(get({This, ySizeJTextField})),
            NewName = (get({get({This, nameJTextField}), '$class'})):getText(get({This, nameJTextField})),
            case (NewName =:= undefined) of
                true ->
                erlang:error({'GraphicsException', "No Name", This, "disposeNewDialog"});
                false -> ok
            end,
            WorkAreaJPanel = 'WorkAreaJPanel':new(NewName, get({This, dimension}), (get({CanvasWidth, '$class'})):intValue(CanvasWidth), (get({CanvasHeight, '$class'})):intValue(CanvasHeight)),
            (get({WorkAreaJPanel, '$class'})):setLayout(WorkAreaJPanel, 'GridLayout':new(1, 1)),
            (get({get({This, parent}), '$class'})):add(get({This, parent}), WorkAreaJPanel),
            (get({This, '$class'})):dispose(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

initComponents(This) ->
        (get({This, '$class'})):addWindowListener(This, 'WindowAdapter':new() % Java anonymous class body: implement it as a module
%             ok % windowClosing
),
        (get({This, '$class'})):pack(This).

closeDialog(This, Evt) ->
        (get({This, '$class'})):setVisible(This, false),
        (get({This, '$class'})):dispose(This).

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        try
            (fun(Target_N67840) -> (get({Target_N67840, '$class'})):show(Target_N67840) end)('NewWorkAreaJDialog':new('MyFrame':new(), true, 'Dimension':new(100, 100), "testing"))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            ok
        end.

