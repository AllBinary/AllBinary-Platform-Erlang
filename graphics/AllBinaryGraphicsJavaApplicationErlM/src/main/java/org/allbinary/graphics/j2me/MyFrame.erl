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
% package org.allbinary.graphics.j2me
% import java.awt
% import java.io.File
% import java.util.HashMap
% import javax.swing
% import org.allbinary.data.tree.dom.XslHelper
% import org.allbinary.dom.DomHelper
% import org.allbinary.graphics.j2me.dialog.NewWorkAreaJDialog
% import org.allbinary.graphics.j2me.dialog.RotateJDialog
% import org.allbinary.graphics.j2me.workarea.WorkAreaDom
% import org.allbinary.graphics.j2me.workarea.WorkAreaJPanel
% import org.allbinary.graphics.j2me.workarea.WorkAreaJPanelInterface
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEvent
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventService
% import org.allbinary.graphics.j2me.workarea.canvas.event.MyCanvasEventSource
% import org.allbinary.gui.dialog.FileJDialog
% import org.allbinary.gui.dialog.FileJDialogListenerInterface
% import org.allbinary.gui.dialog.HashMapJDialogListenerInterface
% import org.allbinary.log.LOGGING
% import org.allbinary.logic.communication.log.GuiLog
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.math.AngleFactory
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document

-module('MyFrame').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements FileJDialogListenerInterface
% implements HashMapJDialogListenerInterface
% implements KeyListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('JFrame', Function, Arguments).

