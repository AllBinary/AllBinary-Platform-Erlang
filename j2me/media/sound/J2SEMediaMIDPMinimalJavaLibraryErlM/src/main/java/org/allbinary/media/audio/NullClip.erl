% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import java.io.IOException
% import javax.sound.sampled.AudioFormat
% import javax.sound.sampled.AudioInputStream
% import javax.sound.sampled.BooleanControl
% import javax.sound.sampled.Clip
% import javax.sound.sampled.Control
% import javax.sound.sampled.Control.Type
% import javax.sound.sampled.Line.Info
% import javax.sound.sampled.LineListener
% import javax.sound.sampled.LineUnavailableException

-module('NullClip').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements Clip

static_init() ->
    put({?MODULE, 'NULL_CONTROL'}, 'NullJ2SEControl':new(get({get({'BooleanControl', 'Type'}), 'MUTE'}))),
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


% throws LineUnavailableException
open(This, Format, Data, Offset, BufferSize) when (is_tuple(Data) orelse Data =:= undefined), is_integer(Offset), is_integer(BufferSize) ->
        ok.

% throws LineUnavailableException, IOException
open(This, Stream) ->
        ok.

getFrameLength(This) ->
        0.

getMicrosecondLength(This) ->
        0.

setFramePosition(This, Frames) when is_integer(Frames) ->
        ok.

setMicrosecondPosition(This, Microseconds) when is_integer(Microseconds) ->
        ok.

setLoopPoints(This, Start, End) when is_integer(Start), is_integer(End) ->
        ok.

loop(This, Count) when is_integer(Count) ->
        ok.

drain(This) ->
        ok.

flush(This) ->
        ok.

start(This) ->
        ok.

stop(This) ->
        ok.

isRunning(This) ->
        false.

isActive(This) ->
        false.

getFormat(This) ->
        get({'NullAudioFormat', 'NULL_AUDIO_FORMAT'}).

getBufferSize(This) ->
        0.

available(This) ->
        0.

getFramePosition(This) ->
        0.

getLongFramePosition(This) ->
        0.

getMicrosecondPosition(This) ->
        0.

getLevel(This) ->
        0.0.

getLineInfo(This) ->
        'Info':new(get({This, '$class'}), get({'NullAudioFormat', 'NULL_AUDIO_FORMAT'})).

% throws LineUnavailableException
open(This) ->
        ok.

close(This) ->
        ok.

isOpen(This) ->
        false.

getControls(This) ->
        array:new(0, {default, undefined}).

isControlSupported(This, Control) ->
        false.

getControl(This, Control) ->
        get({'NullClip', 'NULL_CONTROL'}).

addLineListener(This, Listener) ->
        ok.

removeLineListener(This, Listener) ->
        ok.

