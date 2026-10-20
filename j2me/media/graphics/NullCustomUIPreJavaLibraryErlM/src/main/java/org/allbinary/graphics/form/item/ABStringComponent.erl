% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory

-module('ABStringComponent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_STRING_COMPONENT'}, 'ABStringComponent':new(get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'}))),
    ok.

init_fields(This) ->
    ok.


getBackgroundBasicColor(This) ->
        get({'BasicColorFactory':getInstance(), 'WHITE'}).

new(BackgroundBasicColor, ForegroundBasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, BackgroundBasicColor, ForegroundBasicColor) ->
    init_fields(This),
        ok.

getForegroundBasicColor(This) ->
        get({'BasicColorFactory':getInstance(), 'WHITE'}).

setForegroundBasicColor(This, ForegroundBasicColor) ->
        ok.