static_init() ->
    put({?MODULE, 'MAXWORKAREAS'}, 10),
    put({?MODULE, numberOfWorkAreas}, 0),
    put({?MODULE, 'PATH'}, "G:/mnt/bc/mydev/work/graphics/AllBinaryGraphicsJavaApplication"),
    put({?MODULE, 'SAVE_PATH'}, lists:concat([get({'MyFrame', 'PATH'}), "/save"])),
    put({?MODULE, 'TEMPLATE_EXPORT_PATH'}, lists:concat([get({'MyFrame', 'PATH'}), "/templates/export"])),
    put({?MODULE, statusJLabel}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, guiLog}, 'GuiLog':getInstance()),
    put({This, xslHelper}, 'XslHelper':getInstance()),
    put({This, 'JAVA_TEMPLATE'}, "svgExport.xsl"),
    put({This, 'SAVEEXTENSION'}, ".gxml"),
    put({This, 'JAVAEXTENSION'}, ".javax"),
    put({This, fileJDialog}, undefined),
    put({This, rotateJDialog}, undefined),
    put({This, animateJButton}, undefined),
    put({This, autoDamageJMenuItem}, undefined),
    put({This, autoExplodeJMenuItem}, undefined),
    put({This, autoGrowJMenuItem}, undefined),
    put({This, autoRotateGenerationJMenuItem}, undefined),
    put({This, autoSheildMenuItem}, undefined),
    put({This, autoShrinkJMenuItem}, undefined),
    put({This, centerJMenuItem}, undefined),
    put({This, copyJMenuItem1}, undefined),
    put({This, exitJMenuItem}, undefined),
    put({This, explodeAllJMenuItem}, undefined),
    put({This, exportJMenuItem1}, undefined),
    put({This, fileJMenu}, undefined),
    put({This, frameJMenu}, undefined),
    put({This, generateJMenu}, undefined),
    put({This, insertAfterJMenuItem}, undefined),
    put({This, insertBeforeJMenuItem}, undefined),
    put({This, jButton1}, undefined),
    put({This, jButton2}, undefined),
    put({This, jButton3}, undefined),
    put({This, jButton4}, undefined),
    put({This, jButton41}, undefined),
    put({This, jButton5}, undefined),
    put({This, jMenu1}, undefined),
    put({This, jMenuItem1}, undefined),
    put({This, jPanel1}, undefined),
    put({This, jTabbedPane}, undefined),
    put({This, jToolBar1}, undefined),
    put({This, mainJPanel}, undefined),
    put({This, menuJMenuBar}, undefined),
    put({This, newJMenuItem}, undefined),
    put({This, nextFrameJMenuItem}, undefined),
    put({This, objectJMenu}, undefined),
    put({This, openJButton}, undefined),
    put({This, openJMenuItem}, undefined),
    put({This, playJButton}, undefined),
    put({This, previousFrameJMenuItem}, undefined),
    put({This, removeJMenuItem}, undefined),
    put({This, saveAsJMenuItem}, undefined),
    put({This, saveJButton}, undefined),
    put({This, saveJMenuItem}, undefined),
    put({This, statusJPanel}, undefined),
    put({This, stopJjButton}, undefined),
    put({This, viewJMenu}, undefined),
    put({This, zoomInJMenuItem}, undefined),
    put({This, zoomOutJMenuItem}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'JFrame':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        (get({This, '$class'})):setSize(This, 'Dimension':new(550, 400)),
        (get({get({This, mainJPanel}), '$class'})):setSize(get({This, mainJPanel}), 'Dimension':new(550, 400)),
        (get({get({This, jTabbedPane}), '$class'})):setSize(get({This, jTabbedPane}), 'Dimension':new(550, 400)),
        put({This, fileJDialog}, 'FileJDialog':new()),
        (get({get({This, fileJDialog}), '$class'})):addFinishedListener(get({This, fileJDialog}), This),
        put({This, rotateJDialog}, 'RotateJDialog':new(This, false)).

initComponents(This) ->
        put({This, jToolBar1}, 'JToolBar':new()),
        put({This, jButton2}, 'JButton':new()),
        put({This, saveJButton}, 'JButton':new()),
        put({This, jButton1}, 'JButton':new()),
        put({This, openJButton}, 'JButton':new()),
        put({This, jButton3}, 'JButton':new()),
        put({This, jButton4}, 'JButton':new()),
        put({This, jButton41}, 'JButton':new()),
        put({This, jButton5}, 'JButton':new()),
        put({This, animateJButton}, 'JButton':new()),
        put({This, playJButton}, 'JButton':new()),
        put({This, stopJjButton}, 'JButton':new()),
        put({This, jPanel1}, 'JPanel':new()),
        put({This, mainJPanel}, 'JPanel':new()),
        put({This, jTabbedPane}, 'JTabbedPane':new()),
        put({This, statusJPanel}, 'JPanel':new()),
        put({'MyFrame', statusJLabel}, 'JLabel':new()),
        put({This, menuJMenuBar}, 'JMenuBar':new()),
        put({This, fileJMenu}, 'JMenu':new()),
        put({This, newJMenuItem}, 'JMenuItem':new()),
        put({This, openJMenuItem}, 'JMenuItem':new()),
        put({This, saveJMenuItem}, 'JMenuItem':new()),
        put({This, saveAsJMenuItem}, 'JMenuItem':new()),
        put({This, exportJMenuItem1}, 'JMenuItem':new()),
        put({This, exitJMenuItem}, 'JMenuItem':new()),
        put({This, viewJMenu}, 'JMenu':new()),
        put({This, zoomInJMenuItem}, 'JMenuItem':new()),
        put({This, zoomOutJMenuItem}, 'JMenuItem':new()),
        put({This, objectJMenu}, 'JMenu':new()),
        put({This, explodeAllJMenuItem}, 'JMenuItem':new()),
        put({This, frameJMenu}, 'JMenu':new()),
        put({This, previousFrameJMenuItem}, 'JMenuItem':new()),
        put({This, nextFrameJMenuItem}, 'JMenuItem':new()),
        put({This, removeJMenuItem}, 'JMenuItem':new()),
        put({This, copyJMenuItem1}, 'JMenuItem':new()),
        put({This, insertAfterJMenuItem}, 'JMenuItem':new()),
        put({This, insertBeforeJMenuItem}, 'JMenuItem':new()),
        put({This, generateJMenu}, 'JMenu':new()),
        put({This, centerJMenuItem}, 'JMenuItem':new()),
        put({This, autoDamageJMenuItem}, 'JMenuItem':new()),
        put({This, autoExplodeJMenuItem}, 'JMenuItem':new()),
        put({This, autoGrowJMenuItem}, 'JMenuItem':new()),
        put({This, jMenuItem1}, 'JMenuItem':new()),
        put({This, autoRotateGenerationJMenuItem}, 'JMenuItem':new()),
        put({This, autoSheildMenuItem}, 'JMenuItem':new()),
        put({This, autoShrinkJMenuItem}, 'JMenuItem':new()),
        put({This, jMenu1}, 'JMenu':new()),
        (get({This, '$class'})):addWindowListener(This, 'WindowAdapter':new() % Java anonymous class body: implement it as a module
%             ok % windowClosing
),
        (get({get({This, jButton2}), '$class'})):setText(get({This, jButton2}), "New"),
        (get({get({This, jButton2}), '$class'})):addActionListener(get({This, jButton2}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, jButton2})),
        (get({get({This, saveJButton}), '$class'})):setText(get({This, saveJButton}), "Save"),
        (get({get({This, saveJButton}), '$class'})):addActionListener(get({This, saveJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, saveJButton})),
        (get({get({This, jButton1}), '$class'})):setText(get({This, jButton1}), "Export"),
        (get({get({This, jButton1}), '$class'})):addActionListener(get({This, jButton1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, jButton1})),
        (get({get({This, openJButton}), '$class'})):setText(get({This, openJButton}), "Open"),
        (get({get({This, openJButton}), '$class'})):addActionListener(get({This, openJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, openJButton})),
        (get({get({This, jButton3}), '$class'})):setText(get({This, jButton3}), "Copy"),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, jButton3})),
        (get({get({This, jButton4}), '$class'})):setText(get({This, jButton4}), "Insert Before"),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, jButton4})),
        (get({get({This, jButton41}), '$class'})):setText(get({This, jButton41}), "Insert After"),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, jButton41})),
        (get({get({This, jButton5}), '$class'})):setText(get({This, jButton5}), "Delete"),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, jButton5})),
        (get({get({This, animateJButton}), '$class'})):setText(get({This, animateJButton}), "AnimateEdit"),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, animateJButton})),
        (get({get({This, playJButton}), '$class'})):setText(get({This, playJButton}), "Play"),
        (get({get({This, playJButton}), '$class'})):addMouseListener(get({This, playJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, playJButton})),
        (get({get({This, stopJjButton}), '$class'})):setText(get({This, stopJjButton}), "Stop"),
        (get({get({This, stopJjButton}), '$class'})):addMouseListener(get({This, stopJjButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, jToolBar1}), '$class'})):add(get({This, jToolBar1}), get({This, stopJjButton})),
        (fun(Target_N71407) -> (get({Target_N71407, '$class'})):add(Target_N71407, get({This, jToolBar1}), get({get({get({'java', awt}), 'BorderLayout'}), 'NORTH'})) end)((get({This, '$class'})):getContentPane(This)),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), 'GridLayout':new(1, 0)),
        (get({get({This, mainJPanel}), '$class'})):setLayout(get({This, mainJPanel}), 'GridLayout':new(1, 0)),
        (get({get({This, jTabbedPane}), '$class'})):setMinimumSize(get({This, jTabbedPane}), 'Dimension':new(550, 400)),
        (get({get({This, jTabbedPane}), '$class'})):addChangeListener(get({This, jTabbedPane}), 'ChangeListener':new() % Java anonymous class body: implement it as a module
%             ok % stateChanged
),
        (get({get({This, mainJPanel}), '$class'})):add(get({This, mainJPanel}), get({This, jTabbedPane})),
        (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), get({This, mainJPanel})),
        (fun(Target_N71899) -> (get({Target_N71899, '$class'})):add(Target_N71899, get({This, jPanel1}), get({get({get({'java', awt}), 'BorderLayout'}), 'CENTER'})) end)((get({This, '$class'})):getContentPane(This)),
        (get({get({This, statusJPanel}), '$class'})):setLayout(get({This, statusJPanel}), 'GridLayout':new(1, 0)),
        (get({get({'MyFrame', statusJLabel}), '$class'})):setText(get({'MyFrame', statusJLabel}), "Status Bar"),
        (get({get({This, statusJPanel}), '$class'})):add(get({This, statusJPanel}), get({'MyFrame', statusJLabel})),
        (fun(Target_N72107) -> (get({Target_N72107, '$class'})):add(Target_N72107, get({This, statusJPanel}), get({get({get({'java', awt}), 'BorderLayout'}), 'SOUTH'})) end)((get({This, '$class'})):getContentPane(This)),
        (get({get({This, fileJMenu}), '$class'})):setText(get({This, fileJMenu}), "File"),
        (get({get({This, fileJMenu}), '$class'})):addActionListener(get({This, fileJMenu}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, newJMenuItem}), '$class'})):setText(get({This, newJMenuItem}), "New"),
        (get({get({This, newJMenuItem}), '$class'})):addActionListener(get({This, newJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, fileJMenu}), '$class'})):add(get({This, fileJMenu}), get({This, newJMenuItem})),
        (get({get({This, openJMenuItem}), '$class'})):setText(get({This, openJMenuItem}), "Open"),
        (get({get({This, openJMenuItem}), '$class'})):addActionListener(get({This, openJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, fileJMenu}), '$class'})):add(get({This, fileJMenu}), get({This, openJMenuItem})),
        (get({get({This, saveJMenuItem}), '$class'})):setText(get({This, saveJMenuItem}), "Save"),
        (get({get({This, saveJMenuItem}), '$class'})):addMouseListener(get({This, saveJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, fileJMenu}), '$class'})):add(get({This, fileJMenu}), get({This, saveJMenuItem})),
        (get({get({This, saveAsJMenuItem}), '$class'})):setText(get({This, saveAsJMenuItem}), "SaveAs"),
        (get({get({This, fileJMenu}), '$class'})):add(get({This, fileJMenu}), get({This, saveAsJMenuItem})),
        (get({get({This, exportJMenuItem1}), '$class'})):setText(get({This, exportJMenuItem1}), "Export"),
        (get({get({This, exportJMenuItem1}), '$class'})):addActionListener(get({This, exportJMenuItem1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, fileJMenu}), '$class'})):add(get({This, fileJMenu}), get({This, exportJMenuItem1})),
        (get({get({This, exitJMenuItem}), '$class'})):setText(get({This, exitJMenuItem}), "Exit"),
        (get({get({This, exitJMenuItem}), '$class'})):addActionListener(get({This, exitJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, fileJMenu}), '$class'})):add(get({This, fileJMenu}), get({This, exitJMenuItem})),
        (get({get({This, menuJMenuBar}), '$class'})):add(get({This, menuJMenuBar}), get({This, fileJMenu})),
        (get({get({This, viewJMenu}), '$class'})):setText(get({This, viewJMenu}), "View"),
        (get({get({This, zoomInJMenuItem}), '$class'})):setText(get({This, zoomInJMenuItem}), "Zoom In"),
        (get({get({This, zoomInJMenuItem}), '$class'})):addMouseListener(get({This, zoomInJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, viewJMenu}), '$class'})):add(get({This, viewJMenu}), get({This, zoomInJMenuItem})),
        (get({get({This, zoomOutJMenuItem}), '$class'})):setText(get({This, zoomOutJMenuItem}), "Zoom Out"),
        (get({get({This, zoomOutJMenuItem}), '$class'})):addMouseListener(get({This, zoomOutJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, viewJMenu}), '$class'})):add(get({This, viewJMenu}), get({This, zoomOutJMenuItem})),
        (get({get({This, menuJMenuBar}), '$class'})):add(get({This, menuJMenuBar}), get({This, viewJMenu})),
        (get({get({This, objectJMenu}), '$class'})):setText(get({This, objectJMenu}), "Objects"),
        (get({get({This, explodeAllJMenuItem}), '$class'})):setText(get({This, explodeAllJMenuItem}), "Explode All"),
        (get({get({This, explodeAllJMenuItem}), '$class'})):addMouseListener(get({This, explodeAllJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, objectJMenu}), '$class'})):add(get({This, objectJMenu}), get({This, explodeAllJMenuItem})),
        (get({get({This, menuJMenuBar}), '$class'})):add(get({This, menuJMenuBar}), get({This, objectJMenu})),
        (get({get({This, frameJMenu}), '$class'})):setText(get({This, frameJMenu}), "Frame"),
        (get({get({This, frameJMenu}), '$class'})):addActionListener(get({This, frameJMenu}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, previousFrameJMenuItem}), '$class'})):setText(get({This, previousFrameJMenuItem}), "Previous"),
        (get({get({This, frameJMenu}), '$class'})):add(get({This, frameJMenu}), get({This, previousFrameJMenuItem})),
        (get({get({This, nextFrameJMenuItem}), '$class'})):setText(get({This, nextFrameJMenuItem}), get({'CommonLabels':getInstance(), 'NEXT'})),
        (get({get({This, frameJMenu}), '$class'})):add(get({This, frameJMenu}), get({This, nextFrameJMenuItem})),
        (get({get({This, removeJMenuItem}), '$class'})):setText(get({This, removeJMenuItem}), "Remove"),
        (get({get({This, frameJMenu}), '$class'})):add(get({This, frameJMenu}), get({This, removeJMenuItem})),
        (get({get({This, copyJMenuItem1}), '$class'})):setText(get({This, copyJMenuItem1}), "Copy"),
        (get({get({This, frameJMenu}), '$class'})):add(get({This, frameJMenu}), get({This, copyJMenuItem1})),
        (get({get({This, insertAfterJMenuItem}), '$class'})):setText(get({This, insertAfterJMenuItem}), "Ins After"),
        (get({get({This, frameJMenu}), '$class'})):add(get({This, frameJMenu}), get({This, insertAfterJMenuItem})),
        (get({get({This, insertBeforeJMenuItem}), '$class'})):setText(get({This, insertBeforeJMenuItem}), "Ins Before"),
        (get({get({This, frameJMenu}), '$class'})):add(get({This, frameJMenu}), get({This, insertBeforeJMenuItem})),
        (get({get({This, menuJMenuBar}), '$class'})):add(get({This, menuJMenuBar}), get({This, frameJMenu})),
        (get({get({This, generateJMenu}), '$class'})):setText(get({This, generateJMenu}), "Generate"),
        (get({get({This, centerJMenuItem}), '$class'})):setText(get({This, centerJMenuItem}), "Center"),
        (get({get({This, centerJMenuItem}), '$class'})):addActionListener(get({This, centerJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, centerJMenuItem})),
        (get({get({This, autoDamageJMenuItem}), '$class'})):setText(get({This, autoDamageJMenuItem}), "Damage"),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, autoDamageJMenuItem})),
        (get({get({This, autoExplodeJMenuItem}), '$class'})):setText(get({This, autoExplodeJMenuItem}), "Explode"),
        (get({get({This, autoExplodeJMenuItem}), '$class'})):addMouseListener(get({This, autoExplodeJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, autoExplodeJMenuItem})),
        (get({get({This, autoGrowJMenuItem}), '$class'})):setText(get({This, autoGrowJMenuItem}), "Grow"),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, autoGrowJMenuItem})),
        (get({get({This, jMenuItem1}), '$class'})):setText(get({This, jMenuItem1}), "Mirror"),
        (get({get({This, jMenuItem1}), '$class'})):addActionListener(get({This, jMenuItem1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, jMenuItem1})),
        (get({get({This, autoRotateGenerationJMenuItem}), '$class'})):setText(get({This, autoRotateGenerationJMenuItem}), "Rotate"),
        (get({get({This, autoRotateGenerationJMenuItem}), '$class'})):addMouseListener(get({This, autoRotateGenerationJMenuItem}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, autoRotateGenerationJMenuItem})),
        (get({get({This, autoSheildMenuItem}), '$class'})):setText(get({This, autoSheildMenuItem}), "Shield"),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, autoSheildMenuItem})),
        (get({get({This, autoShrinkJMenuItem}), '$class'})):setText(get({This, autoShrinkJMenuItem}), "Shrink"),
        (get({get({This, generateJMenu}), '$class'})):add(get({This, generateJMenu}), get({This, autoShrinkJMenuItem})),
        (get({get({This, menuJMenuBar}), '$class'})):add(get({This, menuJMenuBar}), get({This, generateJMenu})),
        (get({get({This, jMenu1}), '$class'})):setText(get({This, jMenu1}), "Help"),
        (get({get({This, menuJMenuBar}), '$class'})):add(get({This, menuJMenuBar}), get({This, jMenu1})),
        (get({This, '$class'})):setJMenuBar(This, get({This, menuJMenuBar})),
        (get({This, '$class'})):pack(This).

