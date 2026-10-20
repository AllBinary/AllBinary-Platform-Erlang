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

-module('FileData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileData':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "FILE_NAME"),
    put({This, 'ISFILE'}, "FILE_ISFILE"),
    put({This, 'ISDIRECTORY'}, "FILE_ISDIRECTORY"),
    put({This, 'ISHIDDEN'}, "FILE_ISHIDDEN"),
    put({This, 'ISABSOLUTE'}, "FILE_ISABSOLUTE"),
    put({This, 'ROOT_NAME'}, "FILE_ROOT_NAME"),
    put({This, 'PATH'}, "FILE_PATH"),
    put({This, 'ABSOLUTE_PATH'}, "FILE_ABSOLUTE_PATH"),
    put({This, 'CANONICAL_PATH'}, "FILE_CANONICAL_PATH"),
    put({This, 'PARENT'}, "FILE_PARENT"),
    put({This, 'MINLEN'}, 1),
    put({This, 'MAXLEN'}, 120),
    put({This, 'MAXIMAGEFILESIZE'}, 1048576),
    put({This, 'MINIMAGEFILESIZE'}, 32),
    put({This, 'MAXDOWNLOADABLEFILESIZE'}, (1048576 * 20)),
    put({This, 'MINDOWNLOADABLEFILESIZE'}, 1),
    ok.


getInstance() ->
        get({'FileData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

