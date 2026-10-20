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
% package org.allbinary.midlet
% import javax.microedition.lcdui.NullCanvas
% import org.allbinary.canvas.Processor
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ExitRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Runnable

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, midlet}, undefined),
    put({This, processor}, undefined),
    put({This, isProgress}, false),
    ok.


new(Midlet, Processor, IsProgress) when is_boolean(IsProgress) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Midlet, Processor, IsProgress),
    This.

'$init'(This, Midlet, Processor, IsProgress) when is_boolean(IsProgress) ->
    init_fields(This),
        put({This, midlet}, Midlet),
        put({This, isProgress}, IsProgress),
        put({This, processor}, Processor).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({get({This, midlet}), '$class'})):destroyAppInRunnable(get({This, midlet}), false, get({This, isProgress})),
            (get({get({This, midlet}), '$class'})):setDisplay(get({This, midlet}), get({'NullCanvas', 'NULL_CANVAS'})),
            (get({get({This, midlet}), '$class'})):notifyDestroyed(get({This, midlet})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END_RUNNABLE'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({get({This, processor}), '$class'})):process(get({This, processor}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E),
            try
                (get({get({This, processor}), '$class'})):process(get({This, processor}))
            catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
            end
        end.

