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
% import android.app.Notification.Builder
% import android.app.PendingIntent
% import android.content.Context
% import android.os.Parcelable

-module('NotificationBuilderAPI23').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('NotificationBuilder', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'NotificationBuilder':init(This),
    init_fields(This).


build(This, Context, Command, Message, Integer, PendingIntent) when (is_list(Message) orelse Message =:= undefined) ->
        Notification = (fun(Target_N65749) -> (get({Target_N65749, '$class'})):build(Target_N65749) end)((fun(Target_N65756) -> (get({Target_N65756, '$class'})):setContentIntent(Target_N65756, PendingIntent) end)((fun(Target_N65763) -> (get({Target_N65763, '$class'})):setContentText(Target_N65763, Message) end)((fun(Target_N65770) -> (get({Target_N65770, '$class'})):setContentTitle(Target_N65770, (get({Command, '$class'})):getLabel(Command)) end)((fun(Target_N65777) -> (get({Target_N65777, '$class'})):setWhen(Target_N65777, erlang:system_time(millisecond)) end)((fun(Target_N65784) -> (get({Target_N65784, '$class'})):setTicker(Target_N65784, Message) end)((fun(Target_N65791) -> (get({Target_N65791, '$class'})):setSmallIcon(Target_N65791, (get({Integer, '$class'})):intValue(Integer)) end)('Builder':new(Context)))))))),
        Notification.

