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
% import android.content.Context
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.NullUtil

-module('FileStreamFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, context}, undefined),
    ok.


getInstance() ->
        case (get({'FileStreamFactory', 'SINGLETON'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'FileStreamFactory', 'SINGLETON'}, 'FileStreamFactory':new((fun(Target_N65813) -> (get({Target_N65813, '$class'})):getContext(Target_N65813) end)('ResourceUtil':getInstance())));
            false -> ok
        end,
        get({'FileStreamFactory', 'SINGLETON'}).

new(Context) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Context),
    This.

'$init'(This, Context) ->
    init_fields(This),
        put({This, context}, Context).

% throws Exception
getFileInputStreamInstance(This, Path, FileName) when (is_list(Path) orelse Path =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        'AbFileInputStream':new((fun(Target_N66033) -> (get({Target_N66033, '$class'})):openFileInput(Target_N66033, FileName) end)((get({This, '$class'})):getContext(This))).

% throws Exception
getFileOutputStreamInstance(This, Path, FileName) when (is_list(Path) orelse Path =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        Context = (get({This, '$class'})):getContext(This),
        (get({Context, '$class'})):deleteFile(Context, FileName),
        'AbFileOutputStream':new((get({Context, '$class'})):openFileOutput(Context, FileName, 0)).

% throws Exception
delete(This, Path, FileName) when (is_list(Path) orelse Path =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        (fun(Target_N66379) -> (get({Target_N66379, '$class'})):deleteFile(Target_N66379, FileName) end)((get({This, '$class'})):getContext(This)).

getContext(This) ->
        get({This, context}).

