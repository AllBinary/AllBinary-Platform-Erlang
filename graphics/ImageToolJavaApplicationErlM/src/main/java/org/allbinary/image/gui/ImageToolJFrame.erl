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
% package org.allbinary.image.gui
% import java.awt.image.BufferedImage
% import java.io.File
% import java.util.Arrays
% import java.util.Comparator
% import javax.imageio.ImageIO
% import org.allbinary.gui.dialog.FileJDialog
% import org.allbinary.gui.dialog.FileJDialogListenerInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageProcessorInputCompositeInterface
% import org.allbinary.media.image.analysis.ColorRange
% import org.allbinary.media.image.analysis.ColorRangeInterface
% import org.allbinary.media.image.analysis.ImageAnalysis
% import org.allbinary.media.image.analysis.ImageAnalysisResults
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonStrings

-module('ImageToolJFrame').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements FileJDialogListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JFrame', Function, Arguments).

static_init() ->
    put({?MODULE, imageProcessorInputCompositeInterface}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, fileJDialog}, undefined),
    put({This, imageProcessorInput}, undefined),
    put({This, analysisActionJDialog}, undefined),
    put({This, analyzeJMenuItem}, undefined),
    put({This, blueJLabel}, undefined),
    put({This, colorRangeJLabel}, undefined),
    put({This, createStripImageJMenuItem}, undefined),
    put({This, fileJMenu}, undefined),
    put({This, generateSpriteSplitterMenuItem}, undefined),
    put({This, generateRotationMenuItem}, undefined),
    put({This, generateMirrorSpriteMenuItem}, undefined),
    put({This, generateRotationSpriteJMenuItem}, undefined),
    put({This, greenJLabel}, undefined),
    put({This, jPanel1}, undefined),
    put({This, mainJMenuBar}, undefined),
    put({This, maxBlueJTextField}, undefined),
    put({This, maxGreenJTextField}, undefined),
    put({This, maxJLabel}, undefined),
    put({This, maxRedJTextField}, undefined),
    put({This, minBlueJTextField}, undefined),
    put({This, minGreenJTextField}, undefined),
    put({This, minJLabel}, undefined),
    put({This, minRedJTextField}, undefined),
    put({This, mirrorJMenuItem}, undefined),
    put({This, okJButton}, undefined),
    put({This, openImageJMenuItem}, undefined),
    put({This, processingJMenu}, undefined),
    put({This, redJLabel}, undefined),
    put({This, scaleImagesJMenuItem}, undefined),
    put({This, canvasImagesJMenuItem}, undefined),
    put({This, createIconImagesJMenuItem}, undefined),
    put({This, titleJLabel}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'JFrame':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        CommonPhoneStrings = 'CommonPhoneStrings':getInstance(),
        (get({This, '$class'})):setSize(This, 640, 480),
        (fun(Target_N66371) -> (get({Target_N66371, '$class'})):setText(Target_N66371, "255") end)((get({This, '$class'})):getMaxRedJTextField(This)),
        (fun(Target_N66401) -> (get({Target_N66401, '$class'})):setText(Target_N66401, "255") end)((get({This, '$class'})):getMaxGreenJTextField(This)),
        (fun(Target_N66431) -> (get({Target_N66431, '$class'})):setText(Target_N66431, "255") end)((get({This, '$class'})):getMaxBlueJTextField(This)),
        (fun(Target_N66461) -> (get({Target_N66461, '$class'})):setText(Target_N66461, get({CommonPhoneStrings, 'ZERO'})) end)((get({This, '$class'})):getMinRedJTextField(This)),
        (fun(Target_N66503) -> (get({Target_N66503, '$class'})):setText(Target_N66503, get({CommonPhoneStrings, 'ZERO'})) end)((get({This, '$class'})):getMinGreenJTextField(This)),
        (fun(Target_N66545) -> (get({Target_N66545, '$class'})):setText(Target_N66545, get({CommonPhoneStrings, 'ZERO'})) end)((get({This, '$class'})):getMinBlueJTextField(This)),
        put({This, fileJDialog}, 'FileJDialog':new()),
        (get({get({This, fileJDialog}), '$class'})):addFinishedListener(get({This, fileJDialog}), This).

initComponents(This) ->
        put({This, analysisActionJDialog}, 'JDialog':new()),
        put({This, titleJLabel}, 'JLabel':new()),
        put({This, colorRangeJLabel}, 'JLabel':new()),
        put({This, redJLabel}, 'JLabel':new()),
        put({This, minJLabel}, 'JLabel':new()),
        put({This, maxJLabel}, 'JLabel':new()),
        put({This, greenJLabel}, 'JLabel':new()),
        put({This, blueJLabel}, 'JLabel':new()),
        put({This, minRedJTextField}, 'JTextField':new()),
        put({This, maxRedJTextField}, 'JTextField':new()),
        put({This, maxGreenJTextField}, 'JTextField':new()),
        put({This, minBlueJTextField}, 'JTextField':new()),
        put({This, maxBlueJTextField}, 'JTextField':new()),
        put({This, okJButton}, 'JButton':new()),
        put({This, minGreenJTextField}, 'JTextField':new()),
        put({This, jPanel1}, 'JPanel':new()),
        put({This, mainJMenuBar}, 'JMenuBar':new()),
        put({This, fileJMenu}, 'JMenu':new()),
        put({This, openImageJMenuItem}, 'JMenuItem':new()),
        put({This, processingJMenu}, 'JMenu':new()),
        put({This, analyzeJMenuItem}, 'JMenuItem':new()),
        put({This, generateSpriteSplitterMenuItem}, 'JMenuItem':new()),
        put({This, generateRotationMenuItem}, 'JMenuItem':new()),
        put({This, generateMirrorSpriteMenuItem}, 'JMenuItem':new()),
        put({This, generateRotationSpriteJMenuItem}, 'JMenuItem':new()),
        put({This, createStripImageJMenuItem}, 'JMenuItem':new()),
        put({This, mirrorJMenuItem}, 'JMenuItem':new()),
        put({This, scaleImagesJMenuItem}, 'JMenuItem':new()),
        put({This, canvasImagesJMenuItem}, 'JMenuItem':new()),
        put({This, createIconImagesJMenuItem}, 'JMenuItem':new()),
        (get({get({This, analysisActionJDialog}), '$class'})):setMinimumSize(get({This, analysisActionJDialog}), 'Dimension':new(350, 250)),
        (get({get({This, titleJLabel}), '$class'})):setText(get({This, titleJLabel}), "              Color At Action Options            "),
        (get({get({This, colorRangeJLabel}), '$class'})):setText(get({This, colorRangeJLabel}), "Color Range"),
        (get({get({This, redJLabel}), '$class'})):setText(get({This, redJLabel}), "Red:"),
        (get({get({This, minJLabel}), '$class'})):setText(get({This, minJLabel}), "Minimum"),
        (get({get({This, maxJLabel}), '$class'})):setText(get({This, maxJLabel}), "Maximum"),
        (get({get({This, greenJLabel}), '$class'})):setText(get({This, greenJLabel}), "Green:"),
        (get({get({This, blueJLabel}), '$class'})):setText(get({This, blueJLabel}), "Blue:"),
        (get({get({This, okJButton}), '$class'})):setText(get({This, okJButton}), "OK"),
        (get({get({This, okJButton}), '$class'})):addActionListener(get({This, okJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        AnalysisActionJDialogLayout = 'GroupLayout':new((get({get({This, analysisActionJDialog}), '$class'})):getContentPane(get({This, analysisActionJDialog}))),
        (fun(Target_N68689) -> (get({Target_N68689, '$class'})):setLayout(Target_N68689, AnalysisActionJDialogLayout) end)((get({get({This, analysisActionJDialog}), '$class'})):getContentPane(get({This, analysisActionJDialog}))),
        (get({AnalysisActionJDialogLayout, '$class'})):setHorizontalGroup(AnalysisActionJDialogLayout, (fun(Target_N68748) -> (get({Target_N68748, '$class'})):add(Target_N68748, (fun(Target_N68816) -> (get({Target_N68816, '$class'})):add(Target_N68816, (fun(Target_N68849) -> (get({Target_N68849, '$class'})):add(Target_N68849, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), (fun(Target_N70513) -> (get({Target_N70513, '$class'})):add(Target_N70513, 25, 25, 25) end)((fun(Target_N70520) -> (get({Target_N70520, '$class'})):add(Target_N70520, get({This, titleJLabel})) end)((get({AnalysisActionJDialogLayout, '$class'})):createSequentialGroup(AnalysisActionJDialogLayout)))) end)((fun(Target_N68856) -> (get({Target_N68856, '$class'})):add(Target_N68856, (fun(Target_N68924) -> (get({Target_N68924, '$class'})):addContainerGap(Target_N68924) end)((fun(Target_N68931) -> (get({Target_N68931, '$class'})):add(Target_N68931, (fun(Target_N69735) -> (get({Target_N69735, '$class'})):add(Target_N69735, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), get({This, maxJLabel}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 61, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69742) -> (get({Target_N69742, '$class'})):add(Target_N69742, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), (fun(Target_N69850) -> (get({Target_N69850, '$class'})):addPreferredGap(Target_N69850, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'}), 17, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69857) -> (get({Target_N69857, '$class'})):add(Target_N69857, (fun(Target_N69882) -> (get({Target_N69882, '$class'})):add(Target_N69882, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), (fun(Target_N70053) -> (get({Target_N70053, '$class'})):add(Target_N70053, (fun(Target_N70101) -> (get({Target_N70101, '$class'})):add(Target_N70101, get({This, maxGreenJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 43, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70108) -> (get({Target_N70108, '$class'})):add(Target_N70108, get({This, maxBlueJTextField})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}))))) end)((fun(Target_N70060) -> (get({Target_N70060, '$class'})):add(Target_N70060, 1, 1, 1) end)((get({AnalysisActionJDialogLayout, '$class'})):createSequentialGroup(AnalysisActionJDialogLayout)))) end)((fun(Target_N69889) -> (get({Target_N69889, '$class'})):add(Target_N69889, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), get({This, maxRedJTextField})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), false)))) end)((get({AnalysisActionJDialogLayout, '$class'})):createSequentialGroup(AnalysisActionJDialogLayout)))) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}))))) end)((fun(Target_N68938) -> (get({Target_N68938, '$class'})):addPreferredGap(Target_N68938, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N68945) -> (get({Target_N68945, '$class'})):add(Target_N68945, (fun(Target_N69139) -> (get({Target_N69139, '$class'})):add(Target_N69139, (fun(Target_N69326) -> (get({Target_N69326, '$class'})):add(Target_N69326, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), get({This, okJButton})) end)((fun(Target_N69333) -> (get({Target_N69333, '$class'})):add(Target_N69333, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), get({This, minRedJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 42, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69340) -> (get({Target_N69340, '$class'})):add(Target_N69340, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), get({This, minGreenJTextField})) end)((fun(Target_N69347) -> (get({Target_N69347, '$class'})):add(Target_N69347, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}), get({This, minBlueJTextField})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), false)))))) end)((fun(Target_N69146) -> (get({Target_N69146, '$class'})):add(Target_N69146, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), get({This, minJLabel}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 58, get({'Short', 'MAX_VALUE'})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}))))) end)((fun(Target_N68952) -> (get({Target_N68952, '$class'})):add(Target_N68952, 29, 29, 29) end)((fun(Target_N68959) -> (get({Target_N68959, '$class'})):add(Target_N68959, (fun(Target_N68984) -> (get({Target_N68984, '$class'})):add(Target_N68984, get({This, colorRangeJLabel})) end)((fun(Target_N68991) -> (get({Target_N68991, '$class'})):add(Target_N68991, get({This, redJLabel})) end)((fun(Target_N68998) -> (get({Target_N68998, '$class'})):add(Target_N68998, get({This, greenJLabel})) end)((fun(Target_N69005) -> (get({Target_N69005, '$class'})):add(Target_N69005, get({This, blueJLabel})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}))))))) end)((get({AnalysisActionJDialogLayout, '$class'})):createSequentialGroup(AnalysisActionJDialogLayout)))))))) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'}))))) end)((fun(Target_N68823) -> (get({Target_N68823, '$class'})):addContainerGap(Target_N68823) end)((get({AnalysisActionJDialogLayout, '$class'})):createSequentialGroup(AnalysisActionJDialogLayout)))) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({AnalysisActionJDialogLayout, '$class'})):setVerticalGroup(AnalysisActionJDialogLayout, (fun(Target_N70600) -> (get({Target_N70600, '$class'})):add(Target_N70600, (fun(Target_N70668) -> (get({Target_N70668, '$class'})):addContainerGap(Target_N70668, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70675) -> (get({Target_N70675, '$class'})):add(Target_N70675, get({This, okJButton})) end)((fun(Target_N70682) -> (get({Target_N70682, '$class'})):add(Target_N70682, 16, 16, 16) end)((fun(Target_N70689) -> (get({Target_N70689, '$class'})):add(Target_N70689, (fun(Target_N71938) -> (get({Target_N71938, '$class'})):add(Target_N71938, (fun(Target_N72025) -> (get({Target_N72025, '$class'})):add(Target_N72025, get({This, maxBlueJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72032) -> (get({Target_N72032, '$class'})):add(Target_N72032, get({This, minBlueJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'}))))) end)((fun(Target_N71945) -> (get({Target_N71945, '$class'})):add(Target_N71945, get({This, blueJLabel})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}))))) end)((fun(Target_N70696) -> (get({Target_N70696, '$class'})):addPreferredGap(Target_N70696, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N70703) -> (get({Target_N70703, '$class'})):add(Target_N70703, (fun(Target_N71464) -> (get({Target_N71464, '$class'})):add(Target_N71464, (fun(Target_N71551) -> (get({Target_N71551, '$class'})):add(Target_N71551, get({This, maxGreenJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71558) -> (get({Target_N71558, '$class'})):add(Target_N71558, get({This, minGreenJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'}))))) end)((fun(Target_N71471) -> (get({Target_N71471, '$class'})):add(Target_N71471, get({This, greenJLabel})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}))))) end)((fun(Target_N70710) -> (get({Target_N70710, '$class'})):addPreferredGap(Target_N70710, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N70717) -> (get({Target_N70717, '$class'})):add(Target_N70717, (fun(Target_N70990) -> (get({Target_N70990, '$class'})):add(Target_N70990, (fun(Target_N71077) -> (get({Target_N71077, '$class'})):add(Target_N71077, get({This, maxRedJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71084) -> (get({Target_N71084, '$class'})):add(Target_N71084, get({This, minRedJTextField}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'}))))) end)((fun(Target_N70997) -> (get({Target_N70997, '$class'})):add(Target_N70997, get({This, redJLabel})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}))))) end)((fun(Target_N70724) -> (get({Target_N70724, '$class'})):addPreferredGap(Target_N70724, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N70731) -> (get({Target_N70731, '$class'})):add(Target_N70731, (fun(Target_N70826) -> (get({Target_N70826, '$class'})):add(Target_N70826, get({This, maxJLabel})) end)((fun(Target_N70833) -> (get({Target_N70833, '$class'})):add(Target_N70833, get({This, colorRangeJLabel})) end)((fun(Target_N70840) -> (get({Target_N70840, '$class'})):add(Target_N70840, get({This, minJLabel})) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'})))))) end)((fun(Target_N70738) -> (get({Target_N70738, '$class'})):addPreferredGap(Target_N70738, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N70745) -> (get({Target_N70745, '$class'})):add(Target_N70745, get({This, titleJLabel})) end)((get({AnalysisActionJDialogLayout, '$class'})):createSequentialGroup(AnalysisActionJDialogLayout)))))))))))))) end)((get({AnalysisActionJDialogLayout, '$class'})):createParallelGroup(AnalysisActionJDialogLayout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({This, '$class'})):setDefaultCloseOperation(This, get({get({get({'javax', swing}), 'WindowConstants'}), 'EXIT_ON_CLOSE'})),
        (fun(Target_N72509) -> (get({Target_N72509, '$class'})):setLayout(Target_N72509, 'GridLayout':new(1, 0)) end)((get({This, '$class'})):getContentPane(This)),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), 'GridLayout':new(1, 0)),
        (fun(Target_N72636) -> (get({Target_N72636, '$class'})):add(Target_N72636, get({This, jPanel1})) end)((get({This, '$class'})):getContentPane(This)),
        (get({get({This, fileJMenu}), '$class'})):setText(get({This, fileJMenu}), "File"),
        (get({get({This, fileJMenu}), '$class'})):addActionListener(get({This, fileJMenu}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, openImageJMenuItem}), '$class'})):setText(get({This, openImageJMenuItem}), "Open"),
        (get({get({This, openImageJMenuItem}), '$class'})):addActionListener(get({This, openImageJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, fileJMenu}), '$class'})):add(get({This, fileJMenu}), get({This, openImageJMenuItem})),
        (get({get({This, mainJMenuBar}), '$class'})):add(get({This, mainJMenuBar}), get({This, fileJMenu})),
        (get({get({This, processingJMenu}), '$class'})):setText(get({This, processingJMenu}), "Processing"),
        (get({get({This, processingJMenu}), '$class'})):addActionListener(get({This, processingJMenu}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, analyzeJMenuItem}), '$class'})):setText(get({This, analyzeJMenuItem}), "Image Analyze"),
        (get({get({This, analyzeJMenuItem}), '$class'})):addActionListener(get({This, analyzeJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, analyzeJMenuItem})),
        (get({get({This, generateMirrorSpriteMenuItem}), '$class'})):setText(get({This, generateMirrorSpriteMenuItem}), "Mirror Sprite Generator"),
        (get({get({This, generateMirrorSpriteMenuItem}), '$class'})):addActionListener(get({This, generateMirrorSpriteMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, generateMirrorSpriteMenuItem})),
        (get({get({This, generateRotationSpriteJMenuItem}), '$class'})):setText(get({This, generateRotationSpriteJMenuItem}), "Rotation Sprite Generator"),
        (get({get({This, generateRotationSpriteJMenuItem}), '$class'})):addActionListener(get({This, generateRotationSpriteJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, generateRotationSpriteJMenuItem})),
        (get({get({This, generateSpriteSplitterMenuItem}), '$class'})):setText(get({This, generateSpriteSplitterMenuItem}), "Sprite Splitter Generator"),
        (get({get({This, generateSpriteSplitterMenuItem}), '$class'})):addActionListener(get({This, generateSpriteSplitterMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, generateSpriteSplitterMenuItem})),
        (get({get({This, generateRotationMenuItem}), '$class'})):setText(get({This, generateRotationMenuItem}), "Rotate Image Generator"),
        (get({get({This, generateRotationMenuItem}), '$class'})):addActionListener(get({This, generateRotationMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, generateRotationMenuItem})),
        (get({get({This, createStripImageJMenuItem}), '$class'})):setText(get({This, createStripImageJMenuItem}), "Multi Image Unifier"),
        (get({get({This, createStripImageJMenuItem}), '$class'})):addActionListener(get({This, createStripImageJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, createStripImageJMenuItem})),
        (get({get({This, mirrorJMenuItem}), '$class'})):setText(get({This, mirrorJMenuItem}), "Mirror Image(s)"),
        (get({get({This, mirrorJMenuItem}), '$class'})):addActionListener(get({This, mirrorJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, mirrorJMenuItem})),
        (get({get({This, scaleImagesJMenuItem}), '$class'})):setText(get({This, scaleImagesJMenuItem}), "Scale Image(s)"),
        (get({get({This, scaleImagesJMenuItem}), '$class'})):addActionListener(get({This, scaleImagesJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, scaleImagesJMenuItem})),
        (get({get({This, canvasImagesJMenuItem}), '$class'})):setText(get({This, canvasImagesJMenuItem}), "Canvas Image(s)"),
        (get({get({This, canvasImagesJMenuItem}), '$class'})):addActionListener(get({This, canvasImagesJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, canvasImagesJMenuItem})),
        (get({get({This, createIconImagesJMenuItem}), '$class'})):setText(get({This, createIconImagesJMenuItem}), "Create Icon Image(s)"),
        (get({get({This, createIconImagesJMenuItem}), '$class'})):addActionListener(get({This, createIconImagesJMenuItem}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, processingJMenu}), '$class'})):add(get({This, processingJMenu}), get({This, createIconImagesJMenuItem})),
        (get({get({This, mainJMenuBar}), '$class'})):add(get({This, mainJMenuBar}), get({This, processingJMenu})),
        (get({This, '$class'})):setJMenuBar(This, get({This, mainJMenuBar})),
        (get({This, '$class'})):pack(This).

