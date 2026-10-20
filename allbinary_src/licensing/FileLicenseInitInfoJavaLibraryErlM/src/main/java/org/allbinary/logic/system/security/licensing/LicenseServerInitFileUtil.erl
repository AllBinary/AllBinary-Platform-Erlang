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
% package org.allbinary.logic.system.security.licensing
% import java.io.InputStream
% import java.io.OutputStream
% import org.allbinary.business.init.LicenseInitInfoUtil
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.FileStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.logic.io.file.SimpleFileUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('LicenseServerInitFileUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'NULL_OUTPUT_STREAM'}, 'SimpleFileUtil':nullOutputStream()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


init(This) ->
        try
            FilePath = get({'LicenseInitInfoUtil':getInstance(), 'INITFILENAME'}),
            (fun(Target_N66144) -> (get({Target_N66144, '$class'})):setFilePath(Target_N66144, get({'StringUtil':getInstance(), 'EMPTY_STRING'})) end)('LicenseInitInfoUtil':getInstance()),
            case (fun(Target_N66199) -> (get({Target_N66199, '$class'})):isFile(Target_N66199, FilePath) end)('FileFactory':getInstance()) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Using Existing License File", This, get({get({This, commonStrings}), 'INIT'}));
                false ->
                (get({This, '$class'})):write(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E)
        end.

write(This) ->
        put({local, fileOutputStream}, get({This, 'NULL_OUTPUT_STREAM'})),
        try
            ResourceUtil = 'ResourceUtil':getInstance(),
            FilePath = get({'LicenseInitInfoUtil':getInstance(), 'INITFILENAME'}),
            InputStream = (get({ResourceUtil, '$class'})):getResourceAsStream(ResourceUtil, FilePath),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Writing Default License File", This, get({get({This, commonStrings}), 'INIT'})),
            FileStreamFactory = 'FileStreamFactory':getInstance(),
            put({local, fileOutputStream}, (get({FileStreamFactory, '$class'})):getFileOutputStreamInstance(FileStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), FilePath)),
            put({local, b}, 0),
            put({local, index}, 0),
            (fun Loop() -> case true of true ->
                put({local, b}, (get({InputStream, '$class'})):read(InputStream)),
                case (get({local, b}) =:= (-1)) of
                    true ->
                    throw('$break');
                    false -> ok
                end,
                (get({get({local, fileOutputStream}), '$class'})):write(get({local, fileOutputStream}), get({local, b})),
                put({local, index}, get({local, index}) + 1),
                Loop();
            false -> ok end end)(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Wrote Bytes: ", get({local, index})]), This, get({get({This, commonStrings}), 'INIT'})),
            (get({get({local, fileOutputStream}), '$class'})):flush(get({local, fileOutputStream}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E)
        after
            (fun(Target_N66507) -> (get({Target_N66507, '$class'})):close(Target_N66507, get({local, fileOutputStream})) end)('StreamUtil':getInstance())
        end.

