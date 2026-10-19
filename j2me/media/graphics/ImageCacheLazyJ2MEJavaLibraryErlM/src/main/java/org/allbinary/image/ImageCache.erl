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
% package org.allbinary.image
% import java.io.InputStream
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.J2MEUtil
% import org.allbinary.TsUtil
% import org.allbinary.animation.image.LazyImageRotationAnimation
% import org.allbinary.canvas.GameGlobalsFactory
% import org.allbinary.canvas.Processor
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.game.canvas.ABToGBUtil
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.gd.resource.GDLazyResources
% import org.allbinary.game.gd.resource.GDResources
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
% import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.system.Memory
% import org.allbinary.thread.BaseImageLoadingProcessor
% import org.allbinary.thread.ConcurrentImageLoadingProcessor
% import org.allbinary.thread.SynchObject
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.ABSystemWrapper

-module('ImageCache').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageCacheBase', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_IMAGE_CACHE'}, 'ImageCache':new()),
    ok.

init_fields(This) ->
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, concurrentImageLoadingProcessor}, 'ConcurrentImageLoadingProcessor':new(This)),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, resourceUtil}, 'ResourceUtil':getInstance()),
    put({This, gameGlobalsFactory}, 'GameGlobalsFactory':getInstance()),
    put({This, gdResources}, 'GDResources':getInstance()),
    put({This, loadNowList}, 'BasicArrayListD':new()),
    put({This, loadSoonList}, 'BasicArrayListD':new()),
    put({This, loadList}, 'BasicArrayListD':new()),
    put({This, loadAfterList}, 'BasicArrayListD':new()),
    put({This, lock}, 'SynchObject':new()),
    put({This, firstTime}, true),
    put({This, totalLoaded}, 0),
    put({This, progressEnded}, false),
    put({This, hasAnyLazyAnimationFactories}, false),
    put({This, processor}, 'FirstProcessor':new()),
    put({This, endProcessor}, 'Processor':getInstance()),
    put({This, 'LOAD_IMAGE_FOR_ANIMATION'}, "Load Image Animation"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'ImageCacheBase':init(This),
    init_fields(This),
        ok.

firstProcess(This) ->
        LogUtil = 'LogUtil':getInstance(),
        IsHTML = 'J2MEUtil':isHTML(),
        case IsHTML of
            true ->
            put({This, processor}, 'Processor':getInstance()),
            put({This, endProcessor}, 'HTMLEndProcessor':new());
            false ->
            put({This, processor}, 'NotHTMLProcessor':new()),
            put({This, endProcessor}, 'NotHTMLEndProcessor':new()),
            try
                (get({This, '$class'})):runTask(This)
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({LogUtil, '$class'})):putF(LogUtil, get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'}))
            end
        end.

addListener(This, Renderer) ->
        ok.

% throws Exception
waitForLoadNow(This) ->
        case get({This, firstTime}) of
            true ->
            AbToGBUtil = 'ABToGBUtil':getInstance(),
            AbCanvas = get({AbToGBUtil, abCanvas}),
            (fun Loop() -> case (((get({get({This, loadNowList}), '$class'})):isEmpty(get({This, loadNowList})) andalso (((not (get({AbCanvas, '$class'})):isInitialized(AbCanvas)) orelse (((get({AbCanvas, '$class'})):isInitialized(AbCanvas) andalso get({This, hasAnyLazyAnimationFactories})))))) andalso (not get({This, progressEnded}))) of true ->
                timer:sleep(120),
                Loop();
            false -> ok end end)(),
            put({This, firstTime}, false);
            false -> ok
        end.

% throws Exception
loadImageForAnimation(This) ->
        try
        put({local, lazyImageRotationAnimation}, undefined),
        begin % synchronized
            case (get({get({This, loadNowList}), '$class'})):isEmpty(get({This, loadNowList})) of
                true ->
                (get({get({This, endProcessor}), '$class'})):process(get({This, endProcessor})),
                case (get({get({This, loadSoonList}), '$class'})):isEmpty(get({This, loadSoonList})) of
                    true ->
                    case (get({get({This, loadAfterList}), '$class'})):isEmpty(get({This, loadAfterList})) of
                        true ->
                        case get({This, firstTime}) of
                            true ->
                            ok;
                            false ->
                            case get({get({This, gameGlobalsFactory}), newCanvas}) of
                            true ->
                            ok;
                            false ->
                            (get({This, '$class'})):loadNextImage(This)
                        end
                        end,
                        throw({'$return', ok});
                        false ->
                        put({local, lazyImageRotationAnimation}, (get({get({This, loadAfterList}), '$class'})):get(get({This, loadAfterList}), 0)),
                        case (get({This, '$class'})):loadImageForLazyAnimation(This, get({local, lazyImageRotationAnimation})) of
                            true ->
                            (get({get({This, loadAfterList}), '$class'})):remove(get({This, loadAfterList}), get({local, lazyImageRotationAnimation}));
                            false -> ok
                        end
                    end;
                    false ->
                    put({local, lazyImageRotationAnimation}, (get({get({This, loadSoonList}), '$class'})):get(get({This, loadSoonList}), 0)),
                    case (get({This, '$class'})):loadImageForLazyAnimation(This, get({local, lazyImageRotationAnimation})) of
                        true ->
                        (get({get({This, loadSoonList}), '$class'})):remove(get({This, loadSoonList}), get({local, lazyImageRotationAnimation}));
                        false -> ok
                    end
                end,
                throw({'$return', ok});
                false -> ok
            end,
            put({local, lazyImageRotationAnimation}, (get({get({This, loadNowList}), '$class'})):get(get({This, loadNowList}), 0))
        end,
        case (get({This, '$class'})):loadImageForLazyAnimation(This, get({local, lazyImageRotationAnimation})) of
            true ->
            begin % synchronized
                (get({get({This, loadNowList}), '$class'})):remove(get({This, loadNowList}), get({local, lazyImageRotationAnimation}))
            end,
            case (get({get({local, lazyImageRotationAnimation}), layoutIndex}) =/= 0) of
                true ->
                List = (get({This, '$class'})):getAssociated(This, get({local, lazyImageRotationAnimation})),
                begin % synchronized
                    Size = (get({List, '$class'})):size(List),
                    case (Size > 0) of
                        true ->
                        (get({get({This, loadSoonList}), '$class'})):addAllList(get({This, loadSoonList}), List);
                        false -> ok
                    end
                end;
                false -> ok
            end,
            ProgressCanvas = 'ProgressCanvasFactory':getInstance(),
            IsHTML = 'J2MEUtil':isHTML(),
            case ((get({get({This, loadNowList}), '$class'})):isEmpty(get({This, loadNowList})) andalso (((not IsHTML) orelse get({This, firstTime})))) of
                true ->
                (get({ProgressCanvas, '$class'})):endFromInitialLazyLoadingComplete(ProgressCanvas);
                false ->
                case ((get({This, totalLoaded}) rem 10) =:= 0) of
                    true ->
                    (get({ProgressCanvas, '$class'})):addNormalPortion(ProgressCanvas, 1, get({This, 'LOAD_IMAGE_FOR_ANIMATION'}));
                    false -> ok
                end
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
loadImages(This) ->
        (fun Loop() -> case ((not (get({get({This, loadList}), '$class'})):isEmpty(get({This, loadList}))) orelse (not (get({get({This, loadNowList}), '$class'})):isEmpty(get({This, loadNowList})))) of true ->
            (get({This, '$class'})):loadImageForAnimations(This),
            (get({This, '$class'})):loadNextImage(This),
            Loop();
        false -> ok end end)().

% throws Exception
loadImageForAnimations(This) ->
        (fun Loop() -> case (not (get({get({This, loadNowList}), '$class'})):isEmpty(get({This, loadNowList}))) of true ->
            (get({This, '$class'})):loadImageForAnimation(This),
            Loop();
        false -> ok end end)().

% throws Exception
loadRemainingAnimations(This) ->
        (fun Loop() -> case ((not (get({get({This, loadAfterList}), '$class'})):isEmpty(get({This, loadAfterList}))) orelse (not (get({get({This, loadNowList}), '$class'})):isEmpty(get({This, loadNowList})))) of true ->
            (fun Loop() -> case (not (get({get({This, loadNowList}), '$class'})):isEmpty(get({This, loadNowList}))) of true ->
                (get({This, '$class'})):loadImageForAnimation(This),
                Loop();
            false -> ok end end)(),
            put({local, lazyImageRotationAnimation}, undefined),
            begin % synchronized
                case (not (get({get({This, loadAfterList}), '$class'})):isEmpty(get({This, loadAfterList}))) of
                    true ->
                    put({local, lazyImageRotationAnimation}, (get({get({This, loadAfterList}), '$class'})):removeAt(get({This, loadAfterList}), 0));
                    false -> ok
                end
            end,
            case (get({local, lazyImageRotationAnimation}) =/= undefined) of
                true ->
                (get({This, '$class'})):loadImageForLazyAnimation(This, get({local, lazyImageRotationAnimation}));
                false -> ok
            end,
            Loop();
        false -> ok end end)().

% throws Exception
loadImageForLazyAnimation(This, LazyImageRotationAnimation) ->
        try
        Image = (get({get({LazyImageRotationAnimation, animationInterfaceFactoryInterface}), '$class'})):getImage(get({LazyImageRotationAnimation, animationInterfaceFactoryInterface})),
        case (get({This, '$class'})):loadImage(This, Image) of
            true ->
            (get({LazyImageRotationAnimation, '$class'})):setRealAnimation(LazyImageRotationAnimation),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
loadNextImage(This) ->
        try
        put({local, image}, undefined),
        begin % synchronized
            case ((get({get({This, loadList}), '$class'})):size(get({This, loadList})) =:= 0) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            put({local, image}, (get({get({This, loadList}), '$class'})):removeAt(get({This, loadList}), 0))
        end,
        (get({This, '$class'})):loadImage(This, get({local, image}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
loadImage(This, Image) ->
        try
        case (get({Image, '$class'})):isReady(Image) of
            true ->
            throw({'$return', true});
            false ->
            case ((get({Image, '$class'})):getImage(Image) =/= undefined) of
                true ->
                case (get({Image, '$class'})):setReady(Image) of
                    true ->
                    case (get({Image, '$class'})):isReady(Image) of
                        true ->
                        put({This, totalLoaded}, get({This, totalLoaded}) + 1),
                        throw({'$return', true});
                        false -> ok
                    end;
                    false -> ok
                end;
                false ->
                Key = (get({Image, '$class'})):getName(Image),
                Image2 = (get({This, '$class'})):creatImage(This, Key),
                case (get({Image2, '$class'})):isReady(Image2) of
                    true ->
                    (get({This, '$class'})):init(This, Image, Image2),
                    throw({'$return', true});
                    false ->
                    (get({Image, '$class'})):setImage(Image, (get({Image2, '$class'})):getImage(Image2))
                end
            end
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
init(This, Image, Image2) ->
        (get({Image, '$class'})):init(Image, (get({Image2, '$class'})):getImage(Image2)).

% throws Exception
creatImage(This, Key) when (is_list(Key) orelse Key =:= undefined) ->
        InputStream = (get({get({This, resourceUtil}), '$class'})):getResourceAsStream(get({This, resourceUtil}), Key),
        Image = (fun(Target_N71627) -> (get({Target_N71627, '$class'})):createImageFromInputStream(Target_N71627, InputStream) end)('ImageFactory':getInstance()),
        (get({Image, '$class'})):setName(Image, Key),
        Image.

% throws Exception
get(This, Caller, Width, Height) when (is_list(Caller) orelse Caller =:= undefined), is_integer(Width), is_integer(Height) ->
        put({local, foundIndex}, (get({This, '$class'})):getIndexWH(This, Width, Height)),
        put({local, image}, (get({This, '$class'})):getFromAvailable(This, get({local, foundIndex}), Width, Height)),
        case (get({local, image}) =:= get({'NullImage', 'NULL_IMAGE'})) of
            true ->
            put({This, volume}, (get({This, volume}) + (Width * Height))),
            case (get({This, volume}) > 32000) of
                true ->
                (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})),
                put({This, volume}, 0);
                false -> ok
            end,
            put({local, image}, (get({This, '$class'})):createImage(This, Caller, Width, Height)),
            case (get({This, nextIndex}) > (array:size(get({This, widths})) - 1)) of
                true ->
                case (get({local, foundIndex}) =:= (-1)) of
                    true ->
                    put({local, foundIndex}, get({This, nextIndex})),
                    put({This, widths}, array:set(get({This, nextIndex}), Width, get({This, widths}))),
                    put({This, heights}, array:set(get({This, nextIndex}), Height, get({This, heights}))),
                    put({This, nextIndex}, get({This, nextIndex}) + 1);
                    false -> ok
                end,
                (fun(Target_N72348) -> (get({Target_N72348, '$class'})):add(Target_N72348, get({local, image})) end)(array:get(get({local, foundIndex}), get({This, listOfList})));
                false -> ok
            end;
            false -> ok
        end,
        get({local, image}).

% throws Exception
getWithKey(This, Key) ->
        put({local, image}, (get({This, '$class'})):getImage(This, Key)),
        case (get({local, image}) =:= get({'NullImage', 'NULL_IMAGE'})) of
            true ->
            InputStream = undefined,
            try
                put({local, image}, (get({This, '$class'})):createImageFromInputStream(This, Key, InputStream))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Exception: Trying Again After GC", This, get({get({This, commonStrings}), 'GET'}), E),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72817) -> (get({Target_N72817, '$class'})):toString(Target_N72817) end)((fun(Target_N72824) -> (get({Target_N72824, '$class'})):append(Target_N72824, (fun(Target_N72860) -> (get({Target_N72860, '$class'})):toString(Target_N72860, InputStream) end)('StringUtil':getInstance())) end)((fun(Target_N72831) -> (get({Target_N72831, '$class'})):append(Target_N72831, "InputStream: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'GET'})),
                (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})),
                (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), 'Memory':getInfo(), This, get({get({This, commonStrings}), 'GET'})),
                timer:sleep(100),
                put({local, image}, (get({This, '$class'})):createImageFromInputStream(This, Key, InputStream))
            end,
            (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Key, get({local, image}));
            false -> ok
        end,
        get({local, image}).

