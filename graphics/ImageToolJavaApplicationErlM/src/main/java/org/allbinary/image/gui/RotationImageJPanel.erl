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
% import java.io.IOException
% import javax.imageio.ImageIO
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.image.ImageArrayRotationUtil
% import org.allbinary.media.image.ImageProcessedVisitor
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('RotationImageJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageProcessedVisitor

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
        (fun(Target_N66302) -> (get({Target_N66302, '$class'})):start(Target_N66302) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

initComponents(This) ->
        put({This, jPanel1}, 'JPanel':new() % Java anonymous class body: implement it as a module
%             ok % paint
),
        put({This, jPanel2}, 'JPanel':new()),
        put({This, jLabel1}, 'JLabel':new()),
        put({This, generateJButton}, 'JButton':new()),
        put({This, totalAngleJComboBox}, 'JComboBox':new()),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, writeOverOriginalJCheckBox}, 'JCheckBox':new()),
        put({This, jPanel3}, 'JPanel':new()),
        put({This, jLabel2}, 'JLabel':new()),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N67447) -> (get({Target_N67447, '$class'})):add(Target_N67447, 0, 436, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N67564) -> (get({Target_N67564, '$class'})):add(Target_N67564, 0, 227, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, generateJButton}), '$class'})):setText(get({This, generateJButton}), "Generate"),
        (get({get({This, generateJButton}), '$class'})):addActionListener(get({This, generateJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, totalAngleJComboBox}), '$class'})):setModel(get({This, totalAngleJComboBox}), 'DefaultComboBoxModel':new(array:from_list([get({get({This, commonStrings}), 'UP'}), get({get({This, commonStrings}), 'DOWN'}), "-90", "90"]))),
        (get({get({This, totalAngleJComboBox}), '$class'})):addActionListener(get({This, totalAngleJComboBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Total Angle:"),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):setText(get({This, writeOverOriginalJCheckBox}), "Write Over Original"),
        JPanel2Layout = 'GroupLayout':new(get({This, jPanel2})),
        (get({get({This, jPanel2}), '$class'})):setLayout(get({This, jPanel2}), JPanel2Layout),
        (get({JPanel2Layout, '$class'})):setHorizontalGroup(JPanel2Layout, (fun(Target_N68352) -> (get({Target_N68352, '$class'})):add(Target_N68352, (fun(Target_N68420) -> (get({Target_N68420, '$class'})):addContainerGap(Target_N68420, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68427) -> (get({Target_N68427, '$class'})):add(Target_N68427, get({This, generateJButton})) end)((fun(Target_N68434) -> (get({Target_N68434, '$class'})):addPreferredGap(Target_N68434, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N68441) -> (get({Target_N68441, '$class'})):add(Target_N68441, get({This, writeOverOriginalJCheckBox})) end)((fun(Target_N68448) -> (get({Target_N68448, '$class'})):addPreferredGap(Target_N68448, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N68455) -> (get({Target_N68455, '$class'})):add(Target_N68455, get({This, totalAngleJComboBox}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N68462) -> (get({Target_N68462, '$class'})):addPreferredGap(Target_N68462, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N68469) -> (get({Target_N68469, '$class'})):add(Target_N68469, get({This, jLabel3})) end)((fun(Target_N68476) -> (get({Target_N68476, '$class'})):addPreferredGap(Target_N68476, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N68483) -> (get({Target_N68483, '$class'})):add(Target_N68483, get({This, jLabel1})) end)((fun(Target_N68490) -> (get({Target_N68490, '$class'})):add(Target_N68490, 8, 8, 8) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout))))))))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel2Layout, '$class'})):setVerticalGroup(JPanel2Layout, (fun(Target_N68970) -> (get({Target_N68970, '$class'})):add(Target_N68970, (fun(Target_N69038) -> (get({Target_N69038, '$class'})):add(Target_N69038, get({This, writeOverOriginalJCheckBox})) end)((fun(Target_N69045) -> (get({Target_N69045, '$class'})):add(Target_N69045, get({This, jLabel3})) end)((fun(Target_N69052) -> (get({Target_N69052, '$class'})):add(Target_N69052, get({This, totalAngleJComboBox}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69059) -> (get({Target_N69059, '$class'})):add(Target_N69059, get({This, generateJButton})) end)((fun(Target_N69066) -> (get({Target_N69066, '$class'})):add(Target_N69066, get({This, jLabel1})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'BASELINE'})))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Results:"),
        JPanel3Layout = 'GroupLayout':new(get({This, jPanel3})),
        (get({get({This, jPanel3}), '$class'})):setLayout(get({This, jPanel3}), JPanel3Layout),
        (get({JPanel3Layout, '$class'})):setHorizontalGroup(JPanel3Layout, (fun(Target_N69502) -> (get({Target_N69502, '$class'})):add(Target_N69502, (fun(Target_N69570) -> (get({Target_N69570, '$class'})):addContainerGap(Target_N69570, 377, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69577) -> (get({Target_N69577, '$class'})):add(Target_N69577, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createSequentialGroup(JPanel3Layout)))) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        (get({JPanel3Layout, '$class'})):setVerticalGroup(JPanel3Layout, (fun(Target_N69661) -> (get({Target_N69661, '$class'})):add(Target_N69661, get({This, jLabel2})) end)((get({JPanel3Layout, '$class'})):createParallelGroup(JPanel3Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N69881) -> (get({Target_N69881, '$class'})):add(Target_N69881, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69888) -> (get({Target_N69888, '$class'})):add(Target_N69888, (fun(Target_N70111) -> (get({Target_N70111, '$class'})):addContainerGap(Target_N70111) end)((fun(Target_N70118) -> (get({Target_N70118, '$class'})):add(Target_N70118, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70125) -> (get({Target_N70125, '$class'})):addContainerGap(Target_N70125) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((fun(Target_N69895) -> (get({Target_N69895, '$class'})):add(Target_N69895, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'TRAILING'}), get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N70391) -> (get({Target_N70391, '$class'})):add(Target_N70391, (fun(Target_N70459) -> (get({Target_N70459, '$class'})):add(Target_N70459, get({This, jPanel1}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70466) -> (get({Target_N70466, '$class'})):addPreferredGap(Target_N70466, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'RELATED'})) end)((fun(Target_N70473) -> (get({Target_N70473, '$class'})):add(Target_N70473, get({This, jPanel3}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70480) -> (get({Target_N70480, '$class'})):addPreferredGap(Target_N70480, get({get({get({get({'org', jdesktop}), layout}), 'LayoutStyle'}), 'UNRELATED'})) end)((fun(Target_N70487) -> (get({Target_N70487, '$class'})):add(Target_N70487, get({This, jPanel2}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'org', jdesktop}), layout}), 'GroupLayout'}), 'LEADING'})))).

generateJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

totalAngleJComboBoxActionPerformed(This, Evt) ->
        ok.

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

% throws IOException
visit(This, GeneratedBufferedImage, Name, Index) when (is_list(Name) orelse Name =:= undefined), is_integer(Index) ->
        put({This, result}, GeneratedBufferedImage),
        (fun(Target_N71736) -> (get({Target_N71736, '$class'})):repaint(Target_N71736) end)((get({This, '$class'})):getParent(This)),
        put({local, file}, array:get(Index, (get({get({This, imageProcessorInput}), '$class'})):getFiles(get({This, imageProcessorInput})))),
        case (not (get({get({This, writeOverOriginalJCheckBox}), '$class'})):isSelected(get({This, writeOverOriginalJCheckBox}))) of
            true ->
            put({local, filePath}, (get({get({local, file}), '$class'})):getAbsolutePath(get({local, file}))),
            ExtensionIndex = allbinary_java:index_of(get({local, filePath}), get({get({This, imageStrings}), 'PNG_EXTENSION'})),
            put({local, filePath}, (fun(Target_N71969) -> (get({Target_N71969, '$class'})):toString(Target_N71969) end)((fun(Target_N71976) -> (get({Target_N71976, '$class'})):append(Target_N71976, get({get({This, imageStrings}), 'PNG_EXTENSION'})) end)((fun(Target_N71983) -> (get({Target_N71983, '$class'})):append(Target_N71983, Name) end)((fun(Target_N71990) -> (get({Target_N71990, '$class'})):append(Target_N71990, get({'CommonSeps':getInstance(), 'UNDERSCORE'})) end)((fun(Target_N71997) -> (get({Target_N71997, '$class'})):append(Target_N71997, string:slice(get({local, filePath}), 0, (ExtensionIndex) - (0))) end)('StringMaker':new())))))),
            put({local, file}, 'File':new(get({local, filePath})));
            false -> ok
        end,
        IsWritten = 'ImageIO':write(get({This, result}), get({get({This, imageStrings}), 'PNG'}), get({local, file})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["File: ", get({local, file})]), " Wrote: "]), IsWritten]), This, get({get({This, commonStrings}), 'RUN'})).