explodeAllJMenuItemMousePressed(This, Evt) ->
        try
            'MyCanvasEventService':fire('MyCanvasEvent':new('MyCanvasEventSource':new(get({'MyCanvasEventService', 'EXPLODE'}), undefined)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "explodeAllJMenuItemMousePressed", E)
        end.

autoExplodeJMenuItemMousePressed(This, Evt) ->
        try
            'MyCanvasEventService':fire('MyCanvasEvent':new('MyCanvasEventSource':new(get({'MyCanvasEventService', 'AUTOEXPLODE'}), undefined)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "autoExplodeJMenuItemMousePressed", E)
        end.

stopJjButtonMousePressed(This, Evt) ->
        (fun(Target_N76955) -> (get({Target_N76955, '$class'})):stop(Target_N76955) end)((get({This, '$class'})):getSelectedWorkArea(This)).

playJButtonMousePressed(This, Evt) ->
        (fun(Target_N77069) -> (get({Target_N77069, '$class'})):play(Target_N77069) end)((get({This, '$class'})):getSelectedWorkArea(This)).

autoRotateGenerationJMenuItemMousePressed(This, Evt) ->
        (get({get({This, rotateJDialog}), '$class'})):setVisible(get({This, rotateJDialog}), true).

zoomOutJMenuItemMousePressed(This, Evt) ->
        (fun(Target_N77304) -> (get({Target_N77304, '$class'})):changeZoom(Target_N77304, (-1)) end)((get({This, '$class'})):getSelectedWorkArea(This)).

zoomInJMenuItemMousePressed(This, Evt) ->
        (fun(Target_N77430) -> (get({Target_N77430, '$class'})):changeZoom(Target_N77430, 1) end)((get({This, '$class'})):getSelectedWorkArea(This)).

openJMenuItemActionPerformed(This, Evt) ->
        (get({This, '$class'})):openGraphics(This).

exportJMenuItem1ActionPerformed(This, Evt) ->
        (get({This, '$class'})):export(This).

saveJMenuItemMousePressed(This, Evt) ->
        (get({This, '$class'})):save(This).

jTabbedPaneStateChanged(This, Evt) ->
        (get({This, '$class'})):updateSelectedWorkArea(This).

frameJMenuActionPerformed(This, Evt) ->
        ok.

exitJMenuItemActionPerformed(This, Evt) ->
        erlang:halt(0).

newJMenuItemActionPerformed(This, Evt) ->
        (get({This, '$class'})):newGraphics(This).

fileJMenuActionPerformed(This, Evt) ->
        ok.

exitForm(This, Evt) ->
        erlang:halt(0).

openJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):openGraphics(This).

jButton2ActionPerformed(This, Evt) ->
        (get({This, '$class'})):newGraphics(This).

centerJMenuItemActionPerformed(This, Evt) ->
        try
            'MyCanvasEventService':fire('MyCanvasEvent':new('MyCanvasEventSource':new(get({'MyCanvasEventService', 'CENTER'}), undefined)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "centerJMenuItemActionPerformed", E)
        end.

saveJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):save(This).

jButton1ActionPerformed(This, Evt) ->
        (get({This, '$class'})):export(This).

jMenuItem1ActionPerformed(This, Evt) ->
        try
            (fun(Target_N79108) -> (get({Target_N79108, '$class'})):autoMirror(Target_N79108) end)((get({This, '$class'})):getSelectedWorkArea(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "centerJMenuItemActionPerformed", E)
        end.

onFiles(This, Files) when (is_tuple(Files) orelse Files =:= undefined) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Reading: ", Files]), This, "onFiles"),
            lists:foreach(fun(Index) ->
                Document = (fun(Target_N79376) -> (get({Target_N79376, '$class'})):createDocument(Target_N79376, array:get(Index, Files)) end)('DomHelper':getInstance()),
                WorkAreaJPanel = 'WorkAreaJPanel':new('WorkAreaDom':new(Document), (get({This, '$class'})):getSize(This)),
                (get({WorkAreaJPanel, '$class'})):setLayout(WorkAreaJPanel, 'GridLayout':new(1, 1)),
                (get({This, '$class'})):add(This, WorkAreaJPanel)
            end, lists:seq(0, array:size(Files) - 1)),
            (get({get({This, fileJDialog}), '$class'})):setVisible(get({This, fileJDialog}), false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onFiles", E)
        end.

newGraphics(This) ->
        try
            NewName = lists:concat(["graphic", get({'MyFrame', numberOfWorkAreas})]),
            Dim = (get({This, '$class'})):getSize(This),
            NewDialog = 'NewWorkAreaJDialog':new(This, false, Dim, NewName)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'MyFrame', 'LOGGING'}), '$class'})):contains(get({'MyFrame', 'LOGGING'}), get({get({'MyFrame', 'LOGGING'}), 'MENUEVENT'})) of
                true ->
                (get({get({This, guiLog}), '$class'})):put(get({This, guiLog}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "newJMenuItemActionPerformed", E);
                false -> ok
            end
        end.

openGraphics(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "openImageJMenuItemActionPerformed"),
            (get({get({This, fileJDialog}), '$class'})):setVisible(get({This, fileJDialog}), true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'MyFrame', 'LOGGING'}), '$class'})):contains(get({'MyFrame', 'LOGGING'}), get({get({'MyFrame', 'LOGGING'}), 'MENUEVENT'})) of
                true ->
                (get({get({This, guiLog}), '$class'})):put(get({This, guiLog}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "open", E);
                false -> ok
            end
        end.

export(This) ->
        try
            WorkAreaJPanel = (get({get({This, jTabbedPane}), '$class'})):getSelectedComponent(get({This, jTabbedPane})),
            File = 'File':new(lists:concat([lists:concat([lists:concat([get({?MODULE, 'SAVE_PATH'}), "/"]), (get({WorkAreaJPanel, '$class'})):getName(WorkAreaJPanel)]), get({This, 'JAVAEXTENSION'})])),
            Document = (get({WorkAreaJPanel, '$class'})):toDocument(WorkAreaJPanel),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Export: ", (fun(Target_N80658) -> (get({Target_N80658, '$class'})):toString(Target_N80658, Document) end)('DomHelper':getInstance())]), This, "exportJMenuItem1ActionPerformed"),
            (get({get({This, xslHelper}), '$class'})):export(get({This, xslHelper}), File, lists:concat([lists:concat([get({'MyFrame', 'TEMPLATE_EXPORT_PATH'}), "/"]), get({This, 'JAVA_TEMPLATE'})]), Document)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'MyFrame', 'LOGGING'}), '$class'})):contains(get({'MyFrame', 'LOGGING'}), get({get({'MyFrame', 'LOGGING'}), 'MENUEVENT'})) of
                true ->
                (get({get({This, guiLog}), '$class'})):put(get({This, guiLog}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "export", E);
                false -> ok
            end
        end.

save(This) ->
        try
            WorkAreaJPanel = (get({get({This, jTabbedPane}), '$class'})):getSelectedComponent(get({This, jTabbedPane})),
            (fun(Target_N81021) -> (get({Target_N81021, '$class'})):save(Target_N81021, 'File':new(lists:concat([lists:concat([lists:concat([get({?MODULE, 'SAVE_PATH'}), "/"]), (get({WorkAreaJPanel, '$class'})):getName(WorkAreaJPanel)]), get({This, 'SAVEEXTENSION'})])), (get({WorkAreaJPanel, '$class'})):toDocument(WorkAreaJPanel)) end)('DomHelper':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'MyFrame', 'LOGGING'}), '$class'})):contains(get({'MyFrame', 'LOGGING'}), get({get({'MyFrame', 'LOGGING'}), 'MENUEVENT'})) of
                true ->
                (get({get({This, guiLog}), '$class'})):put(get({This, guiLog}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'SAVE'}), E);
                false -> ok
            end
        end.

