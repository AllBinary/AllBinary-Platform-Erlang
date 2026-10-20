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
% import org.allbinary.media.image.analysis.ImageAnalysisResults
% import org.allbinary.media.image.analysis.ImageColorRangeResults
% import org.allbinary.media.image.analysis.ImageColorResults
% import org.allbinary.string.CommonPhoneStrings

-module('ImageAnalysisResultsJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, avgBlueJTextField}, undefined),
    put({This, avgGreenJTextField}, undefined),
    put({This, avgRedJTextField}, undefined),
    put({This, jComboBox1}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel10}, undefined),
    put({This, jLabel11}, undefined),
    put({This, jLabel12}, undefined),
    put({This, jLabel13}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLabel3}, undefined),
    put({This, jLabel4}, undefined),
    put({This, jLabel5}, undefined),
    put({This, jLabel6}, undefined),
    put({This, jLabel7}, undefined),
    put({This, jLabel8}, undefined),
    put({This, jLabel9}, undefined),
    put({This, matchingPixelsJTextField}, undefined),
    put({This, maxBlueJTextField}, undefined),
    put({This, maxGreenJTextField}, undefined),
    put({This, maxRedJTextField}, undefined),
    put({This, minBlueJTextField}, undefined),
    put({This, minGreenJTextField}, undefined),
    put({This, minRedJTextField}, undefined),
    put({This, percentMatchingJTextField}, undefined),
    put({This, totalPixelsJTextField}, undefined),
    ok.


new(ImageAnalysisResultsArray) when (is_tuple(ImageAnalysisResultsArray) orelse ImageAnalysisResultsArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageAnalysisResultsArray),
    This.

'$init'(This, ImageAnalysisResultsArray) when (is_tuple(ImageAnalysisResultsArray) orelse ImageAnalysisResultsArray =:= undefined) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        ImageAnalysisResults = array:get(0, ImageAnalysisResultsArray),
        (get({This, '$class'})):updateImageColorRangeResults(This, ImageAnalysisResults).

