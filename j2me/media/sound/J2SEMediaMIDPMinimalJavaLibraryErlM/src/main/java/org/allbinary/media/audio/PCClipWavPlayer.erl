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
% import org.allbinary.thread.ARunnable
% import java.io.ByteArrayInputStream
% import java.io.InputStream
% import javax.microedition.media.Control
% import javax.microedition.media.MediaException
% import javax.microedition.media.PlayerListener
% import javax.sound.sampled.AudioInputStream
% import javax.sound.sampled.AudioSystem
% import javax.sound.sampled.Clip
% import javax.sound.sampled.FloatControl
% import javax.sound.sampled.LineEvent
% import javax.sound.sampled.LineListener
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.thread.MusicThreadPool

-module('PCClipWavPlayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements LineListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicPlayer', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, audioInputStream}, undefined),
    put({This, clip}, undefined),
    ok.


new(InputStream) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, InputStream),
    This.

init(This, InputStream) ->
    'BasicPlayer':init(This),
    init_fields(This),
        put({local, audioInputStream}, 'AudioInputStream':new('ByteArrayInputStream':new(get({'NullUtil':getInstance(), 'NULL_BYTE_ARRAY'})), get({'NullAudioFormat', 'NULL_AUDIO_FORMAT'}), 0)),
        put({local, clip}, 'NullClip':new()),
        try
            put({local, audioInputStream}, 'AudioSystem':getAudioInputStream(InputStream)),
            put({local, clip}, (get({This, '$class'})):create(This, get({local, audioInputStream}))),
            case (get({local, clip}) =:= undefined) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Clip was null", This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), {'Exception'}),
                erlang:error({'RuntimeException'});
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end,
        put({This, audioInputStream}, get({local, audioInputStream})),
        put({This, clip}, get({local, clip})).

close(This) ->
        (fun(Target_N66719) -> (get({Target_N66719, '$class'})):runTask(Target_N66719, 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
) end)('MusicThreadPool':getInstance()).

% throws Exception
close2(This) ->
        (get({get({This, clip}), '$class'})):drain(get({This, clip})),
        (get({get({This, clip}), '$class'})):flush(get({This, clip})),
        (get({get({This, clip}), '$class'})):close(get({This, clip})).

getContentType(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

% throws MediaException
start(This) ->
        (fun(Target_N67131) -> (get({Target_N67131, '$class'})):runTask(Target_N67131, 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
) end)('MusicThreadPool':getInstance()).

% throws Exception
start2(This) ->
        (get({get({This, clip}), '$class'})):setFramePosition(get({This, clip}), 0),
        (get({get({This, clip}), '$class'})):loop(get({This, clip}), (get({This, '$class'})):getLoopCount(This)),
        (get({get({This, clip}), '$class'})):start(get({This, clip})),
        'BasicPlayer':start(This).

% throws Exception
create(This, AudioInputStream) ->
        Clip = 'AudioSystem':getClip(),
        (get({Clip, '$class'})):addLineListener(Clip, This),
        (get({Clip, '$class'})):open(Clip, AudioInputStream),
        Clip.

% throws MediaException
stop(This) ->
        (fun(Target_N67713) -> (get({Target_N67713, '$class'})):runTask(Target_N67713, 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
) end)('MusicThreadPool':getInstance()).

% throws Exception
stop2(This) ->
        (get({get({This, clip}), '$class'})):stop(get({This, clip})),
        'BasicPlayer':stop(This).

getControl(This, ControlType) when (is_list(ControlType) orelse ControlType =:= undefined) ->
        'NullControl':new().

getControls(This) ->
        array:new(0, {default, undefined}).

setVolume(This, LeftVolume, RightVolume) when is_integer(LeftVolume), is_integer(RightVolume) ->
        (get({This, '$class'})):setVolumeF(This, ((float(LeftVolume)) / 100.0)).

getVolume(This) ->
        MasterGainFloatControl = (get({get({This, clip}), '$class'})):getControl(get({This, clip}), get({get({'FloatControl', 'Type'}), 'MASTER_GAIN'})),
        float(math:pow(10.0, ((get({MasterGainFloatControl, '$class'})):getValue(MasterGainFloatControl) / 20.0))).

setVolumeF(This, Volume) when is_number(Volume) ->
        case ((Volume < 0.0) orelse (Volume > 1.0)) of
            true ->
            erlang:error({'IllegalArgumentException', lists:concat(["Volume: ", Volume])});
            false -> ok
        end,
        MasterGainFloatControl = (get({get({This, clip}), '$class'})):getControl(get({This, clip}), get({get({'FloatControl', 'Type'}), 'MASTER_GAIN'})),
        (get({MasterGainFloatControl, '$class'})):setValue(MasterGainFloatControl, (20.0 * float(math:log10(Volume)))).

getDuration(This) ->
        ((get({get({This, clip}), '$class'})):getMicrosecondLength(get({This, clip})) / 1000).

update(This, Event) ->
        case (fun(Target_N68861) -> (get({Target_N68861, '$class'})):equals(Target_N68861, get({get({'LineEvent', 'Type'}), 'STOP'})) end)((get({Event, '$class'})):getType(Event)) of
            true ->
            Size = (get({get({This, listenersList}), '$class'})):size(get({This, listenersList})),
            lists:foreach(fun(Index) ->
                Listener = (get({get({This, listenersList}), '$class'})):get(get({This, listenersList}), Size),
                (get({Listener, '$class'})):playerUpdate(Listener, This, get({'PlayerListener', 'END_OF_MEDIA'}), undefined)
            end, lists:seq(0, Size - 1));
            false -> ok
        end.

