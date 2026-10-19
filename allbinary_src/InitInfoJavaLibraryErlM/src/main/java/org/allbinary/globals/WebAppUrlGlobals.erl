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
% import org.allbinary.business.init.InitInfo
% import org.allbinary.logic.string.StringValidationUtil

-module('WebAppUrlGlobals').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('UrlGlobalsInterface', Function, Arguments).

init_fields(This) ->
    put({This, path}, undefined),
    put({This, isWebappPathSet}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'UrlGlobalsInterface':init(This),
    init_fields(This).


isTestingMode(This) ->
        (fun(Target_N65720) -> (get({Target_N65720, '$class'})):isTesting(Target_N65720) end)('InitInfo':getInstance()).

getWebappPath(This) ->
        get({This, path}).

setWebappPath(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({local, path}, Path),
        put({local, path}, get({local, path})),
        put({This, isWebappPathSet}, true).

getTestHtmlPath(This) ->
        (fun(Target_N65917) -> (get({Target_N65917, '$class'})):getTestHtmlPath(Target_N65917) end)('InitInfo':getInstance()).

% throws Exception
getMainPath(This) ->
        try
        MainPath = (fun(Target_N65983) -> (get({Target_N65983, '$class'})):getMainPath(Target_N65983) end)('InitInfo':getInstance()),
        case (not (fun(Target_N66030) -> (get({Target_N66030, '$class'})):isEmpty(Target_N66030, MainPath) end)('StringValidationUtil':getInstance())) of
            true ->
            throw({'$return', MainPath});
            false ->
            case get({This, isWebappPathSet}) of
            true ->
            throw({'$return', (get({This, '$class'})):getWebappPath(This)});
            false ->
            erlang:error({'Exception', "Webapp Path is not set"})
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

