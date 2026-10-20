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
% package org.allbinary.input.automation.module.osgi
% import java.io.File
% import java.io.FileFilter
% import java.io.FileInputStream
% import java.net.URL
% import java.util.HashMap
% import java.util.Set
% import java.util.jar.JarInputStream
% import java.util.jar.Manifest
% import org.osgi.framework.Bundle
% import org.osgi.framework.BundleContext
% import org.osgi.framework.Constants
% import bundle.input.automation.InputAutomationBundleActivator
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.FileWrapperUtil
% import org.allbinary.logic.io.file.directory.SubDirectory
% import org.allbinary.logic.io.file.filter.BasicFileFilterUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.RunnableInterface
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('InputAutomationNewBundleRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements RunnableInterface

static_init() ->
    put({?MODULE, 'FILE'}, "file:"),
    put({?MODULE, 'JAR_DIR_PROP'}, "org.knopflerfish.gosg.jars"),
    put({?MODULE, 'INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH'}, "ia/auto"),
    put({?MODULE, 'MODULES_START_LEVEL'}, 8),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, inputAutomationBundleActivator}, undefined),
    put({This, running}, false),
    put({This, fileBasicArrayList}, undefined),
    ok.


new(InputAutomationBundleActivator) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputAutomationBundleActivator),
    This.

'$init'(This, InputAutomationBundleActivator) ->
    init_fields(This),
        put({This, inputAutomationBundleActivator}, InputAutomationBundleActivator),
        put({This, fileBasicArrayList}, 'BasicArrayListD':new()).

% throws Exception
setThread(This, Thread) ->
        ok.

isRunning(This) ->
        get({This, running}).

setRunning(This, Running) when is_boolean(Running) ->
        put({This, running}, Running).

% throws Exception
updateModules(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "updateModules"),
        List = (get({This, '$class'})):findNewModules(This),
        Size = (get({List, '$class'})):size(List),
        put({local, bundle}, undefined),
        lists:foreach(fun(Index) ->
            put({local, bundle}, (get({This, '$class'})):install(This, (get({List, '$class'})):get(List, Index))),
            case (get({local, bundle}) =/= undefined) of
                true ->
                (get({get({local, bundle}), '$class'})):start(get({local, bundle}), get({'InputAutomationNewBundleRunnable', 'MODULES_START_LEVEL'}));
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
getAllJarSymbolicNameHashMap(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getAllJarSymbolicNameHashMap"),
        HashMap = (fun(Target_N67323) -> (get({Target_N67323, '$class'})):createHashMap(Target_N67323) end)('StdUtil':getInstance()),
        JarFileBasicArrayList = (get({This, '$class'})):getJarModuleFileBasicArrayList(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Jar Module Files: ", JarFileBasicArrayList]), This, "getAllJarSymbolicNameHashMap"),
        Size = (get({JarFileBasicArrayList, '$class'})):size(JarFileBasicArrayList),
        put({local, file}, undefined),
        lists:foreach(fun(Index) ->
            put({local, file}, (get({JarFileBasicArrayList, '$class'})):get(JarFileBasicArrayList, Index)),
            case (not (get({get({local, file}), '$class'})):isDirectory(get({local, file}))) of
                true ->
                FileInputStream = 'FileInputStream':new(get({local, file})),
                JarInputStream = 'JarInputStream':new(FileInputStream),
                Manifest = (get({JarInputStream, '$class'})):getManifest(JarInputStream),
                case (Manifest =:= undefined) of
                    true ->
                    ok;
                    false ->
                    SymbolicName = (fun(Target_N67823) -> (get({Target_N67823, '$class'})):getValue(Target_N67823, get({'Constants', 'BUNDLE_SYMBOLICNAME'})) end)((get({Manifest, '$class'})):getMainAttributes(Manifest)),
                    case (SymbolicName =/= undefined) of
                        true ->
                        (get({HashMap, '$class'})):put(HashMap, SymbolicName, 'URL':new((get({'InputAutomationNewBundleRunnable', 'FILE'}) + (get({get({local, file}), '$class'})):getAbsolutePath(get({local, file})))));
                        false -> ok
                    end
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        HashMap.

getJarModuleFileBasicArrayList(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getJarModuleFileBasicArrayList"),
        put({local, baseJarPath}, 'System':getProperty(get({'InputAutomationNewBundleRunnable', 'JAR_DIR_PROP'}))),
        case lists:prefix(get({'InputAutomationNewBundleRunnable', 'FILE'}), get({local, baseJarPath})) of
            true ->
            put({local, baseJarPath}, string:slice(get({local, baseJarPath}), (get({get({'InputAutomationNewBundleRunnable', 'FILE'}), '$class'})):length(get({'InputAutomationNewBundleRunnable', 'FILE'}))));
            false -> ok
        end,
        JarFileFilter = 'BasicFileFilterUtil':getInstance(".jar"),
        Path = lists:concat([get({local, baseJarPath}), get({'InputAutomationNewBundleRunnable', 'INPUT_AUTMATION_MODULE_BUNDLE_JAR_PATH'})]),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Path: ", Path]), This, "getJarModuleFileBasicArrayList"),
        File = 'File':new(Path),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["File: ", (get({File, '$class'})):getAbsolutePath(File)]), " isDirectory: "]), (get({File, '$class'})):isDirectory(File)]), This, "getJarModuleFileBasicArrayList"),
        (fun(Target_N68622) -> (get({Target_N68622, '$class'})):search(Target_N68622, JarFileFilter, 'FileWrapperUtil':wrapFile(File)) end)('SubDirectory':getInstance()).

