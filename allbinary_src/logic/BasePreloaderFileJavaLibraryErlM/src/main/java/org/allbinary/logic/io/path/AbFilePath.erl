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
% package org.allbinary.logic.io.path
% import org.allbinary.logic.string.StringUtil

-module('AbFilePath').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbPath', Function, Arguments).

init_fields(This) ->
    ok.


new(APath) when (is_list(APath) orelse APath =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, APath),
    This.

'$init'(This, APath) when (is_list(APath) orelse APath =:= undefined) ->
        'AbPath':'$init'(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        PathData = 'AbPathData':getInstance(),
        AbPathUtil = 'PathUtil':getInstance(),
        put({This, schema}, (get({This, '$class'})):getSchema(This, APath)),
        (get({This, '$class'})):setName(This, (get({PathData, '$class'})):getNameFromPath(PathData, APath)),
        (get({This, '$class'})):setPath(This, (get({AbPathUtil, '$class'})):adjust(AbPathUtil, (get({This, '$class'})):getPathFromPath(This, (fun(Target_N65924) -> (get({Target_N65924, '$class'})):toString(Target_N65924) end)((get({AbPathUtil, '$class'})):removeNameFromPath(AbPathUtil, APath))))).

