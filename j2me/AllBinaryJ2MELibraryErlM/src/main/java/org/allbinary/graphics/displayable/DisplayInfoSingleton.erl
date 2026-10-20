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
% package org.allbinary.graphics.displayable
% import javax.microedition.lcdui.Displayable
% import org.allbinary.AndroidUtil
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.displayable.event.DisplayChangeEvent
% import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
% import org.allbinary.graphics.displayable.event.LastDisplayChangeEventHandler
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.graphics.threed.SWTJOGLProcessor
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('DisplayInfoSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'DisplayInfoSingleton':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonLabels}, 'CommonLabels':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'ORIENTATION'}, "ORIENTATION"),
    put({This, 'ADJUSTING_FOR_SCALING_IN_PORTRAIT'}, "Adjusting for Scaling in portrait display ratio: "),
    put({This, 'ADJUSTING_FOR_SCALING_IN_LANDSCAPE'}, "Adjusting for Scaling in landscape display ratio: "),
    put({This, last}, array:new(4, {default, 0})),
    put({This, lastHalf}, array:new(4, {default, 0})),
    put({This, full}, array:new(4, {default, 0})),
    put({This, top}, 0),
    put({This, left}, 0),
    put({This, xOffset}, 0),
    put({This, yOffset}, 0),
    put({This, scaleLargestTo}, 0.0),
    put({This, 'WIDTH'}, 0),
    put({This, 'HEIGHT'}, 1),
    put({This, 'CUSTOM_WIDTH'}, 2),
    put({This, 'CUSTOM_HEIGHT'}, 3),
    put({This, scalableListener}, 'BaseScalable':new()),
    put({This, displayRatio}, 0.0),
    put({This, ratio}, 1.0),
    put({This, 'SET_LAST_SIZE_METHOD_NAME'}, "setLastSize"),
    put({This, 'FULL_WIDTH'}, " FullWidth: "),
    put({This, 'FULL_HEIGHT'}, " FullHeight: "),
    put({This, 'LAST_WIDTH'}, "LastWidth: "),
    put({This, 'LAST_HEIGHT'}, " LastHeight: "),
    put({This, 'PORTRAIT'}, "Portrait"),
    put({This, 'LANDSCAPE'}, "Landscape"),
    put({This, displayChangeEvent}, 'DisplayChangeEvent':new(This)),
    put({This, 'FIRE_METHOD_NAME'}, "fire"),
    put({This, 'REASON'}, "reason: "),
    put({This, 'UPDATE_FROM_ORIENTATION_CHANGE'}, "Updating from Orientation Change "),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, 'DISPLAY_INFO'}, "Display Info: "),
    put({This, 'FULL'}, "full"),
    put({This, 'LAST'}, "last"),
    put({This, 'LAST_HALF'}, "lastHalf"),
    ok.


