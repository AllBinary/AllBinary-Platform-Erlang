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
% import java.awt
% import java.awt.image.BufferedImage
% import java.awt.image.RenderedImage
% import java.io.File
% import javax.imageio.ImageIO
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageProcessorInputCompositeInterface
% import org.allbinary.media.image.ImageStrings
% import org.allbinary.media.image.MirrorImageUtil
% import org.allbinary.string.CommonStrings

-module('MirrorImageJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageProcessorInputCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageStrings}, 'ImageStrings':getInstance()),
    put({This, imageProcessorInput}, undefined),
    put({This, result}, undefined),
    put({This, buttonGroup}, undefined),
    put({This, generateJButton}, undefined),
    put({This, horizontalJCheckBox}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLayeredPane1}, undefined),
    put({This, jPanel1}, undefined),
    put({This, jPanel2}, undefined),
    put({This, jPanel3}, undefined),
    put({This, renameJRadioButton}, undefined),
    put({This, verticleJCheckBox}, undefined),
    put({This, writeOverOriginalJRadioButton}, undefined),
    ok.


new(ImageProcessorInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageProcessorInput),
    This.

'$init'(This, ImageProcessorInput) ->
        'JPanel':'$init'(This),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, imageProcessorInput}, ImageProcessorInput).

