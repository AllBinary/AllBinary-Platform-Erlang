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
% import java.awt.image.BufferedImage
% import java.awt.image.Raster
% import java.io.File
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.FileWrapperUtil
% import org.allbinary.media.image.ImagePersistanceUtil
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageProcessorInputCompositeInterface
% import org.allbinary.media.image.ImageUtil
% import org.allbinary.string.CommonStrings

-module('ResizeImageJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageProcessorInputCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageProcessorInput}, undefined),
    put({This, aboveJButton}, undefined),
    put({This, adjustFor16AboveJButton}, undefined),
    put({This, adjustFor16BelowJButton}, undefined),
    put({This, floatPercentJTextField}, undefined),
    put({This, jComboBox1}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLabel3}, undefined),
    put({This, jTextField1}, undefined),
    put({This, jTextField2}, undefined),
    put({This, updateJButton}, undefined),
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
        put({This, imageProcessorInput}, ImageProcessorInput),
        NumberStringArray = array:new(101, {default, undefined}),
        array:set(0, allbinary_java:to_string((-1)), NumberStringArray),
        lists:foreach(fun(Index) ->
            array:set(Index, allbinary_java:to_string(Index), NumberStringArray)
        end, lists:seq(1, 100 - 1)),
        (get({get({This, jComboBox1}), '$class'})):setModel(get({This, jComboBox1}), 'DefaultComboBoxModel':new(NumberStringArray)),
        Araster = (fun(Target_N66409) -> (get({Target_N66409, '$class'})):getAlphaRaster(Target_N66409) end)(array:get(0, (get({get({This, imageProcessorInput}), '$class'})):getBufferedImageArray(get({This, imageProcessorInput})))),
        case (Araster =:= undefined) of
            true ->
            io:format("~ts~n", [allbinary_java:to_string("there is no Alpha channel!!!!!!!!!")]);
            false ->
            io:format("~ts~n", [allbinary_java:to_string("Alpha channel found !")])
        end.

