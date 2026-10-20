% Generated Code Do Not Modify
% package org.allbinary.configuration
% import java.io.Closeable
% import java.io.InputStream
% import java.io.OutputStream
% import org.allbinary.game.configuration.feature.Feature
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbDataInputStream
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.FileStreamFactory
% import org.allbinary.logic.io.NullCloseable
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('ApplicationConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, fullscreen}, true),
    put({This, showTitleBar}, false),
    put({This, progressBarView}, false),
    put({This, 'FILE'}, "ReloadConfiguration.dat"),
    ok.


getInstance() ->
        case (get({'ApplicationConfiguration', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'ApplicationConfiguration', instance}, 'ApplicationConfiguration':new());
            false -> ok
        end,
        get({'ApplicationConfiguration', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        try
            case (fun(Target_N66487) -> (get({Target_N66487, '$class'})):isFile(Target_N66487, get({This, 'FILE'})) end)('FileFactory':getInstance()) of
                true ->
                (get({This, '$class'})):read(This);
                false ->
                (get({This, '$class'})):write(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end.

% throws Exception
read(This) ->
        FileInputStreamFactory = 'FileStreamFactory':getInstance(),
        FileInputStream = (get({FileInputStreamFactory, '$class'})):getFileInputStreamInstance(FileInputStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, 'FILE'})),
        DataInputStream = 'AbDataInputStream':new(FileInputStream),
        FullScreen = (get({DataInputStream, '$class'})):readInt(DataInputStream),
        case (FullScreen =:= 0) of
            true ->
            (get({This, '$class'})):setFullscreen(This, false);
            false ->
            case (FullScreen =:= 1) of
            true ->
            (get({This, '$class'})):setFullscreen(This, true);
            false ->
            erlang:error({'Exception', "Invalid FullScreen ActivityConfiguration"})
        end
        end,
        ProgressBarView = (get({DataInputStream, '$class'})):readInt(DataInputStream),
        case (ProgressBarView =:= 0) of
            true ->
            (get({This, '$class'})):setProgressBarView(This, false);
            false ->
            case (ProgressBarView =:= 1) of
            true ->
            (get({This, '$class'})):setProgressBarView(This, true);
            false ->
            erlang:error({'Exception', "Invalid ProgressBarView ActivityConfiguration"})
        end
        end,
        ShowTitleBar = (get({DataInputStream, '$class'})):readInt(DataInputStream),
        case (ShowTitleBar =:= 0) of
            true ->
            (get({This, '$class'})):setShowTitleBar(This, false);
            false ->
            case (ShowTitleBar =:= 1) of
            true ->
            (get({This, '$class'})):setShowTitleBar(This, true);
            false ->
            erlang:error({'Exception', "Invalid ShowTitleBar ActivityConfiguration"})
        end
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Read Configuration: ", (get({This, '$class'})):toString(This)]), This, "read").

% throws Exception
write(This) ->
        put({local, closeable}, get({'NullCloseable', 'NULL_CLOSEABLE'})),
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Write Configuration: ", (get({This, '$class'})):toString(This)]), This, "write"),
            FileInputStreamFactory = 'FileStreamFactory':getInstance(),
            FileOutputStream = (get({FileInputStreamFactory, '$class'})):getFileOutputStreamInstance(FileInputStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, 'FILE'})),
            DataOutputStream = 'AbDataOutputStream':new(FileOutputStream),
            put({local, closeable}, DataOutputStream),
            case (get({This, '$class'})):isFullscreen(This) of
                true ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 1);
                false ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 0)
            end,
            case (get({This, '$class'})):isProgressBarView(This) of
                true ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 1);
                false ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 0)
            end,
            case (get({This, '$class'})):isShowTitleBar(This) of
                true ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 1);
                false ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 0)
            end,
            (get({DataOutputStream, '$class'})):flush(DataOutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            (fun(Target_N67608) -> (get({Target_N67608, '$class'})):close(Target_N67608, get({local, closeable})) end)('StreamUtil':getInstance())
        end.

% throws Exception
update(This, GameFeature) ->
        case (GameFeature =:= get({'MainFeatureFactory':getInstance(), 'FULL_SCREEN'})) of
            true ->
            Features = 'Features':getInstance(),
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                case (not (get({This, '$class'})):isFullscreen(This)) of
                    true ->
                    (get({This, '$class'})):setFullscreen(This, true),
                    (get({This, '$class'})):write(This);
                    false -> ok
                end;
                false ->
                case (get({This, '$class'})):isFullscreen(This) of
                    true ->
                    (get({This, '$class'})):setFullscreen(This, false),
                    (get({This, '$class'})):write(This);
                    false -> ok
                end
            end;
            false -> ok
        end.

setFullscreen(This, Fullscreen) when is_boolean(Fullscreen) ->
        put({This, fullscreen}, Fullscreen).

isFullscreen(This) ->
        get({This, fullscreen}).

setShowTitleBar(This, ShowTitleBar) when is_boolean(ShowTitleBar) ->
        put({This, showTitleBar}, ShowTitleBar).

isShowTitleBar(This) ->
        get({This, showTitleBar}).

setProgressBarView(This, ProgressBarView) when is_boolean(ProgressBarView) ->
        put({This, progressBarView}, ProgressBarView).

isProgressBarView(This) ->
        get({This, progressBarView}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "isFullscreen: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isFullscreen(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isProgressBarView: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isProgressBarView(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isShowTitleBar: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isShowTitleBar(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

