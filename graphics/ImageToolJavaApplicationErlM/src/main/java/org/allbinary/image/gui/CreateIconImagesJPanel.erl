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
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.image.ImagePersistanceUtil
% import org.allbinary.media.image.ImageProcessorInput
% import org.allbinary.media.image.ImageProcessorInputCompositeInterface
% import org.allbinary.media.image.ImageUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CreateIconImagesJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ImageProcessorInputCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageProcessorInput}, undefined),
    put({This, aboveJButton}, undefined),
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
        Araster = (fun(Target_N66454) -> (get({Target_N66454, '$class'})):getAlphaRaster(Target_N66454) end)(array:get(0, (get({get({This, imageProcessorInput}), '$class'})):getBufferedImageArray(get({This, imageProcessorInput})))),
        case (Araster =:= undefined) of
            true ->
            io:format("~ts~n", [allbinary_java:to_string("there is no Alpha channel!!!!!!!!!")]);
            false ->
            io:format("~ts~n", [allbinary_java:to_string("Alpha channel found !")])
        end.

process(This) ->
        (fun(Target_N66672) -> (get({Target_N66672, '$class'})):start(Target_N66672) end)('Thread':new() % Java anonymous class body: implement it as a module
%             ok % run
).

getImageProcessorInput(This) ->
        get({This, imageProcessorInput}).

setImageProcessorInput(This, ImageProcessorInput) ->
        put({This, imageProcessorInput}, ImageProcessorInput).

initComponents(This) ->
        put({This, aboveJButton}, 'JButton':new()),
        (get({get({This, aboveJButton}), '$class'})):setText(get({This, aboveJButton}), "Process"),
        (get({get({This, aboveJButton}), '$class'})):addActionListener(get({This, aboveJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N69078) -> (get({Target_N69078, '$class'})):addGroup(Target_N69078, (fun(Target_N69146) -> (get({Target_N69146, '$class'})):addGap(Target_N69146, 0, 335, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69153) -> (get({Target_N69153, '$class'})):addComponent(Target_N69153, get({This, aboveJButton})) end)((get({Layout, '$class'})):createSequentialGroup(Layout)))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N69241) -> (get({Target_N69241, '$class'})):addGroup(Target_N69241, (fun(Target_N69309) -> (get({Target_N69309, '$class'})):addContainerGap(Target_N69309, 286, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N69316) -> (get({Target_N69316, '$class'})):addComponent(Target_N69316, get({This, aboveJButton})) end)((fun(Target_N69323) -> (get({Target_N69323, '$class'})):addContainerGap(Target_N69323) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

aboveJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):process(This).

