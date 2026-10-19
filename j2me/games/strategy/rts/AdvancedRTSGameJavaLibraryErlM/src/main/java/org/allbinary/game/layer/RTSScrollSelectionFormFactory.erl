% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.graphics.PointFactory
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.form.FormTypeFactory
% import org.allbinary.graphics.form.MultipleScrollSelectionHorizontalForm
% import org.allbinary.graphics.form.ScrollSelectionForm
% import org.allbinary.input.motion.button.CommonButtons
% import org.allbinary.input.motion.button.TouchButtonLocationHelper

-module('RTSScrollSelectionFormFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
getInstance(FormLabel, Items) when (is_list(FormLabel) orelse FormLabel =:= undefined), (is_tuple(Items) orelse Items =:= undefined) ->
        BasicColorFactory = 'BasicColorFactory':getInstance(),
        TouchButtonLocationHelper = 'TouchButtonLocationHelper':new(),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        MenuX = (get({'CommonButtons':getInstance(), 'STANDARD_BUTTON_SIZE'}) + (get({TouchButtonLocationHelper, '$class'})):getColumnsRemainderHalf(TouchButtonLocationHelper)),
        Width = ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) - ((MenuX * 2))),
        MenuRectangle = 'Rectangle':new((fun(Target_N66224) -> (get({Target_N66224, '$class'})):createXY(Target_N66224, MenuX, 16) end)('PointFactory':getInstance()), Width, get({'CommonButtons':getInstance(), 'STANDARD_BUTTON_SIZE'})),
        'MultipleScrollSelectionHorizontalForm':createForm(FormLabel, Items, MenuRectangle, get({'FormTypeFactory':getInstance(), 'HORIZONTAL_FORM'}), 0, get({BasicColorFactory, 'BLACK'}), get({BasicColorFactory, 'WHITE'})).

