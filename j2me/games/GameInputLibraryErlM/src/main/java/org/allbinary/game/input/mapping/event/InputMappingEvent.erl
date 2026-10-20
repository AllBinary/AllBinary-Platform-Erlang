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
% package org.allbinary.game.input.mapping.event
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('InputMappingEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, inputToGameKeyMapping}, 'InputToGameKeyMapping':getNullInstance()),
    ok.


new(AnyType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnyType),
    This.

'$init'(This, AnyType) ->
        'AllBinaryEventObject':'$init'(This, AnyType),
        init_fields(This).

setInputToGameKeyMapping(This, InputToGameKeyMapping) ->
        put({This, inputToGameKeyMapping}, InputToGameKeyMapping).

getInputToGameKeyMapping(This) ->
        get({This, inputToGameKeyMapping}).

