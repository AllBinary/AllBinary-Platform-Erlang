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

-module('FileFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileFactory':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'FileFactory', instance}).

% throws Exception
getInstance(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        'AbFile':createAbFileFromRawPath(FilePath).

% throws Exception
getInstance(This, File, ChildFilePath) when (is_list(ChildFilePath) orelse ChildFilePath =:= undefined) ->
        'AbFile':createAbFileWithChild(File, ChildFilePath).

% throws Exception
isFile(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        File = 'AbFile':createAbFile(Path),
        case (get({File, '$class'})):exists(File) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

