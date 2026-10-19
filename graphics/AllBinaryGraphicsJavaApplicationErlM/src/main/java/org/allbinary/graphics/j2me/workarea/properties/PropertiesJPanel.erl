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
% package org.allbinary.graphics.j2me.workarea.properties
% import javax.swing

-module('PropertiesJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, rotateJButton}, undefined),
    put({This, copyVerticalJButton}, undefined),
    put({This, leftJButton}, undefined),
    put({This, rotateJPanel}, undefined),
    put({This, angleJTextField}, undefined),
    put({This, workAreaPropertiesJPanel}, undefined),
    put({This, modifierJPanel}, undefined),
    put({This, upJButton}, undefined),
    put({This, jPanel8}, undefined),
    put({This, downJButton}, undefined),
    put({This, jPanel7}, undefined),
    put({This, rightJButton}, undefined),
    put({This, copyHorizontalJButton}, undefined),
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

set(This, Panel) ->
        (get({get({This, workAreaPropertiesJPanel}), '$class'})):add(get({This, workAreaPropertiesJPanel}), Panel),
        (get({This, '$class'})):repaint(This).

initComponents(This) ->
        put({This, workAreaPropertiesJPanel}, 'JPanel':new()),
        put({This, modifierJPanel}, 'JPanel':new()),
        put({This, copyVerticalJButton}, 'JButton':new()),
        put({This, copyHorizontalJButton}, 'JButton':new()),
        put({This, rotateJPanel}, 'JPanel':new()),
        put({This, rotateJButton}, 'JButton':new()),
        put({This, angleJTextField}, 'JTextField':new()),
        put({This, jPanel7}, 'JPanel':new()),
        put({This, upJButton}, 'JButton':new()),
        put({This, downJButton}, 'JButton':new()),
        put({This, jPanel8}, 'JPanel':new()),
        put({This, leftJButton}, 'JButton':new()),
        put({This, rightJButton}, 'JButton':new()),
        (get({This, '$class'})):setLayout(This, 'GridLayout':new(2, 1)),
        (get({get({This, workAreaPropertiesJPanel}), '$class'})):setLayout(get({This, workAreaPropertiesJPanel}), 'GridLayout':new()),
        (get({This, '$class'})):add(This, get({This, workAreaPropertiesJPanel})),
        (get({get({This, modifierJPanel}), '$class'})):setLayout(get({This, modifierJPanel}), 'GridLayout':new(6, 0)),
        (get({get({This, copyVerticalJButton}), '$class'})):setFont(get({This, copyVerticalJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, copyVerticalJButton}), '$class'})):setText(get({This, copyVerticalJButton}), "Copy Vertical"),
        (get({get({This, modifierJPanel}), '$class'})):add(get({This, modifierJPanel}), get({This, copyVerticalJButton})),
        (get({get({This, copyHorizontalJButton}), '$class'})):setFont(get({This, copyHorizontalJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, copyHorizontalJButton}), '$class'})):setText(get({This, copyHorizontalJButton}), "Copy Horizontal"),
        (get({get({This, modifierJPanel}), '$class'})):add(get({This, modifierJPanel}), get({This, copyHorizontalJButton})),
        (get({get({This, rotateJPanel}), '$class'})):setLayout(get({This, rotateJPanel}), 'GridLayout':new(1, 2)),
        (get({get({This, rotateJButton}), '$class'})):setFont(get({This, rotateJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, rotateJButton}), '$class'})):setText(get({This, rotateJButton}), "Rotate"),
        (get({get({This, rotateJPanel}), '$class'})):add(get({This, rotateJPanel}), get({This, rotateJButton})),
        (get({get({This, angleJTextField}), '$class'})):setText(get({This, angleJTextField}), "Angle"),
        (get({get({This, rotateJPanel}), '$class'})):add(get({This, rotateJPanel}), get({This, angleJTextField})),
        (get({get({This, modifierJPanel}), '$class'})):add(get({This, modifierJPanel}), get({This, rotateJPanel})),
        (get({get({This, jPanel7}), '$class'})):setLayout(get({This, jPanel7}), 'GridLayout':new(1, 2)),
        (get({get({This, upJButton}), '$class'})):setFont(get({This, upJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, upJButton}), '$class'})):setText(get({This, upJButton}), "Up"),
        (get({get({This, jPanel7}), '$class'})):add(get({This, jPanel7}), get({This, upJButton})),
        (get({get({This, downJButton}), '$class'})):setFont(get({This, downJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, downJButton}), '$class'})):setText(get({This, downJButton}), "Down"),
        (get({get({This, jPanel7}), '$class'})):add(get({This, jPanel7}), get({This, downJButton})),
        (get({get({This, modifierJPanel}), '$class'})):add(get({This, modifierJPanel}), get({This, jPanel7})),
        (get({get({This, jPanel8}), '$class'})):setLayout(get({This, jPanel8}), 'GridLayout':new(1, 2)),
        (get({get({This, leftJButton}), '$class'})):setFont(get({This, leftJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, leftJButton}), '$class'})):setText(get({This, leftJButton}), "Left"),
        (get({get({This, jPanel8}), '$class'})):add(get({This, jPanel8}), get({This, leftJButton})),
        (get({get({This, rightJButton}), '$class'})):setFont(get({This, rightJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, rightJButton}), '$class'})):setText(get({This, rightJButton}), "Right"),
        (get({get({This, jPanel8}), '$class'})):add(get({This, jPanel8}), get({This, rightJButton})),
        (get({get({This, modifierJPanel}), '$class'})):add(get({This, modifierJPanel}), get({This, jPanel8})),
        (get({This, '$class'})):add(This, get({This, modifierJPanel})).

