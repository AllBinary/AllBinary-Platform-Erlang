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
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.game.configuration.event.ChangedGameFeatureListener
% import org.allbinary.game.configuration.feature.Feature
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil

-module('OpenGLConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
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
        ok.

write(This) ->
        ok.

% throws Exception
init(This) ->
        Features = 'Features':getInstance(),
        case (fun(Target_N66570) -> (get({Target_N66570, '$class'})):isChangedFeature(Target_N66570, get({'MainFeatureFactory':getInstance(), 'STATIC'})) end)('ChangedGameFeatureListener':getInstance()) of
            true ->
            case (get({This, '$class'})):isOpenGL(This) of
                true ->
                case (not (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'}))) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Turning on OpenGL", This, get({get({This, commonStrings}), 'INIT'})),
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
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "OpenGL is Off", This, get({get({This, commonStrings}), 'INIT'}))
            end;
            false ->
            case ((get({This, '$class'})):isOpenGL(This) andalso (not (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})))) of
                true ->
                'PreLogUtil':put("OpenGL is set but not Enabled since Statics where not cleared (Reboot or Complete exit is Required)", This, get({get({This, commonStrings}), 'INIT'}));
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

