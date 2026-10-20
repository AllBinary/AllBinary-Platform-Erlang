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

-module('URLGLOBALS').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, urlGlobalsInterface}, get({'AppUrlGlobals', 'NULL_APP_URL_GLOBALS'})),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


init(UrlGlobalsInterface) ->
        put({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface}, UrlGlobalsInterface).

isTestingMode() ->
        (get({get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface}), '$class'})):isTestingMode(get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface})).

getWebappPath() ->
        (get({get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface}), '$class'})):getWebappPath(get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface})).

getTestHtmlPath() ->
        (get({get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface}), '$class'})):getTestHtmlPath(get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface})).

% throws Exception
getMainPath() ->
        (get({get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface}), '$class'})):getMainPath(get({get({'URLGLOBALS', 'URLGLOBALS'}), urlGlobalsInterface})).

