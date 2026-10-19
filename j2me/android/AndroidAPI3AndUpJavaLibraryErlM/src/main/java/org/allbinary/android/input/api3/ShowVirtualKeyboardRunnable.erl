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
% package org.allbinary.android.input.api3
% import android.app.Activity
% import android.content.Context
% import android.view.View
% import android.view.inputmethod.InputMethodManager
% import org.allbinary.android.activity.ViewCompositeInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ShowVirtualKeyboardRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Runnable

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, activity}, undefined),
    ok.


new(Activity) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Activity),
    This.

init(This, Activity) ->
    init_fields(This),
        put({This, activity}, Activity).

run(This) ->
        try
            InputMethodManager = (get({get({This, activity}), '$class'})):getSystemService(get({This, activity}), get({'Context', 'INPUT_METHOD_SERVICE'})),
            ViewCompositeInterface = get({This, activity}),
            case (ViewCompositeInterface =:= undefined) of
                true ->
                'ForcedLogUtil':log("Activity Null", This);
                false -> ok
            end,
            View = (get({ViewCompositeInterface, '$class'})):getView(ViewCompositeInterface),
            (get({InputMethodManager, '$class'})):toggleSoftInputFromWindow(InputMethodManager, (get({View, '$class'})):getWindowToken(View), get({'InputMethodManager', 'SHOW_FORCED'}), 0)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'RUN'}), E)
        end.

