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
% import org.allbinary.media.image.BufferedImageUtil2
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageProcessorInputCompositeInterface
% import org.allbinary.media.image.ImageStrings
% import org.allbinary.media.image.MirrorImageUtil
% import org.allbinary.string.CommonStrings

-module('MirrorSpriteImageJPanel').
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
    put({This, generateJButton}, undefined),
    put({This, horizontalJCheckBox}, undefined),
    put({This, imageHeightIsFrameSizeJCheckBox}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLayeredPane1}, undefined),
    put({This, jPanel1}, undefined),
    put({This, jPanel2}, undefined),
    put({This, jPanel3}, undefined),
    put({This, verticleJCheckBox}, undefined),
    put({This, writeOverOriginalJCheckBox}, undefined),
    ok.


new(ImageProcessorInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageProcessorInput),
    This.

init(This, ImageProcessorInput) ->
        'JPanel':init(This),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, imageProcessorInput}, ImageProcessorInput).

process(This) ->
        (fun(Target_N66309) -> (get({Target_N66309, '$class'})):start(Target_N66309) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

initComponents(This) ->
        put({This, jLayeredPane1}, 'JLayeredPane':new()),
        put({This, jPanel1}, 'JPanel':new() % Java anonymous class body: implement it as a module
%             ok % paint
),
        put({This, jPanel2}, 'JPanel':new()),
        put({This, imageHeightIsFrameSizeJCheckBox}, 'JCheckBox':new()),
        put({This, horizontalJCheckBox}, 'JCheckBox':new()),
        put({This, verticleJCheckBox}, 'JCheckBox':new()),
        put({This, writeOverOriginalJCheckBox}, 'JCheckBox':new()),
        put({This, generateJButton}, 'JButton':new()),
        put({This, jPanel3}, 'JPanel':new()),
        put({This, jLabel2}, 'JLabel':new()),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N68333) -> (get({Target_N68333, '$class'})):add(Target_N68333, 0, 507, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N68450) -> (get({Target_N68450, '$class'})):add(Target_N68450, 0, 230, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, imageHeightIsFrameSizeJCheckBox}), '$class'})):setSelected(get({This, imageHeightIsFrameSizeJCheckBox}), true),
        (get({get({This, imageHeightIsFrameSizeJCheckBox}), '$class'})):setText(get({This, imageHeightIsFrameSizeJCheckBox}), "Image Height Is Frame Size"),
        (get({get({This, imageHeightIsFrameSizeJCheckBox}), '$class'})):setEnabled(get({This, imageHeightIsFrameSizeJCheckBox}), false),
        (get({get({This, imageHeightIsFrameSizeJCheckBox}), '$class'})):addActionListener(get({This, imageHeightIsFrameSizeJCheckBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, horizontalJCheckBox}), '$class'})):setSelected(get({This, horizontalJCheckBox}), true),
        (get({get({This, horizontalJCheckBox}), '$class'})):setText(get({This, horizontalJCheckBox}), "Horizontal"),
        (get({get({This, horizontalJCheckBox}), '$class'})):setEnabled(get({This, horizontalJCheckBox}), false),
        (get({get({This, verticleJCheckBox}), '$class'})):setText(get({This, verticleJCheckBox}), "Verticle"),
        (get({get({This, verticleJCheckBox}), '$class'})):setEnabled(get({This, verticleJCheckBox}), false),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):setText(get({This, writeOverOriginalJCheckBox}), "Write Over Original"),
        (get({get({This, generateJButton}), '$class'})):setText(get({This, generateJButton}), "Generate"),
        (get({get({This, generateJButton}), '$class'})):addActionListener(get({This, generateJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        JPanel2Layout = 'GroupLayout':new(get({This, jPanel2})),
        (get({get({This, jPanel2}), '$class'})):setLayout(get({This, jPanel2}), JPanel2Layout),
        (get({JPanel2Layout, '$class'})):setHorizontalGroup(JPanel2Layout, (fun(Target_N69320) -> (get({Target_N69320, '$class'})):add(Target_N69320, (fun(Target_N69388) -> (get({Target_N69388, '$class'})):add(Target_N69388, get({This, generateJButton})) end)((fun(Target_N69395) -> (get({Target_N69395, '$class'})):addPreferredGap(Target_N69395, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69402) -> (get({Target_N69402, '$class'})):add(Target_N69402, get({This, writeOverOriginalJCheckBox})) end)((fun(Target_N69409) -> (get({Target_N69409, '$class'})):addPreferredGap(Target_N69409, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69416) -> (get({Target_N69416, '$class'})):add(Target_N69416, get({This, imageHeightIsFrameSizeJCheckBox})) end)((fun(Target_N69423) -> (get({Target_N69423, '$class'})):addPreferredGap(Target_N69423, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69430) -> (get({Target_N69430, '$class'})):add(Target_N69430, get({This, horizontalJCheckBox})) end)((fun(Target_N69437) -> (get({Target_N69437, '$class'})):addPreferredGap(Target_N69437, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'UNRELATED'})) end)((fun(Target_N69444) -> (get({Target_N69444, '$class'})):add(Target_N69444, get({This, verticleJCheckBox})) end)((fun(Target_N69451) -> (get({Target_N69451, '$class'})):addContainerGap(Target_N69451, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout)))))))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel2Layout, '$class'})):setVerticalGroup(JPanel2Layout, (fun(Target_N69795) -> (get({Target_N69795, '$class'})):add(Target_N69795, (fun(Target_N69863) -> (get({Target_N69863, '$class'})):addContainerGap(Target_N69863) end)((fun(Target_N69870) -> (get({Target_N69870, '$class'})):add(Target_N69870, (fun(Target_N69895) -> (get({Target_N69895, '$class'})):add(Target_N69895, get({This, generateJButton}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 25, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69902) -> (get({Target_N69902, '$class'})):add(Target_N69902, get({This, writeOverOriginalJCheckBox})) end)((fun(Target_N69909) -> (get({Target_N69909, '$class'})):add(Target_N69909, get({This, verticleJCheckBox})) end)((fun(Target_N69916) -> (get({Target_N69916, '$class'})):add(Target_N69916, get({This, horizontalJCheckBox})) end)((fun(Target_N69923) -> (get({Target_N69923, '$class'})):add(Target_N69923, get({This, imageHeightIsFrameSizeJCheckBox}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'})))))))) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout)))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Results:"),
        JPanel3Layout = 'GroupLayout':new(get({This, jPanel3})),
        (get({get({This, jPanel3}), '$class'})):setLayout(get({This, jPanel3}), JPanel3Layout),
        (get({JPanel3Layout, '$class'})):setHorizontalGroup(JPanel3Layout, (fun(Target_N70422) -> (get({Target_N70422, '$class'})):add(Target_N70422, (fun(Target_N70490) -> (get({Target_N70490, '$class'})):addContainerGap(Target_N70490, 448, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70497) -> (get({Target_N70497, '$class'})):add(Target_N70497, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createSequentialGroup(JPanel3Layout)))) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel3Layout, '$class'})):setVerticalGroup(JPanel3Layout, (fun(Target_N70581) -> (get({Target_N70581, '$class'})):add(Target_N70581, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N70801) -> (get({Target_N70801, '$class'})):add(Target_N70801, (fun(Target_N71182) -> (get({Target_N71182, '$class'})):addContainerGap(Target_N71182, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71189) -> (get({Target_N71189, '$class'})):add(Target_N71189, get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((fun(Target_N70808) -> (get({Target_N70808, '$class'})):add(Target_N70808, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70815) -> (get({Target_N70815, '$class'})):add(Target_N70815, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), (fun(Target_N70923) -> (get({Target_N70923, '$class'})):addContainerGap(Target_N70923) end)((fun(Target_N70930) -> (get({Target_N70930, '$class'})):add(Target_N70930, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70937) -> (get({Target_N70937, '$class'})):addContainerGap(Target_N70937) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N71429) -> (get({Target_N71429, '$class'})):add(Target_N71429, (fun(Target_N71497) -> (get({Target_N71497, '$class'})):add(Target_N71497, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71504) -> (get({Target_N71504, '$class'})):addPreferredGap(Target_N71504, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N71511) -> (get({Target_N71511, '$class'})):add(Target_N71511, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71518) -> (get({Target_N71518, '$class'})):addPreferredGap(Target_N71518, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N71525) -> (get({Target_N71525, '$class'})):add(Target_N71525, get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 25, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))).

generateJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

imageHeightIsFrameSizeJCheckBoxActionPerformed(This, Evt) ->
        ok.

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

