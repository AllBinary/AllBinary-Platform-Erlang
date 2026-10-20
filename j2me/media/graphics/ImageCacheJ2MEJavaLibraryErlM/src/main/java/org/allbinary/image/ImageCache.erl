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
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.game.gd.resource.GDResources
% import org.allbinary.logic.ABSystemWrapper
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.system.Memory

-module('ImageCache').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageCacheBase', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_IMAGE_CACHE'}, 'ImageCache':new()),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ImageCacheBase':'$init'(This),
    init_fields(This),
        ok.

addListener(This, Renderer) ->
        ok.

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
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66433) -> (get({Target_N66433, '$class'})):toString(Target_N66433) end)((fun(Target_N66440) -> (get({Target_N66440, '$class'})):append(Target_N66440, (fun(Target_N66476) -> (get({Target_N66476, '$class'})):toString(Target_N66476, Key) end)('StringUtil':getInstance())) end)((fun(Target_N66447) -> (get({Target_N66447, '$class'})):append(Target_N66447, "unable to find key: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'RUN'})),
        erlang:error({'RuntimeException'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

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
            Widths = get({This, widths}),
            case (get({This, nextIndex}) > (array:size(Widths) - 1)) of
                true ->
                case (get({local, foundIndex}) =:= (-1)) of
                    true ->
                    put({local, foundIndex}, get({This, nextIndex})),
                    array:set(get({This, nextIndex}), Width, Widths),
                    put({This, heights}, array:set(get({This, nextIndex}), Height, get({This, heights}))),
                    put({This, nextIndex}, get({This, nextIndex}) + 1);
                    false -> ok
                end,
                (fun(Target_N67211) -> (get({Target_N67211, '$class'})):add(Target_N67211, get({local, image})) end)(array:get(get({local, foundIndex}), get({This, listOfList})));
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
            ResourceUtil = 'ResourceUtil':getInstance(),
            ResourceInputStream = (get({ResourceUtil, '$class'})):getResourceAsStream(ResourceUtil, Key),
            case (ResourceInputStream =:= undefined) of
                true ->
                erlang:error({'RuntimeException', (fun(Target_N67640) -> (get({Target_N67640, '$class'})):toString(Target_N67640) end)((fun(Target_N67647) -> (get({Target_N67647, '$class'})):append(Target_N67647, (fun(Target_N67683) -> (get({Target_N67683, '$class'})):toString(Target_N67683, Key) end)('StringUtil':getInstance())) end)((fun(Target_N67654) -> (get({Target_N67654, '$class'})):append(Target_N67654, "Image resource is not available for key: ") end)('StringMaker':new())))});
                false -> ok
            end,
            try
                put({local, image}, (get({This, '$class'})):createImageFromInputStream(This, Key, ResourceInputStream))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Exception: Trying Again After GC", This, get({get({This, commonStrings}), 'GET'}), E),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67881) -> (get({Target_N67881, '$class'})):toString(Target_N67881) end)((fun(Target_N67888) -> (get({Target_N67888, '$class'})):append(Target_N67888, (fun(Target_N67924) -> (get({Target_N67924, '$class'})):toString(Target_N67924, ResourceInputStream) end)('StringUtil':getInstance())) end)((fun(Target_N67895) -> (get({Target_N67895, '$class'})):append(Target_N67895, "InputStream: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'GET'})),
                (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})),
                (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), 'Memory':getInfo(), This, get({get({This, commonStrings}), 'GET'})),
                timer:sleep(100),
                put({local, image}, (get({This, '$class'})):createImageFromInputStream(This, Key, ResourceInputStream))
            end,
            case 'J2MEUtil':isHTML() of
                true ->
                ok;
                false ->
                (get({ResourceInputStream, '$class'})):close(ResourceInputStream)
            end,
            (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Key, get({local, image}));
            false -> ok
        end,
        get({local, image}).

% throws Exception
loadImageForAnimation(This) ->
        ok.

progressEnded(This) ->
        ok.

runTask(This) ->
        ok.

isLazy(This) ->
        false.

