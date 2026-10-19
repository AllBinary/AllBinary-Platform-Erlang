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
% package org.allbinary.media.graphics.geography.map
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.text.TextAnimation
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor
% import org.allbinary.logic.math.BasicDecimal

-module('GeographicMapCellHistory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements UpdateMyFontInterface

static_init() ->
    put({?MODULE, 'NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY'}, array:new(0, {default, undefined})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, booleanFactory}, 'BooleanFactory':getInstance()),
    put({This, list}, undefined),
    put({This, visitedList}, undefined),
    put({This, 'MISSED_INFO'}, "Missed"),
    put({This, animation}, 'TextAnimation':new(get({This, 'MISSED_INFO'}), 'AnimationBehavior':getInstance())),
    put({This, myFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, totalVisited}, 0),
    put({This, halfWidth}, 0),
    put({This, fontHeight}, 0),
    put({This, 'RED'}, (fun(Target_N71119) -> (get({Target_N71119, '$class'})):intValue(Target_N71119) end)(get({'BasicColorFactory':getInstance(), 'RED'}))),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, list}, 'BasicArrayListD':new()),
        put({This, visitedList}, 'BasicArrayListD':new()),
        (get({This, '$class'})):init(This).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, fontHeight}, (get({Font, '$class'})):getHeight(Font)),
        put({This, myFontProcessor}, 'MyFontProcessor':getInstance()).

getTotalVisited(This) ->
        get({This, totalVisited}).

getTotalNotVisited(This) ->
        ((get({This, '$class'})):getSize(This) - get({This, totalVisited})).

getSize(This) ->
        (get({get({This, list}), '$class'})):size(get({This, list})).

trackAll(This, List) ->
        Size = (get({List, '$class'})):size(List),
        (get({get({This, list}), '$class'})):ensureCapacity(get({This, list}), Size),
        (get({get({This, visitedList}), '$class'})):ensureCapacity(get({This, visitedList}), Size),
        put({local, geographicMapCellPosition}, undefined),
        lists:foreach(fun(Index) ->
            put({local, geographicMapCellPosition}, (get({List, '$class'})):get(List, Index)),
            (get({This, '$class'})):track(This, get({local, geographicMapCellPosition}))
        end, lists:seq(0, Size - 1)).

track(This, GeographicMapCellPosition) ->
        case (not (get({get({This, list}), '$class'})):contains(get({This, list}), GeographicMapCellPosition)) of
            true ->
            (get({get({This, list}), '$class'})):add(get({This, list}), GeographicMapCellPosition),
            (get({get({This, visitedList}), '$class'})):add(get({This, visitedList}), get({get({This, booleanFactory}), 'FALSE'}));
            false -> ok
        end.

getTracked(This) ->
        get({This, list}).

getVisited(This) ->
        get({This, visitedList}).