getInstance() ->
        get({'DisplayInfoSingleton', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        Size = array:size(get({This, last})),
        lists:foreach(fun(Index) ->
            put({This, last}, array:set(Index, 0, get({This, last}))),
            put({This, lastHalf}, array:set(Index, 0, get({This, lastHalf}))),
            put({This, full}, array:set(Index, 0, get({This, full})))
        end, lists:seq(0, Size - 1)),
        case 'AndroidUtil':isAndroid() of
            true ->
            put({This, scaleLargestTo}, 640.0);
            false ->
            put({This, scaleLargestTo}, 1080.0)
        end.

getLastHalf(This) ->
        get({This, lastHalf}).

getLast(This) ->
        get({This, last}).

getFull(This) ->
        get({This, full}).

getScaleLargestTo(This) ->
        get({This, scaleLargestTo}).

setScaleLargestTo(This, ScaleLargestTo) when is_integer(ScaleLargestTo) ->
        put({This, scaleLargestTo}, float(ScaleLargestTo)).

setLastSize(This, ALastWidth, ALastHeight, Reason) when is_integer(ALastWidth), is_integer(ALastHeight), (is_list(Reason) orelse Reason =:= undefined) ->
        case ((array:get(get({This, 'WIDTH'}), get({This, full})) =/= ALastWidth) orelse (array:get(get({This, 'HEIGHT'}), get({This, full})) =/= ALastHeight)) of
            true ->
            (get({This, '$class'})):setLastSizeForce(This, ALastWidth, ALastHeight, Reason);
            false -> ok
        end.

setLastSizeForce(This, ALastWidth, ALastHeight, Reason) when is_integer(ALastWidth), is_integer(ALastHeight), (is_list(Reason) orelse Reason =:= undefined) ->
        put({local, aLastWidth}, ALastWidth),
        put({local, aLastHeight}, ALastHeight),
        StringMaker = 'StringMaker':new(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68264) -> (get({Target_N68264, '$class'})):toString(Target_N68264) end)((fun(Target_N68271) -> (get({Target_N68271, '$class'})):append(Target_N68271, Reason) end)((get({StringMaker, '$class'})):append(StringMaker, get({'CommonLabels':getInstance(), 'START_LABEL'})))), This, get({This, 'SET_LAST_SIZE_METHOD_NAME'})),
        AFullWidth = get({local, aLastWidth}),
        AFullHeight = get({local, aLastHeight}),
        (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68493) -> (get({Target_N68493, '$class'})):toString(Target_N68493) end)((fun(Target_N68500) -> (get({Target_N68500, '$class'})):append(Target_N68500, (get({This, '$class'})):toString(This)) end)((fun(Target_N68507) -> (get({Target_N68507, '$class'})):appendint(Target_N68507, AFullHeight) end)((fun(Target_N68514) -> (get({Target_N68514, '$class'})):append(Target_N68514, get({This, 'FULL_HEIGHT'})) end)((fun(Target_N68521) -> (get({Target_N68521, '$class'})):appendint(Target_N68521, AFullWidth) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'FULL_WIDTH'}))))))), This, get({This, 'SET_LAST_SIZE_METHOD_NAME'})),
        OperatingSystemInterface = (fun(Target_N68648) -> (get({Target_N68648, '$class'})):getOperatingSystemInstance(Target_N68648) end)('OperatingSystemFactory':getInstance()),
        case (get({OperatingSystemInterface, '$class'})):isOverScan(OperatingSystemInterface) of
            true ->
            put({local, aLastWidth}, ((get({local, aLastWidth}) * (get({OperatingSystemInterface, '$class'})):getOverScanXPercent(OperatingSystemInterface)) / 100)),
            put({local, aLastHeight}, ((get({local, aLastHeight}) * (get({OperatingSystemInterface, '$class'})):getOverScanYPercent(OperatingSystemInterface)) / 100));
            false -> ok
        end,
        case (get({OperatingSystemInterface, '$class'})):isScalable(OperatingSystemInterface) of
            true ->
            case (get({This, '$class'})):isPortraitWH(This, get({local, aLastWidth}), get({local, aLastHeight})) of
                true ->
                case (float(get({local, aLastHeight})) > get({This, scaleLargestTo})) of
                    true ->
                    put({This, displayRatio}, (get({This, scaleLargestTo}) / float(get({local, aLastHeight})))),
                    put({This, ratio}, (float(get({local, aLastHeight})) / get({This, scaleLargestTo}))),
                    (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69661) -> (get({Target_N69661, '$class'})):toString(Target_N69661) end)((fun(Target_N69668) -> (get({Target_N69668, '$class'})):appendfloat(Target_N69668, get({This, displayRatio})) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'ADJUSTING_FOR_SCALING_IN_PORTRAIT'})))), This, get({This, 'SET_LAST_SIZE_METHOD_NAME'})),
                    put({local, aLastWidth}, trunc(((float(get({local, aLastWidth})) * get({This, displayRatio}))))),
                    put({local, aLastHeight}, trunc(((float(get({local, aLastHeight})) * get({This, displayRatio}))))),
                    (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}));
                    false ->
                    put({This, ratio}, 1.0),
                    (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}))
                end;
                false ->
                case (float(get({local, aLastWidth})) > get({This, scaleLargestTo})) of
                    true ->
                    put({This, displayRatio}, (get({This, scaleLargestTo}) / float(get({local, aLastWidth})))),
                    put({This, ratio}, (float(get({local, aLastWidth})) / get({This, scaleLargestTo}))),
                    (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69157) -> (get({Target_N69157, '$class'})):toString(Target_N69157) end)((fun(Target_N69164) -> (get({Target_N69164, '$class'})):appendfloat(Target_N69164, get({This, displayRatio})) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'ADJUSTING_FOR_SCALING_IN_LANDSCAPE'})))), This, get({This, 'SET_LAST_SIZE_METHOD_NAME'})),
                    put({local, aLastWidth}, trunc(((float(get({local, aLastWidth})) * get({This, displayRatio}))))),
                    put({local, aLastHeight}, trunc(((float(get({local, aLastHeight})) * get({This, displayRatio}))))),
                    (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}));
                    false ->
                    put({This, ratio}, 1.0),
                    (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}))
                end
            end;
            false -> ok
        end,
        (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69964) -> (get({Target_N69964, '$class'})):toString(Target_N69964) end)((fun(Target_N69971) -> (get({Target_N69971, '$class'})):appendint(Target_N69971, get({local, aLastHeight})) end)((fun(Target_N69978) -> (get({Target_N69978, '$class'})):append(Target_N69978, get({This, 'LAST_HEIGHT'})) end)((fun(Target_N69985) -> (get({Target_N69985, '$class'})):appendint(Target_N69985, get({local, aLastWidth})) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'LAST_WIDTH'})))))), This, get({This, 'SET_LAST_SIZE_METHOD_NAME'})),
        put({This, xOffset}, (AFullWidth - get({local, aLastWidth}))),
        put({This, yOffset}, (AFullHeight - get({local, aLastHeight}))),
        put({This, left}, (get({get({This, scalableListener}), '$class'})):getLeft(get({This, scalableListener}), get({This, xOffset}))),
        put({This, top}, (get({get({This, scalableListener}), '$class'})):getTop(get({This, scalableListener}), get({This, yOffset}))),
        put({This, full}, array:set(get({This, 'WIDTH'}), AFullWidth, get({This, full}))),
        put({This, full}, array:set(get({This, 'HEIGHT'}), AFullHeight, get({This, full}))),
        put({This, last}, array:set(get({This, 'WIDTH'}), get({local, aLastWidth}), get({This, last}))),
        put({This, lastHalf}, array:set(get({This, 'WIDTH'}), ((array:get(get({This, 'WIDTH'}), get({This, last})) bsr 1)), get({This, lastHalf}))),
        put({This, last}, array:set(get({This, 'HEIGHT'}), get({local, aLastHeight}), get({This, last}))),
        put({This, lastHalf}, array:set(get({This, 'HEIGHT'}), ((array:get(get({This, 'HEIGHT'}), get({This, last})) bsr 1)), get({This, lastHalf}))),
        (fun(Target_N70598) -> (get({Target_N70598, '$class'})):setCustom(Target_N70598, get({local, aLastWidth}), get({local, aLastHeight}), get({This, ratio})) end)('SWTJOGLProcessor':getInstance()),
        (get({This, '$class'})):add(This, get({This, 'SET_LAST_SIZE_METHOD_NAME'})).

