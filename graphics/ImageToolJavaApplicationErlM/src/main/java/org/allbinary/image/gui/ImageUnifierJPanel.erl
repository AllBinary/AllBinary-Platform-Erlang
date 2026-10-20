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
% import javax.swing
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.FileWrapperUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.image.ImagePersistanceUtil
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageProcessorInputCompositeInterface
% import org.allbinary.media.image.ImageStrings
% import org.allbinary.media.image.ImageUnifierCell
% import org.allbinary.media.image.ImageUnifierProperties
% import org.allbinary.media.image.ImageUnifierUtil
% import org.allbinary.media.image.ImageUtil
% import org.allbinary.media.image.ImagesRatioUtil
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('ImageUnifierJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageProcessorInputCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageStrings}, 'ImageStrings':getInstance()),
    put({This, imagesRatioUtil}, 'ImagesRatioUtil':getInstance()),
    put({This, imageProcessorInput}, undefined),
    put({This, icon}, undefined),
    put({This, imageUnifierProperties}, undefined),
    put({This, result}, undefined),
    put({This, isImageFillIn}, true),
    put({This, avgRatioJTextField}, undefined),
    put({This, cellHeightJTextField}, undefined),
    put({This, cellRatioJTextField}, undefined),
    put({This, cellWidthJTextField}, undefined),
    put({This, columnsJTextField}, undefined),
    put({This, downJButton}, undefined),
    put({This, fudgeItJButton}, undefined),
    put({This, imageJList}, undefined),
    put({This, jButton1}, undefined),
    put({This, jButton2}, undefined),
    put({This, jButtonOrder}, undefined),
    put({This, jLabel1}, undefined),
    put({This, jLabel2}, undefined),
    put({This, jLabel3}, undefined),
    put({This, jLabel4}, undefined),
    put({This, jLabel5}, undefined),
    put({This, jLabel6}, undefined),
    put({This, jPanel1}, undefined),
    put({This, jScrollPane1}, undefined),
    put({This, jScrollPane2}, undefined),
    put({This, rowsJTextField}, undefined),
    put({This, upJButton}, undefined),
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
        (get({This, '$class'})):setImageProcessorInput(This, ImageProcessorInput).

init(This) ->
        try
            ImageProcessorInput = (get({This, '$class'})):getImageProcessorInput(This),
            BufferedImageArray = (get({ImageProcessorInput, '$class'})):getBufferedImageArray(ImageProcessorInput),
            put({This, icon}, array:new(array:size(BufferedImageArray), {default, undefined})),
            DefaultListModel = 'DefaultListModel':new(),
            lists:foreach(fun(Index) ->
                Width = (fun(Target_N66855) -> (get({Target_N66855, '$class'})):getWidth(Target_N66855) end)(array:get(Index, BufferedImageArray)),
                Height = (fun(Target_N66913) -> (get({Target_N66913, '$class'})):getHeight(Target_N66913) end)(array:get(Index, BufferedImageArray)),
                NewWidth = 52,
                OldRatio = (Width / Height),
                NewHeight = trunc(((float(NewWidth) / OldRatio))),
                IconBufferedImage = (fun(Target_N67119) -> (get({Target_N67119, '$class'})):createBufferedImage(Target_N67119, array:get(Index, BufferedImageArray), NewWidth, NewHeight, true) end)('ImageUtil':getInstance()),
                put({This, icon}, array:set(Index, 'ImageIconUnique':new(IconBufferedImage, Index), get({This, icon}))),
                (get({DefaultListModel, '$class'})):addElement(DefaultListModel, array:get(Index, get({This, icon})))
            end, lists:seq(0, array:size(BufferedImageArray) - 1)),
            (get({get({This, imageJList}), '$class'})):setModel(get({This, imageJList}), DefaultListModel),
            (get({This, '$class'})):updateOnPropertiesChange(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E)
        end.

updateImage(This) ->
        try
            BufferedImageArray = (fun(Target_N67594) -> (get({Target_N67594, '$class'})):getBufferedImageArray(Target_N67594) end)((get({This, '$class'})):getImageProcessorInput(This)),
            TempBufferedImageArray = array:new(array:size(BufferedImageArray), {default, undefined}),
            lists:foreach(fun(Index) ->
                IndexedImageIcon = (fun(Target_N67737) -> (get({Target_N67737, '$class'})):getElementAt(Target_N67737, Index) end)((get({get({This, imageJList}), '$class'})):getModel(get({This, imageJList}))),
                BufferedImage = (fun(Target_N67818) -> (get({Target_N67818, '$class'})):createBufferedImage(Target_N67818, array:get((get({IndexedImageIcon, '$class'})):getId(IndexedImageIcon), BufferedImageArray), (fun(Target_N67871) -> (get({Target_N67871, '$class'})):getWidth(Target_N67871) end)((get({get({This, imageUnifierProperties}), '$class'})):getImageUnifierCell(get({This, imageUnifierProperties}))), (fun(Target_N67898) -> (get({Target_N67898, '$class'})):getHeight(Target_N67898) end)((get({get({This, imageUnifierProperties}), '$class'})):getImageUnifierCell(get({This, imageUnifierProperties}))), false) end)('ImageUtil':getInstance()),
                array:set(Index, BufferedImage, TempBufferedImageArray)
            end, lists:seq(0, array:size(BufferedImageArray) - 1)),
            TotalImages = ((get({get({This, imageUnifierProperties}), '$class'})):getRows(get({This, imageUnifierProperties})) * (get({get({This, imageUnifierProperties}), '$class'})):getColumns(get({This, imageUnifierProperties}))),
            AverageRatio = (get({get({This, imagesRatioUtil}), '$class'})):getAverage(get({This, imagesRatioUtil}), TempBufferedImageArray, TotalImages),
            put({local, averageRatioString}, (get({AverageRatio, '$class'})):toString(AverageRatio)),
            case (string:length(get({local, averageRatioString})) > 4) of
                true ->
                put({local, averageRatioString}, string:slice(get({local, averageRatioString}), 0, (4) - (0)));
                false -> ok
            end,
            (get({get({This, avgRatioJTextField}), '$class'})):setText(get({This, avgRatioJTextField}), get({local, averageRatioString})),
            (get({get({This, fudgeItJButton}), '$class'})):setEnabled(get({This, fudgeItJButton}), false),
            case (not (get({get({This, imagesRatioUtil}), '$class'})):isEqual(get({This, imagesRatioUtil}), TempBufferedImageArray, TotalImages)) of
                true ->
                case get({This, isImageFillIn}) of
                    true ->
                    (get({get({This, fudgeItJButton}), '$class'})):setEnabled(get({This, fudgeItJButton}), true);
                    false -> ok
                end;
                false -> ok
            end,
            (get({This, '$class'})):updateImage(This, TempBufferedImageArray)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "updateImage", E)
        end.

