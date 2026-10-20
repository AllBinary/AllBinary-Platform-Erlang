% Generated Code Do Not Modify
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Graphics

-module('NullDisplayable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Canvas', Function, Arguments).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'NullDisplayable':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'NullDisplayable', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Canvas':'$init'(This),
    init_fields(This),
        ok.

paint(This, Graphics) ->
        ok.

