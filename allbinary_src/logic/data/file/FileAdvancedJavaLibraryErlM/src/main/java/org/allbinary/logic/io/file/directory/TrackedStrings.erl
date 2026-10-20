% 
% AllBinary Open License Version 1 
% Copyright (c) 2026 AllBinary 
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
% package org.allbinary.logic.io.file.directory

-module('TrackedStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TrackedStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'TARGET_PATH_WINDOWS'}, "\\target\\"),
    put({This, 'TARGET_PATH_UNIX'}, "/target/"),
    put({This, 'HTML_TEMP'}, "HTMLTemp"),
    put({This, 'APPLICATION'}, "Application"),
    put({This, 'APP'}, "\\app"),
    put({This, 'GIT_COMMAND'}, "git"),
    put({This, 'CHANGE_DIRECTORY_OPTION'}, "-C"),
    put({This, 'LIST_FILES_COMMAND'}, "ls-files"),
    put({This, 'ERROR_UNMATCH_OPTION'}, "--error-unmatch"),
    put({This, 'PATHSPEC_SEPARATOR'}, "--"),
    put({This, 'SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE'}, "-z"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'TrackedStrings', instance}).

