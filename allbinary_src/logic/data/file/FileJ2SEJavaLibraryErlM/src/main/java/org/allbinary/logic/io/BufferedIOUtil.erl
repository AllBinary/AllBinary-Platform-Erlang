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
% import java.io.BufferedReader
% import java.io.BufferedWriter
% import java.io.FileReader
% import java.io.FileWriter
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.AbFileNativeUtil
% import org.allbinary.logic.string.StringUtil

-module('BufferedIOUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
copy(BackupFile, BackupFileBak) ->
        put({local, line}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        TmpOut = 'BufferedWriter':new('FileWriter':new('AbFileNativeUtil':get(BackupFileBak))),
        TmpIn = 'BufferedReader':new('FileReader':new('AbFileNativeUtil':get(BackupFile))),
        (fun Loop() -> case true of true ->
            put({local, line}, (get({TmpIn, '$class'})):readLine(TmpIn)),
            case (get({local, line}) =:= undefined) of
                true ->
                throw('$break');
                false -> ok
            end,
            (get({TmpOut, '$class'})):write(TmpOut, get({local, line}), 0, string:length(get({local, line}))),
            (get({TmpOut, '$class'})):newLine(TmpOut),
            Loop();
        false -> ok end end)(),
        (get({TmpOut, '$class'})):flush(TmpOut).

