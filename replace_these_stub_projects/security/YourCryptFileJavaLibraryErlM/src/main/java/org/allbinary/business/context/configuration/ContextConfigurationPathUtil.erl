% Generated Code Do Not Modify
% package org.allbinary.business.context.configuration
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath

-module('ContextConfigurationPathUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
getAbFile(ContextName) when (is_list(ContextName) orelse ContextName =:= undefined) ->
        undefined.

% throws Exception
getAbPath(ContextName) when (is_list(ContextName) orelse ContextName =:= undefined) ->
        undefined.

% throws Exception
getPath() ->
        undefined.

getFileName(ContextName) when (is_list(ContextName) orelse ContextName =:= undefined) ->
        undefined.

