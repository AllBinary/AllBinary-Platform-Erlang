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
% package org.allbinary.business.init
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath

-module('InitInfo2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InitInfo2':new()),
    ok.

init_fields(This) ->
    put({This, directory}, 'Directory':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'InitInfo2', instance}).

isTestHtmlPathValid(This, Value) ->
        (get({get({This, directory}), '$class'})):create(get({This, directory}), Value).

isMainPathValid(This, Value) ->
        (get({get({This, directory}), '$class'})):create(get({This, directory}), Value).

