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
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Display
% import javax.microedition.lcdui.Displayable
% import javax.microedition.lcdui.NullCanvas
% import javax.microedition.midlet.MIDlet
% import javax.microedition.midlet.MIDletStateChangeException
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.system.Memory
% import org.allbinary.logic.NullUtil
% import org.allbinary.util.ABHashtable

-module('AllBinaryMidlet').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements CommandListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('MIDlet', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_ALLBINARY_MIDLET'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'SET_DISPLAY'}, "setDisplay"),
    put({This, 'SETTING_'}, "Setting: "),
    put({This, '_DISPLAY_'}, " Display: "),
    put({This, 'SETTING_NO_TITLE'}, "Setting: No Title, Display: "),
    put({This, hashtable}, (fun(Target_N66613) -> (get({Target_N66613, '$class'})):createHashtable(Target_N66613) end)('StdUtil':getInstance())),
    put({This, midletDestroyed}, false),
    ok.


getNullInstance() ->
        case (get({'AllBinaryMidlet', 'NULL_ALLBINARY_MIDLET'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'AllBinaryMidlet', 'NULL_ALLBINARY_MIDLET'}, 'AllBinaryMidlet':new());
            false -> ok
        end,
        get({'AllBinaryMidlet', 'NULL_ALLBINARY_MIDLET'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'MIDlet':init(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, "AllBinaryMidlet::AllBinaryMidlet").

setDisplay(This, NewDisplay) ->
        put({local, title}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        case (NewDisplay =/= get({'NullCanvas', 'NULL_CANVAS'})) of
            true ->
            put({local, title}, (get({NewDisplay, '$class'})):getTitle(NewDisplay)),
            case (get({local, title}) =/= undefined) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67082) -> (get({Target_N67082, '$class'})):toString(Target_N67082) end)((fun(Target_N67089) -> (get({Target_N67089, '$class'})):append(Target_N67089, (fun(Target_N67173) -> (get({Target_N67173, '$class'})):toString(Target_N67173, NewDisplay) end)('StringUtil':getInstance())) end)((fun(Target_N67096) -> (get({Target_N67096, '$class'})):append(Target_N67096, get({This, '_DISPLAY_'})) end)((fun(Target_N67103) -> (get({Target_N67103, '$class'})):append(Target_N67103, get({local, title})) end)((fun(Target_N67110) -> (get({Target_N67110, '$class'})):append(Target_N67110, get({This, 'SETTING_'})) end)('StringMaker':new()))))), This, get({This, 'SET_DISPLAY'}));
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66947) -> (get({Target_N66947, '$class'})):toString(Target_N66947) end)((fun(Target_N66954) -> (get({Target_N66954, '$class'})):append(Target_N66954, (fun(Target_N66997) -> (get({Target_N66997, '$class'})):toString(Target_N66997, NewDisplay) end)('StringUtil':getInstance())) end)((fun(Target_N66961) -> (get({Target_N66961, '$class'})):append(Target_N66961, get({This, 'SETTING_NO_TITLE'})) end)('StringMaker':new()))), This, get({This, 'SET_DISPLAY'}))
            end;
            false -> ok
        end,
        Display = (get({This, '$class'})):getDisplay(This),
        (get({Display, '$class'})):setCurrent(Display, NewDisplay).

getDisplay(This) ->
        'Display':getDisplay(This).

getCurrentDisplayable(This) ->
        (fun(Target_N67421) -> (get({Target_N67421, '$class'})):getCurrent(Target_N67421) end)('Display':getDisplay(This)).

setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        put({This, midletDestroyed}, Destroyed).

isDestroyed(This) ->
        get({This, midletDestroyed}).

% throws MIDletStateChangeException
startApp(This) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

pauseApp(This) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

destroyAppInRunnable(This, Unconditional, IsProgress) when is_boolean(Unconditional), is_boolean(IsProgress) ->
        ok.

destroyApp(This, Unconditional) when is_boolean(Unconditional) ->
        METHOD_NAME = "AllBinaryMidlet::destroyApp",
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, METHOD_NAME),
            'PreLogUtil':put('Memory':getInfo(), This, METHOD_NAME),
            (get({This, '$class'})):setDestroyed(This, true)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, METHOD_NAME, E)
        end.

% throws Exception
setStartStateHashtable(This, Hashtable) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68193) -> (get({Target_N68193, '$class'})):toString(Target_N68193) end)((fun(Target_N68200) -> (get({Target_N68200, '$class'})):append(Target_N68200, (fun(Target_N68256) -> (get({Target_N68256, '$class'})):toString(Target_N68256, Hashtable) end)('StringUtil':getInstance())) end)((fun(Target_N68207) -> (get({Target_N68207, '$class'})):append(Target_N68207, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, "setStartStateHashtable"),
        put({This, hashtable}, Hashtable).

% throws Exception
getStartStateHashtable(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68437) -> (get({Target_N68437, '$class'})):toString(Target_N68437) end)((fun(Target_N68444) -> (get({Target_N68444, '$class'})):append(Target_N68444, (fun(Target_N68500) -> (get({Target_N68500, '$class'})):toString(Target_N68500, get({This, hashtable})) end)('StringUtil':getInstance())) end)((fun(Target_N68451) -> (get({Target_N68451, '$class'})):append(Target_N68451, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, "getStartStateHashtable"),
        get({This, hashtable}).

% throws Exception
getCurrentStateHashtable(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getStateHashtable"),
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

commandAction(This, Command, Displayable) ->
        ok.