getAfterIfNotLast(This, GeographicMapCellPosition) ->
        try
        LocalList = get({This, list}),
        Index = (get({LocalList, '$class'})):indexOf(LocalList, GeographicMapCellPosition),
        case ((get({LocalList, '$class'})):size(LocalList) > (Index + 1)) of
            true ->
            throw({'$return', (get({LocalList, '$class'})):get(LocalList, (Index + 1))});
            false -> ok
        end,
        GeographicMapCellPosition
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getFirstUnvisited(This) ->
        try
        LocalList = get({This, list}),
        LocalVisitedList = get({This, visitedList}),
        Size = (get({LocalVisitedList, '$class'})):size(LocalVisitedList),
        put({local, value}, undefined),
        lists:foreach(fun(Index) ->
            put({local, value}, (get({get({This, visitedList}), '$class'})):get(get({This, visitedList}), Index)),
            case (get({local, value}) =:= get({get({This, booleanFactory}), 'FALSE'})) of
                true ->
                throw({'$return', (get({LocalList, '$class'})):get(LocalList, Index)});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({LocalList, '$class'})):get(LocalList, 0)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getFirstUnvisitedIndex(This) ->
        try
        LocalVisitedList = get({This, visitedList}),
        Size = (get({LocalVisitedList, '$class'})):size(LocalVisitedList),
        put({local, value}, undefined),
        lists:foreach(fun(Index) ->
            put({local, value}, (get({get({This, visitedList}), '$class'})):get(get({This, visitedList}), Index)),
            case (get({local, value}) =:= get({get({This, booleanFactory}), 'FALSE'})) of
                true ->
                throw({'$return', Index});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getInPathButNotTracked(This, PathList) ->
        InPathButNotTrackedList = 'BasicArrayListD':new(),
        LocalList = get({This, list}),
        Size = (get({PathList, '$class'})):size(PathList),
        put({local, geographicMapCellPosition}, undefined),
        lists:foreach(fun(Index) ->
            put({local, geographicMapCellPosition}, (get({PathList, '$class'})):get(PathList, Index)),
            case (not (get({LocalList, '$class'})):contains(LocalList, get({local, geographicMapCellPosition}))) of
                true ->
                (get({InPathButNotTrackedList, '$class'})):add(InPathButNotTrackedList, get({local, geographicMapCellPosition}));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        InPathButNotTrackedList.

isVisited(This, GeographicMapCellPosition) ->
        try
        Index = (get({get({This, list}), '$class'})):indexOf(get({This, list}), GeographicMapCellPosition),
        case (Index =/= (-1)) of
            true ->
            Value = (get({get({This, visitedList}), '$class'})):get(get({This, visitedList}), Index),
            case (Value =:= get({get({This, booleanFactory}), 'TRUE'})) of
                true ->
                throw({'$return', true});
                false -> ok
            end;
            false ->
            ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

visit(This, GeographicMapCellPosition) ->
        try
        Index = (get({get({This, list}), '$class'})):indexOf(get({This, list}), GeographicMapCellPosition),
        put({local, value}, undefined),
        case (Index =/= (-1)) of
            true ->
            put({local, value}, (get({get({This, visitedList}), '$class'})):get(get({This, visitedList}), Index)),
            TRUE = get({get({This, booleanFactory}), 'TRUE'}),
            case (get({local, value}) =/= TRUE) of
                true ->
                (get({get({This, visitedList}), '$class'})):set(get({This, visitedList}), Index, TRUE),
                put({This, totalVisited}, get({This, totalVisited}) + 1),
                throw({'$return', true});
                false -> ok
            end;
            false ->
            ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isAllVisited(This) ->
        try
        case (get({This, totalVisited}) =:= ((get({This, '$class'})):getSize(This) - 1)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isAllVisited2(This) ->
        try
        case (get({This, totalVisited}) =:= (get({This, '$class'})):getSize(This)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
isPortionVisited(This, BasicDecimal) ->
        try
        Size = (get({This, '$class'})):getSize(This),
        NumberRequired = (((Size bsl (get({BasicDecimal, '$class'})):getScaledFactor(BasicDecimal))) div trunc((get({BasicDecimal, '$class'})):getUnscaled(BasicDecimal))),
        NumberNotVisited = (((get({This, '$class'})):getSize(This) - 1) - get({This, totalVisited})),
        case ((Size - NumberNotVisited) > NumberRequired) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
reset(This) ->
        LocalVisitedList = get({This, visitedList}),
        LocalFalseBoolean = get({get({This, booleanFactory}), 'FALSE'}),
        Size = (get({LocalVisitedList, '$class'})):size(LocalVisitedList),
        lists:foreach(fun(Index) ->
            (get({LocalVisitedList, '$class'})):set(LocalVisitedList, Index, LocalFalseBoolean)
        end, lists:seq((Size - 1), 0, -1)),
        put({This, totalVisited}, 0).

paintNotVisitedRelativeToPoint(This, Graphics, TiledLayer, Point) ->
        X = ((get({Point, '$class'})):getX(Point) - (get({TiledLayer, '$class'})):getXP(TiledLayer)),
        Y = ((get({Point, '$class'})):getY(Point) - (get({TiledLayer, '$class'})):getYP(TiledLayer)),
        case (get({This, halfWidth}) =:= 0) of
            true ->
            put({This, halfWidth}, (((fun(Target_N70818) -> (get({Target_N70818, '$class'})):stringWidth(Target_N70818, get({This, 'MISSED_INFO'})) end)((get({Graphics, '$class'})):getFont(Graphics)) bsr 1)));
            false -> ok
        end,
        Height = (2 * get({This, fontHeight})),
        (get({get({This, animation}), '$class'})):paintXY(get({This, animation}), Graphics, (X + get({This, halfWidth})), (Y + (Height))).

paintNotVisited(This, Graphics, GeographicMapInterface) ->
        try
            (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
            (get({Graphics, '$class'})):setColor(Graphics, get({This, 'RED'})),
            LocalVisitedList = get({This, visitedList}),
            Size = (get({LocalVisitedList, '$class'})):size(LocalVisitedList),
            put({local, geographicMapCellPosition}, undefined),
            put({local, isCellVisitedBoolean}, undefined),
            put({local, index}, Size),
            (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
                put({local, geographicMapCellPosition}, (get({get({This, list}), '$class'})):get(get({This, list}), get({local, index}))),
                put({local, isCellVisitedBoolean}, (get({LocalVisitedList, '$class'})):get(LocalVisitedList, get({local, index}))),
                case (not (get({get({local, isCellVisitedBoolean}), '$class'})):booleanValue(get({local, isCellVisitedBoolean}))) of
                    true ->
                    (get({This, '$class'})):paintNotVisitedRelativeToPoint(This, Graphics, (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface), (get({get({local, geographicMapCellPosition}), '$class'})):getPoint(get({local, geographicMapCellPosition})));
                    false -> ok
                end,
                Loop();
            false -> ok end end)()
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "paintNotVisited", E)
        end.

init(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})),
        (get({get({This, visitedList}), '$class'})):clear(get({This, visitedList})),
        put({This, totalVisited}, 0).

