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
% package org.allbinary.media.audio
% import android.media.MediaPlayer
% import org.allbinary.logic.communication.log.LogUtil

-module('MediaPlayerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MediaPlayerUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'MediaPlayerUtil', instance}).

% throws Exception
waitForMediaPlayer(This, MediaPlayer) ->
        MESSAGE = "Not Stopped Waiting",
        METHOD_NAME = "wait",
        put({local, index}, 0),
        (fun Loop() -> case ((get({MediaPlayer, '$class'})):isPlaying(MediaPlayer) andalso (get({local, index}) < 50)) of true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), MESSAGE, This, METHOD_NAME),
            timer:sleep(100),
            put({local, index}, get({local, index}) + 1),
            Loop();
        false -> ok end end)().