isPortraitWH(This, LastWidth, LastHeight) when is_integer(LastWidth), is_integer(LastHeight) ->
        try
        case (LastHeight > LastWidth) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isPortrait(This) ->
        (get({This, '$class'})):isPortraitWH(This, array:get(get({This, 'WIDTH'}), get({This, last})), array:get(get({This, 'HEIGHT'}), get({This, last}))).

add(This, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        StringMaker = 'StringMaker':new(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71265) -> (get({Target_N71265, '$class'})):toString(Target_N71265) end)((fun(Target_N71272) -> (get({Target_N71272, '$class'})):append(Target_N71272, Reason) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'REASON'})))), This, get({This, 'FIRE_METHOD_NAME'})),
        (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):toStringAppend(This, StringMaker), This, get({This, 'FIRE_METHOD_NAME'})),
        (get({get({This, list}), '$class'})):add(get({This, list}), Reason).

process(This) ->
        try
            case ((get({get({This, list}), '$class'})):size(get({This, list})) > 0) of
                true ->
                (get({This, '$class'})):processForced(This);
                false -> ok
            end,
            (get({get({This, list}), '$class'})):clear(get({This, list}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'FIRE_METHOD_NAME'}), E)
        end.

processForced(This) ->
        try
            SwtJOGLProcessor = 'SWTJOGLProcessor':getInstance(),
            (get({SwtJOGLProcessor, '$class'})):clear(SwtJOGLProcessor),
            (fun(Target_N71819) -> (get({Target_N71819, '$class'})):fireEvent(Target_N71819, get({This, displayChangeEvent})) end)('DisplayChangeEventHandler':getInstance()),
            (fun(Target_N71861) -> (get({Target_N71861, '$class'})):fireEvent(Target_N71861, get({This, displayChangeEvent})) end)('LastDisplayChangeEventHandler':getInstance()),
            (get({SwtJOGLProcessor, '$class'})):onSurfaceChanged(SwtJOGLProcessor)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'FIRE_METHOD_NAME'}), E)
        end.

