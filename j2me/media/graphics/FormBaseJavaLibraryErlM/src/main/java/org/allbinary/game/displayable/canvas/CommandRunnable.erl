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
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('CommandRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Runnable

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commandFormInputProcessor}, undefined),
    put({This, command}, undefined),
    ok.


new(CommandFormInputProcessor, Command) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CommandFormInputProcessor, Command),
    This.

init(This, CommandFormInputProcessor, Command) ->
    init_fields(This),
        put({This, commandFormInputProcessor}, CommandFormInputProcessor),
        put({This, command}, Command).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
            Canvas = (get({get({This, commandFormInputProcessor}), '$class'})):getCanvas(get({This, commandFormInputProcessor})),
            CommandListener = (get({Canvas, '$class'})):getCustomCommandListener(Canvas),
            (get({CommandListener, '$class'})):commandAction(CommandListener, get({This, command}), Canvas),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

