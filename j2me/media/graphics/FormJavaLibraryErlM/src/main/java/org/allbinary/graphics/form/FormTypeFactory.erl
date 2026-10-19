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
% package org.allbinary.graphics.form
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.logic.string.StringUtil

-module('FormTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FormTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'UNK'}, "Unknown FormType"),
    put({This, 'NULL_FORM_TYPE'}, 'FormType':new(get({'StringUtil':getInstance(), 'NULL_STRING'}))),
    put({This, 'TEMP_HORIZONTAL_FORM'}, 'FormType':new("TempHorizontal")),
    put({This, 'HORIZONTAL_FORM'}, 'FormType':new("Horizontal")),
    put({This, 'VERTICAL_CENTER_FORM'}, 'FormType':new("Vertical")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'FormTypeFactory', instance}).

getFormType(This) ->
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        put({local, formType}, undefined),
        case (get({DisplayInfo, '$class'})):isPortrait(DisplayInfo) of
            true ->
            put({local, formType}, get({This, 'VERTICAL_CENTER_FORM'}));
            false ->
            put({local, formType}, get({This, 'HORIZONTAL_FORM'}))
        end,
        get({local, formType}).

