% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.image.CanvasExpandUtil
% import org.allbinary.media.image.CanvasTrimUtil
% import org.allbinary.media.image.ImageProcessedVisitor
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageStrings
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('CanvasImageJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageProcessedVisitor

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, imageStrings}, 'ImageStrings':getInstance()),
    put({This, imageProcessorInput}, undefined),
    put({This, result}, undefined),
    put({This, generateJButton}, undefined),
    put({This, heightReductionTextField}, undefined),
    put({This, heightReductionTextField1}, undefined),
    put({This, jLabel4}, undefined),
    put({This, jLabel5}, undefined),
    put({This, jLabel6}, undefined),
    put({This, jLabel7}, undefined),
    put({This, jLabel8}, undefined),
    put({This, jPanel1}, undefined),
    put({This, jPanel2}, undefined),
    put({This, widthReductionTextField}, undefined),
    put({This, widthReductionTextField1}, undefined),
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
        (get({This, '$class'})):initComponents(This),
        put({This, imageProcessorInput}, ImageProcessorInput).

process(This) ->
        (fun(Target_N66445) -> (get({Target_N66445, '$class'})):start(Target_N66445) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

initComponents(This) ->
        put({This, writeOverOriginalJCheckBox}, 'JCheckBox':new()),
        put({This, jPanel1}, 'JPanel':new() % Java anonymous class body: implement it as a module
%             ok % paint
),
        put({This, generateJButton}, 'JButton':new()),
        put({This, jLabel4}, 'JLabel':new()),
        put({This, jPanel2}, 'JPanel':new()),
        put({This, jLabel5}, 'JLabel':new()),
        put({This, widthReductionTextField}, 'JTextField':new()),
        put({This, jLabel6}, 'JLabel':new()),
        put({This, heightReductionTextField}, 'JTextField':new()),
        put({This, widthReductionTextField1}, 'JTextField':new()),
        put({This, jLabel7}, 'JLabel':new()),
        put({This, jLabel8}, 'JLabel':new()),
        put({This, heightReductionTextField1}, 'JTextField':new()),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):setSelected(get({This, writeOverOriginalJCheckBox}), true),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):setText(get({This, writeOverOriginalJCheckBox}), "Write Over Original"),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):addActionListener(get({This, writeOverOriginalJCheckBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N68473) -> (get({Target_N68473, '$class'})):addGap(Target_N68473, 0, 0, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N68590) -> (get({Target_N68590, '$class'})):addGap(Target_N68590, 0, 196, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, generateJButton}), '$class'})):setText(get({This, generateJButton}), "Generate"),
        (get({get({This, generateJButton}), '$class'})):addActionListener(get({This, generateJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel4}), '$class'})):setText(get({This, jLabel4}), "Results:"),
        (get({get({This, jLabel5}), '$class'})):setText(get({This, jLabel5}), "Right:"),
        (get({get({This, widthReductionTextField}), '$class'})):setText(get({This, widthReductionTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, widthReductionTextField}), '$class'})):addActionListener(get({This, widthReductionTextField}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel6}), '$class'})):setText(get({This, jLabel6}), "Bottom"),
        (get({get({This, heightReductionTextField}), '$class'})):setText(get({This, heightReductionTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, widthReductionTextField1}), '$class'})):setText(get({This, widthReductionTextField1}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, widthReductionTextField1}), '$class'})):addActionListener(get({This, widthReductionTextField1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel7}), '$class'})):setText(get({This, jLabel7}), "Top"),
        (get({get({This, jLabel8}), '$class'})):setText(get({This, jLabel8}), "Left:"),
        (get({get({This, heightReductionTextField1}), '$class'})):setText(get({This, heightReductionTextField1}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        JPanel2Layout = 'GroupLayout':new(get({This, jPanel2})),
        (get({get({This, jPanel2}), '$class'})):setLayout(get({This, jPanel2}), JPanel2Layout),
        (get({JPanel2Layout, '$class'})):setHorizontalGroup(JPanel2Layout, (fun(Target_N69677) -> (get({Target_N69677, '$class'})):addGroup(Target_N69677, (fun(Target_N69745) -> (get({Target_N69745, '$class'})):addContainerGap(Target_N69745, 140, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69752) -> (get({Target_N69752, '$class'})):addComponent(Target_N69752, get({This, heightReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 46, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69759) -> (get({Target_N69759, '$class'})):addPreferredGap(Target_N69759, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69766) -> (get({Target_N69766, '$class'})):addComponent(Target_N69766, get({This, jLabel6})) end)((fun(Target_N69773) -> (get({Target_N69773, '$class'})):addPreferredGap(Target_N69773, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69780) -> (get({Target_N69780, '$class'})):addComponent(Target_N69780, get({This, heightReductionTextField1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 46, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69787) -> (get({Target_N69787, '$class'})):addPreferredGap(Target_N69787, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69794) -> (get({Target_N69794, '$class'})):addComponent(Target_N69794, get({This, jLabel7})) end)((fun(Target_N69801) -> (get({Target_N69801, '$class'})):addPreferredGap(Target_N69801, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69808) -> (get({Target_N69808, '$class'})):addComponent(Target_N69808, get({This, widthReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 41, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69815) -> (get({Target_N69815, '$class'})):addPreferredGap(Target_N69815, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69822) -> (get({Target_N69822, '$class'})):addComponent(Target_N69822, get({This, jLabel5})) end)((fun(Target_N69829) -> (get({Target_N69829, '$class'})):addPreferredGap(Target_N69829, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69836) -> (get({Target_N69836, '$class'})):addComponent(Target_N69836, get({This, widthReductionTextField1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 41, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69843) -> (get({Target_N69843, '$class'})):addPreferredGap(Target_N69843, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N69850) -> (get({Target_N69850, '$class'})):addComponent(Target_N69850, get({This, jLabel8})) end)((fun(Target_N69857) -> (get({Target_N69857, '$class'})):addContainerGap(Target_N69857) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout))))))))))))))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({JPanel2Layout, '$class'})):setVerticalGroup(JPanel2Layout, (fun(Target_N70606) -> (get({Target_N70606, '$class'})):addGroup(Target_N70606, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N70714) -> (get({Target_N70714, '$class'})):addGroup(Target_N70714, (fun(Target_N70774) -> (get({Target_N70774, '$class'})):addGroup(Target_N70774, (fun(Target_N71356) -> (get({Target_N71356, '$class'})):addComponent(Target_N71356, get({This, widthReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 22, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71363) -> (get({Target_N71363, '$class'})):addComponent(Target_N71363, get({This, jLabel5})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N70781) -> (get({Target_N70781, '$class'})):addGroup(Target_N70781, (fun(Target_N71053) -> (get({Target_N71053, '$class'})):addComponent(Target_N71053, get({This, heightReductionTextField1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71060) -> (get({Target_N71060, '$class'})):addComponent(Target_N71060, get({This, jLabel7})) end)((fun(Target_N71067) -> (get({Target_N71067, '$class'})):addComponent(Target_N71067, get({This, widthReductionTextField1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 22, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71074) -> (get({Target_N71074, '$class'})):addComponent(Target_N71074, get({This, jLabel8})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N70788) -> (get({Target_N70788, '$class'})):addGroup(Target_N70788, (fun(Target_N70856) -> (get({Target_N70856, '$class'})):addComponent(Target_N70856, get({This, heightReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70863) -> (get({Target_N70863, '$class'})):addComponent(Target_N70863, get({This, jLabel6})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))) end)((fun(Target_N70721) -> (get({Target_N70721, '$class'})):addGap(Target_N70721, 0, 16, get({'Short', 'MAX_VALUE'})) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout)))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N71653) -> (get({Target_N71653, '$class'})):addGroup(Target_N71653, (fun(Target_N71870) -> (get({Target_N71870, '$class'})):addContainerGap(Target_N71870) end)((fun(Target_N71877) -> (get({Target_N71877, '$class'})):addGroup(Target_N71877, (fun(Target_N71902) -> (get({Target_N71902, '$class'})):addGroup(Target_N71902, (fun(Target_N72104) -> (get({Target_N72104, '$class'})):addGap(Target_N72104, 0, 0, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72111) -> (get({Target_N72111, '$class'})):addGroup(Target_N72111, (fun(Target_N72136) -> (get({Target_N72136, '$class'})):addGroup(Target_N72136, (fun(Target_N72223) -> (get({Target_N72223, '$class'})):addComponent(Target_N72223, get({This, generateJButton})) end)((fun(Target_N72230) -> (get({Target_N72230, '$class'})):addPreferredGap(Target_N72230, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72237) -> (get({Target_N72237, '$class'})):addComponent(Target_N72237, get({This, writeOverOriginalJCheckBox})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((fun(Target_N72143) -> (get({Target_N72143, '$class'})):addComponent(Target_N72143, get({This, jLabel4})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((fun(Target_N71909) -> (get({Target_N71909, '$class'})):addGroup(Target_N71909, (fun(Target_N71977) -> (get({Target_N71977, '$class'})):addComponent(Target_N71977, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71984) -> (get({Target_N71984, '$class'})):addContainerGap(Target_N71984) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((fun(Target_N71660) -> (get({Target_N71660, '$class'})):addGroup(Target_N71660, (fun(Target_N71728) -> (get({Target_N71728, '$class'})):addGap(Target_N71728, 78, 78, 78) end)((fun(Target_N71735) -> (get({Target_N71735, '$class'})):addComponent(Target_N71735, get({This, jPanel2}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N72390) -> (get({Target_N72390, '$class'})):addGroup(Target_N72390, (fun(Target_N72458) -> (get({Target_N72458, '$class'})):addComponent(Target_N72458, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72465) -> (get({Target_N72465, '$class'})):addPreferredGap(Target_N72465, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72472) -> (get({Target_N72472, '$class'})):addComponent(Target_N72472, get({This, jLabel4})) end)((fun(Target_N72479) -> (get({Target_N72479, '$class'})):addPreferredGap(Target_N72479, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72486) -> (get({Target_N72486, '$class'})):addGroup(Target_N72486, (fun(Target_N72677) -> (get({Target_N72677, '$class'})):addComponent(Target_N72677, get({This, writeOverOriginalJCheckBox})) end)((fun(Target_N72684) -> (get({Target_N72684, '$class'})):addComponent(Target_N72684, get({This, generateJButton})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N72493) -> (get({Target_N72493, '$class'})):addPreferredGap(Target_N72493, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72500) -> (get({Target_N72500, '$class'})):addComponent(Target_N72500, get({This, jPanel2}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

writeOverOriginalJCheckBoxActionPerformed(This, Evt) ->
        ok.

generateJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

widthReductionTextFieldActionPerformed(This, Evt) ->
        ok.

widthReductionTextField1ActionPerformed(This, Evt) ->
        ok.

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

% throws IOException
visit(This, GeneratedBufferedImage, Name, Index) when (is_list(Name) orelse Name =:= undefined), is_integer(Index) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'VISIT'}), This, get({get({This, commonStrings}), 'VISIT'})),
        put({This, result}, GeneratedBufferedImage),
        (fun(Target_N74143) -> (get({Target_N74143, '$class'})):repaint(Target_N74143) end)((get({This, '$class'})):getParent(This)),
        put({local, file}, array:get(Index, (get({get({This, imageProcessorInput}), '$class'})):getFiles(get({This, imageProcessorInput})))),
        case (not (get({get({This, writeOverOriginalJCheckBox}), '$class'})):isSelected(get({This, writeOverOriginalJCheckBox}))) of
            true ->
            put({local, filePath}, (get({get({local, file}), '$class'})):getAbsolutePath(get({local, file}))),
            ExtensionIndex = allbinary_java:index_of(get({local, filePath}), get({get({This, imageStrings}), 'PNG_EXTENSION'})),
            put({local, filePath}, (fun(Target_N74383) -> (get({Target_N74383, '$class'})):toString(Target_N74383) end)((fun(Target_N74390) -> (get({Target_N74390, '$class'})):append(Target_N74390, get({get({This, imageStrings}), 'PNG_EXTENSION'})) end)((fun(Target_N74397) -> (get({Target_N74397, '$class'})):append(Target_N74397, Name) end)((fun(Target_N74404) -> (get({Target_N74404, '$class'})):append(Target_N74404, get({get({This, commonSeps}), 'UNDERSCORE'})) end)((fun(Target_N74411) -> (get({Target_N74411, '$class'})):append(Target_N74411, string:slice(get({local, filePath}), 0, (ExtensionIndex) - (0))) end)('StringMaker':new())))))),
            put({local, file}, 'File':new(get({local, filePath})));
            false -> ok
        end,
        IsWritten = 'ImageIO':write(get({This, result}), get({get({This, imageStrings}), 'PNG'}), get({local, file})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N74693) -> (get({Target_N74693, '$class'})):toString(Target_N74693) end)((fun(Target_N74700) -> (get({Target_N74700, '$class'})):appendboolean(Target_N74700, IsWritten) end)((fun(Target_N74707) -> (get({Target_N74707, '$class'})):append(Target_N74707, " Wrote: ") end)((fun(Target_N74714) -> (get({Target_N74714, '$class'})):append(Target_N74714, (fun(Target_N74750) -> (get({Target_N74750, '$class'})):toString(Target_N74750, get({local, file})) end)('StringUtil':getInstance())) end)((fun(Target_N74721) -> (get({Target_N74721, '$class'})):append(Target_N74721, "File: ") end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'RUN'})).

