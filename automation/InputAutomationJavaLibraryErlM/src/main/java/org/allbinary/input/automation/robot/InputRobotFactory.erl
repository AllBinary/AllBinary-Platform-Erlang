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
% package org.allbinary.input.automation.robot
% import java.awt.GraphicsDevice
% import java.awt.GraphicsEnvironment
% import java.util.Collection
% import java.util.Iterator
% import java.util.Set
% import javax.help.HelpSet
% import javax.help.event.HelpSetEvent
% import javax.help.event.HelpSetListener
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.help.JavaHelpSetNotifier
% import org.allbinary.logic.java.anyType.InterfaceUtil
% import org.allbinary.logic.system.loader.SecuredNativeLibraryInterface
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('InputRobotFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, inputRobotFactory}, 'InputRobotFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, hashtable}, (fun(Target_N66207) -> (get({Target_N66207, '$class'})):createHashtable(Target_N66207) end)('StdUtil':getInstance())),
    put({This, helpSetListenerInterface}, undefined),
    ok.


% throws Exception
getInstance() ->
        get({'InputRobotFactory', inputRobotFactory}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        try
            Graphenv = 'GraphicsEnvironment':getLocalGraphicsEnvironment(),
            Screens = (get({Graphenv, '$class'})):getScreenDevices(Graphenv),
            put({local, inputRobotInterface}, undefined),
            lists:foreach(fun(I) ->
                put({local, inputRobotInterface}, 'InputRobot':new(array:get(I, Screens))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Adding Robot: ", (get({get({local, inputRobotInterface}), '$class'})):getName(get({local, inputRobotInterface}))]), This, "getRobots"),
                (fun(Target_N66576) -> (get({Target_N66576, '$class'})):put(Target_N66576, (get({get({local, inputRobotInterface}), '$class'})):getName(get({local, inputRobotInterface})), get({local, inputRobotInterface})) end)((get({This, '$class'})):get(This))
            end, lists:seq(0, array:size(Screens) - 1)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Robots: ", (get({get({This, hashtable}), '$class'})):size(get({This, hashtable}))]), This, "getRobots")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}))
        end.

addListener(This, HelpSetListenerInterface) ->
        put({This, helpSetListenerInterface}, HelpSetListenerInterface).

% throws Exception
add(This, InputRobotInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Adding InputRobotInterface: ", (get({InputRobotInterface, '$class'})):getName(InputRobotInterface)]), This, "add"),
        (fun(Target_N67022) -> (get({Target_N67022, '$class'})):put(Target_N67022, (get({InputRobotInterface, '$class'})):getName(InputRobotInterface), InputRobotInterface) end)((get({This, '$class'})):get(This)),
        HelpSet = (get({InputRobotInterface, '$class'})):getHelpSet(InputRobotInterface),
        case (get({This, helpSetListenerInterface}) =/= undefined) of
            true ->
            case (HelpSet =/= undefined) of
                true ->
                case (not 'JavaHelpSetNotifier':isNotified(HelpSet)) of
                    true ->
                    HelpSetEvent = 'HelpSetEvent':new(This, HelpSet, get({'HelpSetEvent', 'HELPSET_ADDED'})),
                    (get({get({This, helpSetListenerInterface}), '$class'})):helpSetAdded(get({This, helpSetListenerInterface}), HelpSetEvent);
                    false -> ok
                end;
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Null HelpSet For: ", (get({InputRobotInterface, '$class'})):getName(InputRobotInterface)]), This, "add")
            end;
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "No HelpSet Listener", This, "add")
        end.

% throws Exception
loadLibraries(This) ->
        Set = (fun(Target_N67519) -> (get({Target_N67519, '$class'})):keySet(Target_N67519) end)((get({This, '$class'})):get(This)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Loading Libraries", This, "loadLibraries"),
        NameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(NameArray),
        lists:foreach(fun(Index) ->
            InputRobotInterface = (fun(Target_N67711) -> (get({Target_N67711, '$class'})):get(Target_N67711, array:get(Index, NameArray)) end)('InputRobotFactory':getInstance()),
            'InputRobotFactory':loadLibrary(InputRobotInterface)
        end, lists:seq(0, Size - 1));
% throws Exception
loadLibraries(Collection) ->
        LogUtil = 'LogUtil':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, "Loading Libraries", "InputRobotFactory", "loadLibraries"),
        Iterator = (get({Collection, '$class'})):iterator(Collection),
        (fun Loop() -> case (get({Iterator, '$class'})):hasNext(Iterator) of true ->
            'InputRobotFactory':loadLibrary((get({Iterator, '$class'})):next(Iterator)),
            Loop();
        false -> ok end end)().


% throws Exception
loadLibrary(InputRobotInterface) ->
        LogUtil = 'LogUtil':getInstance(),
        case 'InterfaceUtil':isImplemented('SecuredNativeLibraryInterface', InputRobotInterface) of
            true ->
            (get({LogUtil, '$class'})):putF(LogUtil, lists:concat(["Loading Library: ", (get({InputRobotInterface, '$class'})):getName(InputRobotInterface)]), "InputRobotFactory", "loadLibraries"),
            SecuredNativeLibraryInterface = InputRobotInterface,
            (get({SecuredNativeLibraryInterface, '$class'})):load(SecuredNativeLibraryInterface);
            false -> ok
        end.

% throws Exception
unloadLibraries(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Unloading Libraries", This, "unloadLibraries"),
        Set = (fun(Target_N68544) -> (get({Target_N68544, '$class'})):keySet(Target_N68544) end)((get({This, '$class'})):get(This)),
        put({local, inputRobotInterface}, undefined),
        InputRobotArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(InputRobotArray),
        lists:foreach(fun(Index) ->
            put({local, inputRobotInterface}, (get({This, '$class'})):get(This, array:get(Index, InputRobotArray))),
            case 'InterfaceUtil':isImplemented('SecuredNativeLibraryInterface', get({local, inputRobotInterface})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Unloading Library: ", (get({get({local, inputRobotInterface}), '$class'})):getName(get({local, inputRobotInterface}))]), This, "unloadLibraries"),
                SecuredNativeLibraryInterface = get({local, inputRobotInterface}),
                (get({SecuredNativeLibraryInterface, '$class'})):unload(SecuredNativeLibraryInterface);
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
get(This) ->
        get({This, hashtable}).

get(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Getting Robot: ", Name]), This, "getRobots"),
        (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), Name).