createStripImageJMenuItemActionPerformed(This, Evt) ->
        try
            ImageUnifierJPanel = 'ImageUnifierJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), ImageUnifierJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, ImageUnifierJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "createStripImageJMenuItemActionPerformed", E)
        end.

okJButtonActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "okJButtonActionPerformed"),
            ImageAnalysisResultsArray = (fun(Target_N76068) -> (get({Target_N76068, '$class'})):process(Target_N76068, (get({get({This, imageProcessorInput}), '$class'})):getBufferedImageArray(get({This, imageProcessorInput})), (get({This, '$class'})):getColorRangeInterface(This)) end)('ImageAnalysis':getInstance()),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), 'ImageAnalysisResultsJPanel':new(ImageAnalysisResultsArray)),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            (get({get({This, analysisActionJDialog}), '$class'})):setVisible(get({This, analysisActionJDialog}), false),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, undefined)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "okJButtonActionPerformed", E)
        end.

processingJMenuActionPerformed(This, Evt) ->
        ok.

openImageJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "openImageJMenuItemActionPerformed"),
            (get({get({This, fileJDialog}), '$class'})):setVisible(get({This, fileJDialog}), true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "openImageJMenuItemActionPerformed", E)
        end.

onFiles(This, Files) when (is_tuple(Files) orelse Files =:= undefined) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Reading ", array:size(Files)]), " files."]), This, "onFiles"),
            'Arrays':sort(Files, 'Comparator':new() % Java anonymous class body: implement it as a module
%                 ok % compare
%                 ok % extractIndexNumberIfAnyFromFileName
),
            BufferedImageArray = array:new(array:size(Files), {default, undefined}),
            lists:foreach(fun(Index) ->
                array:set(Index, 'ImageIO':read(array:get(Index, Files)), BufferedImageArray),
                case (array:get(Index, BufferedImageArray) =:= undefined) of
                    true ->
                    erlang:error({'Exception', lists:concat(["Unable to read file: ", (fun(Target_N77779) -> (get({Target_N77779, '$class'})):getPath(Target_N77779) end)(array:get(Index, Files))])});
                    false -> ok
                end
            end, lists:seq(0, array:size(Files) - 1)),
            put({This, imageProcessorInput}, 'ImageProcessorInput':new(Files, BufferedImageArray)),
            (get({get({This, fileJDialog}), '$class'})):setVisible(get({This, fileJDialog}), false),
            case (get({'ImageToolJFrame', imageProcessorInputCompositeInterface}) =/= undefined) of
                true ->
                (get({get({'ImageToolJFrame', imageProcessorInputCompositeInterface}), '$class'})):setImageProcessorInput(get({'ImageToolJFrame', imageProcessorInputCompositeInterface}), get({This, imageProcessorInput}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "onFiles", E)
        end.

fileJMenuActionPerformed(This, Evt) ->
        ok.

analyzeJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "analyzeJMenuItemActionPerformed"),
            (get({get({This, analysisActionJDialog}), '$class'})):setVisible(get({This, analysisActionJDialog}), true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "analyzeJMenuItemActionPerformed", E)
        end.

generateRotationSpriteJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "generateRotationSpriteJMenuItemActionPerformed"),
            SpriteImageJPanel = 'RotationSpriteImageJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), SpriteImageJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, SpriteImageJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "generateRotationSpriteJMenuItemActionPerformed", E)
        end.

generateSpriteSplitterMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "generateRotationSpriteJMenuItemActionPerformed"),
            ImageJPanel = 'SpriteSplitterImageJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), ImageJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, ImageJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "generateRotationMenuItemActionPerformed", E)
        end.

generateRotationMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "generateRotationSpriteJMenuItemActionPerformed"),
            RotationImageJPanel = 'RotationImageJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), RotationImageJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, RotationImageJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "generateRotationMenuItemActionPerformed", E)
        end.

scaleImagesJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "scaleImagesJMenuItemActionPerformed"),
            ResizeImageJPanel = 'ResizeImageJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), ResizeImageJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, ResizeImageJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "scaleImagesJMenuItemActionPerformed", E)
        end.

createIconsJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "createIconsJMenuItemActionPerformed"),
            CreateIconImagesJPanel = 'CreateIconImagesJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), CreateIconImagesJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, CreateIconImagesJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "scaleImagesJMenuItemActionPerformed", E)
        end.

canvasImagesJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "canvasImagesJMenuItemActionPerformed"),
            ResizeImageJPanel = 'CanvasImageJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), ResizeImageJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, ResizeImageJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "scaleImagesJMenuItemActionPerformed", E)
        end.

generateMirrorSpriteMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "generateMirrorSpriteJMenuItemActionPerformed"),
            SpriteImageJPanel = 'MirrorSpriteImageJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), SpriteImageJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, SpriteImageJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "generateMirrorSpriteJMenuItemActionPerformed", E)
        end.

mirrorJMenuItemActionPerformed(This, Evt) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "generateMirrorJMenuItemActionPerformed"),
            MirrorImageJPanel = 'MirrorImageJPanel':new(get({This, imageProcessorInput})),
            (get({get({This, jPanel1}), '$class'})):removeAll(get({This, jPanel1})),
            (get({get({This, jPanel1}), '$class'})):add(get({This, jPanel1}), MirrorImageJPanel),
            (get({get({This, jPanel1}), '$class'})):updateUI(get({This, jPanel1})),
            put({'ImageToolJFrame', imageProcessorInputCompositeInterface}, MirrorImageJPanel)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "generateMirrorJMenuItemActionPerformed", E)
        end.

getColorRangeInterface(This) ->
        ColorRangeInterface = 'ColorRange':new(),
        (get({ColorRangeInterface, '$class'})):setMinRed(ColorRangeInterface, (fun(Target_N81764) -> (get({Target_N81764, '$class'})):intValue(Target_N81764) end)((fun(Target_N81784) -> (get({Target_N81784, '$class'})):getText(Target_N81784) end)((get({This, '$class'})):getMinRedJTextField(This)))),
        (get({ColorRangeInterface, '$class'})):setMaxRed(ColorRangeInterface, (fun(Target_N81829) -> (get({Target_N81829, '$class'})):intValue(Target_N81829) end)((fun(Target_N81849) -> (get({Target_N81849, '$class'})):getText(Target_N81849) end)((get({This, '$class'})):getMaxRedJTextField(This)))),
        (get({ColorRangeInterface, '$class'})):setMinGreen(ColorRangeInterface, (fun(Target_N81894) -> (get({Target_N81894, '$class'})):intValue(Target_N81894) end)((fun(Target_N81914) -> (get({Target_N81914, '$class'})):getText(Target_N81914) end)((get({This, '$class'})):getMinGreenJTextField(This)))),
        (get({ColorRangeInterface, '$class'})):setMaxGreen(ColorRangeInterface, (fun(Target_N81959) -> (get({Target_N81959, '$class'})):intValue(Target_N81959) end)((fun(Target_N81979) -> (get({Target_N81979, '$class'})):getText(Target_N81979) end)((get({This, '$class'})):getMaxGreenJTextField(This)))),
        (get({ColorRangeInterface, '$class'})):setMinBlue(ColorRangeInterface, (fun(Target_N82024) -> (get({Target_N82024, '$class'})):intValue(Target_N82024) end)((fun(Target_N82044) -> (get({Target_N82044, '$class'})):getText(Target_N82044) end)((get({This, '$class'})):getMinBlueJTextField(This)))),
        (get({ColorRangeInterface, '$class'})):setMaxBlue(ColorRangeInterface, (fun(Target_N82089) -> (get({Target_N82089, '$class'})):intValue(Target_N82089) end)((fun(Target_N82109) -> (get({Target_N82109, '$class'})):getText(Target_N82109) end)((get({This, '$class'})):getMaxBlueJTextField(This)))),
        ColorRangeInterface.

