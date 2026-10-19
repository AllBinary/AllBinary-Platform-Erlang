% Generated Code Do Not Modify
% package org.allbinary.layer
% import javax.microedition.lcdui.Graphics
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.SynchObject
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.ABSystemWrapper

-module('LayerManager').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, systemWrapper}, 'ABSystemWrapper':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, layerManagerLogging}, undefined),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, anyType}, 'SynchObject':new()),
    ok.


new(LayerManagerLogging) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayerManagerLogging),
    This.

init(This, LayerManagerLogging) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, layerManagerLogging}, LayerManagerLogging).

contains(This, LayerInterface) ->
        (get({get({This, list}), '$class'})):contains(get({This, list}), LayerInterface).

% throws Exception
update(This, LayerInterface) ->
        try
        Had = (get({get({This, list}), '$class'})):remove(get({This, list}), LayerInterface),
        case Had of
            true ->
            put({local, nextLayerInterface}, undefined),
            Size = (get({get({This, list}), '$class'})):size(get({This, list})),
            lists:foreach(fun(Index) ->
                put({local, nextLayerInterface}, (get({get({This, list}), '$class'})):get(get({This, list}), Index)),
                case ((get({LayerInterface, '$class'})):getZP(LayerInterface) > (get({get({local, nextLayerInterface}), '$class'})):getZP(get({local, nextLayerInterface}))) of
                    true ->
                    (get({get({This, list}), '$class'})):addAt(get({This, list}), Index, LayerInterface),
                    throw({'$return', ok});
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            (get({get({This, list}), '$class'})):add(get({This, list}), LayerInterface);
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
insert(This, LayerInterface) ->
        try
        put({local, nextLayerInterface}, undefined),
        Size = (get({get({This, list}), '$class'})):size(get({This, list})),
        lists:foreach(fun(Index) ->
            put({local, nextLayerInterface}, (get({get({This, list}), '$class'})):get(get({This, list}), Index)),
            case ((get({LayerInterface, '$class'})):getZP(LayerInterface) > (get({get({local, nextLayerInterface}), '$class'})):getZP(get({local, nextLayerInterface}))) of
                true ->
                (get({This, '$class'})):appendAt(This, LayerInterface, Index),
                throw({'$return', ok});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):append(This, LayerInterface)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
append(This, LayerInterface) ->
        (get({get({This, layerManagerLogging}), '$class'})):append(get({This, layerManagerLogging}), LayerInterface),
        (get({get({This, list}), '$class'})):add(get({This, list}), LayerInterface).

% throws Exception
appendAt(This, LayerInterface, Index) when is_integer(Index) ->
        (get({get({This, layerManagerLogging}), '$class'})):appendAt(get({This, layerManagerLogging}), LayerInterface, Index),
        (get({get({This, list}), '$class'})):addAt(get({This, list}), Index, LayerInterface).

% throws Exception
remove(This, LayerInterface) ->
        begin % synchronized
            (get({get({This, layerManagerLogging}), '$class'})):remove(get({This, layerManagerLogging}), LayerInterface),
            Result = (get({get({This, list}), '$class'})):remove(get({This, list}), LayerInterface),
            (get({get({This, layerManagerLogging}), '$class'})):removeResult(get({This, layerManagerLogging}), This, LayerInterface, Result)
        end.

getLayerAt(This, Index) when is_integer(Index) ->
        array:get(Index, get({get({This, list}), objectArray})).

getSize(This) ->
        (get({get({This, list}), '$class'})):size(get({This, list})).

% throws Exception
cleanup(This) ->
        begin % synchronized
            (get({get({This, list}), '$class'})):clear(get({This, list})),
            (get({get({This, layerManagerLogging}), '$class'})):clear(get({This, layerManagerLogging})),
            (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil})),
            (get({get({This, tsUtil}), '$class'})):gc(get({This, tsUtil}))
        end.

paint(This, G, X, Y) when is_integer(X), is_integer(Y) ->
        begin % synchronized
            put({local, comp}, undefined),
            put({local, index}, (get({get({This, list}), '$class'})):size(get({This, list}))),
            (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
                put({local, comp}, array:get(get({local, index}), get({get({This, list}), objectArray}))),
                case ((get({local, comp}) =/= undefined) andalso (get({get({local, comp}), '$class'})):isVisible(get({local, comp}))) of
                    true ->
                    (get({get({local, comp}), '$class'})):paint(get({local, comp}), G);
                    false -> ok
                end,
                Loop();
            false -> ok end end)()
        end.

