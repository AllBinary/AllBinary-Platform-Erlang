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
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('ImageCacheBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, imageFactory}, 'ImageFactory':getInstance()),
    put({This, hashtable}, (fun(Target_N65982) -> (get({Target_N65982, '$class'})):createHashtable(Target_N65982) end)('StdUtil':getInstance())),
    put({This, 'SIZE'}, 128),
    put({This, widths}, array:new(get({This, 'SIZE'}), {default, 0})),
    put({This, heights}, array:new(get({This, 'SIZE'}), {default, 0})),
    put({This, listOfList}, array:new(get({This, 'SIZE'}), {default, undefined})),
    put({This, availableListOfList}, array:new(get({This, 'SIZE'}), {default, undefined})),
    put({This, volume}, 0),
    put({This, nextIndex}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        lists:foreach(fun(Index) ->
            put({This, listOfList}, array:set(Index, 'BasicArrayListD':new(), get({This, listOfList})))
        end, lists:seq((array:size(get({This, listOfList})) - 1), 0, -1)),
        lists:foreach(fun(Index) ->
            put({This, availableListOfList}, array:set(Index, 'BasicArrayListD':new(), get({This, availableListOfList})))
        end, lists:seq((array:size(get({This, availableListOfList})) - 1), 0, -1)).

getImage(This, ResourceId) ->
        try
        ImageCanBeNull = (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), ResourceId),
        case (ImageCanBeNull =:= undefined) of
            true ->
            throw({'$return', get({'NullImage', 'NULL_IMAGE'})});
            false -> ok
        end,
        ImageCanBeNull
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

releaseAll(This) ->
        lists:foreach(fun(Index) ->
            (fun(Target_N66915) -> (get({Target_N66915, '$class'})):clear(Target_N66915) end)(array:get(Index, get({This, availableListOfList}))),
            (fun(Target_N66950) -> (get({Target_N66950, '$class'})):addAllList(Target_N66950, array:get(Index, get({This, listOfList}))) end)(array:get(Index, get({This, availableListOfList})))
        end, lists:seq((array:size(get({This, listOfList})) - 1), 0, -1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67117) -> (get({Target_N67117, '$class'})):toString(Target_N67117) end)((fun(Target_N67124) -> (get({Target_N67124, '$class'})):append(Target_N67124, (get({This, '$class'})):toString(This)) end)((fun(Target_N67131) -> (get({Target_N67131, '$class'})):append(Target_N67131, "ImageCache: ") end)('StringMaker':new()))), This, "releaseAll").

getIndexWH(This, Width, Height) when is_integer(Width), is_integer(Height) ->
        try
        put({local, foundIndex}, (-1)),
        Size = array:size(get({This, widths})),
        lists:foreach(fun(Index) ->
            case ((array:get(Index, get({This, widths})) =:= Width) andalso (array:get(Index, get({This, heights})) =:= Height)) of
                true ->
                put({local, foundIndex}, Index),
                throw({'$return', get({local, foundIndex})});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        get({local, foundIndex})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getFromAvailable(This, FoundIndex, Width, Height) when is_integer(FoundIndex), is_integer(Width), is_integer(Height) ->
        try
        case (FoundIndex =/= (-1)) of
            true ->
            case ((fun(Target_N67600) -> (get({Target_N67600, '$class'})):size(Target_N67600) end)(array:get(FoundIndex, get({This, availableListOfList}))) > 0) of
                true ->
                List = array:get(FoundIndex, get({This, availableListOfList})),
                throw({'$return', (get({List, '$class'})):removeAt(List, ((get({List, '$class'})):size(List) - 1))});
                false -> ok
            end;
            false -> ok
        end,
        get({'NullImage', 'NULL_IMAGE'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
get(This, Caller, Width, Height) when (is_list(Caller) orelse Caller =:= undefined), is_integer(Width), is_integer(Height) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getWithKey(This, Key) ->
        erlang:error({'RuntimeException'}).

% throws Exception
createImage(This, Caller, Width, Height) when (is_list(Caller) orelse Caller =:= undefined), is_integer(Width), is_integer(Height) ->
        (get({get({This, imageFactory}), '$class'})):createImage(get({This, imageFactory}), Caller, Width, Height).

% throws Exception
createImageFromInputStream(This, Key, InputStream) ->
        (get({get({This, imageFactory}), '$class'})):createImageFromInputStream(get({This, imageFactory}), Key, InputStream).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(Index) ->
            Width = array:get(Index, get({This, widths})),
            Height = array:get(Index, get({This, heights})),
            Total = (fun(Target_N68556) -> (get({Target_N68556, '$class'})):size(Target_N68556) end)(array:get(Index, get({This, listOfList}))),
            TotalAvailable = (fun(Target_N68617) -> (get({Target_N68617, '$class'})):size(Target_N68617) end)(array:get(Index, get({This, availableListOfList}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " w: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Width),
            (get({StringBuffer, '$class'})):append(StringBuffer, " h: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Height),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'TOTAL_LABEL'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, Total),
            (get({StringBuffer, '$class'})):append(StringBuffer, " available: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, TotalAvailable)
        end, lists:seq((get({This, nextIndex}) - 1), 0, -1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getHashtableP(This) ->
        get({This, hashtable}).

init(This, Image) ->
        ok.

initProgress(This) ->
        ok.

