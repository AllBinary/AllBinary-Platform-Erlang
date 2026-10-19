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
% package org.allbinary.logic.communication.http.file.upload
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath

-module('HttpFilePermissionsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HttpFilePermissionsUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'HttpFilePermissionsUtil', instance}).

% throws Exception
create(This, Path) ->
        File = 'AbFile':createAbFileFromAbPath(Path),
        case (not (get({File, '$class'})):isFile(File)) of
            true ->
            (get({File, '$class'})):createNewFile(File);
            false -> ok
        end.