% throws Exception
onHashMap(This, HashMap) ->
        AngleIncrementInteger = (get({HashMap, '$class'})):get(HashMap, allbinary_java:to_string(0)),
        TotalRotationInteger = (get({HashMap, '$class'})):get(HashMap, allbinary_java:to_string(1)),
        (fun(Target_N81482) -> (get({Target_N81482, '$class'})):autoRotate(Target_N81482, (get({AngleIncrementInteger, '$class'})):intValue(AngleIncrementInteger), (get({TotalRotationInteger, '$class'})):intValue(TotalRotationInteger)) end)((get({This, '$class'})):getSelectedWorkArea(This)).

getSelectedWorkArea(This) ->
        (get({get({This, jTabbedPane}), '$class'})):getSelectedComponent(get({This, jTabbedPane})).

updateSelectedWorkArea(This) ->
        NumberOfTabs = (get({get({This, jTabbedPane}), '$class'})):getTabCount(get({This, jTabbedPane})),
        lists:foreach(fun(Index) ->
            put({local, workAreaJPanel}, (get({get({This, jTabbedPane}), '$class'})):getComponentAt(get({This, jTabbedPane}), Index)),
            (get({get({local, workAreaJPanel}), '$class'})):deselect(get({local, workAreaJPanel}))
        end, lists:seq(0, NumberOfTabs - 1)),
        put({local, workAreaJPanel}, (get({get({This, jTabbedPane}), '$class'})):getSelectedComponent(get({This, jTabbedPane}))),
        case (get({local, workAreaJPanel}) =/= undefined) of
            true ->
            (get({get({local, workAreaJPanel}), '$class'})):select(get({local, workAreaJPanel}));
            false -> ok
        end.

