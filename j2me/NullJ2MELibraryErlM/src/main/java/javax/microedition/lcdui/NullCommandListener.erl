% Generated Code Do Not Modify
% package javax.microedition.lcdui

-module('NullCommandListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CommandListener

static_init() ->
    put({?MODULE, 'NULL_COMMAND_LISTENER'}, 'NullCommandListener':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


commandAction(This, C, D) ->
        ok.

