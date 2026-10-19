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
% import javax.microedition.media.Player
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.string.CommonLabels
% import org.allbinary.logic.math.SmallIntegerSingletonFactory

-module('Sounds').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, soundStrings}, 'SoundStrings':getInstance()),
    put({This, soundsFactoryInterface}, undefined),
    ok.


new(SoundsFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SoundsFactoryInterface),
    This.

init(This, SoundsFactoryInterface) ->
    init_fields(This),
        put({This, soundsFactoryInterface}, SoundsFactoryInterface).

% throws Exception
init(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'INIT'})),
        CommonLabels = 'CommonLabels':getInstance(),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({get({This, soundsFactoryInterface}), '$class'})):init(get({This, soundsFactoryInterface})),
        SoundInterfaceArray = (get({get({This, soundsFactoryInterface}), '$class'})):getSoundInterfaceArray(get({This, soundsFactoryInterface})),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        put({local, indexInteger}, undefined),
        put({local, indexString}, undefined),
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(I) ->
            SoundInterfaceCanBeNull = array:get(I, SoundInterfaceArray),
            case (SoundInterfaceCanBeNull =/= undefined) of
                true ->
                put({local, indexInteger}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, I)),
                put({local, indexString}, (get({get({local, indexInteger}), '$class'})):toString(get({local, indexInteger}))),
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonLabels, 'INDEX_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, indexString})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, soundStrings}), 'SOUND'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({SoundInterfaceCanBeNull, '$class'}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'INIT'})),
                (get({SoundInterfaceCanBeNull, '$class'})):init(SoundInterfaceCanBeNull),
                (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 100, (fun(Target_N66959) -> (get({Target_N66959, '$class'})):toString(Target_N66959) end)((fun(Target_N66966) -> (get({Target_N66966, '$class'})):append(Target_N66966, get({local, indexString})) end)((fun(Target_N66973) -> (get({Target_N66973, '$class'})):append(Target_N66973, get({get({This, soundStrings}), 'INIT_SOUND'})) end)('StringMaker':new()))));
                false -> ok
            end
        end, lists:seq(0, array:size(SoundInterfaceArray) - 1)),
        (get({get({This, soundsFactoryInterface}), '$class'})):setInitialized(get({This, soundsFactoryInterface}), true),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'INIT'})).

% throws Exception
stopAll(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, soundStrings}), 'STOP_ALL'})),
        SoundInterfaceArray = (get({get({This, soundsFactoryInterface}), '$class'})):getSoundInterfaceArray(get({This, soundsFactoryInterface})),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        put({local, player}, undefined),
        lists:foreach(fun(Index) ->
            case (array:get(Index, SoundInterfaceArray) =/= undefined) of
                true ->
                put({local, player}, (fun(Target_N67502) -> (get({Target_N67502, '$class'})):getPlayerP(Target_N67502) end)(array:get(Index, SoundInterfaceArray))),
                case (get({local, player}) =/= undefined) of
                    true ->
                    (get({get({local, player}), '$class'})):stop(get({local, player})),
                    (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, 100, get({get({This, soundStrings}), 'STOPPING_SOUND'}), Index);
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, array:size(SoundInterfaceArray) - 1)).

% throws Exception
closeAll(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, soundStrings}), 'CLOSE_ALL'})),
        SoundInterfaceArray = (get({get({This, soundsFactoryInterface}), '$class'})):getSoundInterfaceArray(get({This, soundsFactoryInterface})),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        put({local, player}, undefined),
        lists:foreach(fun(Index) ->
            case (array:get(Index, SoundInterfaceArray) =/= undefined) of
                true ->
                put({local, player}, (fun(Target_N68007) -> (get({Target_N68007, '$class'})):getPlayerP(Target_N68007) end)(array:get(Index, SoundInterfaceArray))),
                case (get({local, player}) =/= undefined) of
                    true ->
                    (get({get({local, player}), '$class'})):close(get({local, player})),
                    (get({ProgressCanvas, '$class'})):addPortion(ProgressCanvas, 100, get({get({This, soundStrings}), 'CLOSING_SOUND'}), Index);
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, array:size(SoundInterfaceArray) - 1)).

