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
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import android.app.Activity

-module('TitleProgressBarPortionSetProgressRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProgressRunnable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
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
            ProgressCanvas = get({This, progressCanvas}),
            (get({get({This, midletActivity}), '$class'})):onSetProgress(get({This, midletActivity}), trunc((((get({get({This, progressCanvas}), '$class'})):getValue(get({This, progressCanvas})) + ((get({get({This, progressCanvas}), '$class'})):getMaxValue(get({This, progressCanvas})) / (get({ProgressCanvas, '$class'})):getPortion(ProgressCanvas))))), (get({get({This, progressCanvas}), '$class'})):getText(get({This, progressCanvas})))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E)
        end.