getIndex(This, Key) ->
        try
        GdResources = 'GDResources':getInstance(),
        ResourceStringArray = get({GdResources, resourceStringArray}),
        Size = array:size(ResourceStringArray),
        lists:foreach(fun(Index) ->
            case (array:get(Index, ResourceStringArray) =:= Key) of
                true ->
                throw({'$return', Index});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73577) -> (get({Target_N73577, '$class'})):toString(Target_N73577) end)((fun(Target_N73584) -> (get({Target_N73584, '$class'})):append(Target_N73584, (fun(Target_N73620) -> (get({Target_N73620, '$class'})):toString(Target_N73620, Key) end)('StringUtil':getInstance())) end)((fun(Target_N73591) -> (get({Target_N73591, '$class'})):append(Target_N73591, "unable to find key: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'})),
        erlang:error({'RuntimeException'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createImageFromInputStream(This, Key, InputStream) ->
        try
        GdLazyResources = 'GDLazyResources':getInstance(),
        ResourceStringArray = get({GdLazyResources, requiredResourcesBeforeLoadingArray}),
        Size = array:size(ResourceStringArray),
        lists:foreach(fun(Index) ->
            case (Key =:= array:get(Index, ResourceStringArray)) of
                true ->
                throw({'$return', (get({This, '$class'})):creatImage(This, Key)});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):runTask(This),
        put({local, index}, (get({This, '$class'})):getIndex(This, Key)),
        Width = array:get(get({local, index}), get({GdLazyResources, imageResourceWidthArray})),
        Height = array:get(get({local, index}), get({GdLazyResources, imageResourceHeightArray})),
        Image = (get({This, '$class'})):createImageLater(This, Key, Width, Height),
        begin % synchronized
            (get({get({This, loadList}), '$class'})):add(get({This, loadList}), Image)
        end,
        Image
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createImageLater(This, Key, Width, Height) when (is_list(Key) orelse Key =:= undefined), is_integer(Width), is_integer(Height) ->
        'Image':createImageLater(Key, Width, Height).

getAssociated(This, LazyImageRotationAnimation) ->
        List = 'BasicArrayListD':new(),
        begin % synchronized
            put({local, lazyImageRotationAnimation2}, undefined),
            Size = (get({get({This, loadAfterList}), '$class'})):size(get({This, loadAfterList})),
            lists:foreach(fun(Index) ->
                put({local, lazyImageRotationAnimation2}, (get({get({This, loadAfterList}), '$class'})):get(get({This, loadAfterList}), Index)),
                case (get({get({local, lazyImageRotationAnimation2}), instanceId}) =:= get({LazyImageRotationAnimation, instanceId})) of
                    true ->
                    (get({List, '$class'})):add(List, get({local, lazyImageRotationAnimation2}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            Size2 = (get({List, '$class'})):size(List),
            lists:foreach(fun(Index) ->
                (get({get({This, loadAfterList}), '$class'})):remove(get({This, loadAfterList}), (get({List, '$class'})):get(List, Index))
            end, lists:seq(0, Size2 - 1))
        end,
        List.

add(This, LazyImageRotationAnimation) ->
        begin % synchronized
            (get({get({This, loadAfterList}), '$class'})):add(get({This, loadAfterList}), LazyImageRotationAnimation)
        end.

% throws Exception
insertFirst(This, LazyImageRotationAnimation) ->
        case (get({get({This, loadNowList}), '$class'})):contains(get({This, loadNowList}), LazyImageRotationAnimation) of
            true ->
            ok;
            false ->
            begin % synchronized
                (get({get({This, loadNowList}), '$class'})):add(get({This, loadNowList}), LazyImageRotationAnimation),
                (get({get({This, loadAfterList}), '$class'})):remove(get({This, loadAfterList}), LazyImageRotationAnimation)
            end
        end,
        (get({This, '$class'})):runTask(This).

progressEnded(This) ->
        put({This, progressEnded}, true).

% throws Exception
runTask(This) ->
        (get({get({This, processor}), '$class'})):process(get({This, processor})).

initProgress(This) ->
        case get({This, firstTime}) of
            true ->
            put({This, firstTime}, false);
            false -> ok
        end.

isLazy(This) ->
        true.
% Java nested class NotHTMLProcessor: move it to its own module 'NotHTMLProcessor'
% Java nested class NotHTMLEndProcessor: move it to its own module 'NotHTMLEndProcessor'
% Java nested class HTMLEndProcessor: move it to its own module 'HTMLEndProcessor'
% Java nested class FirstProcessor: move it to its own module 'FirstProcessor'

