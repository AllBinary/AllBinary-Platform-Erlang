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
% import org.allbinary.logic.string.StringUtil

-module('AppUrlGlobals').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('UrlGlobalsInterface', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_APP_URL_GLOBALS'}, 'AppUrlGlobals':new()),
    ok.

init_fields(This) ->
    put({This, path}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'UrlGlobalsInterface':'$init'(This),
    init_fields(This).


isTestingMode(This) ->
        false.

getWebappPath(This) ->
        get({This, path}).

setWebappPath(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({This, path}, Path),
        case (not ((lists:suffix("\\", get({This, path})) orelse lists:suffix("/", get({This, path}))))) of
            true ->
            put({This, path}, lists:concat([get({This, path}), "\\"]));
            false -> ok
        end.

getTestHtmlPath(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

% throws Exception
getMainPath(This) ->
        get({This, path}).

