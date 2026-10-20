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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.paint.InitUpdatePaintable
% import org.allbinary.graphics.paint.NullInitUpdatePaintable

-module('RTSLayerInfoPaintable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitUpdatePaintable', Function, Arguments).

init_fields(This) ->
    put({This, initUpdatePaintable}, 'NullInitUpdatePaintable':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'InitUpdatePaintable':'$init'(This),
    init_fields(This),
        ok.

update(This) ->
        (get({get({This, initUpdatePaintable}), '$class'})):update(get({This, initUpdatePaintable})).

paint(This, Graphics) ->
        (get({get({This, initUpdatePaintable}), '$class'})):paint(get({This, initUpdatePaintable}), Graphics).

updateRTSLayerInfoInit(This, HudPaintable) ->
        put({This, initUpdatePaintable}, HudPaintable).

updateRTSLayerInfoSelection(This, HudPaintable) ->
        (get({HudPaintable, '$class'})):updateSelectionInfo(HudPaintable),
        put({This, initUpdatePaintable}, HudPaintable).

