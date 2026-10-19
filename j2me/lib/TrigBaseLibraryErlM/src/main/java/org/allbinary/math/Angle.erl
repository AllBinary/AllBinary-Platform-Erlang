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
% package org.allbinary.math
% import jsinterop.annotations.JsType
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

-module('Angle').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, value}, 0),
    ok.


new(Angle) when is_integer(Angle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Angle),
    This.

init(This, Angle) when is_integer(Angle) ->
    init_fields(This),
        put({This, value}, Angle).

getValue(This) ->
        get({This, value}).

