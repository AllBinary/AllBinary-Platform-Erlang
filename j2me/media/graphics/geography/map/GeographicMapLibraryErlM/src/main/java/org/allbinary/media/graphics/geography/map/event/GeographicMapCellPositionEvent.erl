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
% package org.allbinary.media.graphics.geography.map.event
% import org.allbinary.graphics.CellPosition
% import org.allbinary.graphics.CellPositionFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition

-module('GeographicMapCellPositionEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, geographicMapCellPosition}, get({'CellPositionFactory':getInstance(), 'NONE'})),
    ok.


new(AnyType, GeographicMapCellPosition) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnyType, GeographicMapCellPosition),
    This.

init(This, AnyType, GeographicMapCellPosition) ->
        'AllBinaryEventObject':init(This, AnyType),
        init_fields(This),
        put({This, geographicMapCellPosition}, GeographicMapCellPosition).

init(This, AnyType) ->
        (get({This, '$class'})):setSource(This, AnyType).

setGeographicMapCellPosition(This, GeographicMapCellPosition) ->
        put({This, geographicMapCellPosition}, GeographicMapCellPosition).

getGeographicMapCellPosition(This) ->
        get({This, geographicMapCellPosition}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "CellPositionEvent: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nGeographicMapCellPosition: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66294) -> (get({Target_N66294, '$class'})):toString(Target_N66294, (get({This, '$class'})):getGeographicMapCellPosition(This)) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

