% Generated Code Do Not Modify
% package javax.microedition.lcdui
% import java.util.Stack

-module('NullCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Canvas', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_CANVAS'}, 'NullCanvas':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Canvas':init(This),
    init_fields(This),
        ok.

setFullScreenMode(This, Mode) when is_boolean(Mode) ->
        ok.

sizeChanged(This, W, H) when is_integer(W), is_integer(H) ->
        ok.

getCommandStack(This) ->
        erlang:error({'RuntimeException'}).

isCommand(This, Command) ->
        erlang:error({'RuntimeException'}).

addCommand(This, Command) ->
        ok.

removeCommand(This, Command) ->
        ok.

removeAllCommands(This) ->
        ok.

setCommandListener(This, L) ->
        ok.

getCustomCommandListener(This) ->
        erlang:error({'RuntimeException'}).

isPaused(This) ->
        erlang:error({'RuntimeException'}).

removePauseCommand(This) ->
        ok.

pause(This) ->
        ok.

unPause(This) ->
        ok.

% throws Exception
process(This) ->
        ok.

paint(This, Graphics) ->
        ok.

destroy(This) ->
        ok.

setPaused(This, IsPaused) when is_boolean(IsPaused) ->
        erlang:error({'RuntimeException'}).

pointerDragged(This, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

pointerPressed(This, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

pointerReleased(This, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