update(This, Displayable, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        put({local, aLastWidth}, (get({Displayable, '$class'})):getWidth(Displayable)),
        put({local, aLastHeight}, (get({Displayable, '$class'})):getHeight(Displayable)),
        AFullWidth = get({local, aLastWidth}),
        AFullHeight = get({local, aLastHeight}),
        StringMaker = 'StringMaker':new(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72266) -> (get({Target_N72266, '$class'})):toString(Target_N72266) end)((fun(Target_N72273) -> (get({Target_N72273, '$class'})):append(Target_N72273, (get({This, '$class'})):toString(This)) end)((fun(Target_N72280) -> (get({Target_N72280, '$class'})):append(Target_N72280, get({get({This, commonSeps}), 'SPACE'})) end)((fun(Target_N72287) -> (get({Target_N72287, '$class'})):appendint(Target_N72287, get({local, aLastHeight})) end)((fun(Target_N72294) -> (get({Target_N72294, '$class'})):append(Target_N72294, get({This, 'LAST_HEIGHT'})) end)((fun(Target_N72301) -> (get({Target_N72301, '$class'})):appendint(Target_N72301, get({local, aLastWidth})) end)((fun(Target_N72308) -> (get({Target_N72308, '$class'})):append(Target_N72308, get({This, 'LAST_WIDTH'})) end)((fun(Target_N72315) -> (get({Target_N72315, '$class'})):append(Target_N72315, Reason) end)((get({StringMaker, '$class'})):append(StringMaker, get({'CommonLabels':getInstance(), 'START_LABEL'})))))))))), This, get({get({This, commonStrings}), 'UPDATE'})),
        case ((get({local, aLastWidth}) > 0) andalso (get({local, aLastHeight}) > 0)) of
            true ->
            Features = 'Features':getInstance(),
            OpenGLFeatureFactory = 'OpenGLFeatureFactory':getInstance(),
            case (((not (get({Features, '$class'})):isDefault(Features, get({OpenGLFeatureFactory, 'OPENGL'}))) orelse (array:get(get({This, 'WIDTH'}), get({This, last})) =/= get({local, aLastWidth}))) orelse (array:get(get({This, 'HEIGHT'}), get({This, last})) =/= get({local, aLastHeight}))) of
                true ->
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N72844) -> (get({Target_N72844, '$class'})):toString(Target_N72844) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'UPDATE_FROM_ORIENTATION_CHANGE'}))), This, get({get({This, commonStrings}), 'UPDATE'})),
                OperatingSystemInterface = (fun(Target_N72925) -> (get({Target_N72925, '$class'})):getOperatingSystemInstance(Target_N72925) end)('OperatingSystemFactory':getInstance()),
                case (get({OperatingSystemInterface, '$class'})):isOverScan(OperatingSystemInterface) of
                    true ->
                    put({local, aLastWidth}, ((get({local, aLastWidth}) * (get({OperatingSystemInterface, '$class'})):getOverScanXPercent(OperatingSystemInterface)) / 100)),
                    put({local, aLastHeight}, ((get({local, aLastHeight}) * (get({OperatingSystemInterface, '$class'})):getOverScanYPercent(OperatingSystemInterface)) / 100));
                    false -> ok
                end,
                case (get({OperatingSystemInterface, '$class'})):isScalable(OperatingSystemInterface) of
                    true ->
                    case (get({This, '$class'})):isPortraitWH(This, get({local, aLastWidth}), get({local, aLastHeight})) of
                        true ->
                        case (float(get({local, aLastHeight})) > get({This, scaleLargestTo})) of
                            true ->
                            put({This, displayRatio}, (get({This, scaleLargestTo}) / float(get({local, aLastHeight})))),
                            put({This, ratio}, (float(get({local, aLastHeight})) / get({This, scaleLargestTo}))),
                            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73946) -> (get({Target_N73946, '$class'})):toString(Target_N73946) end)((fun(Target_N73953) -> (get({Target_N73953, '$class'})):appendfloat(Target_N73953, get({This, displayRatio})) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'ADJUSTING_FOR_SCALING_IN_PORTRAIT'})))), This, get({get({This, commonStrings}), 'UPDATE'})),
                            put({local, aLastWidth}, trunc(((float(get({local, aLastWidth})) * get({This, displayRatio}))))),
                            put({local, aLastHeight}, trunc(((float(get({local, aLastHeight})) * get({This, displayRatio}))))),
                            (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}));
                            false ->
                            put({This, ratio}, 1.0),
                            (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}))
                        end;
                        false ->
                        case (float(get({local, aLastWidth})) > get({This, scaleLargestTo})) of
                            true ->
                            put({This, displayRatio}, (get({This, scaleLargestTo}) / float(get({local, aLastWidth})))),
                            put({This, ratio}, (float(get({local, aLastWidth})) / get({This, scaleLargestTo}))),
                            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73430) -> (get({Target_N73430, '$class'})):toString(Target_N73430) end)((fun(Target_N73437) -> (get({Target_N73437, '$class'})):appendfloat(Target_N73437, get({This, displayRatio})) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'ADJUSTING_FOR_SCALING_IN_LANDSCAPE'})))), This, get({get({This, commonStrings}), 'UPDATE'})),
                            put({local, aLastWidth}, trunc(((float(get({local, aLastWidth})) * get({This, displayRatio}))))),
                            put({local, aLastHeight}, trunc(((float(get({local, aLastHeight})) * get({This, displayRatio}))))),
                            (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}));
                            false ->
                            put({This, ratio}, 1.0),
                            (get({get({This, scalableListener}), '$class'})):scale(get({This, scalableListener}), get({This, ratio}))
                        end
                    end;
                    false -> ok
                end,
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N74265) -> (get({Target_N74265, '$class'})):toString(Target_N74265) end)((fun(Target_N74272) -> (get({Target_N74272, '$class'})):appendint(Target_N74272, get({local, aLastHeight})) end)((fun(Target_N74279) -> (get({Target_N74279, '$class'})):append(Target_N74279, get({This, 'LAST_HEIGHT'})) end)((fun(Target_N74286) -> (get({Target_N74286, '$class'})):appendint(Target_N74286, get({local, aLastWidth})) end)((fun(Target_N74293) -> (get({Target_N74293, '$class'})):append(Target_N74293, get({This, 'LAST_WIDTH'})) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'UPDATE_FROM_ORIENTATION_CHANGE'}))))))), This, get({get({This, commonStrings}), 'UPDATE'})),
                put({This, xOffset}, (AFullWidth - get({local, aLastWidth}))),
                put({This, yOffset}, (AFullHeight - get({local, aLastHeight}))),
                put({This, left}, (get({get({This, scalableListener}), '$class'})):getLeft(get({This, scalableListener}), get({This, xOffset}))),
                put({This, top}, (get({get({This, scalableListener}), '$class'})):getTop(get({This, scalableListener}), get({This, yOffset}))),
                put({This, full}, array:set(get({This, 'WIDTH'}), AFullWidth, get({This, full}))),
                put({This, full}, array:set(get({This, 'HEIGHT'}), AFullHeight, get({This, full}))),
                put({This, last}, array:set(get({This, 'WIDTH'}), get({local, aLastWidth}), get({This, last}))),
                put({This, lastHalf}, array:set(get({This, 'WIDTH'}), ((array:get(get({This, 'WIDTH'}), get({This, last})) bsr 1)), get({This, lastHalf}))),
                put({This, last}, array:set(get({This, 'HEIGHT'}), get({local, aLastHeight}), get({This, last}))),
                put({This, lastHalf}, array:set(get({This, 'HEIGHT'}), ((array:get(get({This, 'HEIGHT'}), get({This, last})) bsr 1)), get({This, lastHalf}))),
                (fun(Target_N74929) -> (get({Target_N74929, '$class'})):setCustom(Target_N74929, get({local, aLastWidth}), get({local, aLastHeight}), get({This, ratio})) end)('SWTJOGLProcessor':getInstance()),
                (get({This, '$class'})):add(This, get({get({This, commonStrings}), 'UPDATE'}));
                false -> ok
            end;
            false -> ok
        end.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({This, '$class'})):toStringAppend(This, StringBuffer).