updateImageWithFudgedImages(This) ->
        try
            BufferedImageArray = (fun(Target_N68672) -> (get({Target_N68672, '$class'})):getBufferedImageArray(Target_N68672) end)((get({This, '$class'})):getImageProcessorInput(This)),
            TempBufferedImageArray = array:new(array:size(BufferedImageArray), {default, undefined}),
            lists:foreach(fun(Index) ->
                IndexedImageIcon = (fun(Target_N68815) -> (get({Target_N68815, '$class'})):getElementAt(Target_N68815, Index) end)((get({get({This, imageJList}), '$class'})):getModel(get({This, imageJList}))),
                BufferedImage = (fun(Target_N68896) -> (get({Target_N68896, '$class'})):createBufferedImage(Target_N68896, array:get((get({IndexedImageIcon, '$class'})):getId(IndexedImageIcon), BufferedImageArray), (fun(Target_N68949) -> (get({Target_N68949, '$class'})):getWidth(Target_N68949) end)((get({get({This, imageUnifierProperties}), '$class'})):getImageUnifierCell(get({This, imageUnifierProperties}))), (fun(Target_N68976) -> (get({Target_N68976, '$class'})):getHeight(Target_N68976) end)((get({get({This, imageUnifierProperties}), '$class'})):getImageUnifierCell(get({This, imageUnifierProperties}))), false) end)('ImageUtil':getInstance()),
                array:set(Index, BufferedImage, TempBufferedImageArray)
            end, lists:seq(0, array:size(BufferedImageArray) - 1)),
            TotalImages = ((get({get({This, imageUnifierProperties}), '$class'})):getRows(get({This, imageUnifierProperties})) * (get({get({This, imageUnifierProperties}), '$class'})):getColumns(get({This, imageUnifierProperties}))),
            AverageRatio = (get({get({This, imagesRatioUtil}), '$class'})):getAverage(get({This, imagesRatioUtil}), TempBufferedImageArray, TotalImages),
            FudgedBufferedImageArray = (get({get({This, imagesRatioUtil}), '$class'})):fudge(get({This, imagesRatioUtil}), TempBufferedImageArray, TotalImages, AverageRatio),
            (get({This, '$class'})):updateImage(This, FudgedBufferedImageArray)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "updateImageWithFudgedImages", E)
        end.

