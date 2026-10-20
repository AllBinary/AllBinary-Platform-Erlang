% Generated Code Do Not Modify
% package org.allbinary.media.audio
% import javax.microedition.media.PlayerListener
% import android.media.MediaPlayer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings

-module('AndroidMediaPlayerWrapperListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, androidMediaPlayerWrapper}, get({'AndroidMediaPlayerWrapper', 'NULL_ANDROID_MEDIA_PLAYER_WRAPPER'})),
    put({This, mOnBufferingUpdateListener}, 'AndroidMediaPlayerOnBufferingUpdateListener':new(This)),
    put({This, mOnPreparedListener}, 'AndroidMediaPlayerOnPreparedListener':new(This)),
    put({This, mOnErrorListener}, 'AndroidMediaPlayerOnErrorListener':new(This)),
    put({This, mOnCompletionListener}, 'AndroidMediaPlayerOnCompletionListener':new(This)),
    ok.


new(AndroidMediaPlayerWrapper) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AndroidMediaPlayerWrapper),
    This.

'$init'(This, AndroidMediaPlayerWrapper) ->
    init_fields(This),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            put({This, androidMediaPlayerWrapper}, AndroidMediaPlayerWrapper),
            MediaPlayer = (get({AndroidMediaPlayerWrapper, '$class'})):getMediaPlayer(AndroidMediaPlayerWrapper),
            (get({MediaPlayer, '$class'})):setOnCompletionListener(MediaPlayer, get({This, mOnCompletionListener})),
            (get({MediaPlayer, '$class'})):setOnBufferingUpdateListener(MediaPlayer, get({This, mOnBufferingUpdateListener})),
            (get({MediaPlayer, '$class'})):setOnPreparedListener(MediaPlayer, get({This, mOnPreparedListener})),
            (get({MediaPlayer, '$class'})):setOnErrorListener(MediaPlayer, get({This, mOnErrorListener}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end.
% Java nested class MediaPlayerOnBufferingUpdateListener: move it to its own module 'MediaPlayerOnBufferingUpdateListener'
% Java nested class MediaPlayerOnPreparedListener: move it to its own module 'MediaPlayerOnPreparedListener'
% Java nested class MediaPlayerOnErrorListener: move it to its own module 'MediaPlayerOnErrorListener'
% Java nested class MediaPlayerOnCompletionListener: move it to its own module 'MediaPlayerOnCompletionListener'
% Java nested class AndroidMediaPlayerOnBufferingUpdateListener: move it to its own module 'AndroidMediaPlayerOnBufferingUpdateListener'
% Java nested class AndroidMediaPlayerOnPreparedListener: move it to its own module 'AndroidMediaPlayerOnPreparedListener'
% Java nested class AndroidMediaPlayerOnErrorListener: move it to its own module 'AndroidMediaPlayerOnErrorListener'
% Java nested class AndroidMediaPlayerOnCompletionListener: move it to its own module 'AndroidMediaPlayerOnCompletionListener'

