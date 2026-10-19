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
% package org.allbinary.game.displayable.canvas
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.form.FormTypeFactory
% import org.allbinary.graphics.form.ItemPaintableFactory
% import org.allbinary.graphics.form.ScrollCurrentSelectionForm

-module('PreGameScrollSelectionForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ScrollCurrentSelectionForm', Function, Arguments).

init_fields(This) ->
    ok.


new(Title, Items, FormPaintableFactory, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Title, Items, FormPaintableFactory, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Title, Items, FormPaintableFactory, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined), (is_tuple(Items) orelse Items =:= undefined) ->
        'ScrollCurrentSelectionForm':init(This, Title, Items, FormPaintableFactory, 0, 3, false, BackgroundBasicColor, ForegroundBasicColor).

% throws Exception
init(This, Rectangle) ->
        'ScrollCurrentSelectionForm':init(This, Rectangle, get({'FormTypeFactory':getInstance(), 'TEMP_HORIZONTAL_FORM'})).