getMaxBlueJTextField(This) ->
        get({This, maxBlueJTextField}).

setMaxBlueJTextField(This, MaxBlueJTextField) ->
        put({This, maxBlueJTextField}, get({This, maxBlueJTextField})).

getMaxGreenJTextField(This) ->
        get({This, maxGreenJTextField}).

setMaxGreenJTextField(This, MaxGreenJTextField) ->
        put({This, maxGreenJTextField}, get({This, maxGreenJTextField})).

getMaxRedJTextField(This) ->
        get({This, maxRedJTextField}).

setMaxRedJTextField(This, MaxRedJTextField) ->
        put({This, maxRedJTextField}, get({This, maxRedJTextField})).

getMinBlueJTextField(This) ->
        get({This, minBlueJTextField}).

setMinBlueJTextField(This, MinBlueJTextField) ->
        put({This, minBlueJTextField}, get({This, minBlueJTextField})).

getMinGreenJTextField(This) ->
        get({This, minGreenJTextField}).

setMinGreenJTextField(This, MinGreenJTextField) ->
        put({This, minGreenJTextField}, get({This, minGreenJTextField})).

getMinRedJTextField(This) ->
        get({This, minRedJTextField}).

setMinRedJTextField(This, MinRedJTextField) ->
        put({This, minRedJTextField}, get({This, minRedJTextField})).

