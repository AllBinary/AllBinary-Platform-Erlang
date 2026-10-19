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
% package org.allbinary.logic.communication.log
% import org.allbinary.logic.io.path.AbPathData

-module('LogData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'MAX'}, 5000000),
    put({This, extension}, "log"),
    put({This, backupFileExt}, lists:concat([lists:concat([lists:concat([get({'AbPathData':getInstance(), 'EXTENSION_SEP'}), "bak"]), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})]), "txt"])),
    put({This, 'ALLBINARY'}, "allbinary"),
    put({This, 'NAME'}, "LOG_NAME"),
    put({This, 'DESCRIPTION'}, "LOG_DESCRIPTION"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


