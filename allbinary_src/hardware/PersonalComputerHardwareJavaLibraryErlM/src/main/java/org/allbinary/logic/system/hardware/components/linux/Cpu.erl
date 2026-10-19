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
% package org.allbinary.logic.system.hardware.components.linux
% import java.io.FileReader
% import java.io.LineNumberReader
% import java.util.HashMap
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FilePathData
% import org.allbinary.logic.io.file.directory.SubDirectory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.hardware.components.interfaces.CpuInterface
% import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('Cpu').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CpuInterface
% implements HardwareComponentInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'CPUFILE'}, "/proc/cpuinfo"),
    put({This, cpuHashMap}, undefined),
    ok.


new(FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, FilePath),
    This.

init(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):init(This, FilePath).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):init(This, get({This, 'CPUFILE'})).

% throws Exception
init(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        LineNumberReader = undefined,
        try
            (get({This, '$class'})):init(This, LineNumberReader, FilePath)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'OS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (fun(Target_N66640) -> (get({Target_N66640, '$class'})):toString(Target_N66640) end)((fun(Target_N66647) -> (get({Target_N66647, '$class'})):append(Target_N66647, (get({This, '$class'})):toString(This)) end)((fun(Target_N66654) -> (get({Target_N66654, '$class'})):append(Target_N66654, "Cpu Data: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
init(This, LineNumberReader, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        put({local, lineNumberReader}, LineNumberReader),
        try
            FileReader = 'FileReader':new(FilePath),
            put({local, lineNumberReader}, 'LineNumberReader':new(FileReader)),
            put({This, cpuHashMap}, (fun(Target_N66986) -> (get({Target_N66986, '$class'})):createHashMap(Target_N66986) end)('StdUtil':getInstance())),
            case (get({local, lineNumberReader}) =:= undefined) of
                true ->
                FileVector = (fun(Target_N67054) -> (get({Target_N67054, '$class'})):search(Target_N67054, FilePath, 'AbFile':createAbFile(get({'FilePathData':getInstance(), 'PATH_START'}))) end)('SubDirectory':getInstance()),
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'OS'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67234) -> (get({Target_N67234, '$class'})):toString(Target_N67234) end)((fun(Target_N67241) -> (get({Target_N67241, '$class'})):appendint(Target_N67241, (get({FileVector, '$class'})):size(FileVector)) end)((fun(Target_N67248) -> (get({Target_N67248, '$class'})):append(Target_N67248, "Cpu File BasicArrayList Size: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                    false -> ok
                end,
                case (not (get({FileVector, '$class'})):isEmpty(FileVector)) of
                    true ->
                    File = (get({FileVector, '$class'})):get(FileVector, 0),
                    put({local, lineNumberReader}, 'LineNumberReader':new('FileReader':new((get({File, '$class'})):getPath(File))));
                    false -> ok
                end;
                false -> ok
            end,
            case (get({local, lineNumberReader}) =/= undefined) of
                true ->
                put({local, nextLine}, (get({get({local, lineNumberReader}), '$class'})):readLine(get({local, lineNumberReader}))),
                (fun Loop() -> case ((get({local, lineNumberReader}) =/= undefined) andalso (get({local, nextLine}) =/= undefined)) of true ->
                    Index = allbinary_java:index_of(get({local, nextLine}), $:),
                    case (Index >= 0) of
                        true ->
                        Key = string:slice(get({local, nextLine}), 0, (Index) - (0)),
                        ValueIndex = (Index + 1),
                        Value = string:slice(get({local, nextLine}), ValueIndex, (string:length(get({local, nextLine}))) - (ValueIndex)),
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'PROCESSOR'}), '$class'})):toString(get({'CpuInfo', 'PROCESSOR'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'PROCESSOR'}), Value);
                            false -> ok
                        end,
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'VENDORID'}), '$class'})):toString(get({'CpuInfo', 'VENDORID'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'VENDORID'}), Value);
                            false -> ok
                        end,
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'CPUFAMILY'}), '$class'})):toString(get({'CpuInfo', 'CPUFAMILY'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'CPUFAMILY'}), Value);
                            false -> ok
                        end,
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'MODEL'}), '$class'})):toString(get({'CpuInfo', 'MODEL'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'MODEL'}), Value);
                            false -> ok
                        end,
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'MODELNAME'}), '$class'})):toString(get({'CpuInfo', 'MODELNAME'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'MODELNAME'}), Value);
                            false -> ok
                        end,
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'STEPPING'}), '$class'})):toString(get({'CpuInfo', 'STEPPING'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'STEPPING'}), Value);
                            false -> ok
                        end,
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'CPUMHZ'}), '$class'})):toString(get({'CpuInfo', 'CPUMHZ'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'CPUMHZ'}), Value);
                            false -> ok
                        end,
                        case (allbinary_java:index_of(Key, (get({get({'CpuInfo', 'CACHESIZE'}), '$class'})):toString(get({'CpuInfo', 'CACHESIZE'}))) >= 0) of
                            true ->
                            (get({get({This, cpuHashMap}), '$class'})):put(get({This, cpuHashMap}), get({'CpuInfo', 'CACHESIZE'}), Value);
                            false -> ok
                        end;
                        false -> ok
                    end,
                    put({local, nextLine}, (get({get({local, lineNumberReader}), '$class'})):readLine(get({local, lineNumberReader}))),
                    Loop();
                false -> ok end end)();
                false -> ok
            end
        after
            case (get({local, lineNumberReader}) =/= undefined) of
                true ->
                (get({get({local, lineNumberReader}), '$class'})):close(get({local, lineNumberReader}));
                false -> ok
            end
        end.

