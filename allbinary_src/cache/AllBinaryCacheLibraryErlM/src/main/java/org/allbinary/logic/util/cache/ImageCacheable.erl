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
% package org.allbinary.logic.util.cache
% import org.allbinary.logic.string.StringUtil

-module('ImageCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


new(Name, AnyType) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, AnyType),
    This.

init(This, Name, AnyType) when (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        ok.

getKey(This) ->
        get({This, name}).

toString(This) ->
        get({This, name}).

