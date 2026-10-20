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
% import java.io.File
% import org.allbinary.logic.communication.log.PreLogUtil

-module('FileWrapperUtil').
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


wrapFiles(Files) when (is_tuple(Files) orelse Files =:= undefined) ->
        try
            AbFileArray = array:new(array:size(Files), {default, undefined}),
            lists:foreach(fun(Index) ->
                array:set(Index, 'AbFile':new(array:get(Index, Files)), AbFileArray)
            end, lists:seq((array:size(Files) - 1), 0, -1)),
            AbFileArray
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putSE("Exception Wrapping Files", "FileWrapperUtil", "wrapFiles", E),
            array:new(0, {default, undefined})
        end.

wrapFile(File) ->
        try
            'AbFile':new(File)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putSE("Exception Wrapping File", "FileWrapperUtil", "wrapFile", E),
            get({'AbFile', 'NULL_FILE'})
        end.