getProcessor(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'PROCESSOR'})).

getVendorId(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'VENDORID'})).

getCpuFamily(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'CPUFAMILY'})).

getModel(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'MODEL'})).

getModelName(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'MODELNAME'})).

getStepping(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'STEPPING'})).

getCpuSpeed(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'CPUMHZ'})).

getCacheSize(This) ->
        (get({get({This, cpuHashMap}), '$class'})):get(get({This, cpuHashMap}), get({'CpuInfo', 'CACHESIZE'})).

compareTo(This, CpuInterface) ->
        true;
compareTo(This, ComponentInterface) ->
        true.


toString(This) ->
        CommonLabels = 'CommonLabels':getInstance(),
        CommonSeps = 'CommonSeps':getInstance(),
        StringMaker = 'StringMaker':new(),
        (fun(Target_N69734) -> (get({Target_N69734, '$class'})):append(Target_N69734, (get({This, '$class'})):getProcessor(This)) end)((fun(Target_N69741) -> (get({Target_N69741, '$class'})):append(Target_N69741, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'PROCESSOR'}), '$class'})):toString(get({'CpuInfo', 'PROCESSOR'}))))),
        (get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'NEW_LINE'})),
        (fun(Target_N69869) -> (get({Target_N69869, '$class'})):append(Target_N69869, (get({This, '$class'})):getVendorId(This)) end)((fun(Target_N69876) -> (get({Target_N69876, '$class'})):append(Target_N69876, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'VENDORID'}), '$class'})):toString(get({'CpuInfo', 'VENDORID'}))))),
        (get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'NEW_LINE'})),
        (fun(Target_N70004) -> (get({Target_N70004, '$class'})):append(Target_N70004, (get({This, '$class'})):getCpuFamily(This)) end)((fun(Target_N70011) -> (get({Target_N70011, '$class'})):append(Target_N70011, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'CPUFAMILY'}), '$class'})):toString(get({'CpuInfo', 'CPUFAMILY'}))))),
        (get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'NEW_LINE'})),
        (fun(Target_N70139) -> (get({Target_N70139, '$class'})):append(Target_N70139, (get({This, '$class'})):getModel(This)) end)((fun(Target_N70146) -> (get({Target_N70146, '$class'})):append(Target_N70146, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'MODEL'}), '$class'})):toString(get({'CpuInfo', 'MODEL'}))))),
        (get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'NEW_LINE'})),
        (fun(Target_N70274) -> (get({Target_N70274, '$class'})):append(Target_N70274, (get({This, '$class'})):getModelName(This)) end)((fun(Target_N70281) -> (get({Target_N70281, '$class'})):append(Target_N70281, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'MODELNAME'}), '$class'})):toString(get({'CpuInfo', 'MODELNAME'}))))),
        (get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'NEW_LINE'})),
        (fun(Target_N70409) -> (get({Target_N70409, '$class'})):append(Target_N70409, (get({This, '$class'})):getStepping(This)) end)((fun(Target_N70416) -> (get({Target_N70416, '$class'})):append(Target_N70416, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'STEPPING'}), '$class'})):toString(get({'CpuInfo', 'STEPPING'}))))),
        (get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'NEW_LINE'})),
        (fun(Target_N70544) -> (get({Target_N70544, '$class'})):append(Target_N70544, (get({This, '$class'})):getCpuSpeed(This)) end)((fun(Target_N70551) -> (get({Target_N70551, '$class'})):append(Target_N70551, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'CPUMHZ'}), '$class'})):toString(get({'CpuInfo', 'CPUMHZ'}))))),
        (get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'NEW_LINE'})),
        (fun(Target_N70679) -> (get({Target_N70679, '$class'})):append(Target_N70679, (get({This, '$class'})):getCacheSize(This)) end)((fun(Target_N70686) -> (get({Target_N70686, '$class'})):append(Target_N70686, get({CommonLabels, 'COLON_SEP'})) end)((get({StringMaker, '$class'})):append(StringMaker, (get({get({'CpuInfo', 'CACHESIZE'}), '$class'})):toString(get({'CpuInfo', 'CACHESIZE'}))))),
        (get({StringMaker, '$class'})):toString(StringMaker).

