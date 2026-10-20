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
% package org.allbinary.logic.io.file
% import java.io.FileNotFoundException
% import android.content.Context
% import org.allbinary.data.resource.ResourceUtil

-module('FileFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'FileFactory':new((fun(Target_N65698) -> (get({Target_N65698, '$class'})):getContext(Target_N65698) end)('ResourceUtil':getInstance()))),
    ok.

init_fields(This) ->
    put({This, context}, undefined),
    ok.


new(Context) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Context),
    This.

'$init'(This, Context) ->
    init_fields(This),
        put({This, context}, Context).

getInstance() ->
        get({'FileFactory', 'SINGLETON'}).

% throws Exception
isFile(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
            (get({get({This, context}), '$class'})):openFileInput(get({This, context}), Path),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

getContext(This) ->
        get({This, context}).

% throws Exception
getFile(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        'AbFile':createAbFileFromRawPath(FilePath).

% throws Exception
getInstance(This, File, ChildFilePath) when (is_list(ChildFilePath) orelse ChildFilePath =:= undefined) ->
        'AbFile':createAbFileWithChild(File, ChildFilePath).

