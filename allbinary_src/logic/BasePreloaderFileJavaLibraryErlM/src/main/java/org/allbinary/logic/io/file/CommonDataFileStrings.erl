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
% package org.allbinary.logic.io.file

-module('CommonDataFileStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommonDataFileStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'XML'}, "xml"),
    put({This, '_XML'}, ".xml"),
    put({This, 'JSON'}, "json"),
    put({This, '_JSON'}, ".json"),
    put({This, 'XSL'}, "xsl"),
    put({This, '_XSL'}, ".xsl"),
    put({This, 'JAVA'}, "java"),
    put({This, '_JAVA'}, ".java"),
    put({This, 'KT'}, "kt"),
    put({This, '_KT'}, ".kt"),
    put({This, 'TS'}, "ts"),
    put({This, '_TS'}, ".ts"),
    put({This, 'JS'}, "js"),
    put({This, '_JS'}, ".js"),
    put({This, 'CPP'}, "cpp"),
    put({This, '_CPP'}, ".cpp"),
    put({This, 'H'}, "h"),
    put({This, '_H'}, ".h"),
    put({This, 'PY'}, "py"),
    put({This, '_PY'}, ".py"),
    put({This, 'GO'}, "go"),
    put({This, '_GO'}, ".go"),
    put({This, 'CS'}, "cs"),
    put({This, '_CS'}, ".cs"),
    put({This, 'ADB'}, "adb"),
    put({This, '_ADB'}, ".adb"),
    put({This, 'ADS'}, "ads"),
    put({This, '_ADS'}, ".ads"),
    put({This, 'ADA'}, "ada"),
    put({This, '_ADA'}, ".ada"),
    put({This, 'RUST'}, "rs"),
    put({This, '_RUST'}, ".rs"),
    put({This, 'C'}, "c"),
    put({This, '_C'}, ".c"),
    put({This, 'CSHARP'}, "cs"),
    put({This, '_CSHARP'}, ".cs"),
    put({This, 'ERL'}, "erl"),
    put({This, '_ERL'}, ".erl"),
    put({This, 'HS'}, "hs"),
    put({This, '_HS'}, ".hs"),
    put({This, 'HX'}, "hx"),
    put({This, '_HX'}, ".hx"),
    put({This, 'LUA'}, "lua"),
    put({This, '_LUA'}, ".lua"),
    put({This, 'PAS'}, "pas"),
    put({This, '_PAS'}, ".pas"),
    put({This, 'ML'}, "ml"),
    put({This, '_ML'}, ".ml"),
    put({This, 'PL'}, "pl"),
    put({This, '_PL'}, ".pl"),
    put({This, 'RB'}, "rb"),
    put({This, '_RB'}, ".rb"),
    put({This, 'ZIG'}, "zig"),
    put({This, '_ZIG'}, ".zig"),
    put({This, 'UNCRYPTED_EXTENSION'}, get({This, 'XML'})),
    put({This, 'ENCRYPTED_EXTENSION'}, "abd"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CommonDataFileStrings', instance}).

