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
% package org.allbinary.graphics.canvas.transition.progress
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil

-module('ProgressCanvasFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'PROGRESS_FORM_SCREEN'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
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
        case (get({'ProgressCanvasFactory', 'PROGRESS_FORM_SCREEN'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'ProgressCanvasFactory', 'PROGRESS_FORM_SCREEN'}, 'ProgressCanvas':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'})));
            false -> ok
        end,
        get({'ProgressCanvasFactory', 'PROGRESS_FORM_SCREEN'}).

getLazyInstance() ->
        'NullPaintable':getInstance().

