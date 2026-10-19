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
% package org.allbinary.input.automation.log
% import java.io.File
% import java.io.FileOutputStream
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.ImageOutputData
% import org.allbinary.logic.java.number.LongUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('FrameLog').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, frameBytes}, (fun(Target_N65817) -> (get({Target_N65817, '$class'})):getBytes(Target_N65817) end)(allbinary_java:to_string("Frame: "))),
    put({?MODULE, info}, (fun(Target_N65879) -> (get({Target_N65879, '$class'})):getBytes(Target_N65879) end)(allbinary_java:to_string("Info: \n"))),
    put({?MODULE, actions}, (fun(Target_N65941) -> (get({Target_N65941, '$class'})):getBytes(Target_N65941) end)(allbinary_java:to_string("Actions: \n"))),
    ok.

init_fields(This) ->
    put({This, frame}, undefined),
    put({This, infoStringBuffer}, 'StringMaker':new()),
    put({This, actionsStringBuffer}, 'StringMaker':new()),
    ok.


new(Frame) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Frame),
    This.

init(This, Frame) ->
    init_fields(This),
        put({This, frame}, Frame).

addInfo(This, InfoString) when (is_list(InfoString) orelse InfoString =:= undefined) ->
        (get({get({This, infoStringBuffer}), '$class'})):append(get({This, infoStringBuffer}), InfoString).

addActions(This, VectorOfStrings) ->
        Size = (get({VectorOfStrings, '$class'})):size(VectorOfStrings),
        lists:foreach(fun(Index) ->
            (get({This, '$class'})):addAction(This, (get({VectorOfStrings, '$class'})):get(VectorOfStrings, Index))
        end, lists:seq(0, Size - 1)).

addAction(This, Action) when (is_list(Action) orelse Action =:= undefined) ->
        (get({get({This, actionsStringBuffer}), '$class'})):append(get({This, actionsStringBuffer}), Action),
        (get({get({This, actionsStringBuffer}), '$class'})):append(get({This, actionsStringBuffer}), get({'CommonSeps':getInstance(), 'NEW_LINE'})).

% throws Exception
write(This) ->
        FilePathStringBuffer = 'StringMaker':new(),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, get({'ImageOutputData', 'SAVE_PATH'})),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, 'LongUtil':fillIn((get({get({This, frame}), '$class'})):toString(get({This, frame})))),
        (get({FilePathStringBuffer, '$class'})):append(FilePathStringBuffer, ".txt"),
        FilePath = (get({FilePathStringBuffer, '$class'})):toString(FilePathStringBuffer),
        FileOutputStream = 'FileOutputStream':new('File':new(FilePath)),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, get({'FrameLog', frameBytes})),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, (fun(Target_N66954) -> (get({Target_N66954, '$class'})):getBytes(Target_N66954) end)((fun(Target_N66961) -> (get({Target_N66961, '$class'})):toString(Target_N66961) end)((get({This, '$class'})):getFrame(This)))),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, $\n),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, get({'FrameLog', info})),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, (fun(Target_N67067) -> (get({Target_N67067, '$class'})):getBytes(Target_N67067) end)((get({get({This, infoStringBuffer}), '$class'})):toString(get({This, infoStringBuffer})))),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, $\n),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, get({'FrameLog', actions})),
        (get({FileOutputStream, '$class'})):write(FileOutputStream, (fun(Target_N67183) -> (get({Target_N67183, '$class'})):getBytes(Target_N67183) end)((get({get({This, actionsStringBuffer}), '$class'})):toString(get({This, actionsStringBuffer})))),
        (get({FileOutputStream, '$class'})):close(FileOutputStream).

getFrame(This) ->
        get({This, frame}).

