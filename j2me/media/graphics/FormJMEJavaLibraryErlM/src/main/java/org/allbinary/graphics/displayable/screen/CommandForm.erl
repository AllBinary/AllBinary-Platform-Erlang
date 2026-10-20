% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
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
% package org.allbinary.graphics.displayable.screen
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Form
% import javax.microedition.lcdui.NullCommandListener
% import org.allbinary.canvas.Processor
% import org.allbinary.game.displayable.canvas.MenuListener
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.command.MyCommandInterface
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABStack

-module('CommandForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements MyCommandInterface
% implements MenuListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('Form', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_COMMAND_FORM'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, repaintProcessor}, (fun(Target_N66465) -> (get({Target_N66465, '$class'})):create(Target_N66465, This) end)('ScreenRepaintProcessorFactory':getInstance())),
    put({This, commandStack}, undefined),
    ok.


getNullCommandForm() ->
        case (get({'CommandForm', 'NULL_COMMAND_FORM'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'CommandForm', 'NULL_COMMAND_FORM'}, 'CommandForm':new(get({'NullCommandListener', 'NULL_COMMAND_LISTENER'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'})));
            false -> ok
        end,
        get({'CommandForm', 'NULL_COMMAND_FORM'}).

new(CommandListener, FormTitle, BackgrounBasicColor, ForegroundBasicColor) when (is_list(FormTitle) orelse FormTitle =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CommandListener, FormTitle, BackgrounBasicColor, ForegroundBasicColor),
    This.

'$init'(This, CommandListener, FormTitle, BackgrounBasicColor, ForegroundBasicColor) when (is_list(FormTitle) orelse FormTitle =:= undefined) ->
        'Form':'$init'(This, FormTitle),
        init_fields(This),
        put({This, commandStack}, (fun(Target_N66593) -> (get({Target_N66593, '$class'})):createStack(Target_N66593) end)('StdUtil':getInstance())),
        try
            (get({get({This, repaintProcessor}), '$class'})):process(get({This, repaintProcessor}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end.

initCommands(This, CmdListener) ->
        ok.

open(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "open").

% throws Exception
close(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CLOSE'})).

% throws Exception
update(This) ->
        (get({get({This, repaintProcessor}), '$class'})):process(get({This, repaintProcessor})).

getSourceId(This) ->
        0.

addCommand(This, Command) ->
        (get({get({This, commandStack}), '$class'})):push(get({This, commandStack}), Command),
        'Form':addCommand(This, Command).

removeAllCommands(This) ->
        Size = (get({get({This, commandStack}), '$class'})):size(get({This, commandStack})),
        lists:foreach(fun(Index) ->
            'Form':removeCommand(This, (get({get({This, commandStack}), '$class'})):pop(get({This, commandStack})))
        end, lists:seq(0, Size - 1)).

