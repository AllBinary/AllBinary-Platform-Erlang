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
% package org.allbinary.business.init.db
% import org.allbinary.logic.communication.log.PreLogUtil

-module('DbInitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DbConnectionInfo', Function, Arguments).

init_fields(This) ->
    ok.


new(InitFileName, Read) when (is_list(InitFileName) orelse InitFileName =:= undefined), is_boolean(Read) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InitFileName, Read),
    This.

init(This, InitFileName, Read) when (is_list(InitFileName) orelse InitFileName =:= undefined), is_boolean(Read) ->
        'DbConnectionInfo':init(This).

getUrl(This) ->
        Url = 'DbConnectionInfo':getUrl(This),
        'PreLogUtil':put(lists:concat(["Url: ", Url]), This, "getUrl"),
        Url.

% throws Exception
write(This) ->
        ok.

% throws Exception
load(This) ->
        ok.

setHasRead(This, Value) when is_boolean(Value) ->
        ok.

