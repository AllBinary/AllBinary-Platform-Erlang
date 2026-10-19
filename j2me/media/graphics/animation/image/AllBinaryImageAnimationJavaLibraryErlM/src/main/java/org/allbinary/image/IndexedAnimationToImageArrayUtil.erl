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
% package org.allbinary.image
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.IndexedAnimation

-module('IndexedAnimationToImageArrayUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
getInstance(Width, Height, SequentialAnimationInterface) when is_integer(Width), is_integer(Height) ->
        Size = (get({SequentialAnimationInterface, '$class'})):getAnimationSize(SequentialAnimationInterface),
        ImageArray = array:new(Size, {default, undefined}),
        lists:foreach(fun(Index) ->
            (get({SequentialAnimationInterface, '$class'})):setFrame(SequentialAnimationInterface, Index),
            array:set(Index, (fun(Target_N65800) -> (get({Target_N65800, '$class'})):getInstanceWH(Target_N65800, Width, Height, SequentialAnimationInterface) end)('AnimationFrameToImageUtil':getInstance()), ImageArray)
        end, lists:seq(0, Size - 1)),
        ImageArray.

