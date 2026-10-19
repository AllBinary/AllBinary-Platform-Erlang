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
% package org.allbinary.logic.system.security.licensing.registration
% import java.io.DataInputStream
% import java.io.InputStream
% import java.io.OutputStream
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.FileStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil

-module('RegistrationConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'RegistrationConfiguration':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, registrationCode}, "No Registration Code"),
    put({This, 'NAME'}, "registrationid"),
    put({This, 'FILE'}, "Registration.dat"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        try
            case (fun(Target_N66167) -> (get({Target_N66167, '$class'})):isFile(Target_N66167, get({This, 'FILE'})) end)('FileFactory':getInstance()) of
                true ->
                (get({This, '$class'})):read(This);
                false ->
                (get({This, '$class'})):write(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end.

getInstance() ->
        get({'RegistrationConfiguration', 'SINGLETON'}).

% throws Exception
read(This) ->
        FileInputStreamFactory = 'FileStreamFactory':getInstance(),
        FileInputStream = (get({FileInputStreamFactory, '$class'})):getFileInputStreamInstance(FileInputStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, 'FILE'})),
        DataInputStream = 'DataInputStream':new(FileInputStream),
        (get({This, '$class'})):setRegistrationCode(This, (get({DataInputStream, '$class'})):readUTF(DataInputStream)),
        'PreLogUtil':put((fun(Target_N66707) -> (get({Target_N66707, '$class'})):toString(Target_N66707) end)((fun(Target_N66714) -> (get({Target_N66714, '$class'})):append(Target_N66714, (get({This, '$class'})):toString(This)) end)((fun(Target_N66721) -> (get({Target_N66721, '$class'})):append(Target_N66721, "Read Configuration: ") end)('StringMaker':new()))), This, "read").

% throws Exception
write(This) ->
        put({local, dataOutputStream}, undefined),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66917) -> (get({Target_N66917, '$class'})):toString(Target_N66917) end)((fun(Target_N66924) -> (get({Target_N66924, '$class'})):append(Target_N66924, (get({This, '$class'})):toString(This)) end)((fun(Target_N66931) -> (get({Target_N66931, '$class'})):append(Target_N66931, "Write Configuration: ") end)('StringMaker':new()))), This, "write"),
            FileInputStreamFactory = 'FileStreamFactory':getInstance(),
            FileOutputStream = (get({FileInputStreamFactory, '$class'})):getFileOutputStreamInstance(FileInputStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, 'FILE'})),
            put({local, dataOutputStream}, 'AbDataOutputStream':new(FileOutputStream)),
            (get({get({local, dataOutputStream}), '$class'})):writeUTF(get({local, dataOutputStream}), (get({This, '$class'})):getRegistrationCode(This)),
            (get({get({local, dataOutputStream}), '$class'})):flush(get({local, dataOutputStream}))
        after
            (fun(Target_N66851) -> (get({Target_N66851, '$class'})):close(Target_N66851, get({local, dataOutputStream})) end)('StreamUtil':getInstance())
        end.

toString(This) ->
        (fun(Target_N67248) -> (get({Target_N67248, '$class'})):toString(Target_N67248) end)((fun(Target_N67255) -> (get({Target_N67255, '$class'})):append(Target_N67255, (get({This, '$class'})):getRegistrationCode(This)) end)((fun(Target_N67262) -> (get({Target_N67262, '$class'})):append(Target_N67262, "Registration Code: ") end)('StringMaker':new()))).

setRegistrationCode(This, RegistrationCode) when (is_list(RegistrationCode) orelse RegistrationCode =:= undefined) ->
        put({This, registrationCode}, RegistrationCode).

getRegistrationCode(This) ->
        get({This, registrationCode}).

