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
% package org.allbinary.graphics.opengles
% import java.io.Closeable
% import java.io.DataInputStream
% import java.io.InputStream
% import java.io.OutputStream
% import org.allbinary.TsUtil
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.FileStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.game.configuration.feature.Feature
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.io.NullCloseable

-module('OpenGLConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'FILE'}, "OpenGLConfiguration.dat"),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, opengl}, false),
    put({This, type}, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL_AS_GAME_THREAD'})),
    put({This, imageColor}, get({'OpenGLFeatureFactory':getInstance(), 'IMAGE_COLOR_DEPTH_4444'})),
    put({This, color}, get({'OpenGLFeatureFactory':getInstance(), 'IMAGE_COLOR_DEPTH_4444'})),
    put({This, versionSelector}, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL_AUTO_SELECT'})),
    ok.


getInstance() ->
        case (get({'OpenGLConfiguration', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'OpenGLConfiguration', instance}, 'OpenGLConfiguration':new());
            false -> ok
        end,
        get({'OpenGLConfiguration', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        try
            case (fun(Target_N66832) -> (get({Target_N66832, '$class'})):isFile(Target_N66832, get({This, 'FILE'})) end)('FileFactory':getInstance()) of
                true ->
                (get({This, '$class'})):read(This);
                false ->
                (get({This, '$class'})):write(This)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end.

% throws Exception
read(This) ->
        OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
        FileInputStreamFactory = 'FileStreamFactory':getInstance(),
        FileInputStream = (get({FileInputStreamFactory, '$class'})):getFileInputStreamInstance(FileInputStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, 'FILE'})),
        DataInputStream = 'DataInputStream':new(FileInputStream),
        OpenGLValue = (get({DataInputStream, '$class'})):readInt(DataInputStream),
        case (OpenGLValue =:= 0) of
            true ->
            (get({This, '$class'})):setOpenGL(This, false);
            false ->
            case (OpenGLValue =:= 1) of
            true ->
            (get({This, '$class'})):setOpenGL(This, true);
            false ->
            erlang:error({'Exception', "Invalid OpenGL Setting"})
        end
        end,
        Version = (get({DataInputStream, '$class'})):readUTF(DataInputStream),
        case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Version, (get({get({OpenGLFeatureFactory, 'OPENGL_AUTO_SELECT'}), '$class'})):getName(get({OpenGLFeatureFactory, 'OPENGL_AUTO_SELECT'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setVersionSelector(This, get({OpenGLFeatureFactory, 'OPENGL_AUTO_SELECT'}));
            false ->
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Version, (get({get({OpenGLFeatureFactory, 'OPENGL_MINIMUM'}), '$class'})):getName(get({OpenGLFeatureFactory, 'OPENGL_MINIMUM'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setVersionSelector(This, get({OpenGLFeatureFactory, 'OPENGL_MINIMUM'}));
            false ->
            erlang:error({'Exception', lists:concat(["OpenGLConfiguration: Error reading version selector: ", Version])})
        end
        end,
        Type = (get({DataInputStream, '$class'})):readUTF(DataInputStream),
        case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Type, (get({get({OpenGLFeatureFactory, 'OPENGL_AS_GAME_THREAD'}), '$class'})):getName(get({OpenGLFeatureFactory, 'OPENGL_AS_GAME_THREAD'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setType(This, get({OpenGLFeatureFactory, 'OPENGL_AS_GAME_THREAD'}));
            false ->
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Type, (get({get({OpenGLFeatureFactory, 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'}), '$class'})):getName(get({OpenGLFeatureFactory, 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setType(This, get({OpenGLFeatureFactory, 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'}));
            false ->
            erlang:error({'Exception', "OpenGLConfiguration: Error reading image color"})
        end
        end,
        ImageColor = (get({DataInputStream, '$class'})):readUTF(DataInputStream),
        case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), ImageColor, (get({get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}), '$class'})):getName(get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setImageColor(This, get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}));
            false ->
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), ImageColor, (get({get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}), '$class'})):getName(get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setImageColor(This, get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}));
            false ->
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), ImageColor, (get({get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}), '$class'})):getName(get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setImageColor(This, get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'}));
            false ->
            erlang:error({'Exception', lists:concat(["OpenGLConfiguration: Error reading image color: ", ImageColor])})
        end
        end
        end,
        Color = (get({DataInputStream, '$class'})):readUTF(DataInputStream),
        case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Color, (get({get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_4444'}), '$class'})):getName(get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_4444'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setColor(This, get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_4444'}));
            false ->
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Color, (get({get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_565'}), '$class'})):getName(get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_565'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setColor(This, get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_565'}));
            false ->
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), Color, (get({get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_8888'}), '$class'})):getName(get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_8888'}))) =:= 0) of
            true ->
            (get({This, '$class'})):setColor(This, get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_8888'}));
            false ->
            erlang:error({'Exception', lists:concat(["OpenGLConfiguration: Error reading color: ", Color])})
        end
        end
        end,
        'PreLogUtil':put(lists:concat(["Read Configuration: ", (get({This, '$class'})):toString(This)]), This, "read").

% throws Exception
write(This) ->
        put({local, closeable}, get({'NullCloseable', 'NULL_CLOSEABLE'})),
        try
            'PreLogUtil':put(lists:concat(["Write Configuration: ", (get({This, '$class'})):toString(This)]), This, "write"),
            FileInputStreamFactory = 'FileStreamFactory':getInstance(),
            FileOutputStream = (get({FileInputStreamFactory, '$class'})):getFileOutputStreamInstance(FileInputStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, 'FILE'})),
            DataOutputStream = 'AbDataOutputStream':new(FileOutputStream),
            put({local, closeable}, DataOutputStream),
            case (get({This, '$class'})):isOpenGL(This) of
                true ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 1);
                false ->
                (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, 0)
            end,
            (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, (fun(Target_N69470) -> (get({Target_N69470, '$class'})):getName(Target_N69470) end)((get({This, '$class'})):getVersionSelector(This))),
            (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, (fun(Target_N69512) -> (get({Target_N69512, '$class'})):getName(Target_N69512) end)((get({This, '$class'})):getType(This))),
            (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, (fun(Target_N69554) -> (get({Target_N69554, '$class'})):getName(Target_N69554) end)((get({This, '$class'})):getImageColor(This))),
            (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, (fun(Target_N69596) -> (get({Target_N69596, '$class'})):getName(Target_N69596) end)((get({This, '$class'})):getColor(This))),
            (get({DataOutputStream, '$class'})):flush(DataOutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        after
            (fun(Target_N69050) -> (get({Target_N69050, '$class'})):close(Target_N69050, get({local, closeable})) end)('StreamUtil':getInstance())
        end.

% throws Exception
init(This) ->
        Features = 'Features':getInstance(),
        case (fun(Target_N69773) -> (get({Target_N69773, '$class'})):isChangedFeature(Target_N69773, get({'MainFeatureFactory':getInstance(), 'STATIC'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
            case (get({This, '$class'})):isOpenGL(This) of
                true ->
                case (((get({Features, '$class'})):isFeature(Features, get({OpenGLFeatureFactory, 'OPENGL_2D'})) orelse (get({Features, '$class'})):isFeature(Features, get({OpenGLFeatureFactory, 'OPENGL_3D'}))) orelse (get({Features, '$class'})):isFeature(Features, get({OpenGLFeatureFactory, 'OPENGL_2D_AND_3D'}))) of
                    true ->
                    case (not (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'}))) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Turning on OpenGL as Default", This, get({get({This, commonStrings}), 'INIT'})),
                        (get({Features, '$class'})):addDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Using OpenGL Type Feature: ", (get({This, '$class'})):getType(This)]), This, get({get({This, commonStrings}), 'INIT'})),
                        (get({Features, '$class'})):addDefault(Features, (get({This, '$class'})):getType(This)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Using OpenGL ImageColor Feature: ", (get({This, '$class'})):getImageColor(This)]), This, get({get({This, commonStrings}), 'INIT'})),
                        (get({Features, '$class'})):addDefault(Features, (get({This, '$class'})):getImageColor(This)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Using OpenGL Color Feature: ", (get({This, '$class'})):getColor(This)]), This, get({get({This, commonStrings}), 'INIT'})),
                        (get({Features, '$class'})):addDefault(Features, (get({This, '$class'})):getColor(This)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Using OpenGL Version Selector Feature: ", (get({This, '$class'})):getVersionSelector(This)]), This, get({get({This, commonStrings}), 'INIT'})),
                        (get({Features, '$class'})):addDefault(Features, (get({This, '$class'})):getVersionSelector(This));
                        false -> ok
                    end;
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "OpenGL is enabled, but this game does not support OpenGL (Probably from installing with the same package name from a game that had OpenGL available)", This, get({get({This, commonStrings}), 'INIT'}))
                end;
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "OpenGL is Off", This, get({get({This, commonStrings}), 'INIT'}))
            end;
            false ->
            case ((get({This, '$class'})):isOpenGL(This) andalso (not (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})))) of
                true ->
                'PreLogUtil':put("OpenGL is set but not Enabled since statics where not cleared (Reboot or Complete exit is Required)", This, get({get({This, commonStrings}), 'INIT'}));
                false -> ok
            end
        end,
        'PreLogUtil':put((get({This, '$class'})):toString(This), This, get({get({This, commonStrings}), 'INIT'})).

% throws Exception
update(This, GameFeature, ColorLocked) when is_boolean(ColorLocked) ->
        Features = 'Features':getInstance(),
        OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
        put({local, modified}, false),
        case (GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL'})) of
            true ->
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                case (not (get({This, '$class'})):isOpenGL(This)) of
                    true ->
                    (get({This, '$class'})):setOpenGL(This, true),
                    put({local, modified}, true);
                    false -> ok
                end;
                false ->
                case (get({This, '$class'})):isOpenGL(This) of
                    true ->
                    (get({This, '$class'})):setOpenGL(This, false),
                    put({local, modified}, true);
                    false -> ok
                end
            end;
            false -> ok
        end,
        case ((GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS'})) orelse (GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL_AS_GAME_THREAD'}))) of
            true ->
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                case (GameFeature =/= (get({This, '$class'})):getType(This)) of
                    true ->
                    (get({This, '$class'})):setType(This, GameFeature),
                    put({local, modified}, true);
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end,
        case (((GameFeature =:= get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'})) orelse (GameFeature =:= get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_565'}))) orelse (GameFeature =:= get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_8888'}))) of
            true ->
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                case ((get({This, '$class'})):getImageColor(This) =/= GameFeature) of
                    true ->
                    (get({This, '$class'})):setImageColor(This, GameFeature),
                    case ColorLocked of
                        true ->
                        case (GameFeature =:= get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_4444'})) of
                            true ->
                            (get({This, '$class'})):setColor(This, get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_4444'}));
                            false ->
                            case (GameFeature =:= get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_565'})) of
                            true ->
                            (get({This, '$class'})):setColor(This, get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_565'}));
                            false ->
                            case (GameFeature =:= get({OpenGLFeatureFactory, 'IMAGE_COLOR_DEPTH_8888'})) of
                            true ->
                            (get({This, '$class'})):setColor(This, get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_8888'}));
                            false -> ok
                        end
                        end
                        end;
                        false -> ok
                    end,
                    put({local, modified}, true);
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end,
        case (((GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_4444'})) orelse (GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_565'}))) orelse (GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL_COLOR_DEPTH_8888'}))) of
            true ->
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                case ((get({This, '$class'})):getColor(This) =/= GameFeature) of
                    true ->
                    (get({This, '$class'})):setColor(This, GameFeature),
                    put({local, modified}, true);
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end,
        case ((GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL_AUTO_SELECT'})) orelse (GameFeature =:= get({OpenGLFeatureFactory, 'OPENGL_MINIMUM'}))) of
            true ->
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                (get({This, '$class'})):setVersionSelector(This, GameFeature);
                false -> ok
            end,
            put({local, modified}, true);
            false -> ok
        end,
        case get({local, modified}) of
            true ->
            (get({This, '$class'})):write(This);
            false -> ok
        end.

setOpenGL(This, Opengl) when is_boolean(Opengl) ->
        put({This, opengl}, Opengl).

isOpenGL(This) ->
        get({This, opengl}).

setImageColor(This, ImageColor) ->
        put({This, imageColor}, ImageColor).

getImageColor(This) ->
        get({This, imageColor}).

setColor(This, Color) ->
        put({This, color}, Color).

getColor(This) ->
        get({This, color}).

setVersionSelector(This, VersionSelector) ->
        put({This, versionSelector}, VersionSelector).

getVersionSelector(This) ->
        get({This, versionSelector}).

setType(This, Type) ->
        put({This, type}, Type).

getType(This) ->
        get({This, type}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        StringUtil = 'StringUtil':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isOpenGL: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isOpenGL(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " VersionSelector: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, (get({This, '$class'})):getVersionSelector(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Type: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, (get({This, '$class'})):getType(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Image Color: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, (get({This, '$class'})):getImageColor(This))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Color: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, (get({This, '$class'})):getColor(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

