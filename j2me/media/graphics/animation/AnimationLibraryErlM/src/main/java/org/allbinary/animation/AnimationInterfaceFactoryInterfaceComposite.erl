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
% package org.allbinary.animation
% import org.allbinary.media.ScaleProperties

-module('AnimationInterfaceFactoryInterfaceComposite').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, animationInterfaceFactoryInterfaceArray}, undefined),
    ok.


new(BasicAnimationInterfaceFactoryInterfaceArray) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BasicAnimationInterfaceFactoryInterfaceArray),
    This.

init(This, BasicAnimationInterfaceFactoryInterfaceArray) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
    init_fields(This),
        put({This, animationInterfaceFactoryInterfaceArray}, BasicAnimationInterfaceFactoryInterfaceArray).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        (fun(Target_N65746) -> (get({Target_N65746, '$class'})):getInstance(Target_N65746, 0) end)('NullAnimationFactory':getFactoryInstance()).

getAnimationInterfaceFactoryInterfaceArray(This) ->
        get({This, animationInterfaceFactoryInterfaceArray}).

setInitialScale(This, ScaleProperties) ->
        ok.

