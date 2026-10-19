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
% package org.allbinary.content
% import javax.microedition.lcdui.Command
% import android.app.Notification
% import android.app.NotificationManager
% import android.app.PendingIntent
% import android.content.Context
% import android.content.Intent
% import org.allbinary.android.AndroidInfoFactory
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('NotificationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'NotificationUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, notificationManager}, (fun(Target_N65936) -> (get({Target_N65936, '$class'})):getSystemService(Target_N65936, get({'Context', 'NOTIFICATION_SERVICE'})) end)((fun(Target_N65943) -> (get({Target_N65943, '$class'})):getContext(Target_N65943) end)('ResourceUtil':getInstance()))),
    put({This, notificationBuilder}, undefined),
    ok.


getInstance() ->
        get({'NotificationUtil', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        SDK_VERSION = (fun(Target_N66125) -> (get({Target_N66125, '$class'})):getVersion(Target_N66125) end)('AndroidInfoFactory':getInstance()),
        case (SDK_VERSION > 22) of
            true ->
            put({This, notificationBuilder}, 'NotificationBuilderAPI23':new());
            false ->
            put({This, notificationBuilder}, get({'NotificationBuilder', 'NULL_NOTIFICATION_BUILDER'}))
        end.

notify(This, Command, Resource, Message) when (is_list(Resource) orelse Resource =:= undefined), (is_list(Message) orelse Message =:= undefined) ->
        try
        Context = (fun(Target_N66304) -> (get({Target_N66304, '$class'})):getContext(Target_N66304) end)('ResourceUtil':getInstance()),
        Intent = (fun(Target_N66362) -> (get({Target_N66362, '$class'})):getIntent(Target_N66362, Command) end)('CommandUriAction':getInstance()),
        Integer = (fun(Target_N66431) -> (get({Target_N66431, '$class'})):getResourceId(Target_N66431, Resource) end)('ResourceUtil':getInstance()),
        FLAG_IMMUTABLE = (1 bsl 26),
        SDK_VERSION = (fun(Target_N66547) -> (get({Target_N66547, '$class'})):getVersion(Target_N66547) end)('AndroidInfoFactory':getInstance()),
        PendingIntent = 'PendingIntent':getActivity(Context, 0, Intent, case (SDK_VERSION > 22) of true -> FLAG_IMMUTABLE; false -> 0 end),
        case (get({This, notificationBuilder}) =:= undefined) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'NOT_IMPLEMENTED'})),
            throw({'$return', ok});
            false -> ok
        end,
        (get({get({This, notificationBuilder}), '$class'})):build(get({This, notificationBuilder}), Context, Command, Message, Integer, PendingIntent)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