% throws Exception
getInstalledJarSymbolicNameBasicArrayList(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getInstalledJarSymbolicNameBasicArrayList"),
        Vector = 'BasicArrayListD':new(),
        BundleContext = 'InputAutomationBundleActivator':getBundleContext(),
        BundleArray = (get({BundleContext, '$class'})):getBundles(BundleContext),
        case (BundleArray =/= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["bundleArray: ", array:size(BundleArray)]), This, "getInputAutomationModuleServices"),
            lists:foreach(fun(Index) ->
                Bundle = array:get(Index, BundleArray),
                (get({Vector, '$class'})):add(Vector, (get({Bundle, '$class'})):getSymbolicName(Bundle))
            end, lists:seq(0, array:size(BundleArray) - 1));
            false -> ok
        end,
        Vector.

% throws Exception
isInstalled(This, SymbolicName) when (is_list(SymbolicName) orelse SymbolicName =:= undefined) ->
        try
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'CommonLabels':getInstance(), 'START'}), SymbolicName]), This, "isInstalled"),
        List = (get({This, '$class'})):getInstalledJarSymbolicNameBasicArrayList(This),
        Size = (get({List, '$class'})):size(List),
        put({local, nextSymbolicName}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextSymbolicName}, (get({List, '$class'})):get(List, Index)),
            case ((get({get({local, nextSymbolicName}), '$class'})):compareTo(get({local, nextSymbolicName}), SymbolicName) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
findNewModules(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "findNewModules"),
        Vector = 'BasicArrayListD':new(),
        HashMap = (get({This, '$class'})):getAllJarSymbolicNameHashMap(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["All: ", HashMap]), This, "findNewModules"),
        Set = (get({HashMap, '$class'})):keySet(HashMap),
        SymbolicNameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(SymbolicNameArray),
        lists:foreach(fun(Index) ->
            SymbolicName = array:get(Index, SymbolicNameArray),
            case (not (get({This, '$class'})):isInstalled(This, SymbolicName)) of
                true ->
                (get({Vector, '$class'})):add(Vector, (get({HashMap, '$class'})):get(HashMap, SymbolicName));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Vector.

% throws Exception
install(This, Url) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'START'}) + Url), This, "install"),
        BundleContext = 'InputAutomationBundleActivator':getBundleContext(),
        (get({BundleContext, '$class'})):installBundle(BundleContext, (get({Url, '$class'})):toString(Url)).

run(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'RUN'})),
            (get({This, '$class'})):setRunning(This, true),
            TimeHelper = 'TimeDelayHelper':new(1000),
            try (fun Loop() -> case (get({This, '$class'})):isRunning(This) of true ->
                (get({TimeHelper, '$class'})):setStartTimeTNT(TimeHelper),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({'CommonLabels':getInstance(), 'ELAPSED'}) + (get({TimeHelper, '$class'})):getElapsedTNT(TimeHelper)), This, get({get({This, commonStrings}), 'RUN'})),
                (get({This, '$class'})):updateModules(This),
                throw('$break'),
                Loop();
            false -> ok end end)() catch throw:'$break' -> ok end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'RUN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'RUN'}), E)
        end.

