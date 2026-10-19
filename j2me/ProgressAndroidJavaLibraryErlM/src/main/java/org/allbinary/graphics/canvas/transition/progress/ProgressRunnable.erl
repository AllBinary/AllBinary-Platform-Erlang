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
% import android.app.Activity
% import org.allbinary.android.activity.MidletActivityBase
% import org.allbinary.android.activity.SimpleProgressActivityInterface
% import org.allbinary.thread.ARunnable

-module('ProgressRunnable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ARunnable', Function, Arguments).

init_fields(This) ->
    put({This, midletActivity}, undefined),
    put({This, progressCanvas}, undefined),
    ok.


new(MidletActivity, ProgressCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MidletActivity, ProgressCanvas),
    This.

init(This, MidletActivity, ProgressCanvas) ->
    'ARunnable':init(This),
    init_fields(This),
        MidletActivity2 = MidletActivity,
        put({This, midletActivity}, MidletActivity2),
        put({This, progressCanvas}, ProgressCanvas).

run(This) ->
        ok.