% throws Exception
add(This, NewCanvasInterface) ->
        try
            put({?MODULE, numberOfWorkAreas}, get({?MODULE, numberOfWorkAreas}) + 1),
            case (get({?MODULE, numberOfWorkAreas}) =:= get({'MyFrame', 'MAXWORKAREAS'})) of
                true ->
                erlang:error({'Exception'});
                false -> ok
            end,
            (get({get({This, jTabbedPane}), '$class'})):addTab(get({This, jTabbedPane}), (get({NewCanvasInterface, '$class'})):getName(NewCanvasInterface), NewCanvasInterface),
            (get({get({This, jTabbedPane}), '$class'})):setSelectedComponent(get({This, jTabbedPane}), NewCanvasInterface),
            AnimationThread = 'Thread':new(NewCanvasInterface),
            (get({AnimationThread, '$class'})):start(AnimationThread),
            (get({This, '$class'})):updateSelectedWorkArea(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'MyFrame', 'LOGGING'}), '$class'})):contains(get({'MyFrame', 'LOGGING'}), get({get({'MyFrame', 'LOGGING'}), 'GRAPHICSCREATION'})) of
                true ->
                (get({get({This, guiLog}), '$class'})):put(get({This, guiLog}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "addNewCanvas", E);
                false -> ok
            end
        end.

keyPressed(This, KeyEvent) ->
        (fun(Target_N82488) -> (get({Target_N82488, '$class'})):keyPressed(Target_N82488, KeyEvent) end)((get({This, '$class'})):getSelectedWorkArea(This)).

keyReleased(This, KeyEvent) ->
        ok.

keyTyped(This, KeyEvent) ->
        ok.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        try
            'AngleFactory':getInstance(),
            (fun(Target_N82753) -> (get({Target_N82753, '$class'})):init(Target_N82753) end)('SmallIntegerSingletonFactory':getInstance()),
            (fun(Target_N82781) -> (get({Target_N82781, '$class'})):show(Target_N82781) end)('MyFrame':new())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            LogUtil = 'LogUtil':getInstance(),
            (get({LogUtil, '$class'})):put(LogUtil, get({'CommonStrings':getInstance(), 'EXCEPTION'}), undefined, "main", E)
        end.

