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
% package org.allbinary.game.layer.resources
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GraphicsFeature
% import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('GameGraphicsResourceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'SPRITE'}, "_sprite"),
    put({This, 'QUARTER'}, "_quarter"),
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


getInstance() ->
        case (get({'GameGraphicsResourceUtil', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameGraphicsResourceUtil', instance}, 'GameGraphicsResourceUtil':new());
            false -> ok
        end,
        get({'GameGraphicsResourceUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        try
            put({This, name}, (get({This, '$class'})):getString(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end.

% throws Exception
getString(This) ->
        GraphicsFeatureFactory = 'GraphicsFeatureFactory':getInstance(),
        put({local, graphicsFeature}, get({GraphicsFeatureFactory, 'NONE'})),
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'IMAGE_TO_ARRAY_GRAPHICS'})) of
            true ->
            put({local, graphicsFeature}, get({GraphicsFeatureFactory, 'IMAGE_TO_ARRAY_GRAPHICS'}));
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'SPRITE_FULL_GRAPHICS'})) of
            true ->
            put({local, graphicsFeature}, get({GraphicsFeatureFactory, 'SPRITE_FULL_GRAPHICS'}));
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'SPRITE_QUARTER_ROTATION_GRAPHICS'})) of
            true ->
            put({local, graphicsFeature}, get({GraphicsFeatureFactory, 'SPRITE_QUARTER_ROTATION_GRAPHICS'}));
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'IMAGE_ROTATION_ON_THE_FLY'})) of
            true ->
            put({local, graphicsFeature}, get({GraphicsFeatureFactory, 'IMAGE_ROTATION_ON_THE_FLY'}));
            false -> ok
        end
        end
        end
        end,
        (get({This, '$class'})):getStringForFeature(This, get({local, graphicsFeature})).

% throws Exception
getStringForFeature(This, GraphicsFeature) ->
        StringBuffer = 'StringMaker':new(),
        GraphicsFeatureFactory = 'GraphicsFeatureFactory':getInstance(),
        (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
        Features = 'Features':getInstance(),
        case (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'VECTOR_GRAPHICS'})) of
            true ->
            ok;
            false ->
            case (get({Features, '$class'})):isFeature(Features, get({GraphicsFeatureFactory, 'IMAGE_GRAPHICS'})) of
            true ->
            case ((GraphicsFeature =:= get({GraphicsFeatureFactory, 'IMAGE_TO_ARRAY_GRAPHICS'})) orelse (GraphicsFeature =:= get({GraphicsFeatureFactory, 'IMAGE_ROTATION_ON_THE_FLY'}))) of
                true ->
                ok;
                false ->
                case (GraphicsFeature =:= get({GraphicsFeatureFactory, 'SPRITE_FULL_GRAPHICS'})) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPRITE'}));
                false ->
                case (GraphicsFeature =:= get({GraphicsFeatureFactory, 'SPRITE_QUARTER_ROTATION_GRAPHICS'})) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'QUARTER'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SPRITE'}));
                false ->
                erlang:error({'Exception', "None/Unknown Sub Image Resource Type Specified"})
            end
            end
            end;
            false ->
            case (fun(Target_N67315) -> (get({Target_N67315, '$class'})):isAnyThreed(Target_N67315) end)('OpenGLFeatureUtil':getInstance()) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CanvasStrings':getInstance(), 'OBJ_MODEL'}));
            false ->
            erlang:error({'Exception', "None/Unknown Main Image Resource Type Specified"})
        end
        end
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getName(This) ->
        get({This, name}).

