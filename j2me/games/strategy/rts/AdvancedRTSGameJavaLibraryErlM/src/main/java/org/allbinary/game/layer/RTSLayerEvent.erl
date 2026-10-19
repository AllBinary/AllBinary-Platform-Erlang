% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
%  
% By agreeing to this license you and any business entity you represent are 
% legally bound to the AllBinary Open License Version 1 legal agreement. 
%  
% You may obtain the AllBinary Open License Version 1 legal agreement from 
% AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
%  
% Created By: Travis Berthelot  
% Generated Code Do Not Modify
% package org.allbinary.game.layer
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('RTSLayerEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, rtsLayer}, get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})),
    ok.


new(RtsLayer) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RtsLayer),
    This.

init(This, RtsLayer) ->
        'AllBinaryEventObject':init(This, RtsLayer),
        init_fields(This).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "RTSLayerEvent: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "RTSLayer: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65891) -> (get({Target_N65891, '$class'})):toString(Target_N65891) end)((get({This, '$class'})):getRtsLayer(This))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getRtsLayer(This) ->
        get({This, rtsLayer}).

setRtsLayer(This, RtsLayer) ->
        put({This, rtsLayer}, RtsLayer).

