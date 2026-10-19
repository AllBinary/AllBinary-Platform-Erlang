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
% package org.allbinary.media.audio

-module('SoundsFactoryInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


init(This) ->
    erlang:error({abstract_method, init}).

% throws Exception
getSoundInterfaceArray(This) ->
    erlang:error({abstract_method, getSoundInterfaceArray}).

setInitialized(This, Initialized) when is_boolean(Initialized) ->
    erlang:error({abstract_method, setInitialized}).

isInitialized(This) ->
    erlang:error({abstract_method, isInitialized}).

