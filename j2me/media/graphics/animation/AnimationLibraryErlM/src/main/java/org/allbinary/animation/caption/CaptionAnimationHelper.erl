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
% package org.allbinary.animation.caption
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.animation.text.TextAnimation
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('CaptionAnimationHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CaptionAnimationHelperBase', Function, Arguments).

init_fields(This) ->
    put({This, timeHelper}, 'TimeDelayHelper':new(620)),
    put({This, textAnimation}, 'TextAnimation':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 'AnimationBehavior':getInstance())),
    put({This, captionAnimation}, undefined),
    put({This, animation}, (fun(Target_N66025) -> (get({Target_N66025, '$class'})):getInstance(Target_N66025, 0) end)('NullAnimationFactory':getFactoryInstance())),
    ok.


new(CaptionAnimation, CaptionDx, CaptionDy, Dx, Dy) when is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CaptionAnimation, CaptionDx, CaptionDy, Dx, Dy),
    This.

init(This, CaptionAnimation, CaptionDx, CaptionDy, Dx, Dy) when is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy) ->
    'CaptionAnimationHelperBase':init(This),
    init_fields(This),
        put({This, captionAnimation}, 'CaptionAnimation':new(CaptionAnimation, get({This, textAnimation}), CaptionDx, CaptionDy, Dx, Dy)).

isShowing(This) ->
        try
        case (get({This, animation}) =:= get({This, captionAnimation})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

tick(This) ->
        case (get({get({This, timeHelper}), '$class'})):isTime(get({This, timeHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) of
            true ->
            put({This, animation}, (fun(Target_N66464) -> (get({Target_N66464, '$class'})):getInstance(Target_N66464, 0) end)('NullAnimationFactory':getFactoryInstance()));
            false -> ok
        end.

update(This, Message, BasicColor) when (is_list(Message) orelse Message =:= undefined) ->
        (get({get({This, textAnimation}), '$class'})):setBasicColorP(get({This, textAnimation}), BasicColor),
        (get({get({This, textAnimation}), '$class'})):setText(get({This, textAnimation}), Message),
        put({This, animation}, get({This, captionAnimation})),
        (get({get({This, timeHelper}), '$class'})):setStartTimeTNT(get({This, timeHelper})).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, animation}), '$class'})):paintXY(get({This, animation}), Graphics, X, Y).

