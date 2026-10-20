% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.NullUtil

-module('MultiSelectPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SelectionHudPaintable', Function, Arguments).

init_fields(This) ->
    put({This, rootNameList}, 'BasicArrayListD':new()),
    put({This, totalCharArray}, get({'NullUtil':getInstance(), 'NULL_CHAR_ARRAY'})),
    put({This, rootNamesString}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'TOTAL'}, "Total Selected: "),
    put({This, backgroundColor}, (fun(Target_N66050) -> (get({Target_N66050, '$class'})):intValue(Target_N66050) end)(get({'BasicColorFactory':getInstance(), 'GREY'}))),
    put({This, totalWidth}, 0),
    put({This, textLine2Y}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'SelectionHudPaintable':'$init'(This),
    init_fields(This),
        ok.

updateMeasurement(This, Graphics) ->
        'SelectionHudPaintable':updateMeasurement(This, Graphics),
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        put({This, totalWidth}, (get({Font, '$class'})):stringWidth(Font, get({This, 'TOTAL'}))),
        put({This, textLine2Y}, ((get({This, y}) + (get({Font, '$class'})):getHeight(Font)))).

update(This, List) ->
        (get({This, '$class'})):clear(This),
        Size = (get({List, '$class'})):size(List),
        put({This, totalCharArray}, (fun(Target_N66492) -> (get({Target_N66492, '$class'})):getCharArray(Target_N66492, Size) end)((get({This, '$class'})):getPrimitiveLongUtil(This))),
        lists:foreach(fun(Index) ->
            RtsLayer = (get({List, '$class'})):get(List, Index),
            case (not (get({get({This, rootNameList}), '$class'})):contains(get({This, rootNameList}), (get({RtsLayer, '$class'})):getRootName(RtsLayer))) of
                true ->
                (get({get({This, rootNameList}), '$class'})):add(get({This, rootNameList}), (get({RtsLayer, '$class'})):getRootName(RtsLayer));
                false -> ok
            end
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
        COMMA_SEP = get({'CommonSeps':getInstance(), 'COMMA_SEP'}),
        StringBuffer = 'StringMaker':new(),
        lists:foreach(fun(Index) ->
            RootName = (get({get({This, rootNameList}), '$class'})):get(get({This, rootNameList}), Index),
            (get({StringBuffer, '$class'})):append(StringBuffer, RootName),
            case (Index =/= 0) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, COMMA_SEP);
                false -> ok
            end
        end, lists:seq(((get({get({This, rootNameList}), '$class'})):size(get({This, rootNameList})) - 1), 0, -1)),
        put({This, rootNamesString}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

clear(This) ->
        (get({get({This, rootNameList}), '$class'})):clear(get({This, rootNameList})).

paint(This, Graphics) ->
        (get({Graphics, '$class'})):setColor(Graphics, get({This, backgroundColor})),
        (get({Graphics, '$class'})):drawRect(Graphics, (get({This, '$class'})):getX(This), get({This, y}), (get({This, '$class'})):getWidth(This), (get({This, '$class'})):getHeight(This)),
        (get({Graphics, '$class'})):setColor(Graphics, (get({This, '$class'})):getColor(This)),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, 'TOTAL'}), get({This, textX}), get({This, y}), 0),
        (get({Graphics, '$class'})):drawChars(Graphics, get({This, totalCharArray}), 0, (fun(Target_N67497) -> (get({Target_N67497, '$class'})):getCurrentTotalDigits(Target_N67497) end)((get({This, '$class'})):getPrimitiveLongUtil(This)), (get({This, textX}) + get({This, totalWidth})), get({This, y}), 0),
        (get({Graphics, '$class'})):drawString(Graphics, get({This, rootNamesString}), get({This, textX}), get({This, textLine2Y}), 0).