updateImage(This, TempBufferedImageArray) when (is_tuple(TempBufferedImageArray) orelse TempBufferedImageArray =:= undefined) ->
        put({This, result}, (fun(Target_N69522) -> (get({Target_N69522, '$class'})):getImage(Target_N69522, TempBufferedImageArray, get({This, imageUnifierProperties})) end)('ImageUnifierUtil':getInstance())),
        Image = 'ImageIcon':new(get({This, result})),
        Label = 'JLabel':new(Image),
        (fun(Target_N69690) -> (get({Target_N69690, '$class'})):add(Target_N69690, Label) end)((get({get({This, jScrollPane2}), '$class'})):getViewport(get({This, jScrollPane2}))),
        (get({This, '$class'})):updateUI(This).

updateOnPropertiesChange(This) ->
        case (((((fun(Target_N69820) -> (get({Target_N69820, '$class'})):length(Target_N69820) end)((get({get({This, rowsJTextField}), '$class'})):getText(get({This, rowsJTextField}))) > 0) andalso ((fun(Target_N69856) -> (get({Target_N69856, '$class'})):length(Target_N69856) end)((get({get({This, columnsJTextField}), '$class'})):getText(get({This, columnsJTextField}))) > 0)) andalso ((fun(Target_N69893) -> (get({Target_N69893, '$class'})):length(Target_N69893) end)((get({get({This, cellWidthJTextField}), '$class'})):getText(get({This, cellWidthJTextField}))) > 0)) andalso ((fun(Target_N69930) -> (get({Target_N69930, '$class'})):length(Target_N69930) end)((get({get({This, cellHeightJTextField}), '$class'})):getText(get({This, cellHeightJTextField}))) > 0)) of
            true ->
            put({This, imageUnifierProperties}, 'ImageUnifierProperties':new()),
            (get({get({This, imageUnifierProperties}), '$class'})):setRows(get({This, imageUnifierProperties}), (get({get({This, rowsJTextField}), '$class'})):getText(get({This, rowsJTextField}))),
            (get({get({This, imageUnifierProperties}), '$class'})):setColumns(get({This, imageUnifierProperties}), (get({get({This, columnsJTextField}), '$class'})):getText(get({This, columnsJTextField}))),
            ImageUnifierCell = 'ImageUnifierCell':new((get({get({This, cellWidthJTextField}), '$class'})):getText(get({This, cellWidthJTextField})), (get({get({This, cellHeightJTextField}), '$class'})):getText(get({This, cellHeightJTextField}))),
            (get({get({This, imageUnifierProperties}), '$class'})):setImageUnifierCell(get({This, imageUnifierProperties}), ImageUnifierCell),
            CellRatio = ((float((get({ImageUnifierCell, '$class'})):getWidth(ImageUnifierCell)) / (get({ImageUnifierCell, '$class'})):getHeight(ImageUnifierCell))),
            put({local, cellRatioString}, (get({CellRatio, '$class'})):toString(CellRatio)),
            case (string:length(get({local, cellRatioString})) > 4) of
                true ->
                put({local, cellRatioString}, string:slice(get({local, cellRatioString}), 0, (4) - (0)));
                false -> ok
            end,
            (get({get({This, cellRatioJTextField}), '$class'})):setText(get({This, cellRatioJTextField}), get({local, cellRatioString})),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

