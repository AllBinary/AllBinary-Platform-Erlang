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

-module('FREEBLISKET_PATH_GLOBALS').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FREEBLISKET_PATH_GLOBALS':new()),
    ok.

init_fields(This) ->
    put({This, 'INSTALLPATH'}, undefined),
    put({This, 'XSLPATH'}, undefined),
    put({This, 'TEMPLATEPATH'}, lists:concat(["template", get({'AbPathData':getInstance(), 'SEPARATOR'})])),
    put({This, 'STYLEPATH'}, lists:concat([lists:concat([get({This, 'TEMPLATEPATH'}), "style"]), get({'AbPathData':getInstance(), 'SEPARATOR'})])),
    put({This, 'THEMEPATH'}, lists:concat([lists:concat([get({This, 'STYLEPATH'}), "theme"]), get({'AbPathData':getInstance(), 'SEPARATOR'})])),
    put({This, 'DBINITPATH'}, lists:concat([lists:concat([get({(get({get({'FREEBLISKET_PATH_GLOBALS', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'FREEBLISKET_PATH_GLOBALS', 'PATH_GLOBALS'})), 'INIT_PATH'}), "db"]), get({'AbPathData':getInstance(), 'SEPARATOR'})])),
    put({This, 'LINEDATAPATH'}, lists:concat([lists:concat([get({(get({get({'FREEBLISKET_PATH_GLOBALS', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'FREEBLISKET_PATH_GLOBALS', 'PATH_GLOBALS'})), 'INIT_PATH'}), "lineData"]), get({'AbPathData':getInstance(), 'SEPARATOR'})])),
    put({This, 'CONFIGURATIONPATH'}, undefined),
    put({This, 'USERCONFIGURATIONPATH'}, undefined),
    put({This, 'CONTEXTCONFIGURATIONPATH'}, undefined),
    put({This, 'LICENSEERRORPAGE'}, "LicensingError.jsp"),
    put({This, 'ERRORPAGE'}, "Error.jsp"),
    ok.


getInstance() ->
        get({get({'FREEBLISKET_PATH_GLOBALS', 'FREEBLISKET_PATH_GLOBALS'}), instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "install"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        put({This, 'INSTALLPATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'FREEBLISKET_PATH_GLOBALS', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'FREEBLISKET_PATH_GLOBALS', 'PATH_GLOBALS'})), 'INIT_PATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "views"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        put({This, 'XSLPATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'XSLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "configuration"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        put({This, 'CONFIGURATIONPATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'CONFIGURATIONPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "user"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        put({This, 'USERCONFIGURATIONPATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'CONFIGURATIONPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, "context"),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        put({This, 'CONTEXTCONFIGURATIONPATH'}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)).

