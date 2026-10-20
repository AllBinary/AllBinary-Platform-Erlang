% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('FileUtil2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileUtil2':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, streamUtil}, 'StreamUtil':getInstance()),
    ok.


getInstance() ->
        get({'FileUtil2', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

loadFileAsList(This, File, Max, ByteArray1) when is_integer(Max), (is_tuple(ByteArray1) orelse ByteArray1 =:= undefined) ->
        put({local, inputStream}, undefined),
        try
            put({local, inputStream}, 'AbFileInputStream':new(File))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'ADD'}), E)
        end,
        (fun(Target_N66211) -> (get({Target_N66211, '$class'})):loadFileAsList(Target_N66211, get({local, inputStream}), Max, ByteArray1) end)('SimpleFileUtil':getInstance()).

