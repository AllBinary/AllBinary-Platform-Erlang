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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.graphics.draw.CanvasDrawLineString
% import org.allbinary.graphics.paint.InitUpdatePaintable

-module('PreGameSelectorPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitUpdatePaintable', Function, Arguments).

init_fields(This) ->
    put({This, title}, undefined),
    put({This, canvasDrawLineString}, undefined),
    put({This, preGameScrollSelectionForm}, undefined),
    ok.


new(Title, PreGameScrollSelectionForm) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Title, PreGameScrollSelectionForm),
    This.

init(This, Title, PreGameScrollSelectionForm) when (is_list(Title) orelse Title =:= undefined) ->
    'InitUpdatePaintable':init(This),
    init_fields(This),
        put({This, title}, Title),
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        put({This, canvasDrawLineString}, 'CanvasDrawLineString':new((get({DisplayInfo, '$class'})):getLastHalfWidth(DisplayInfo), 0)),
        put({This, preGameScrollSelectionForm}, PreGameScrollSelectionForm).

update(This) ->
        DisplayInfo = 'DisplayInfoSingleton':getInstance(),
        put({This, canvasDrawLineString}, 'CanvasDrawLineString':new((get({DisplayInfo, '$class'})):getLastHalfWidth(DisplayInfo), 0)).

paint(This, Graphics) ->
        (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N66221) -> (get({Target_N66221, '$class'})):intValue(Target_N66221) end)(get({'BasicColorFactory':getInstance(), 'WHITE'}))),
        (get({get({This, canvasDrawLineString}), '$class'})):paint(get({This, canvasDrawLineString}), Graphics, get({This, title}), 0),
        (fun(Target_N66305) -> (get({Target_N66305, '$class'})):paint(Target_N66305, Graphics) end)((get({This, '$class'})):getPreGameSelectionForm(This)).

getPreGameSelectionForm(This) ->
        get({This, preGameScrollSelectionForm}).