toStringAppend(This, StringBuffer) ->
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'DISPLAY_INFO'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'FULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonLabels}), 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(get({This, 'WIDTH'}), get({This, full}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'FULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonLabels}), 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(get({This, 'HEIGHT'}), get({This, full}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LAST'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonLabels}), 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(get({This, 'WIDTH'}), get({This, last}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LAST'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonLabels}), 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(get({This, 'HEIGHT'}), get({This, last}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LAST_HALF'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonLabels}), 'WIDTH_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(get({This, 'WIDTH'}), get({This, lastHalf}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LAST_HALF'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonLabels}), 'HEIGHT_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, array:get(get({This, 'HEIGHT'}), get({This, lastHalf}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, case (get({This, '$class'})):isPortrait(This) of true -> get({This, 'PORTRAIT'}); false -> get({This, 'LANDSCAPE'}) end),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getTop(This) ->
        get({This, top}).

getLeft(This) ->
        get({This, left}).

getLastWidth(This) ->
        array:get(get({This, 'WIDTH'}), get({This, last})).

getLastHeight(This) ->
        array:get(get({This, 'HEIGHT'}), get({This, last})).

getLastHalfWidth(This) ->
        array:get(get({This, 'WIDTH'}), get({This, lastHalf})).

getLastHalfHeight(This) ->
        array:get(get({This, 'HEIGHT'}), get({This, lastHalf})).

getCustomLastWidth(This) ->
        array:get(get({This, 'CUSTOM_WIDTH'}), get({This, last})).

getCustomLastHeight(This) ->
        array:get(get({This, 'CUSTOM_HEIGHT'}), get({This, last})).

getRawLastWidth(This) ->
        array:get(get({This, 'WIDTH'}), get({This, last})).

getRawLastHeight(This) ->
        array:get(get({This, 'HEIGHT'}), get({This, last})).

setCustom(This, Width, Height) when is_integer(Width), is_integer(Height) ->
        put({This, last}, array:set(get({This, 'CUSTOM_WIDTH'}), Width, get({This, last}))),
        put({This, lastHalf}, array:set(get({This, 'CUSTOM_WIDTH'}), ((array:get(get({This, 'CUSTOM_WIDTH'}), get({This, last})) bsr 1)), get({This, lastHalf}))),
        put({This, last}, array:set(get({This, 'CUSTOM_HEIGHT'}), Height, get({This, last}))),
        put({This, lastHalf}, array:set(get({This, 'CUSTOM_HEIGHT'}), ((array:get(get({This, 'CUSTOM_HEIGHT'}), get({This, last})) bsr 1)), get({This, lastHalf}))).

setScalableListener(This, ScalableListener) ->
        put({This, scalableListener}, ScalableListener).

getScalableListener(This) ->
        get({This, scalableListener}).

getRatio(This) ->
        get({This, ratio}).

getDisplayRatio(This) ->
        get({This, displayRatio}).

setOffset(This, Left, Top) when is_integer(Left), is_integer(Top) ->
        put({This, left}, Left).

getxOffset(This) ->
        get({This, xOffset}).

getyOffset(This) ->
        get({This, yOffset}).

