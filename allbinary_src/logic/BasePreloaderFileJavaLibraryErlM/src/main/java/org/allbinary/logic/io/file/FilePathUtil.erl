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
% package org.allbinary.logic.io.file
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringValidationUtil

-module('FilePathUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

adjust(Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({local, path}, Path),
        try
        AbPathData = 'AbPathData':getInstance(),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        FilePathData = 'FilePathData':getInstance(),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, path})) of
            true ->
            throw({'$return', get({FilePathData, 'PATH_START'})});
            false -> ok
        end,
        put({local, path}, (get({get({local, path}), '$class'})):replace(get({local, path}), get({AbPathData, 'SEPARATORCHAR'}), get({FilePathData, 'SEPARATORCHAR'}))),
        get({local, path})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

