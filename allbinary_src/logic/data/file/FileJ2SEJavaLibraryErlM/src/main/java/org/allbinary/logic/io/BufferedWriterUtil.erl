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
% package org.allbinary.logic.io
% import java.io.BufferedWriter
% import java.io.FileWriter
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('BufferedWriterUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BufferedWriterUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonLabels}, 'CommonLabels':getInstance()),
    put({This, 'REMOVING_OLD'}, "Remove old for overwriting: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'BufferedWriterUtil', instance}).

% throws Exception
overwrite(This, Path, Data) when (is_list(Path) orelse Path =:= undefined), (is_list(Data) orelse Data =:= undefined) ->
        AbFile = 'AbFile':createAbFile(Path),
        case (get({AbFile, '$class'})):exists(AbFile) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'REMOVING_OLD'}), Path]), This, get({get({This, commonStrings}), 'CREATE'})),
            (get({AbFile, '$class'})):delete(AbFile);
            false ->
            Name = (fun(Target_N66250) -> (get({Target_N66250, '$class'})):removeNameFromPath(Target_N66250, Path) end)('AbPathData':getInstance()),
            AbFileDirectory = 'AbFile':createAbFile(Name),
            case (get({AbFileDirectory, '$class'})):exists(AbFileDirectory) of
                true ->
                ok;
                false ->
                StringBuilder = 'StringMaker':new(),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66459) -> (get({Target_N66459, '$class'})):toString(Target_N66459) end)((fun(Target_N66466) -> (get({Target_N66466, '$class'})):append(Target_N66466, Name) end)((fun(Target_N66473) -> (get({Target_N66473, '$class'})):append(Target_N66473, get({get({This, commonLabels}), 'COLON_SEP'})) end)((get({StringBuilder, '$class'})):append(StringBuilder, get({get({This, commonStrings}), 'CREATE'}))))), This, get({get({This, commonStrings}), 'CREATE'})),
                Result = (get({AbFileDirectory, '$class'})):mkdirs(AbFileDirectory),
                (get({StringBuilder, '$class'})):delete(StringBuilder, 0, (get({StringBuilder, '$class'})):length(StringBuilder)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66684) -> (get({Target_N66684, '$class'})):toString(Target_N66684) end)((fun(Target_N66691) -> (get({Target_N66691, '$class'})):appendboolean(Target_N66691, Result) end)((get({StringBuilder, '$class'})):append(StringBuilder, get({get({This, commonLabels}), 'RESULT_'})))), This, get({get({This, commonStrings}), 'CREATE'}))
            end
        end,
        (get({This, '$class'})):write(This, AbFile, Data);
% throws Exception
overwrite(This, AbFile, Data) when (is_list(Data) orelse Data =:= undefined) ->
        case (get({AbFile, '$class'})):exists(AbFile) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'REMOVING_OLD'}), (get({AbFile, '$class'})):getPath(AbFile)]), This, get({get({This, commonStrings}), 'CREATE'})),
            (get({AbFile, '$class'})):delete(AbFile);
            false ->
            Name = (fun(Target_N67045) -> (get({Target_N67045, '$class'})):removeNameFromPath(Target_N67045, (get({AbFile, '$class'})):getAbsolutePath(AbFile)) end)('AbPathData':getInstance()),
            AbFileDirectory = 'AbFile':createAbFile(Name),
            case (get({AbFileDirectory, '$class'})):exists(AbFileDirectory) of
                true ->
                ok;
                false ->
                StringBuilder = 'StringMaker':new(),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67262) -> (get({Target_N67262, '$class'})):toString(Target_N67262) end)((fun(Target_N67269) -> (get({Target_N67269, '$class'})):append(Target_N67269, Name) end)((fun(Target_N67276) -> (get({Target_N67276, '$class'})):append(Target_N67276, get({get({This, commonLabels}), 'COLON_SEP'})) end)((get({StringBuilder, '$class'})):append(StringBuilder, get({get({This, commonStrings}), 'CREATE'}))))), This, get({get({This, commonStrings}), 'CREATE'})),
                Result = (get({AbFileDirectory, '$class'})):mkdirs(AbFileDirectory),
                (get({StringBuilder, '$class'})):delete(StringBuilder, 0, (get({StringBuilder, '$class'})):length(StringBuilder)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67487) -> (get({Target_N67487, '$class'})):toString(Target_N67487) end)((fun(Target_N67494) -> (get({Target_N67494, '$class'})):appendboolean(Target_N67494, Result) end)((get({StringBuilder, '$class'})):append(StringBuilder, get({get({This, commonLabels}), 'RESULT_'})))), This, get({get({This, commonStrings}), 'CREATE'}))
            end
        end,
        (get({This, '$class'})):write(This, AbFile, Data).


% throws Exception
write(This, AbFile, Data) when (is_list(Data) orelse Data =:= undefined) ->
        FileOut = 'BufferedWriter':new('FileWriter':new('AbFileNativeUtil':get(AbFile))),
        (get({FileOut, '$class'})):write(FileOut, Data, 0, string:length(Data)),
        (get({FileOut, '$class'})):newLine(FileOut),
        (get({FileOut, '$class'})):flush(FileOut).