initComponents(This) ->
        put({This, jLabel1}, 'JLabel':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, percentMatchingJTextField}, 'JTextField':new()),
        put({This, totalPixelsJTextField}, 'JTextField':new()),
        put({This, matchingPixelsJTextField}, 'JTextField':new()),
        put({This, jComboBox1}, 'JComboBox':new()),
        put({This, jLabel4}, 'JLabel':new()),
        put({This, jLabel5}, 'JLabel':new()),
        put({This, jLabel6}, 'JLabel':new()),
        put({This, jLabel7}, 'JLabel':new()),
        put({This, avgRedJTextField}, 'JTextField':new()),
        put({This, avgGreenJTextField}, 'JTextField':new()),
        put({This, avgBlueJTextField}, 'JTextField':new()),
        put({This, minGreenJTextField}, 'JTextField':new()),
        put({This, jLabel8}, 'JLabel':new()),
        put({This, jLabel9}, 'JLabel':new()),
        put({This, jLabel10}, 'JLabel':new()),
        put({This, minRedJTextField}, 'JTextField':new()),
        put({This, minBlueJTextField}, 'JTextField':new()),
        put({This, jLabel11}, 'JLabel':new()),
        put({This, jLabel12}, 'JLabel':new()),
        put({This, jLabel13}, 'JLabel':new()),
        put({This, maxRedJTextField}, 'JTextField':new()),
        put({This, maxGreenJTextField}, 'JTextField':new()),
        put({This, maxBlueJTextField}, 'JTextField':new()),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Matching Pixels:"),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Total Pixels:"),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Percent Matching:"),
        (get({get({This, percentMatchingJTextField}), '$class'})):setEditable(get({This, percentMatchingJTextField}), false),
        (get({get({This, totalPixelsJTextField}), '$class'})):setEditable(get({This, totalPixelsJTextField}), false),
        (get({get({This, matchingPixelsJTextField}), '$class'})):setEditable(get({This, matchingPixelsJTextField}), false),
        (get({get({This, jComboBox1}), '$class'})):setModel(get({This, jComboBox1}), 'DefaultComboBoxModel':new(array:from_list([get({'CommonPhoneStrings':getInstance(), 'ONE'})]))),
        (get({get({This, jComboBox1}), '$class'})):setEnabled(get({This, jComboBox1}), false),
        (get({get({This, jLabel4}), '$class'})):setText(get({This, jLabel4}), "Image:"),
        (get({get({This, jLabel5}), '$class'})):setText(get({This, jLabel5}), "Average Red:"),
        (get({get({This, jLabel6}), '$class'})):setText(get({This, jLabel6}), "Average Green:"),
        (get({get({This, jLabel7}), '$class'})):setText(get({This, jLabel7}), "Average Blue:"),
        (get({get({This, avgRedJTextField}), '$class'})):setEditable(get({This, avgRedJTextField}), false),
        (get({get({This, avgGreenJTextField}), '$class'})):setEditable(get({This, avgGreenJTextField}), false),
        (get({get({This, avgBlueJTextField}), '$class'})):setEditable(get({This, avgBlueJTextField}), false),
        (get({get({This, minGreenJTextField}), '$class'})):setEditable(get({This, minGreenJTextField}), false),
        (get({get({This, jLabel8}), '$class'})):setText(get({This, jLabel8}), "Min Red:"),
        (get({get({This, jLabel9}), '$class'})):setText(get({This, jLabel9}), "Min Green:"),
        (get({get({This, jLabel10}), '$class'})):setText(get({This, jLabel10}), "Min Blue:"),
        (get({get({This, minRedJTextField}), '$class'})):setEditable(get({This, minRedJTextField}), false),
        (get({get({This, minBlueJTextField}), '$class'})):setEditable(get({This, minBlueJTextField}), false),
        (get({get({This, jLabel11}), '$class'})):setText(get({This, jLabel11}), "Max Red:"),
        (get({get({This, jLabel12}), '$class'})):setText(get({This, jLabel12}), "Max Green:"),
        (get({get({This, jLabel13}), '$class'})):setText(get({This, jLabel13}), "Max Blue:"),
        (get({get({This, maxRedJTextField}), '$class'})):setEditable(get({This, maxRedJTextField}), false),
        (get({get({This, maxGreenJTextField}), '$class'})):setEditable(get({This, maxGreenJTextField}), false),
        (get({get({This, maxBlueJTextField}), '$class'})):setEditable(get({This, maxBlueJTextField}), false),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N68154) -> (get({Target_N68154, '$class'})):addGroup(Target_N68154, (fun(Target_N68222) -> (get({Target_N68222, '$class'})):addContainerGap(Target_N68222, 18, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68229) -> (get({Target_N68229, '$class'})):addGroup(Target_N68229, (fun(Target_N69385) -> (get({Target_N69385, '$class'})):addComponent(Target_N69385, get({This, maxBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 82, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69392) -> (get({Target_N69392, '$class'})):addComponent(Target_N69392, get({This, maxRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 82, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69399) -> (get({Target_N69399, '$class'})):addComponent(Target_N69399, get({This, minBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 82, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69406) -> (get({Target_N69406, '$class'})):addComponent(Target_N69406, get({This, minGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 82, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69413) -> (get({Target_N69413, '$class'})):addComponent(Target_N69413, get({This, maxGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 82, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N69420) -> (get({Target_N69420, '$class'})):addComponent(Target_N69420, get({This, minRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 82, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))))))) end)((fun(Target_N68236) -> (get({Target_N68236, '$class'})):addPreferredGap(Target_N68236, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68243) -> (get({Target_N68243, '$class'})):addGroup(Target_N68243, (fun(Target_N69164) -> (get({Target_N69164, '$class'})):addComponent(Target_N69164, get({This, jLabel11})) end)((fun(Target_N69171) -> (get({Target_N69171, '$class'})):addComponent(Target_N69171, get({This, jLabel10})) end)((fun(Target_N69178) -> (get({Target_N69178, '$class'})):addComponent(Target_N69178, get({This, jLabel9})) end)((fun(Target_N69185) -> (get({Target_N69185, '$class'})):addComponent(Target_N69185, get({This, jLabel8})) end)((fun(Target_N69192) -> (get({Target_N69192, '$class'})):addComponent(Target_N69192, get({This, jLabel13})) end)((fun(Target_N69199) -> (get({Target_N69199, '$class'})):addComponent(Target_N69199, get({This, jLabel12})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))))))) end)((fun(Target_N68250) -> (get({Target_N68250, '$class'})):addPreferredGap(Target_N68250, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68257) -> (get({Target_N68257, '$class'})):addGroup(Target_N68257, (fun(Target_N68544) -> (get({Target_N68544, '$class'})):addComponent(Target_N68544, get({This, matchingPixelsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 81, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68551) -> (get({Target_N68551, '$class'})):addComponent(Target_N68551, get({This, percentMatchingJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 81, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68558) -> (get({Target_N68558, '$class'})):addComponent(Target_N68558, get({This, totalPixelsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 81, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68565) -> (get({Target_N68565, '$class'})):addComponent(Target_N68565, get({This, avgRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 81, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68572) -> (get({Target_N68572, '$class'})):addComponent(Target_N68572, get({This, avgGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 81, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68579) -> (get({Target_N68579, '$class'})):addComponent(Target_N68579, get({This, avgBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 81, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N68586) -> (get({Target_N68586, '$class'})):addComponent(Target_N68586, get({This, jComboBox1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 81, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))))))) end)((fun(Target_N68264) -> (get({Target_N68264, '$class'})):addPreferredGap(Target_N68264, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N68271) -> (get({Target_N68271, '$class'})):addGroup(Target_N68271, (fun(Target_N68304) -> (get({Target_N68304, '$class'})):addComponent(Target_N68304, get({This, jLabel4})) end)((fun(Target_N68311) -> (get({Target_N68311, '$class'})):addComponent(Target_N68311, get({This, jLabel7})) end)((fun(Target_N68318) -> (get({Target_N68318, '$class'})):addComponent(Target_N68318, get({This, jLabel6})) end)((fun(Target_N68325) -> (get({Target_N68325, '$class'})):addComponent(Target_N68325, get({This, jLabel5})) end)((fun(Target_N68332) -> (get({Target_N68332, '$class'})):addComponent(Target_N68332, get({This, jLabel1})) end)((fun(Target_N68339) -> (get({Target_N68339, '$class'})):addComponent(Target_N68339, get({This, jLabel2})) end)((fun(Target_N68346) -> (get({Target_N68346, '$class'})):addComponent(Target_N68346, get({This, jLabel3})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))))))) end)((fun(Target_N68278) -> (get({Target_N68278, '$class'})):addContainerGap(Target_N68278) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N70017) -> (get({Target_N70017, '$class'})):addGroup(Target_N70017, (fun(Target_N70085) -> (get({Target_N70085, '$class'})):addGroup(Target_N70085, (fun(Target_N72310) -> (get({Target_N72310, '$class'})):addComponent(Target_N72310, get({This, maxBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72317) -> (get({Target_N72317, '$class'})):addComponent(Target_N72317, get({This, jLabel13})) end)((fun(Target_N72324) -> (get({Target_N72324, '$class'})):addComponent(Target_N72324, get({This, avgBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72331) -> (get({Target_N72331, '$class'})):addComponent(Target_N72331, get({This, jLabel7})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N70092) -> (get({Target_N70092, '$class'})):addPreferredGap(Target_N70092, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70099) -> (get({Target_N70099, '$class'})):addGroup(Target_N70099, (fun(Target_N71935) -> (get({Target_N71935, '$class'})):addComponent(Target_N71935, get({This, jLabel12})) end)((fun(Target_N71942) -> (get({Target_N71942, '$class'})):addComponent(Target_N71942, get({This, maxGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71949) -> (get({Target_N71949, '$class'})):addComponent(Target_N71949, get({This, avgGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71956) -> (get({Target_N71956, '$class'})):addComponent(Target_N71956, get({This, jLabel6})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N70106) -> (get({Target_N70106, '$class'})):addPreferredGap(Target_N70106, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70113) -> (get({Target_N70113, '$class'})):addGroup(Target_N70113, (fun(Target_N71560) -> (get({Target_N71560, '$class'})):addComponent(Target_N71560, get({This, maxRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71567) -> (get({Target_N71567, '$class'})):addComponent(Target_N71567, get({This, jLabel11})) end)((fun(Target_N71574) -> (get({Target_N71574, '$class'})):addComponent(Target_N71574, get({This, avgRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71581) -> (get({Target_N71581, '$class'})):addComponent(Target_N71581, get({This, jLabel5})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N70120) -> (get({Target_N70120, '$class'})):addPreferredGap(Target_N70120, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70127) -> (get({Target_N70127, '$class'})):addGroup(Target_N70127, (fun(Target_N71185) -> (get({Target_N71185, '$class'})):addComponent(Target_N71185, get({This, minBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71192) -> (get({Target_N71192, '$class'})):addComponent(Target_N71192, get({This, jLabel10})) end)((fun(Target_N71199) -> (get({Target_N71199, '$class'})):addComponent(Target_N71199, get({This, percentMatchingJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N71206) -> (get({Target_N71206, '$class'})):addComponent(Target_N71206, get({This, jLabel3})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N70134) -> (get({Target_N70134, '$class'})):addPreferredGap(Target_N70134, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70141) -> (get({Target_N70141, '$class'})):addGroup(Target_N70141, (fun(Target_N70810) -> (get({Target_N70810, '$class'})):addComponent(Target_N70810, get({This, minGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70817) -> (get({Target_N70817, '$class'})):addComponent(Target_N70817, get({This, jLabel9})) end)((fun(Target_N70824) -> (get({Target_N70824, '$class'})):addComponent(Target_N70824, get({This, totalPixelsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70831) -> (get({Target_N70831, '$class'})):addComponent(Target_N70831, get({This, jLabel2})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N70148) -> (get({Target_N70148, '$class'})):addPreferredGap(Target_N70148, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70155) -> (get({Target_N70155, '$class'})):addGroup(Target_N70155, (fun(Target_N70435) -> (get({Target_N70435, '$class'})):addComponent(Target_N70435, get({This, minRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70442) -> (get({Target_N70442, '$class'})):addComponent(Target_N70442, get({This, jLabel8})) end)((fun(Target_N70449) -> (get({Target_N70449, '$class'})):addComponent(Target_N70449, get({This, matchingPixelsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70456) -> (get({Target_N70456, '$class'})):addComponent(Target_N70456, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N70162) -> (get({Target_N70162, '$class'})):addPreferredGap(Target_N70162, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N70169) -> (get({Target_N70169, '$class'})):addGroup(Target_N70169, (fun(Target_N70194) -> (get({Target_N70194, '$class'})):addComponent(Target_N70194, get({This, jComboBox1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N70201) -> (get({Target_N70201, '$class'})):addComponent(Target_N70201, get({This, jLabel4})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))))))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

updateImageColorRangeResults(This, ImageAnalysisResults) ->
        ImageColorRangeResults = (get({ImageAnalysisResults, '$class'})):getImageColorRangeResults(ImageAnalysisResults),
        (get({get({This, matchingPixelsJTextField}), '$class'})):setText(get({This, matchingPixelsJTextField}), (fun(Target_N72746) -> (get({Target_N72746, '$class'})):toString(Target_N72746) end)((get({ImageColorRangeResults, '$class'})):getMatchingPixelsChecked(ImageColorRangeResults))),
        (get({get({This, totalPixelsJTextField}), '$class'})):setText(get({This, totalPixelsJTextField}), (fun(Target_N72811) -> (get({Target_N72811, '$class'})):toString(Target_N72811) end)((get({ImageColorRangeResults, '$class'})):getTotalPixelsChecked(ImageColorRangeResults))),
        (get({get({This, percentMatchingJTextField}), '$class'})):setText(get({This, percentMatchingJTextField}), (fun(Target_N72876) -> (get({Target_N72876, '$class'})):toString(Target_N72876) end)((get({ImageColorRangeResults, '$class'})):getPercent(ImageColorRangeResults))),
        ImageColorResults = (get({ImageAnalysisResults, '$class'})):getImageColorResults(ImageAnalysisResults),
        (get({get({This, avgRedJTextField}), '$class'})):setText(get({This, avgRedJTextField}), (fun(Target_N72984) -> (get({Target_N72984, '$class'})):toString(Target_N72984) end)((fun(Target_N73004) -> (get({Target_N73004, '$class'})):getAvgRed(Target_N73004) end)((get({ImageColorResults, '$class'})):getColorAverage(ImageColorResults)))),
        (get({get({This, avgGreenJTextField}), '$class'})):setText(get({This, avgGreenJTextField}), (fun(Target_N73057) -> (get({Target_N73057, '$class'})):toString(Target_N73057) end)((fun(Target_N73077) -> (get({Target_N73077, '$class'})):getAvgGreen(Target_N73077) end)((get({ImageColorResults, '$class'})):getColorAverage(ImageColorResults)))),
        (get({get({This, avgBlueJTextField}), '$class'})):setText(get({This, avgBlueJTextField}), (fun(Target_N73130) -> (get({Target_N73130, '$class'})):toString(Target_N73130) end)((fun(Target_N73150) -> (get({Target_N73150, '$class'})):getAvgBlue(Target_N73150) end)((get({ImageColorResults, '$class'})):getColorAverage(ImageColorResults)))),
        (get({get({This, minRedJTextField}), '$class'})):setText(get({This, minRedJTextField}), (fun(Target_N73203) -> (get({Target_N73203, '$class'})):toString(Target_N73203) end)((fun(Target_N73223) -> (get({Target_N73223, '$class'})):getMinRed(Target_N73223) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults)))),
        (get({get({This, minGreenJTextField}), '$class'})):setText(get({This, minGreenJTextField}), (fun(Target_N73276) -> (get({Target_N73276, '$class'})):toString(Target_N73276) end)((fun(Target_N73296) -> (get({Target_N73296, '$class'})):getMinGreen(Target_N73296) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults)))),
        (get({get({This, minBlueJTextField}), '$class'})):setText(get({This, minBlueJTextField}), (fun(Target_N73349) -> (get({Target_N73349, '$class'})):toString(Target_N73349) end)((fun(Target_N73369) -> (get({Target_N73369, '$class'})):getMinBlue(Target_N73369) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults)))),
        (get({get({This, maxRedJTextField}), '$class'})):setText(get({This, maxRedJTextField}), (fun(Target_N73422) -> (get({Target_N73422, '$class'})):toString(Target_N73422) end)((fun(Target_N73442) -> (get({Target_N73442, '$class'})):getMaxRed(Target_N73442) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults)))),
        (get({get({This, maxGreenJTextField}), '$class'})):setText(get({This, maxGreenJTextField}), (fun(Target_N73495) -> (get({Target_N73495, '$class'})):toString(Target_N73495) end)((fun(Target_N73515) -> (get({Target_N73515, '$class'})):getMaxGreen(Target_N73515) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults)))),
        (get({get({This, maxBlueJTextField}), '$class'})):setText(get({This, maxBlueJTextField}), (fun(Target_N73568) -> (get({Target_N73568, '$class'})):toString(Target_N73568) end)((fun(Target_N73588) -> (get({Target_N73588, '$class'})):getMaxBlue(Target_N73588) end)((get({ImageColorResults, '$class'})):getColorRange(ImageColorResults)))).

