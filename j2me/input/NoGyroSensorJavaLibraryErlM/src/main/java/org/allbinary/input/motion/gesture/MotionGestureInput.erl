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
% package org.allbinary.input.motion.gesture
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory

-module('MotionGestureInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Input', Function, Arguments).

init_fields(This) ->
    ok.


new(Id, Name) when is_integer(Id), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Id, Name),
    This.

'$init'(This, Id, Name) when is_integer(Id), (is_list(Name) orelse Name =:= undefined) ->
        'Input':'$init'(This, Id, Name),
        InputFactory = 'InputFactory':getInstance(),
        (get({InputFactory, '$class'})):add(InputFactory, (get({This, '$class'})):getId(This), This).

