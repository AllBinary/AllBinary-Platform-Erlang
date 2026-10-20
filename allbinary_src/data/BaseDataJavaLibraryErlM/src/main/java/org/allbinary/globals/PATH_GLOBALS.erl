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
% package org.allbinary.globals
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('PATH_GLOBALS').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PATH_GLOBALS':new()),
    ok.

init_fields(This) ->
    put({This, 'DATA_PATH'}, undefined),
    put({This, 'INIT_PATH'}, undefined),
    put({This, 'VIEWS_PATH'}, undefined),
    put({This, 'LOG_PATH'}, undefined),
    put({This, 'BACKUP_PATH'}, undefined),
    ok.


getInstance() ->
        get({get({'PATH_GLOBALS', 'PATH_GLOBALS'}), instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        AbPathData = 'AbPathData':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "data"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({AbPathData, 'SEPARATOR'})),
        put({This, 'DATA_PATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'DATA_PATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonStrings':getInstance(), 'INIT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({AbPathData, 'SEPARATOR'})),
        put({This, 'INIT_PATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'DATA_PATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "log"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({AbPathData, 'SEPARATOR'})),
        put({This, 'LOG_PATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'DATA_PATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "backup"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({AbPathData, 'SEPARATOR'})),
        put({This, 'BACKUP_PATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'INIT_PATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "views"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({AbPathData, 'SEPARATOR'})),
        put({This, 'VIEWS_PATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