initComponents(This) ->
        CommonPhoneStrings = 'CommonPhoneStrings':getInstance(),
        put({This, jScrollPane1}, 'JScrollPane':new()),
        put({This, imageJList}, 'JList':new()),
        put({This, jScrollPane2}, 'JScrollPane':new()),
        put({This, jPanel1}, 'JPanel':new()),
        put({This, jButton1}, 'JButton':new()),
        put({This, upJButton}, 'JButton':new()),
        put({This, downJButton}, 'JButton':new()),
        put({This, fudgeItJButton}, 'JButton':new()),
        put({This, jLabel2}, 'JLabel':new()),
        put({This, columnsJTextField}, 'JTextField':new()),
        put({This, jLabel1}, 'JLabel':new()),
        put({This, rowsJTextField}, 'JTextField':new()),
        put({This, jLabel3}, 'JLabel':new()),
        put({This, cellWidthJTextField}, 'JTextField':new()),
        put({This, jLabel4}, 'JLabel':new()),
        put({This, cellHeightJTextField}, 'JTextField':new()),
        put({This, jLabel5}, 'JLabel':new()),
        put({This, cellRatioJTextField}, 'JTextField':new()),
        put({This, jLabel6}, 'JLabel':new()),
        put({This, avgRatioJTextField}, 'JTextField':new()),
        put({This, jButton2}, 'JButton':new()),
        put({This, jButtonOrder}, 'JButton':new()),
        (get({This, '$class'})):setMinimumSize(This, 'Dimension':new(500, 375)),
        (get({This, '$class'})):setPreferredSize(This, 'Dimension':new(0, 0)),
        (get({get({This, imageJList}), '$class'})):setMinimumSize(get({This, imageJList}), 'Dimension':new(50, 0)),
        (get({get({This, jScrollPane1}), '$class'})):setViewportView(get({This, jScrollPane1}), get({This, imageJList})),
        (get({get({This, jButton1}), '$class'})):setText(get({This, jButton1}), "Save"),
        (get({get({This, jButton1}), '$class'})):addActionListener(get({This, jButton1}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, upJButton}), '$class'})):setText(get({This, upJButton}), "Up"),
        (get({get({This, upJButton}), '$class'})):addActionListener(get({This, upJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, downJButton}), '$class'})):setText(get({This, downJButton}), "Down"),
        (get({get({This, downJButton}), '$class'})):addActionListener(get({This, downJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, fudgeItJButton}), '$class'})):setText(get({This, fudgeItJButton}), "Fudge It!"),
        (get({get({This, fudgeItJButton}), '$class'})):addActionListener(get({This, fudgeItJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel2}), '$class'})):setText(get({This, jLabel2}), "Columns:"),
        (get({get({This, columnsJTextField}), '$class'})):setText(get({This, columnsJTextField}), get({CommonPhoneStrings, 'TWO'})),
        (get({get({This, columnsJTextField}), '$class'})):addActionListener(get({This, columnsJTextField}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, columnsJTextField}), '$class'})):addPropertyChangeListener(get({This, columnsJTextField}), 'PropertyChangeListener':new() % Java anonymous class body: implement it as a module
%             ok % propertyChange
),
        (get({get({This, columnsJTextField}), '$class'})):addKeyListener(get({This, columnsJTextField}), 'KeyAdapter':new() % Java anonymous class body: implement it as a module
%             ok % keyPressed
%             ok % keyTyped
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Rows:"),
        (get({get({This, rowsJTextField}), '$class'})):setText(get({This, rowsJTextField}), get({CommonPhoneStrings, 'TWO'})),
        (get({get({This, rowsJTextField}), '$class'})):addActionListener(get({This, rowsJTextField}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel3}), '$class'})):setText(get({This, jLabel3}), "Cell Width:"),
        (get({get({This, cellWidthJTextField}), '$class'})):setText(get({This, cellWidthJTextField}), "200"),
        (get({get({This, cellWidthJTextField}), '$class'})):addActionListener(get({This, cellWidthJTextField}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel4}), '$class'})):setText(get({This, jLabel4}), "Cell Height:"),
        (get({get({This, cellHeightJTextField}), '$class'})):setText(get({This, cellHeightJTextField}), "150"),
        (get({get({This, cellHeightJTextField}), '$class'})):addActionListener(get({This, cellHeightJTextField}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel5}), '$class'})):setText(get({This, jLabel5}), "Cell Ratio:"),
        (get({get({This, cellRatioJTextField}), '$class'})):setEditable(get({This, cellRatioJTextField}), false),
        (get({get({This, jLabel6}), '$class'})):setText(get({This, jLabel6}), "Avg Image Ratio:"),
        (get({get({This, avgRatioJTextField}), '$class'})):setEditable(get({This, avgRatioJTextField}), false),
        (get({get({This, jButton2}), '$class'})):setText(get({This, jButton2}), get({get({This, commonStrings}), 'UPDATE'})),
        (get({get({This, jButton2}), '$class'})):addActionListener(get({This, jButton2}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jButtonOrder}), '$class'})):setText(get({This, jButtonOrder}), "Order"),
        (get({get({This, jButtonOrder}), '$class'})):addActionListener(get({This, jButtonOrder}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        JPanel1Layout = 'GroupLayout':new(get({This, jPanel1})),
        (get({get({This, jPanel1}), '$class'})):setLayout(get({This, jPanel1}), JPanel1Layout),
        (get({JPanel1Layout, '$class'})):setHorizontalGroup(JPanel1Layout, (fun(Target_N74559) -> (get({Target_N74559, '$class'})):addGroup(Target_N74559, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N74667) -> (get({Target_N74667, '$class'})):addContainerGap(Target_N74667) end)((fun(Target_N74674) -> (get({Target_N74674, '$class'})):addGroup(Target_N74674, (fun(Target_N74707) -> (get({Target_N74707, '$class'})):addComponent(Target_N74707, get({This, jButtonOrder}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74714) -> (get({Target_N74714, '$class'})):addGroup(Target_N74714, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), (fun(Target_N76399) -> (get({Target_N76399, '$class'})):addGroup(Target_N76399, (fun(Target_N76583) -> (get({Target_N76583, '$class'})):addGroup(Target_N76583, (fun(Target_N76722) -> (get({Target_N76722, '$class'})):addGap(Target_N76722, 1, 1, 1) end)((fun(Target_N76729) -> (get({Target_N76729, '$class'})):addComponent(Target_N76729, get({This, columnsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 102, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout)))) end)((fun(Target_N76590) -> (get({Target_N76590, '$class'})):addComponent(Target_N76590, get({This, rowsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 103, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N76406) -> (get({Target_N76406, '$class'})):addPreferredGap(Target_N76406, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N76413) -> (get({Target_N76413, '$class'})):addGroup(Target_N76413, (fun(Target_N76438) -> (get({Target_N76438, '$class'})):addComponent(Target_N76438, get({This, jLabel1})) end)((fun(Target_N76445) -> (get({Target_N76445, '$class'})):addComponent(Target_N76445, get({This, jLabel2})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout))))) end)((fun(Target_N74721) -> (get({Target_N74721, '$class'})):addComponent(Target_N74721, get({This, jButton2}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74728) -> (get({Target_N74728, '$class'})):addComponent(Target_N74728, get({This, cellWidthJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74735) -> (get({Target_N74735, '$class'})):addComponent(Target_N74735, get({This, cellHeightJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74742) -> (get({Target_N74742, '$class'})):addComponent(Target_N74742, get({This, jLabel5}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74749) -> (get({Target_N74749, '$class'})):addComponent(Target_N74749, get({This, cellRatioJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74756) -> (get({Target_N74756, '$class'})):addComponent(Target_N74756, get({This, jLabel6}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74763) -> (get({Target_N74763, '$class'})):addComponent(Target_N74763, get({This, avgRatioJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74770) -> (get({Target_N74770, '$class'})):addGroup(Target_N74770, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), (fun(Target_N75505) -> (get({Target_N75505, '$class'})):addPreferredGap(Target_N75505, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 96, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N75512) -> (get({Target_N75512, '$class'})):addComponent(Target_N75512, get({This, jLabel4})) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout)))) end)((fun(Target_N74777) -> (get({Target_N74777, '$class'})):addGroup(Target_N74777, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), (fun(Target_N75339) -> (get({Target_N75339, '$class'})):addPreferredGap(Target_N75339, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 99, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N75346) -> (get({Target_N75346, '$class'})):addComponent(Target_N75346, get({This, jLabel3})) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout)))) end)((fun(Target_N74784) -> (get({Target_N74784, '$class'})):addComponent(Target_N74784, get({This, fudgeItJButton}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74791) -> (get({Target_N74791, '$class'})):addGroup(Target_N74791, (fun(Target_N74930) -> (get({Target_N74930, '$class'})):addComponent(Target_N74930, get({This, downJButton}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 70, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74937) -> (get({Target_N74937, '$class'})):addPreferredGap(Target_N74937, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 10, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N74944) -> (get({Target_N74944, '$class'})):addComponent(Target_N74944, get({This, upJButton}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 71, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout))))) end)((fun(Target_N74798) -> (get({Target_N74798, '$class'})):addComponent(Target_N74798, get({This, jButton1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 151, get({'Short', 'MAX_VALUE'})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}))))))))))))))))) end)((fun(Target_N74681) -> (get({Target_N74681, '$class'})):addContainerGap(Target_N74681) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout))))) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({JPanel1Layout, '$class'})):setVerticalGroup(JPanel1Layout, (fun(Target_N76930) -> (get({Target_N76930, '$class'})):addGroup(Target_N76930, (fun(Target_N76998) -> (get({Target_N76998, '$class'})):addGap(Target_N76998, 66, 66, 66) end)((fun(Target_N77005) -> (get({Target_N77005, '$class'})):addComponent(Target_N77005, get({This, avgRatioJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N77012) -> (get({Target_N77012, '$class'})):addPreferredGap(Target_N77012, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77019) -> (get({Target_N77019, '$class'})):addComponent(Target_N77019, get({This, jLabel6})) end)((fun(Target_N77026) -> (get({Target_N77026, '$class'})):addGap(Target_N77026, 7, 7, 7) end)((fun(Target_N77033) -> (get({Target_N77033, '$class'})):addComponent(Target_N77033, get({This, cellRatioJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N77040) -> (get({Target_N77040, '$class'})):addPreferredGap(Target_N77040, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N77047) -> (get({Target_N77047, '$class'})):addComponent(Target_N77047, get({This, jLabel5})) end)((fun(Target_N77054) -> (get({Target_N77054, '$class'})):addPreferredGap(Target_N77054, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77061) -> (get({Target_N77061, '$class'})):addComponent(Target_N77061, get({This, jButton2})) end)((fun(Target_N77068) -> (get({Target_N77068, '$class'})):addPreferredGap(Target_N77068, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77075) -> (get({Target_N77075, '$class'})):addComponent(Target_N77075, get({This, cellHeightJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N77082) -> (get({Target_N77082, '$class'})):addPreferredGap(Target_N77082, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77089) -> (get({Target_N77089, '$class'})):addComponent(Target_N77089, get({This, jLabel4})) end)((fun(Target_N77096) -> (get({Target_N77096, '$class'})):addPreferredGap(Target_N77096, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77103) -> (get({Target_N77103, '$class'})):addComponent(Target_N77103, get({This, cellWidthJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N77110) -> (get({Target_N77110, '$class'})):addPreferredGap(Target_N77110, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77117) -> (get({Target_N77117, '$class'})):addComponent(Target_N77117, get({This, jLabel3})) end)((fun(Target_N77124) -> (get({Target_N77124, '$class'})):addPreferredGap(Target_N77124, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77131) -> (get({Target_N77131, '$class'})):addGroup(Target_N77131, (fun(Target_N77788) -> (get({Target_N77788, '$class'})):addComponent(Target_N77788, get({This, rowsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N77795) -> (get({Target_N77795, '$class'})):addComponent(Target_N77795, get({This, jLabel1})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N77138) -> (get({Target_N77138, '$class'})):addPreferredGap(Target_N77138, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77145) -> (get({Target_N77145, '$class'})):addGroup(Target_N77145, (fun(Target_N77547) -> (get({Target_N77547, '$class'})):addComponent(Target_N77547, get({This, columnsJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N77554) -> (get({Target_N77554, '$class'})):addComponent(Target_N77554, get({This, jLabel2})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N77152) -> (get({Target_N77152, '$class'})):addPreferredGap(Target_N77152, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77159) -> (get({Target_N77159, '$class'})):addComponent(Target_N77159, get({This, fudgeItJButton})) end)((fun(Target_N77166) -> (get({Target_N77166, '$class'})):addPreferredGap(Target_N77166, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77173) -> (get({Target_N77173, '$class'})):addComponent(Target_N77173, get({This, jButtonOrder})) end)((fun(Target_N77180) -> (get({Target_N77180, '$class'})):addPreferredGap(Target_N77180, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77187) -> (get({Target_N77187, '$class'})):addGroup(Target_N77187, (fun(Target_N77290) -> (get({Target_N77290, '$class'})):addComponent(Target_N77290, get({This, downJButton})) end)((fun(Target_N77297) -> (get({Target_N77297, '$class'})):addComponent(Target_N77297, get({This, upJButton})) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N77194) -> (get({Target_N77194, '$class'})):addPreferredGap(Target_N77194, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N77201) -> (get({Target_N77201, '$class'})):addComponent(Target_N77201, get({This, jButton1})) end)((fun(Target_N77208) -> (get({Target_N77208, '$class'})):addContainerGap(Target_N77208) end)((get({JPanel1Layout, '$class'})):createSequentialGroup(JPanel1Layout))))))))))))))))))))))))))))))))) end)((get({JPanel1Layout, '$class'})):createParallelGroup(JPanel1Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N79035) -> (get({Target_N79035, '$class'})):addGroup(Target_N79035, (fun(Target_N79103) -> (get({Target_N79103, '$class'})):addComponent(Target_N79103, get({This, jScrollPane2}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 527, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N79110) -> (get({Target_N79110, '$class'})):addPreferredGap(Target_N79110, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N79117) -> (get({Target_N79117, '$class'})):addComponent(Target_N79117, get({This, jPanel1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N79124) -> (get({Target_N79124, '$class'})):addPreferredGap(Target_N79124, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N79131) -> (get({Target_N79131, '$class'})):addComponent(Target_N79131, get({This, jScrollPane1}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 84, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N79519) -> (get({Target_N79519, '$class'})):addGroup(Target_N79519, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N79627) -> (get({Target_N79627, '$class'})):addContainerGap(Target_N79627) end)((fun(Target_N79634) -> (get({Target_N79634, '$class'})):addGroup(Target_N79634, (fun(Target_N79659) -> (get({Target_N79659, '$class'})):addComponent(Target_N79659, get({This, jScrollPane1}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 445, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N79666) -> (get({Target_N79666, '$class'})):addComponent(Target_N79666, get({This, jScrollPane2}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 445, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N79673) -> (get({Target_N79673, '$class'})):addComponent(Target_N79673, get({This, jPanel1}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), 0, 445, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'})))))) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

jButton2ActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateOnPropertiesChange(This).

columnsJTextFieldKeyPressed(This, Evt) ->
        ok.

columnsJTextFieldKeyTyped(This, Evt) ->
        ok.

columnsJTextFieldPropertyChange(This, Evt) ->
        ok.

fudgeItJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateImageWithFudgedImages(This).

cellHeightJTextFieldActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateOnPropertiesChange(This).

cellWidthJTextFieldActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateOnPropertiesChange(This).

columnsJTextFieldActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateOnPropertiesChange(This).

rowsJTextFieldActionPerformed(This, Evt) ->
        (get({This, '$class'})):updateOnPropertiesChange(This).

jButton1ActionPerformed(This, Evt) ->
        try
            FileArray = (get({get({This, imageProcessorInput}), '$class'})):getFiles(get({This, imageProcessorInput})),
            File = array:get(0, FileArray),
            put({local, filePath}, (get({File, '$class'})):getAbsolutePath(File)),
            ExtensionIndex = allbinary_java:index_of(get({local, filePath}), get({get({This, imageStrings}), 'PNG_EXTENSION'})),
            put({local, filePath}, (fun(Target_N81179) -> (get({Target_N81179, '$class'})):toString(Target_N81179) end)((fun(Target_N81186) -> (get({Target_N81186, '$class'})):append(Target_N81186, get({get({This, imageStrings}), 'PNG_EXTENSION'})) end)((fun(Target_N81193) -> (get({Target_N81193, '$class'})):append(Target_N81193, "_Unified") end)((fun(Target_N81200) -> (get({Target_N81200, '$class'})):appendint(Target_N81200, trunc((get({get({This, imageUnifierProperties}), '$class'})):getRows(get({This, imageUnifierProperties})))) end)((fun(Target_N81207) -> (get({Target_N81207, '$class'})):append(Target_N81207, "_By_") end)((fun(Target_N81214) -> (get({Target_N81214, '$class'})):appendint(Target_N81214, trunc((get({get({This, imageUnifierProperties}), '$class'})):getColumns(get({This, imageUnifierProperties})))) end)((fun(Target_N81221) -> (get({Target_N81221, '$class'})):append(Target_N81221, get({'CommonSeps':getInstance(), 'UNDERSCORE'})) end)((fun(Target_N81228) -> (get({Target_N81228, '$class'})):append(Target_N81228, string:slice(get({local, filePath}), 0, (ExtensionIndex) - (0))) end)('StringMaker':new()))))))))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["New File Path: ", get({local, filePath})]), This, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            OutputFile = 'File':new(get({local, filePath})),
            (fun(Target_N81528) -> (get({Target_N81528, '$class'})):saveWithBatik(Target_N81528, 'FileWrapperUtil':wrapFile(OutputFile), get({This, result})) end)('ImagePersistanceUtil':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "jButton1ActionPerformed", E)
        end.

downJButtonActionPerformed(This, Evt) ->
        Index = (get({get({This, imageJList}), '$class'})):getSelectedIndex(get({This, imageJList})),
        DefaultListModel = (get({get({This, imageJList}), '$class'})):getModel(get({This, imageJList})),
        case ((Index >= 0) andalso ((Index + 1) < (get({DefaultListModel, '$class'})):size(DefaultListModel))) of
            true ->
            IndexedImageIcon = (get({DefaultListModel, '$class'})):remove(DefaultListModel, Index),
            (get({DefaultListModel, '$class'})):insertElementAt(DefaultListModel, IndexedImageIcon, (Index + 1)),
            (get({get({This, imageJList}), '$class'})):setSelectedIndex(get({This, imageJList}), (Index + 1)),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

upJButtonActionPerformed(This, Evt) ->
        Index = (get({get({This, imageJList}), '$class'})):getSelectedIndex(get({This, imageJList})),
        case (Index > 0) of
            true ->
            DefaultListModel = (get({get({This, imageJList}), '$class'})):getModel(get({This, imageJList})),
            IndexedImageIcon = (get({DefaultListModel, '$class'})):remove(DefaultListModel, Index),
            (get({DefaultListModel, '$class'})):insertElementAt(DefaultListModel, IndexedImageIcon, (Index - 1)),
            (get({get({This, imageJList}), '$class'})):setSelectedIndex(get({This, imageJList}), (Index - 1)),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

jButtonOrderActionPerformed(This, Evt) ->
        DefaultListModel = (get({get({This, imageJList}), '$class'})):getModel(get({This, imageJList})),
        Size = (get({DefaultListModel, '$class'})):size(DefaultListModel),
        Last = (Size - 1),
        lists:foreach(fun(Index) ->
            IndexedImageIcon = (get({DefaultListModel, '$class'})):remove(DefaultListModel, Last),
            (get({DefaultListModel, '$class'})):insertElementAt(DefaultListModel, IndexedImageIcon, (Last - Index))
        end, lists:seq(Last, 0, -1)),
        case (Size > 0) of
            true ->
            (get({get({This, imageJList}), '$class'})):setSelectedIndex(get({This, imageJList}), 0),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput),
        (get({This, '$class'})):init(This).

