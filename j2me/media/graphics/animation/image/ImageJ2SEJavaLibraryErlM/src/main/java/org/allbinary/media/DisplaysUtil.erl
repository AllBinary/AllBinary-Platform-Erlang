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
% package org.allbinary.media
% import java.awt.Dimension
% import java.awt.DisplayMode
% import java.awt.GraphicsDevice
% import java.awt.GraphicsEnvironment
% import java.awt.Toolkit
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle

-module('DisplaysUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'DisplaysUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'DisplaysUtil', instance}).

getPrimaryScreenSize(This) ->
        Dimension = (fun(Target_N65866) -> (get({Target_N65866, '$class'})):getScreenSize(Target_N65866) end)('Toolkit':getDefaultToolkit()),
        'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), get({Dimension, width}), get({Dimension, height})).

getScreenSizesAsRectangleArray(This) ->
        GraphicsEnvironment = 'GraphicsEnvironment':getLocalGraphicsEnvironment(),
        GraphicsDeviceArray = (get({GraphicsEnvironment, '$class'})):getScreenDevices(GraphicsEnvironment),
        put({local, graphicsDevice}, undefined),
        put({local, displayMode}, undefined),
        put({local, rectangle}, undefined),
        Size = array:size(GraphicsDeviceArray),
        RectangleArray = array:new(Size, {default, undefined}),
        lists:foreach(fun(Index) ->
            put({local, graphicsDevice}, array:get(Index, GraphicsDeviceArray)),
            put({local, displayMode}, (get({get({local, graphicsDevice}), '$class'})):getDisplayMode(get({local, graphicsDevice}))),
            put({local, rectangle}, 'Rectangle':new(get({'PointFactory':getInstance(), 'ZERO_ZERO'}), (get({get({local, displayMode}), '$class'})):getWidth(get({local, displayMode})), (get({get({local, displayMode}), '$class'})):getHeight(get({local, displayMode})))),
            array:set(Index, get({local, rectangle}), RectangleArray)
        end, lists:seq(0, Size - 1)),
        RectangleArray.

