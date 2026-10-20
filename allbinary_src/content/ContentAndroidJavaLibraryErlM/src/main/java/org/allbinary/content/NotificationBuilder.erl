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
% import org.allbinary.android.NullParcelable
% import javax.microedition.lcdui.Command
% import android.app.PendingIntent
% import android.content.Context
% import android.os.Parcelable

-module('NotificationBuilder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_NOTIFICATION_BUILDER'}, 'NotificationBuilder':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


build(This, Context, Command, Message, Integer, PendingIntent) when (is_list(Message) orelse Message =:= undefined) ->
        get({'NullParcelable', 'NULL_PARCELABLE'}).

