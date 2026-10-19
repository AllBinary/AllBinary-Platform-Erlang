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
% package org.allbinary.layer

-module('LayerProcessorInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicLayerProcessorInterface', Function, Arguments).


getLayerManager(This) ->
    erlang:error({abstract_method, getLayerManager}).

% throws Exception
processAt(This, AllBinaryLayerManager, LayerInterface, Index) when is_integer(Index) ->
    erlang:error({abstract_method, processAt}).

% throws Exception
isProcessorLayer(This, LayerInterface) ->
    erlang:error({abstract_method, isProcessorLayer}).