process(This) ->
        (fun(Target_N66627) -> (get({Target_N66627, '$class'})):start(Target_N66627) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

update(This) ->
        (fun(Target_N68100) -> (get({Target_N68100, '$class'})):start(Target_N68100) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

updateFor16Above(This) ->
        (fun(Target_N68799) -> (get({Target_N68799, '$class'})):start(Target_N68799) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

updateFor16Below(This) ->
        (fun(Target_N69534) -> (get({Target_N69534, '$class'})):start(Target_N69534) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

initComponents(This) ->
        put({This, jLabel1}, 'JLabel':new()),
        put({This, jComboBox1}, 'JComboBox':new()),
        put({This, aboveJButton}, 'JButton':new()),
        put({This, jTextField1}, 'JTextField':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, jTextField2}, 'JTextField':new()),
        put({This, updateJButton}, 'JButton':new()),
        put({This, floatPercentJTextField}, 'JTextField':new()),
        put({This, adjustFor16AboveJButton}, 'JButton':new()),
        put({This, adjustFor16BelowJButton}, 'JButton':new()),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Percent:"),
        (get({get({This, jComboBox1}), '$class'})):setModel(get({This, jComboBox1}), 'DefaultComboBoxModel':new(array:from_list(["Item 1", "Item 2", "Item 3", "Item 4"]))),
        (get({get({This, aboveJButton}), '$class'})):setText(get({This, aboveJButton}), "Process"),
        (get({get({This, aboveJButton}), '$class'})):addActionListener(get({This, aboveJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Width:"),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Height:"),
        (get({get({This, updateJButton}), '$class'})):setText(get({This, updateJButton}), "Update"),
        (get({get({This, updateJButton}), '$class'})):addActionListener(get({This, updateJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, floatPercentJTextField}), '$class'})):setText(get({This, floatPercentJTextField}), "-1.000000"),
        (get({get({This, floatPercentJTextField}), '$class'})):setMinimumSize(get({This, floatPercentJTextField}), 'Dimension':new(120, 22)),
        (get({get({This, adjustFor16AboveJButton}), '$class'})):setText(get({This, adjustFor16AboveJButton}), "Adjust for 16 Above"),
        (get({get({This, adjustFor16AboveJButton}), '$class'})):addActionListener(get({This, adjustFor16AboveJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, adjustFor16BelowJButton}), '$class'})):setText(get({This, adjustFor16BelowJButton}), "Adjust for 16 Below"),
        (get({get({This, adjustFor16BelowJButton}), '$class'})):addActionListener(get({This, adjustFor16BelowJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N72104) -> (get({Target_N72104, '$class'})):addGroup(Target_N72104, (fun(Target_N72901) -> (get({Target_N72901, '$class'})):addGap(Target_N72901, 0, 250, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72908) -> (get({Target_N72908, '$class'})):addComponent(Target_N72908, get({This, aboveJButton})) end)((fun(Target_N72915) -> (get({Target_N72915, '$class'})):addPreferredGap(Target_N72915, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72922) -> (get({Target_N72922, '$class'})):addComponent(Target_N72922, get({This, updateJButton})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))))) end)((fun(Target_N72111) -> (get({Target_N72111, '$class'})):addGroup(Target_N72111, (fun(Target_N72179) -> (get({Target_N72179, '$class'})):addContainerGap(Target_N72179, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72186) -> (get({Target_N72186, '$class'})):addGroup(Target_N72186, (fun(Target_N72631) -> (get({Target_N72631, '$class'})):addComponent(Target_N72631, get({This, adjustFor16BelowJButton})) end)((fun(Target_N72638) -> (get({Target_N72638, '$class'})):addComponent(Target_N72638, get({This, adjustFor16AboveJButton})) end)((fun(Target_N72645) -> (get({Target_N72645, '$class'})):addComponent(Target_N72645, get({This, floatPercentJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))) end)((fun(Target_N72193) -> (get({Target_N72193, '$class'})):addPreferredGap(Target_N72193, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'UNRELATED'})) end)((fun(Target_N72200) -> (get({Target_N72200, '$class'})):addGroup(Target_N72200, (fun(Target_N72411) -> (get({Target_N72411, '$class'})):addComponent(Target_N72411, get({This, jTextField2})) end)((fun(Target_N72418) -> (get({Target_N72418, '$class'})):addComponent(Target_N72418, get({This, jTextField1})) end)((fun(Target_N72425) -> (get({Target_N72425, '$class'})):addComponent(Target_N72425, get({This, jComboBox1}), 0, get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), false))))) end)((fun(Target_N72207) -> (get({Target_N72207, '$class'})):addPreferredGap(Target_N72207, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N72214) -> (get({Target_N72214, '$class'})):addGroup(Target_N72214, (fun(Target_N72247) -> (get({Target_N72247, '$class'})):addComponent(Target_N72247, get({This, jLabel3})) end)((fun(Target_N72254) -> (get({Target_N72254, '$class'})):addComponent(Target_N72254, get({This, jLabel2})) end)((fun(Target_N72261) -> (get({Target_N72261, '$class'})):addComponent(Target_N72261, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))) end)((fun(Target_N72221) -> (get({Target_N72221, '$class'})):addContainerGap(Target_N72221) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N73066) -> (get({Target_N73066, '$class'})):addGroup(Target_N73066, (fun(Target_N73134) -> (get({Target_N73134, '$class'})):addContainerGap(Target_N73134, 175, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N73141) -> (get({Target_N73141, '$class'})):addGroup(Target_N73141, (fun(Target_N74064) -> (get({Target_N74064, '$class'})):addComponent(Target_N74064, get({This, updateJButton})) end)((fun(Target_N74071) -> (get({Target_N74071, '$class'})):addComponent(Target_N74071, get({This, aboveJButton})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N73148) -> (get({Target_N73148, '$class'})):addGap(Target_N73148, 18, 18, 18) end)((fun(Target_N73155) -> (get({Target_N73155, '$class'})):addGroup(Target_N73155, (fun(Target_N73832) -> (get({Target_N73832, '$class'})):addComponent(Target_N73832, get({This, adjustFor16BelowJButton})) end)((fun(Target_N73839) -> (get({Target_N73839, '$class'})):addComponent(Target_N73839, get({This, jTextField2}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73846) -> (get({Target_N73846, '$class'})):addComponent(Target_N73846, get({This, jLabel3})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'})))))) end)((fun(Target_N73162) -> (get({Target_N73162, '$class'})):addPreferredGap(Target_N73162, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73169) -> (get({Target_N73169, '$class'})):addGroup(Target_N73169, (fun(Target_N73572) -> (get({Target_N73572, '$class'})):addComponent(Target_N73572, get({This, adjustFor16AboveJButton})) end)((fun(Target_N73579) -> (get({Target_N73579, '$class'})):addComponent(Target_N73579, get({This, jLabel2})) end)((fun(Target_N73586) -> (get({Target_N73586, '$class'})):addComponent(Target_N73586, get({This, jTextField1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'})))))) end)((fun(Target_N73176) -> (get({Target_N73176, '$class'})):addPreferredGap(Target_N73176, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73183) -> (get({Target_N73183, '$class'})):addGroup(Target_N73183, (fun(Target_N73216) -> (get({Target_N73216, '$class'})):addComponent(Target_N73216, get({This, floatPercentJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73223) -> (get({Target_N73223, '$class'})):addComponent(Target_N73223, get({This, jComboBox1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73230) -> (get({Target_N73230, '$class'})):addComponent(Target_N73230, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'})))))) end)((fun(Target_N73190) -> (get({Target_N73190, '$class'})):addContainerGap(Target_N73190) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

aboveJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

updateJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):update(This).

adjustFor16AboveJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateFor16Above(This).

adjustFor16BelowJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateFor16Below(This).

