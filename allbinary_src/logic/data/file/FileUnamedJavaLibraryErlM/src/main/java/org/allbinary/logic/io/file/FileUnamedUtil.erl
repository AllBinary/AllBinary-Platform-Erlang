% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import org.allbinary.string.CommonSeps

-module('FileUnamedUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileUnamedUtil':new()),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'FileUnamedUtil', instance}).

process(This, String) when (is_list(String) orelse String =:= undefined) ->
        put({local, simplifiedString}, string:lowercase(String)),
        put({local, simplifiedString}, (get({get({local, simplifiedString}), '$class'})):replace(get({local, simplifiedString}), get({get({This, commonSeps}), 'SPACE'}), get({get({This, commonSeps}), 'UNDERSCORE'}))),
        put({local, simplifiedString}, (get({get({local, simplifiedString}), '$class'})):replace(get({local, simplifiedString}), get({get({This, commonSeps}), 'DASH'}), get({get({This, commonSeps}), 'UNDERSCORE'}))),
        get({local, simplifiedString}).

