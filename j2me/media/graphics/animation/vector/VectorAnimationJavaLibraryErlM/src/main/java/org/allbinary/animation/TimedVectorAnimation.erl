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
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('TimedVectorAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('VectorAnimation', Function, Arguments).

init_fields(This) ->
    put({This, timeElapsedHelper}, 'TimeDelayHelper':new(200)),
    ok.


new(CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CurrentPoints, BasicColor, AnimationBehavior),
    This.

init(This, CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
        'VectorAnimation':init(This, CurrentPoints, BasicColor, AnimationBehavior),
        init_fields(This).

nextFrame(This) ->
        case (get({get({This, timeElapsedHelper}), '$class'})):isTime(get({This, timeElapsedHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) of
            true ->
            'VectorAnimation':nextFrame(This);
            false -> ok
        end.

