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
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.TsUtil

-module('NotificationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'NotificationUtil':new()),
    ok.

init_fields(This) ->
    put({This, notificationManager}, (fun(Target_N65721) -> (get({Target_N65721, '$class'})):getSystemService(Target_N65721, get({'Context', 'NOTIFICATION_SERVICE'})) end)((fun(Target_N65728) -> (get({Target_N65728, '$class'})):getContext(Target_N65728) end)('ResourceUtil':getInstance()))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'NotificationUtil', 'SINGLETON'}).

notify(This, Command, Resource, Message) when (is_list(Resource) orelse Resource =:= undefined), (is_list(Message) orelse Message =:= undefined) ->
        Context = (fun(Target_N65869) -> (get({Target_N65869, '$class'})):getContext(Target_N65869) end)('ResourceUtil':getInstance()),
        Intent = (fun(Target_N65920) -> (get({Target_N65920, '$class'})):getIntent(Target_N65920, Command) end)('CommandUriAction':getInstance()),
        Integer = (fun(Target_N65982) -> (get({Target_N65982, '$class'})):getResourceId(Target_N65982, Resource) end)('ResourceUtil':getInstance()),
        Notification = 'Notification':new((get({Integer, '$class'})):intValue(Integer), Message, erlang:system_time(millisecond)),
        PendingIntent = 'PendingIntent':getActivity(Context, 0, Intent, 0),
        (get({Notification, '$class'})):setLatestEventInfo(Notification, Context, (get({Command, '$class'})):getLabel(Command), Message, PendingIntent),
        (get({get({This, notificationManager}), '$class'})):notify(get({This, notificationManager}), (fun(Target_N66275) -> (get({Target_N66275, '$class'})):hashCode(Target_N66275, Command) end)('TsUtil':getInstance()), Notification).

