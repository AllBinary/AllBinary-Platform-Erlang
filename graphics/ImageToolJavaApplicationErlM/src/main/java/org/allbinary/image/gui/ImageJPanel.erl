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
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ImageJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, canvasStrings}, 'CanvasStrings':getInstance()),
    put({This, isDrawn}, false),
    put({This, bufferedImage}, undefined),
    ok.


new(BufferedImage) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BufferedImage),
    This.

init(This, BufferedImage) ->
    'JPanel':init(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This),
        put({This, bufferedImage}, BufferedImage),
        (get({This, '$class'})):setSize(This, (get({get({This, bufferedImage}), '$class'})):getWidth(get({This, bufferedImage}), undefined), (get({get({This, bufferedImage}), '$class'})):getHeight(get({This, bufferedImage}), undefined)).

paint(This, Graphics) ->
        case (not get({This, isDrawn})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, canvasStrings}), 'PAINT'})),
            (get({Graphics, '$class'})):drawImage(Graphics, get({This, bufferedImage}), 0, 0, (get({get({This, bufferedImage}), '$class'})):getWidth(get({This, bufferedImage}), undefined), (get({get({This, bufferedImage}), '$class'})):getHeight(get({This, bufferedImage}), undefined), undefined),
            put({This, isDrawn}, true);
            false -> ok
        end.

initComponents(This) ->
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N66489) -> (get({Target_N66489, '$class'})):addGap(Target_N66489, 0, 400, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N66606) -> (get({Target_N66606, '$class'})):addGap(Target_N66606, 0, 300, get({'Short', 'MAX_VALUE'})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

