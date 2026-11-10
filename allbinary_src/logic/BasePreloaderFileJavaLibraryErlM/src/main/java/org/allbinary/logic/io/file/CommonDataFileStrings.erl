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
    put({This, 'PM'}, "pm"),
    put({This, '_PM'}, ".pm"),
    put({This, 'KTS'}, "kts"),
    put({This, '_KTS'}, ".kts"),
    put({This, 'CBL'}, "cbl"),
    put({This, '_CBL'}, ".cbl"),
    put({This, 'COB'}, "cob"),
    put({This, '_COB'}, ".cob"),
    put({This, 'F90'}, "f90"),
    put({This, '_F90'}, ".f90"),
    put({This, 'F'}, "f"),
    put({This, '_F'}, ".f"),
    put({This, 'DART'}, "dart"),
    put({This, '_DART'}, ".dart"),
    put({This, 'EX'}, "ex"),
    put({This, '_EX'}, ".ex"),
    put({This, 'EXS'}, "exs"),
    put({This, '_EXS'}, ".exs"),
    put({This, 'KOTLIN'}, "kotlin"),
    put({This, 'TYPESCRIPT'}, "typescript"),
    put({This, 'JAVASCRIPT'}, "javascript"),
    put({This, 'C_PLUS_PLUS'}, "c++"),
    put({This, 'PYTHON'}, "python"),
    put({This, 'C_SHARP'}, "c#"),
    put({This, 'RUST_NAME'}, "rust"),
    put({This, 'RUBY'}, "ruby"),
    put({This, 'PERL'}, "perl"),
    put({This, 'OBJECT_PASCAL'}, "objectpascal"),
    put({This, 'OCAML'}, "ocaml"),
    put({This, 'HASKELL'}, "haskell"),
    put({This, 'HAXE'}, "haxe"),
    put({This, 'ERLANG'}, "erlang"),
    put({This, 'COBOL'}, "cobol"),
    put({This, 'FORTRAN'}, "fortran"),
    put({This, 'ELIXIR'}, "elixir"),
    put({This, 'CPLUSPLUS'}, "cplusplus"),
    put({This, 'GOLANG'}, "golang"),
    put({This, 'CSHARP_ALIAS'}, "csharp"),
    put({This, 'C23'}, "c23"),
    put({This, 'PASCAL'}, "pascal"),
    put({This, 'OBJECT_PASCAL_ALIAS'}, "object pascal"),
    put({This, 'KT_SHORT_NAME'}, "Kt"),
    put({This, 'TS_SHORT_NAME'}, "Ts"),
    put({This, 'JS_SHORT_NAME'}, "Js"),
    put({This, 'CPP_SHORT_NAME'}, "Cpp"),
    put({This, 'PY_SHORT_NAME'}, "Py"),
    put({This, 'GO_SHORT_NAME'}, "Go"),
    put({This, 'CS_SHORT_NAME'}, "Cs"),
    put({This, 'ADA_SHORT_NAME'}, "Ada"),
    put({This, 'RUST_SHORT_NAME'}, "Rust"),
    put({This, 'LUA_SHORT_NAME'}, "Lua"),
    put({This, 'C_SHORT_NAME'}, "C"),
    put({This, 'ZIG_SHORT_NAME'}, "Zig"),
    put({This, 'RB_SHORT_NAME'}, "Rb"),
    put({This, 'PL_SHORT_NAME'}, "Pl"),
    put({This, 'PAS_SHORT_NAME'}, "Pas"),
    put({This, 'ML_SHORT_NAME'}, "Ml"),
    put({This, 'HS_SHORT_NAME'}, "Hs"),
    put({This, 'HX_SHORT_NAME'}, "Hx"),
    put({This, 'ERL_SHORT_NAME'}, "Erl"),
    put({This, 'CBL_SHORT_NAME'}, "Cbl"),
    put({This, 'F90_SHORT_NAME'}, "F90"),
    put({This, 'DART_SHORT_NAME'}, "Dart"),
    put({This, 'EX_SHORT_NAME'}, "Ex"),
    put({This, 'UNCRYPTED_EXTENSION'}, get({This, 'XML'})),
    put({This, 'ENCRYPTED_EXTENSION'}, "abd"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'CommonDataFileStrings', instance}).

