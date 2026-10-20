% Generated Code Do Not Modify
% package org.allbinary.graphics.opengles
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import org.allbinary.device.LoadTextures
% import org.allbinary.device.OpenGLESGraphics
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.opengles.renderer.RendererStrings
% import org.allbinary.image.PreResourceImageUtil
% import org.allbinary.image.opengles.OpenGLESImage
% import org.allbinary.image.opengles.OpenGLImageCache
% import org.allbinary.image.opengles.OpenGLImageCacheFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.SynchObject
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('OpenGLUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, renderStrings}, 'RendererStrings':getInstance()),
    put({This, canvasStrings}, 'CanvasStrings':getInstance()),
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, preResourceImageUtil}, 'PreResourceImageUtil':getInstance()),
    put({This, lockObject}, 'SynchObject':new()),
    put({This, anyType}, 'SynchObject':new()),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, runnableList}, 'BasicArrayListD':new()),
    put({This, created}, false),
    put({This, surfaceCreatedAndInitialized}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLUtil', instance}).

onSurfaceCreated(This, Gl) ->
        try
            case (not get({This, created})) of
                true ->
                put({This, created}, true),
                'PreLogUtil':put(lists:concat([get({'CommonLabels':getInstance(), 'START_LABEL'}), (fun(Target_N66899) -> (get({Target_N66899, '$class'})):toString(Target_N66899) end)('OpenGLCapabilities':getInstance())]), This, get({get({This, renderStrings}), 'ON_SURFACE_CREATED'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, renderStrings}), 'ON_SURFACE_CREATED'}), E)
        end.

onSurfaceCreated(This, Gl, LoadTextures) ->
        try
            (get({LoadTextures, '$class'})):load(LoadTextures, Gl),
            (fun(Target_N67159) -> (get({Target_N67159, '$class'})):logError(Target_N67159, Gl) end)('OpenGLLogUtil':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, renderStrings}), 'ON_SURFACE_CREATED'}), E)
        end.

% throws Exception
onSurfaceChanged(This, Gl, Graphics) ->
        case (not get({This, surfaceCreatedAndInitialized})) of
            true ->
            (get({Graphics, '$class'})):init(Graphics),
            put({This, surfaceCreatedAndInitialized}, true);
            false -> ok
        end,
        (get({Graphics, '$class'})):update(Graphics),
        ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
        (get({ProgressCanvas, '$class'})):update(ProgressCanvas, Graphics),
        (fun(Target_N67589) -> (get({Target_N67589, '$class'})):update(Target_N67589, Gl) end)(('OpenGLImageCacheFactory':getInstance())),
        (get({This, '$class'})):processRunnables(This),
        (get({This, '$class'})):set(This, Gl).

addImage(This, Image) ->
        try
        EncapsulateImage = (get({get({This, preResourceImageUtil}), '$class'})):encapsulate(get({This, preResourceImageUtil}), Image),
        case (EncapsulateImage =/= Image) of
            true ->
            begin % synchronized
                (get({get({This, list}), '$class'})):add(get({This, list}), EncapsulateImage)
            end,
            throw({'$return', EncapsulateImage});
            false -> ok
        end,
        Image
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

clear(This) ->
        begin % synchronized
            (get({get({This, list}), '$class'})):clear(get({This, list}))
        end.

addRunnable(This, Runnable) ->
        begin % synchronized
            case (not (get({get({This, runnableList}), '$class'})):contains(get({This, runnableList}), Runnable)) of
                true ->
                (get({get({This, runnableList}), '$class'})):add(get({This, runnableList}), Runnable),
                (get({get({This, displayInfoSingleton}), '$class'})):add(get({This, displayInfoSingleton}), get({get({This, canvasStrings}), 'SCALED_IMAGES'}));
                false -> ok
            end
        end.

processRunnables(This) ->
        begin % synchronized
            put({local, runnable}, undefined),
            Size = (get({get({This, runnableList}), '$class'})):size(get({This, runnableList})),
            lists:foreach(fun(Index) ->
                put({local, runnable}, (get({get({This, runnableList}), '$class'})):get(get({This, runnableList}), Index)),
                (get({get({local, runnable}), '$class'})):run(get({local, runnable}))
            end, lists:seq(0, Size - 1)),
            (get({get({This, runnableList}), '$class'})):clear(get({This, runnableList}))
        end.

% throws Exception
set(This, Gl) ->
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        put({local, image}, undefined),
        lists:foreach(fun(Index2) ->
            put({local, image}, (get({get({This, list}), '$class'})):get(get({This, list}), Index2)),
            (get({get({local, image}), '$class'})):set(get({local, image}), Gl)
        end, lists:seq(0, Size - 1)).

