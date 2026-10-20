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
% package org.allbinary.logic.system.security.licensing
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('ClientInformationFactory').
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


getInstance(This) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonStrings, 'NOT_IMPLEMENTED'}), This, get({CommonStrings, 'GET_INSTANCE'})),
        StringUtil = 'StringUtil':getInstance(),
        'ClientInformation':new(get({StringUtil, 'NULL_STRING'}), get({StringUtil, 'NULL_STRING'}), get({StringUtil, 'NULL_STRING'}), get({StringUtil, 'NULL_STRING'})).

