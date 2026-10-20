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
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath

-module('FileStreamFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        case (get({'FileStreamFactory', 'SINGLETON'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'FileStreamFactory', 'SINGLETON'}, 'FileStreamFactory':new());
            false -> ok
        end,
        get({'FileStreamFactory', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getFileInputStreamInstance(This, Path, FileName) when (is_list(Path) orelse Path =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        FILEABPATH = 'AbPath':new(Path, FileName),
        File = 'AbFile':createAbFileFromAbPath(FILEABPATH),
        'AbFileInputStream':new(File).

% throws Exception
getFileOutputStreamInstance(This, Path, FileName) when (is_list(Path) orelse Path =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        FILEABPATH = 'AbPath':new(Path, FileName),
        File = 'AbFile':createAbFileFromAbPath(FILEABPATH),
        case (get({File, '$class'})):exists(File) of
            true ->
            (get({File, '$class'})):delete(File),
            (get({File, '$class'})):createNewFile(File);
            false -> ok
        end,
        'AbFileOutputStream':createFromAbFile(File).

% throws Exception
delete(This, Path, FileName) when (is_list(Path) orelse Path =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        FILEABPATH = 'AbPath':new(Path, FileName),
        File = 'AbFile':createAbFileFromAbPath(FILEABPATH),
        (get({File, '$class'})):delete(File).

