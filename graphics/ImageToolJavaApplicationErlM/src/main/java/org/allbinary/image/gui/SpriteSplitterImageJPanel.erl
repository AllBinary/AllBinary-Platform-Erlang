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
% import org.allbinary.media.image.ImageProcessedVisitor
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageStrings
% import org.allbinary.media.image.SpriteSplitterUtil
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('SpriteSplitterImageJPanel').
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
    put({This, increaseHeightTextField}, undefined),
    put({This, increaseWidthTextField}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLabel3}, undefined),
    put({This, jLabel4}, undefined),
    put({This, jLabel5}, undefined),
    put({This, jLabel6}, undefined),
    put({This, jLabel7}, undefined),
    put({This, jLabel8}, undefined),
    put({This, jPanel1}, undefined),
    put({This, jPanel2}, undefined),
    put({This, spriteTypeJComboBox}, undefined),
    put({This, totalAnimationsJComboBox}, undefined),
    put({This, totalFramesJComboBox}, undefined),
    put({This, widthReductionTextField}, undefined),
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
        (fun(Target_N66415) -> (get({Target_N66415, '$class'})):start(Target_N66415) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

initComponents(This) ->
        put({This, writeOverOriginalJCheckBox}, 'JCheckBox':new()),
        put({This, widthReductionTextField}, 'JTextField':new()),
        put({This, jLabel5}, 'JLabel':new()),
        put({This, jPanel1}, 'JPanel':new() % Java anonymous class body: implement it as a module
%             ok % paint
),
        put({This, jLabel4}, 'JLabel':new()),
        put({This, jLabel6}, 'JLabel':new()),
        put({This, heightReductionTextField}, 'JTextField':new()),
        put({This, generateJButton}, 'JButton':new()),
        put({This, jPanel2}, 'JPanel':new()),
        put({This, jLabel1}, 'JLabel':new()),
        put({This, totalFramesJComboBox}, 'JComboBox':new()),
        Size = 70,
        AnimationStringArray2 = array:new((Size - 1), {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set((Index - 1), allbinary_java:to_string(Index), AnimationStringArray2)
        end, lists:seq(1, Size - 1)),
        (get({get({This, totalFramesJComboBox}), '$class'})):setModel(get({This, totalFramesJComboBox}), 'DefaultComboBoxModel':new(AnimationStringArray2)),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, totalAnimationsJComboBox}, 'JComboBox':new()),
        AnimationStringArray = array:new((Size - 1), {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set((Index - 1), allbinary_java:to_string(Index), AnimationStringArray)
        end, lists:seq(1, Size - 1)),
        (get({get({This, totalAnimationsJComboBox}), '$class'})):setModel(get({This, totalAnimationsJComboBox}), 'DefaultComboBoxModel':new(AnimationStringArray)),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, spriteTypeJComboBox}, 'JComboBox':new()),
        (get({get({This, spriteTypeJComboBox}), '$class'})):setModel(get({This, spriteTypeJComboBox}), 'DefaultComboBoxModel':new(array:from_list([get({(get({get({get({get({get({'org', allbinary}), media}), image}), 'SpriteSplitterUtil'}), '$class'})):getInstance(get({get({get({get({'org', allbinary}), media}), image}), 'SpriteSplitterUtil'})), 'DIRECTIONAL_ANIMATIONS'}), get({(get({get({get({get({get({'org', allbinary}), media}), image}), 'SpriteSplitterUtil'}), '$class'})):getInstance(get({get({get({get({'org', allbinary}), media}), image}), 'SpriteSplitterUtil'})), 'HORIZONTAL_ANIMATIONS'}), get({(get({get({get({get({get({'org', allbinary}), media}), image}), 'SpriteSplitterUtil'}), '$class'})):getInstance(get({get({get({get({'org', allbinary}), media}), image}), 'SpriteSplitterUtil'})), 'HORIZONTAL_SPRITE'})]))),
        put({This, jLabel7}, 'JLabel':new()),
        put({This, increaseWidthTextField}, 'JTextField':new()),
        put({This, jLabel8}, 'JLabel':new()),
        put({This, increaseHeightTextField}, 'JTextField':new()),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):setText(get({This, writeOverOriginalJCheckBox}), "Write Over Original"),
        (get({get({This, writeOverOriginalJCheckBox}), '$class'})):addActionListener(get({This, writeOverOriginalJCheckBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, widthReductionTextField}), '$class'})):setText(get({This, widthReductionTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, widthReductionTextField}), '$class'})):addActionListener(get({This, widthReductionTextField}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel5}), '$class'})):setText(get({This, jLabel5}), "Less Width:"),
        (get({get({This, jLabel4}), '$class'})):setText(get({This, jLabel4}), "Results:"),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N69831) -> (get({Target_N69831, '$class'})):addGroup(Target_N69831, (fun(Target_N69899) -> (get({Target_N69899, '$class'})):addGap(Target_N69899, 0, 0, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69906) -> (get({Target_N69906, '$class'})):addComponent(Target_N69906, get({This, jLabel4})) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout)))) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N69994) -> (get({Target_N69994, '$class'})):addGroup(Target_N69994, (fun(Target_N70062) -> (get({Target_N70062, '$class'})):addGap(Target_N70062, 0, 184, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N70069) -> (get({Target_N70069, '$class'})):addComponent(Target_N70069, get({This, jLabel4})) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout)))) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, jLabel6}), '$class'})):setText(get({This, jLabel6}), "Less Height:"),
        (get({get({This, heightReductionTextField}), '$class'})):setText(get({This, heightReductionTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, generateJButton}), '$class'})):setText(get({This, generateJButton}), "Generate"),
        (get({get({This, generateJButton}), '$class'})):addActionListener(get({This, generateJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Row Total:"),
        (get({get({This, totalFramesJComboBox}), '$class'})):setSelectedIndex(get({This, totalFramesJComboBox}), 1),
        (get({get({This, totalFramesJComboBox}), '$class'})):addActionListener(get({This, totalFramesJComboBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Column Total :"),
        (get({get({This, totalAnimationsJComboBox}), '$class'})):setSelectedIndex(get({This, totalAnimationsJComboBox}), 3),
        (get({get({This, totalAnimationsJComboBox}), '$class'})):addActionListener(get({This, totalAnimationsJComboBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Type:"),
        (get({get({This, spriteTypeJComboBox}), '$class'})):addActionListener(get({This, spriteTypeJComboBox}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        JPanel2Layout = 'GroupLayout':new(get({This, jPanel2})),
        (get({get({This, jPanel2}), '$class'})):setLayout(get({This, jPanel2}), JPanel2Layout),
        (get({JPanel2Layout, '$class'})):setHorizontalGroup(JPanel2Layout, (fun(Target_N71164) -> (get({Target_N71164, '$class'})):addGroup(Target_N71164, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N71272) -> (get({Target_N71272, '$class'})):addContainerGap(Target_N71272, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71279) -> (get({Target_N71279, '$class'})):addComponent(Target_N71279, get({This, spriteTypeJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 172, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71286) -> (get({Target_N71286, '$class'})):addPreferredGap(Target_N71286, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71293) -> (get({Target_N71293, '$class'})):addComponent(Target_N71293, get({This, jLabel3})) end)((fun(Target_N71300) -> (get({Target_N71300, '$class'})):addPreferredGap(Target_N71300, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71307) -> (get({Target_N71307, '$class'})):addComponent(Target_N71307, get({This, totalAnimationsJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 39, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71314) -> (get({Target_N71314, '$class'})):addPreferredGap(Target_N71314, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71321) -> (get({Target_N71321, '$class'})):addComponent(Target_N71321, get({This, jLabel2})) end)((fun(Target_N71328) -> (get({Target_N71328, '$class'})):addPreferredGap(Target_N71328, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71335) -> (get({Target_N71335, '$class'})):addComponent(Target_N71335, get({This, totalFramesJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 48, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71342) -> (get({Target_N71342, '$class'})):addPreferredGap(Target_N71342, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N71349) -> (get({Target_N71349, '$class'})):addComponent(Target_N71349, get({This, jLabel1})) end)((fun(Target_N71356) -> (get({Target_N71356, '$class'})):addContainerGap(Target_N71356) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout))))))))))))))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({JPanel2Layout, '$class'})):setVerticalGroup(JPanel2Layout, (fun(Target_N71953) -> (get({Target_N71953, '$class'})):addGroup(Target_N71953, (fun(Target_N72021) -> (get({Target_N72021, '$class'})):addGroup(Target_N72021, (fun(Target_N72105) -> (get({Target_N72105, '$class'})):addComponent(Target_N72105, get({This, spriteTypeJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72112) -> (get({Target_N72112, '$class'})):addComponent(Target_N72112, get({This, jLabel3})) end)((fun(Target_N72119) -> (get({Target_N72119, '$class'})):addComponent(Target_N72119, get({This, totalAnimationsJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72126) -> (get({Target_N72126, '$class'})):addComponent(Target_N72126, get({This, jLabel2})) end)((fun(Target_N72133) -> (get({Target_N72133, '$class'})):addComponent(Target_N72133, get({This, totalFramesJComboBox}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72140) -> (get({Target_N72140, '$class'})):addComponent(Target_N72140, get({This, jLabel1})) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))))) end)((fun(Target_N72028) -> (get({Target_N72028, '$class'})):addContainerGap(Target_N72028, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({JPanel2Layout, '$class'})):createSequentialGroup(JPanel2Layout)))) end)((get({JPanel2Layout, '$class'})):createParallelGroup(JPanel2Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({get({This, jLabel7}), '$class'})):setText(get({This, jLabel7}), "More Width:"),
        (get({get({This, increaseWidthTextField}), '$class'})):setText(get({This, increaseWidthTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, increaseWidthTextField}), '$class'})):addActionListener(get({This, increaseWidthTextField}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel8}), '$class'})):setText(get({This, jLabel8}), "More Height:"),
        (get({get({This, increaseHeightTextField}), '$class'})):setText(get({This, increaseHeightTextField}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N73013) -> (get({Target_N73013, '$class'})):addGroup(Target_N73013, (fun(Target_N73202) -> (get({Target_N73202, '$class'})):addContainerGap(Target_N73202) end)((fun(Target_N73209) -> (get({Target_N73209, '$class'})):addGroup(Target_N73209, (fun(Target_N73242) -> (get({Target_N73242, '$class'})):addGroup(Target_N73242, (fun(Target_N73409) -> (get({Target_N73409, '$class'})):addGap(Target_N73409, 0, 0, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N73416) -> (get({Target_N73416, '$class'})):addGroup(Target_N73416, (fun(Target_N73441) -> (get({Target_N73441, '$class'})):addGroup(Target_N73441, (fun(Target_N73625) -> (get({Target_N73625, '$class'})):addComponent(Target_N73625, get({This, increaseHeightTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 46, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73632) -> (get({Target_N73632, '$class'})):addPreferredGap(Target_N73632, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73639) -> (get({Target_N73639, '$class'})):addComponent(Target_N73639, get({This, jLabel8})) end)((fun(Target_N73646) -> (get({Target_N73646, '$class'})):addPreferredGap(Target_N73646, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73653) -> (get({Target_N73653, '$class'})):addComponent(Target_N73653, get({This, increaseWidthTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 41, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73660) -> (get({Target_N73660, '$class'})):addPreferredGap(Target_N73660, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73667) -> (get({Target_N73667, '$class'})):addComponent(Target_N73667, get({This, jLabel7})) end)((fun(Target_N73674) -> (get({Target_N73674, '$class'})):addPreferredGap(Target_N73674, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73681) -> (get({Target_N73681, '$class'})):addComponent(Target_N73681, get({This, heightReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 46, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73688) -> (get({Target_N73688, '$class'})):addPreferredGap(Target_N73688, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73695) -> (get({Target_N73695, '$class'})):addComponent(Target_N73695, get({This, jLabel6})) end)((fun(Target_N73702) -> (get({Target_N73702, '$class'})):addPreferredGap(Target_N73702, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73709) -> (get({Target_N73709, '$class'})):addComponent(Target_N73709, get({This, widthReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 41, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73716) -> (get({Target_N73716, '$class'})):addPreferredGap(Target_N73716, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73723) -> (get({Target_N73723, '$class'})):addComponent(Target_N73723, get({This, jLabel5})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))))))))))) end)((fun(Target_N73448) -> (get({Target_N73448, '$class'})):addGroup(Target_N73448, (fun(Target_N73516) -> (get({Target_N73516, '$class'})):addComponent(Target_N73516, get({This, generateJButton})) end)((fun(Target_N73523) -> (get({Target_N73523, '$class'})):addPreferredGap(Target_N73523, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73530) -> (get({Target_N73530, '$class'})):addComponent(Target_N73530, get({This, writeOverOriginalJCheckBox})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((fun(Target_N73249) -> (get({Target_N73249, '$class'})):addComponent(Target_N73249, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N73216) -> (get({Target_N73216, '$class'})):addContainerGap(Target_N73216) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((fun(Target_N73020) -> (get({Target_N73020, '$class'})):addGroup(Target_N73020, (fun(Target_N73088) -> (get({Target_N73088, '$class'})):addGap(Target_N73088, 78, 78, 78) end)((fun(Target_N73095) -> (get({Target_N73095, '$class'})):addComponent(Target_N73095, get({This, jPanel2}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 415, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N74484) -> (get({Target_N74484, '$class'})):addGroup(Target_N74484, (fun(Target_N74552) -> (get({Target_N74552, '$class'})):addComponent(Target_N74552, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74559) -> (get({Target_N74559, '$class'})):addPreferredGap(Target_N74559, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74566) -> (get({Target_N74566, '$class'})):addGroup(Target_N74566, (fun(Target_N75498) -> (get({Target_N75498, '$class'})):addComponent(Target_N75498, get({This, generateJButton})) end)((fun(Target_N75505) -> (get({Target_N75505, '$class'})):addComponent(Target_N75505, get({This, writeOverOriginalJCheckBox})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N74573) -> (get({Target_N74573, '$class'})):addPreferredGap(Target_N74573, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74580) -> (get({Target_N74580, '$class'})):addGroup(Target_N74580, (fun(Target_N74771) -> (get({Target_N74771, '$class'})):addGroup(Target_N74771, (fun(Target_N75149) -> (get({Target_N75149, '$class'})):addComponent(Target_N75149, get({This, heightReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N75156) -> (get({Target_N75156, '$class'})):addComponent(Target_N75156, get({This, jLabel6})) end)((fun(Target_N75163) -> (get({Target_N75163, '$class'})):addComponent(Target_N75163, get({This, widthReductionTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 22, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N75170) -> (get({Target_N75170, '$class'})):addComponent(Target_N75170, get({This, jLabel5})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N74778) -> (get({Target_N74778, '$class'})):addGroup(Target_N74778, (fun(Target_N74846) -> (get({Target_N74846, '$class'})):addComponent(Target_N74846, get({This, increaseHeightTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74853) -> (get({Target_N74853, '$class'})):addComponent(Target_N74853, get({This, jLabel8})) end)((fun(Target_N74860) -> (get({Target_N74860, '$class'})):addComponent(Target_N74860, get({This, increaseWidthTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 22, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74867) -> (get({Target_N74867, '$class'})):addComponent(Target_N74867, get({This, jLabel7})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N74587) -> (get({Target_N74587, '$class'})):addPreferredGap(Target_N74587, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74594) -> (get({Target_N74594, '$class'})):addComponent(Target_N74594, get({This, jPanel2}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

writeOverOriginalJCheckBoxActionPerformed(This, Evt) ->
        ok.

generateJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

spriteTypeJComboBoxActionPerformed(This, Evt) ->
        SpriteSplitterUtil = 'SpriteSplitterUtil':getInstance(),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), array:get((get({get({This, spriteTypeJComboBox}), '$class'})):getSelectedIndex(get({This, spriteTypeJComboBox})), get({SpriteSplitterUtil, 'ANIMATIONS_LABELS'}))),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), array:get(((get({get({This, spriteTypeJComboBox}), '$class'})):getSelectedIndex(get({This, spriteTypeJComboBox})) + 1), get({SpriteSplitterUtil, 'ANIMATIONS_LABELS'}))).

totalAnimationsJComboBoxActionPerformed(This, Evt) ->
        ok.

totalFramesJComboBoxActionPerformed(This, Evt) ->
        ok.

widthReductionTextFieldActionPerformed(This, Evt) ->
        ok.

increaseWidthTextFieldActionPerformed(This, Evt) ->
        ok.

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

% throws IOException
visit(This, GeneratedBufferedImage, Name, Index) when (is_list(Name) orelse Name =:= undefined), is_integer(Index) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'VISIT'}), This, get({get({This, commonStrings}), 'VISIT'})),
        put({This, result}, GeneratedBufferedImage),
        (fun(Target_N77621) -> (get({Target_N77621, '$class'})):repaint(Target_N77621) end)((get({This, '$class'})):getParent(This)),
        put({local, file}, array:get(Index, (get({get({This, imageProcessorInput}), '$class'})):getFiles(get({This, imageProcessorInput})))),
        case (not (get({get({This, writeOverOriginalJCheckBox}), '$class'})):isSelected(get({This, writeOverOriginalJCheckBox}))) of
            true ->
            put({local, filePath}, (get({get({local, file}), '$class'})):getAbsolutePath(get({local, file}))),
            ExtensionIndex = allbinary_java:index_of(get({local, filePath}), get({get({This, imageStrings}), 'PNG_EXTENSION'})),
            put({local, filePath}, (fun(Target_N77861) -> (get({Target_N77861, '$class'})):toString(Target_N77861) end)((fun(Target_N77868) -> (get({Target_N77868, '$class'})):append(Target_N77868, get({get({This, imageStrings}), 'PNG_EXTENSION'})) end)((fun(Target_N77875) -> (get({Target_N77875, '$class'})):append(Target_N77875, Name) end)((fun(Target_N77882) -> (get({Target_N77882, '$class'})):append(Target_N77882, get({get({This, commonSeps}), 'UNDERSCORE'})) end)((fun(Target_N77889) -> (get({Target_N77889, '$class'})):append(Target_N77889, string:slice(get({local, filePath}), 0, (ExtensionIndex) - (0))) end)('StringMaker':new())))))),
            put({local, file}, 'File':new(get({local, filePath})));
            false -> ok
        end,
        IsWritten = 'ImageIO':write(get({This, result}), get({get({This, imageStrings}), 'PNG'}), get({local, file})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N78171) -> (get({Target_N78171, '$class'})):toString(Target_N78171) end)((fun(Target_N78178) -> (get({Target_N78178, '$class'})):appendboolean(Target_N78178, IsWritten) end)((fun(Target_N78185) -> (get({Target_N78185, '$class'})):append(Target_N78185, " Wrote: ") end)((fun(Target_N78192) -> (get({Target_N78192, '$class'})):append(Target_N78192, (fun(Target_N78228) -> (get({Target_N78228, '$class'})):toString(Target_N78228, get({local, file})) end)('StringUtil':getInstance())) end)((fun(Target_N78199) -> (get({Target_N78199, '$class'})):append(Target_N78199, "File: ") end)('StringMaker':new()))))), This, get({get({This, commonStrings}), 'RUN'})).

