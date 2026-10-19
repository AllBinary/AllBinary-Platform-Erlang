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
% package org.allbinary.graphics.canvas.transition.progress
% import org.allbinary.animation.transition.TransistionTypes
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import android.app.Activity

-module('DismissTitleProgressBarRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProgressRunnable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'ZOOM_OUT_AND_IN'}, array:from_list([get({'TransistionTypes':getInstance(), 'ZOOM_OUT'}), get({'TransistionTypes':getInstance(), 'ZOOM_IN'})])),
    ok.


new(MidletActivity, ProgressCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MidletActivity, ProgressCanvas),
    This.

init(This, MidletActivity, ProgressCanvas) ->
        'ProgressRunnable':init(This, MidletActivity, ProgressCanvas),
        init_fields(This).

run(This) ->
        try
            (get({get({This, midletActivity}), '$class'})):onDismissProgress(get({This, midletActivity}), get({This, 'ZOOM_OUT_AND_IN'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E)
        end.

