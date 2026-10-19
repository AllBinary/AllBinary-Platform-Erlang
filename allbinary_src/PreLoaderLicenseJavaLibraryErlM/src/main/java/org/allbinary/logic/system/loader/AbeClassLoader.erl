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
% package org.allbinary.logic.system.loader
% import java.io.FileInputStream
% import java.io.IOException
% import java.util.Map
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogBuffer
% import org.allbinary.logic.communication.log.LogFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.AbCryptUtil

-module('AbeClassLoader').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ClassLoader', Function, Arguments).

static_init() ->
    put({?MODULE, classes}, (fun(Target_N66080) -> (get({Target_N66080, '$class'})):createHashMap(Target_N66080) end)('StdUtil':getInstance())),
    put({?MODULE, 'PATH'}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abCryptUtil}, 'AbCryptUtil':getInstance()),
    put({This, 'LOAD_CLASS'}, "loadClass"),
    put({This, 'ENCRYPTED_EXTENSION'}, lists:concat([get({'AbPathData':getInstance(), 'EXTENSION_SEP'}), "abc"])),
    put({This, key}, undefined),
    ok.


new(Parent, Key) when (is_list(Key) orelse Key =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Parent, Key),
    This.

init(This, Parent, Key) when (is_list(Key) orelse Key =:= undefined) ->
        'ClassLoader':init(This, Parent),
        init_fields(This),
        put({This, key}, Key),
        put({'AbeClassLoader', 'PATH'}, lists:concat([(get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):getWebappPath(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})), "WEB-INF/classes/"])).

findLoadedClass1(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({get({'AbeClassLoader', classes}), '$class'})):get(get({'AbeClassLoader', classes}), Name).

% throws ClassNotFoundException
loadClass(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        (get({This, '$class'})):loadClass(This, Name, false).

% throws ClassNotFoundException
loadClass(This, Name, Resolve) when (is_list(Name) orelse Name =:= undefined), is_boolean(Resolve) ->
        try
        put({local, loadedWith}, "findLoadedClass1"),
        LogBuffer = 'LogBuffer':new(),
        try
            put({local, myClass}, (get({This, '$class'})):findLoadedClass1(This, Name)),
            case (get({local, myClass}) =:= undefined) of
                true ->
                try
                    put({local, loadedWith}, "super.loadClass"),
                    NormalClass = 'ClassLoader':loadClass(This, Name, Resolve),
                    case (NormalClass =/= undefined) of
                        true ->
                        throw({'$return', NormalClass});
                        false -> ok
                    end
                catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                    (get({LogBuffer, '$class'})):add(LogBuffer, 'LogFactory':getInstance(lists:concat([lists:concat([lists:concat(["Failed to Load Class: ", Name]), "\nwith: "]), get({local, loadedWith})]), This, get({This, 'LOAD_CLASS'}), E))
                end,
                ClassBytes = (get({This, '$class'})):loadClassBytesFromFile(This, Name),
                case (ClassBytes =:= undefined) of
                    true ->
                    erlang:error({'ClassNotFoundException', lists:concat([lists:concat([lists:concat(["My Bytes not loaded for: ", Name]), "\nwith: "]), "loadClassBytes"])});
                    false -> ok
                end,
                put({local, myClass}, (get({This, '$class'})):defineClass(This, Name, ClassBytes, 0, array:size(ClassBytes))),
                case (get({local, myClass}) =:= undefined) of
                    true ->
                    erlang:error({'ClassNotFoundException', lists:concat([lists:concat([lists:concat(["My Class Not Defineable for: ", Name]), "\nwith: "]), "loadClassBytes"])});
                    false -> ok
                end,
                (get({get({'AbeClassLoader', classes}), '$class'})):put(get({'AbeClassLoader', classes}), Name, get({local, myClass}));
                false ->
                (get({LogBuffer, '$class'})):add(LogBuffer, 'LogFactory':getInstanceF(lists:concat([lists:concat([lists:concat(["Already Loaded: ", Name]), "\nwith: "]), get({local, loadedWith})]), This, get({This, 'LOAD_CLASS'})))
            end,
            (get({This, '$class'})):resolveClass(This, get({local, myClass})),
            get({local, myClass})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADERERROR'})) of
                true ->
                (get({LogBuffer, '$class'})):logAll(LogBuffer),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Failure loading: ", Name]), "\nwith: "]), get({local, loadedWith})]), This, get({This, 'LOAD_CLASS'}), E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

loadClassBytesFromFile(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({local, in}, undefined),
        put({local, cname}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        try
            put({local, cname}, lists:concat([lists:concat([get({'AbeClassLoader', 'PATH'}), (get({Name, '$class'})):replace(Name, $., get({'AbPathData':getInstance(), 'SEPARATORCHAR'}))]), get({This, 'ENCRYPTED_EXTENSION'})])),
            put({local, in}, 'FileInputStream':new(get({local, cname}))),
            Decrypted = (get({get({This, abCryptUtil}), '$class'})):decrypt(get({This, abCryptUtil}), get({local, in}), get({This, key})),
            Decrypted
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["(Before LogBuffer Output) Failure loading Encrypted: ", Name]), " File: "]), get({local, cname})]), "AbeClassLoader", "loadClassBytes", E);
                false -> ok
            end,
            (fun(Target_N68793) -> (get({Target_N68793, '$class'})):close(Target_N68793, get({local, in})) end)('StreamUtil':getInstance())
        end,
        undefined.

% throws ClassNotFoundException
oldLoadClass(This, Name, Resolve) when (is_list(Name) orelse Name =:= undefined), is_boolean(Resolve) ->
        try
        put({local, loadedWith}, "findLoadedClass1"),
        try
            put({local, myClass}, (get({This, '$class'})):findLoadedClass1(This, Name)),
            case (get({local, myClass}) =:= undefined) of
                true ->
                try
                    put({local, loadedWith}, "super.loadClass"),
                    NormalClass = 'ClassLoader':loadClass(This, Name, Resolve),
                    case (NormalClass =/= undefined) of
                        true ->
                        throw({'$return', NormalClass});
                        false -> ok
                    end
                catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADER'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Failed Loaded Class: ", Name]), " with: "]), get({local, loadedWith})]), This, get({This, 'LOAD_CLASS'}));
                        false -> ok
                    end
                end,
                put({local, loadedWith}, "loadClassBytes"),
                ClassBytes = (get({This, '$class'})):loadClassBytesFromFile(This, Name),
                case (ClassBytes =:= undefined) of
                    true ->
                    erlang:error({'ClassNotFoundException', lists:concat(["Bytes not loaded for: ", Name])});
                    false -> ok
                end,
                put({local, myClass}, (get({This, '$class'})):defineClass(This, Name, ClassBytes, 0, array:size(ClassBytes))),
                case (get({local, myClass}) =:= undefined) of
                    true ->
                    erlang:error({'ClassNotFoundException', lists:concat(["Class Not Defineable for: ", Name])});
                    false -> ok
                end,
                (get({get({'AbeClassLoader', classes}), '$class'})):put(get({'AbeClassLoader', classes}), Name, get({local, myClass}));
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Already Loaded: ", Name]), " with: "]), get({local, loadedWith})]), This, get({This, 'LOAD_CLASS'}));
                    false -> ok
                end
            end,
            (get({This, '$class'})):resolveClass(This, get({local, myClass})),
            get({local, myClass})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'LOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Failure loading: ", Name]), "AbeClassLoader", get({This, 'LOAD_CLASS'}), E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

