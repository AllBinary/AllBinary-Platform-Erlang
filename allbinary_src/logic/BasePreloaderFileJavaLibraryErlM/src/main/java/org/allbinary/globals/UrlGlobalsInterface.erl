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

-module('UrlGlobalsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
getMainPath(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

getTestHtmlPath(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

getWebappPath(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

isTestingMode(This) ->
        false.