process(This) ->
        (fun(Target_N66279) -> (get({Target_N66279, '$class'})):start(Target_N66279) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

initComponents(This) ->
        put({This, jLayeredPane1}, 'JLayeredPane':new()),
        put({This, buttonGroup}, 'ButtonGroup':new()),
        put({This, jPanel1}, 'JPanel':new() % Java anonymous class body: implement it as a module
%             ok % paint
),
        put({This, jPanel2}, 'JPanel':new()),
        put({This, horizontalJCheckBox}, 'JCheckBox':new()),
        put({This, verticleJCheckBox}, 'JCheckBox':new()),
        put({This, generateJButton}, 'JButton':new()),
        put({This, renameJRadioButton}, 'JRadioButton':new()),
        put({This, writeOverOriginalJRadioButton}, 'JRadioButton':new()),
        put({This, jPanel3}, 'JPanel':new()),
        put({This, jLabel2}, 'JLabel':new()),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N68301) -> (get({Target_N68301, '$class'})):add(Target_N68301, 0, 522, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N68418) -> (get({Target_N68418, '$class'})):add(Target_N68418, 0, 230, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, horizontalJCheckBox}), '$class'})):setSelected(get({This, horizontalJCheckBox}), true),
        (get({get({This, horizontalJCheckBox}), '$class'})):setText(get({This, horizontalJCheckBox}), "Horizontal"),
        (get({get({This, horizontalJCheckBox}), '$class'})):setEnabled(get({This, horizontalJCheckBox}), false),
        (get({get({This, verticleJCheckBox}), '$class'})):setText(get({This, verticleJCheckBox}), "Verticle"),
        (get({get({This, verticleJCheckBox}), '$class'})):setEnabled(get({This, verticleJCheckBox}), false),
        (get({get({This, generateJButton}), '$class'})):setText(get({This, generateJButton}), "Generate"),
        (get({get({This, generateJButton}), '$class'})):addActionListener(get({This, generateJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, renameJRadioButton}), '$class'})):setText(get({This, renameJRadioButton}), "Save As filename_mirror"),
        (get({get({This, renameJRadioButton}), '$class'})):addActionListener(get({This, renameJRadioButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, writeOverOriginalJRadioButton}), '$class'})):setText(get({This, writeOverOriginalJRadioButton}), "Write Over Original"),
        JPanel2Layout = 'GroupLayout':new(get({This, jPanel2})),
        (get({get({This, jPanel2}), '$class'})):setLayout(get({This, jPanel2}), JPanel2Layout),
        (get({JPanel2Layout, '$class'})):setHorizontalGroup(JPanel2Layout, (fun(Target_N69224) -> (get({Target_N69224, '$class'})):add(Target_N69224, (fun(Target_N69292) -> (get({Target_N69292, '$class'})):add(Target_N69292, 37, 37, 37) end)((fun(Target_N69299) -> (get({Target_N69299, '$class'})):add(Target_N69299, get({This, generateJButton})) end)((fun(Target_N69306) -> (get({Target_N69306, '$class'})):addPreferredGap(Target_N69306, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69313) -> (get({Target_N69313, '$class'})):add(Target_N69313, get({This, renameJRadioButton})) end)((fun(Target_N69320) -> (get({Target_N69320, '$class'})):addPreferredGap(Target_N69320, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'UNRELATED'})) end)((fun(Target_N69327) -> (get({Target_N69327, '$class'})):add(Target_N69327, get({This, writeOverOriginalJRadioButton})) end)((fun(Target_N69334) -> (get({Target_N69334, '$class'})):addPreferredGap(Target_N69334, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69341) -> (get({Target_N69341, '$class'})):add(Target_N69341, get({This, horizontalJCheckBox})) end)((fun(Target_N69348) -> (get({Target_N69348, '$class'})):addPreferredGap(Target_N69348, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'UNRELATED'})) end)((fun(Target_N69355) -> (get({Target_N69355, '$class'})):add(Target_N69355, get({This, verticleJCheckBox})) end)((fun(Target_N69362) -> (get({Target_N69362, '$class'})):addContainerGap(Target_N69362, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout))))))))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel2Layout, '$class'})):setVerticalGroup(JPanel2Layout, (fun(Target_N69722) -> (get({Target_N69722, '$class'})):add(Target_N69722, (fun(Target_N69790) -> (get({Target_N69790, '$class'})):addContainerGap(Target_N69790) end)((fun(Target_N69797) -> (get({Target_N69797, '$class'})):add(Target_N69797, (fun(Target_N69822) -> (get({Target_N69822, '$class'})):add(Target_N69822, get({This, generateJButton})) end)((fun(Target_N69829) -> (get({Target_N69829, '$class'})):add(Target_N69829, get({This, renameJRadioButton})) end)((fun(Target_N69836) -> (get({Target_N69836, '$class'})):add(Target_N69836, get({This, writeOverOriginalJRadioButton})) end)((fun(Target_N69843) -> (get({Target_N69843, '$class'})):add(Target_N69843, get({This, verticleJCheckBox})) end)((fun(Target_N69850) -> (get({Target_N69850, '$class'})):add(Target_N69850, get({This, horizontalJCheckBox})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'})))))))) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout)))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Results:"),
        JPanel3Layout = 'GroupLayout':new(get({This, jPanel3})),
        (get({get({This, jPanel3}), '$class'})):setLayout(get({This, jPanel3}), JPanel3Layout),
        (get({JPanel3Layout, '$class'})):setHorizontalGroup(JPanel3Layout, (fun(Target_N70169) -> (get({Target_N70169, '$class'})):add(Target_N70169, (fun(Target_N70237) -> (get({Target_N70237, '$class'})):addContainerGap(Target_N70237, 433, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70244) -> (get({Target_N70244, '$class'})):add(Target_N70244, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createSequentialGroup(JPanel3Layout)))) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel3Layout, '$class'})):setVerticalGroup(JPanel3Layout, (fun(Target_N70328) -> (get({Target_N70328, '$class'})):add(Target_N70328, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N70548) -> (get({Target_N70548, '$class'})):add(Target_N70548, (fun(Target_N70929) -> (get({Target_N70929, '$class'})):addContainerGap(Target_N70929, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70936) -> (get({Target_N70936, '$class'})):add(Target_N70936, get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((fun(Target_N70555) -> (get({Target_N70555, '$class'})):add(Target_N70555, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70562) -> (get({Target_N70562, '$class'})):add(Target_N70562, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), (fun(Target_N70670) -> (get({Target_N70670, '$class'})):addContainerGap(Target_N70670) end)((fun(Target_N70677) -> (get({Target_N70677, '$class'})):add(Target_N70677, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70684) -> (get({Target_N70684, '$class'})):addContainerGap(Target_N70684) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N71152) -> (get({Target_N71152, '$class'})):add(Target_N71152, (fun(Target_N71220) -> (get({Target_N71220, '$class'})):add(Target_N71220, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71227) -> (get({Target_N71227, '$class'})):addPreferredGap(Target_N71227, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N71234) -> (get({Target_N71234, '$class'})):add(Target_N71234, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71241) -> (get({Target_N71241, '$class'})):addPreferredGap(Target_N71241, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N71248) -> (get({Target_N71248, '$class'})):add(Target_N71248, get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 25, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))).

generateJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

renameJRadioButtonActionPerformed(This, Evt) ->
        ok.

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

