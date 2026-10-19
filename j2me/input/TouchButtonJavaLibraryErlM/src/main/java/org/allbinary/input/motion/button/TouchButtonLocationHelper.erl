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
% package org.allbinary.input.motion.button
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.logic.string.StringMaker

-module('TouchButtonLocationHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, totalColumns}, 0),
    put({This, totalRows}, 0),
    put({This, columnsRemainder}, 0),
    put({This, rowsRemainder}, 0),
    put({This, columnsRemainderHalf}, 0),
    put({This, rowsRemainderHalf}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ButtonSize = get({'CommonButtons':getInstance(), 'STANDARD_BUTTON_SIZE'}),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        put({This, totalColumns}, erlang:round((float((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo)) / float(ButtonSize)))),
        put({This, totalRows}, erlang:round((float((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo)) / float(ButtonSize)))),
        put({This, columnsRemainder}, ((get({DisplayInfo, '$class'})):getLastWidth(DisplayInfo) rem ButtonSize)),
        put({This, columnsRemainderHalf}, ((get({This, columnsRemainder}) bsr 1))),
        put({This, rowsRemainder}, ((get({DisplayInfo, '$class'})):getLastHeight(DisplayInfo) rem ButtonSize)),
        put({This, rowsRemainderHalf}, ((get({This, rowsRemainder}) bsr 1))).

getTotalColumns(This) ->
        get({This, totalColumns}).

getTotalRows(This) ->
        get({This, totalRows}).

getColumnsRemainder(This) ->
        get({This, columnsRemainder}).

getRowsRemainder(This) ->
        get({This, rowsRemainder}).

getColumnsRemainderHalf(This) ->
        get({This, columnsRemainderHalf}).

getRowsRemainderHalf(This) ->
        get({This, rowsRemainderHalf}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "totalColumns: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, totalColumns})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " totalRows: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, totalRows})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " columnsRemainder: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, columnsRemainder})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " rowsRemainder: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, rowsRemainder})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " columnsRemainderHalf: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, columnsRemainderHalf})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " rowsRemainderHalf: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, rowsRemainderHalf})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

