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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.image.ImageJ2SERotationUtil
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageProcessorInputCompositeInterface
% import org.allbinary.media.image.ImageStrings
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('RotationSpriteImageJPanel').
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
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLabel3}, undefined),
    put({This, jPanel1}, undefined),
    put({This, jPanel2}, undefined),
    put({This, jPanel3}, undefined),
    put({This, totalAngleJComboBox}, undefined),
    put({This, totalFramesJComboBox}, undefined),
    put({This, writeOverOriginalJCheckBox}, undefined),
    ok.


new(ImageProcessorInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageProcessorInput),
    This.

'$init'(This, ImageProcessorInput) ->
        'JPanel':'$init'(This),
        init_fields(This),
        (get({This, '$class'})):initComponents(This),
        put({This, imageProcessorInput}, ImageProcessorInput).

process(This) ->
        (fun(Target_N66307) -> (get({Target_N66307, '$class'})):start(Target_N66307) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

initComponents(This) ->
        put({This, jPanel1}, 'JPanel':new() % Java anonymous class body: implement it as a module
%             ok % paint
),
        put({This, jPanel2}, 'JPanel':new()),
        put({This, totalFramesJComboBox}, 'JComboBox':new()),
        put({This, jLabel1}, 'JLabel':new()),
        put({This, generateJButton}, 'JButton':new()),
        put({This, totalAngleJComboBox}, 'JComboBox':new()),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, writeOverOriginalJCheckBox}, 'JCheckBox':new()),
        put({This, jPanel3}, 'JPanel':new()),
        put({This, jLabel2}, 'JLabel':new()),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N68537) -> (get({Target_N68537, '$class'})):add(Target_N68537, 0, 436, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N68654) -> (get({Target_N68654, '$class'})):add(Target_N68654, 0, 227, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, totalFramesJComboBox}), '$class'})):setModel(get({This, totalFramesJComboBox}), 'DefaultComboBoxModel':new(array:from_list([get({'CommonPhoneStrings':getInstance(), 'FOUR'}), get({'CommonPhoneStrings':getInstance(), 'NINE'}), "18", "20", "36"]))),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Total Frames:"),
        (get({get({This, generateJButton}), '$class'})):setText(get({This, generateJButton}), "Generate"),
        (get({get({This, generateJButton}), '$class'})):addActionListener(get({This, generateJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, totalAngleJComboBox}), '$class'})):setModel(get({This, totalAngleJComboBox}), 'DefaultComboBoxModel':new(array:from_list(["360", "90"]))),
        (get({get({This, totalAngleJComboBox}), '$class'})):addActionListener(get({This, totalAngleJComboBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Total Angle:"),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):setText(get({This, writeOverOriginalJCheckBox}), "Write Over Original"),
        JPanel2Layout = 'GroupLayout':new(get({This, jPanel2})),
        (get({get({This, jPanel2}), '$class'})):setLayout(get({This, jPanel2}), JPanel2Layout),
        (get({JPanel2Layout, '$class'})):setHorizontalGroup(JPanel2Layout, (fun(Target_N69576) -> (get({Target_N69576, '$class'})):add(Target_N69576, (fun(Target_N69644) -> (get({Target_N69644, '$class'})):addContainerGap(Target_N69644, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69651) -> (get({Target_N69651, '$class'})):add(Target_N69651, get({This, generateJButton})) end)((fun(Target_N69658) -> (get({Target_N69658, '$class'})):addPreferredGap(Target_N69658, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69665) -> (get({Target_N69665, '$class'})):add(Target_N69665, get({This, writeOverOriginalJCheckBox})) end)((fun(Target_N69672) -> (get({Target_N69672, '$class'})):addPreferredGap(Target_N69672, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69679) -> (get({Target_N69679, '$class'})):add(Target_N69679, get({This, totalAngleJComboBox}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69686) -> (get({Target_N69686, '$class'})):addPreferredGap(Target_N69686, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69693) -> (get({Target_N69693, '$class'})):add(Target_N69693, get({This, jLabel3})) end)((fun(Target_N69700) -> (get({Target_N69700, '$class'})):addPreferredGap(Target_N69700, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69707) -> (get({Target_N69707, '$class'})):add(Target_N69707, get({This, totalFramesJComboBox}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69714) -> (get({Target_N69714, '$class'})):addPreferredGap(Target_N69714, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N69721) -> (get({Target_N69721, '$class'})):add(Target_N69721, get({This, jLabel1})) end)((fun(Target_N69728) -> (get({Target_N69728, '$class'})):add(Target_N69728, 8, 8, 8) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout))))))))))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel2Layout, '$class'})):setVerticalGroup(JPanel2Layout, (fun(Target_N70384) -> (get({Target_N70384, '$class'})):add(Target_N70384, (fun(Target_N70452) -> (get({Target_N70452, '$class'})):add(Target_N70452, get({This, writeOverOriginalJCheckBox})) end)((fun(Target_N70459) -> (get({Target_N70459, '$class'})):add(Target_N70459, get({This, jLabel3})) end)((fun(Target_N70466) -> (get({Target_N70466, '$class'})):add(Target_N70466, get({This, totalAngleJComboBox}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70473) -> (get({Target_N70473, '$class'})):add(Target_N70473, get({This, generateJButton})) end)((fun(Target_N70480) -> (get({Target_N70480, '$class'})):add(Target_N70480, get({This, totalFramesJComboBox}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70487) -> (get({Target_N70487, '$class'})):add(Target_N70487, get({This, jLabel1})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'}))))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Results:"),
        JPanel3Layout = 'GroupLayout':new(get({This, jPanel3})),
        (get({get({This, jPanel3}), '$class'})):setLayout(get({This, jPanel3}), JPanel3Layout),
        (get({JPanel3Layout, '$class'})):setHorizontalGroup(JPanel3Layout, (fun(Target_N71055) -> (get({Target_N71055, '$class'})):add(Target_N71055, (fun(Target_N71123) -> (get({Target_N71123, '$class'})):addContainerGap(Target_N71123, 377, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71130) -> (get({Target_N71130, '$class'})):add(Target_N71130, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createSequentialGroup(JPanel3Layout)))) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel3Layout, '$class'})):setVerticalGroup(JPanel3Layout, (fun(Target_N71214) -> (get({Target_N71214, '$class'})):add(Target_N71214, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N71434) -> (get({Target_N71434, '$class'})):add(Target_N71434, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71441) -> (get({Target_N71441, '$class'})):add(Target_N71441, (fun(Target_N71664) -> (get({Target_N71664, '$class'})):addContainerGap(Target_N71664) end)((fun(Target_N71671) -> (get({Target_N71671, '$class'})):add(Target_N71671, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71678) -> (get({Target_N71678, '$class'})):addContainerGap(Target_N71678) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((fun(Target_N71448) -> (get({Target_N71448, '$class'})):add(Target_N71448, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N71944) -> (get({Target_N71944, '$class'})):add(Target_N71944, (fun(Target_N72012) -> (get({Target_N72012, '$class'})):add(Target_N72012, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72019) -> (get({Target_N72019, '$class'})):addPreferredGap(Target_N72019, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N72026) -> (get({Target_N72026, '$class'})):add(Target_N72026, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72033) -> (get({Target_N72033, '$class'})):addPreferredGap(Target_N72033, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'UNRELATED'})) end)((fun(Target_N72040) -> (get({Target_N72040, '$class'})):add(Target_N72040, get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))).

generateJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

totalAngleJComboBoxActionPerformed(This, Evt) ->
        ok.

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

