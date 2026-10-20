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
% package org.allbinary.logic.util.event
% import jsinterop.annotations.JsType
% import org.allbinary.logic.NullUtil
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('AllBinaryEventObject').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_EVENT'}, 'AllBinaryEventObject':new(get({'NullUtil':getInstance(), 'NULL_OBJECT'}))),
    ok.

init_fields(This) ->
    put({This, source}, undefined),
    ok.


new(AnyType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnyType),
    This.

'$init'(This, AnyType) ->
    init_fields(This),
        put({This, source}, AnyType).

getSource(This) ->
        get({This, source}).

setSource(This, Source) ->
        put({This, source}, Source).

