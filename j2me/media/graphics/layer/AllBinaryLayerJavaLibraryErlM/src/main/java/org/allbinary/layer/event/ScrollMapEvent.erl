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
% package org.allbinary.layer.event
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('ScrollMapEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(AnyType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnyType),
    This.

init(This, AnyType) ->
        'AllBinaryEventObject':init(This, AnyType),
        init_fields(This).

setDx(This, Dx) when is_integer(Dx) ->
        put({This, dx}, Dx).

getDx(This) ->
        get({This, dx}).

setDy(This, Dy) when is_integer(Dy) ->
        put({This, dy}, Dy).

getDy(This) ->
        get({This, dy}).

setDxDy(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({This, dx}, Dx),
        put({This, dy}, Dy).

