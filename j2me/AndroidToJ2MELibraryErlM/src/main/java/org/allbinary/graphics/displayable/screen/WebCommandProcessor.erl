%
% AllBinary Open License Version 1
% Copyright (c) 2022 AllBinary
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
% package org.allbinary.graphics.displayable.screen
% import android.content.Context
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import android.content.Intent
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('WebCommandProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'WebCommandProcessor':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, aboutCommandProcessor}, 'AboutCommandProcessor':getInstance()),
    put({This, 'WEB_VIEW_ACTIVITY'}, "org.allbinary.android.activity.WebViewActivity"),
    put({This, list}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'WebCommandProcessor', instance}).

process(This, MidletCommandListener, Command, Canvas) ->
        try
            Context = (get({get({This, aboutCommandProcessor}), '$class'})):getContext(get({This, aboutCommandProcessor})),
            Intent = 'Intent':new(Context, (fun(Target_N66257) -> (get({Target_N66257, '$class'})):loadClass(Target_N66257, get({This, 'WEB_VIEW_ACTIVITY'})) end)((fun(Target_N66264) -> (get({Target_N66264, '$class'})):getClassClassLoader(Target_N66264, This) end)('TsUtil':getInstance()))),
            (get({Intent, '$class'})):putExtra(Intent, get({get({This, aboutCommandProcessor}), 'URL'}), (get({get({This, list}), '$class'})):removeAt(get({This, list}), 0)),
            (get({Intent, '$class'})):setFlags(Intent, get({'Intent', 'FLAG_ACTIVITY_NEW_TASK'})),
            (get({Context, '$class'})):startActivity(Context, Intent)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "process", E)
        end.

