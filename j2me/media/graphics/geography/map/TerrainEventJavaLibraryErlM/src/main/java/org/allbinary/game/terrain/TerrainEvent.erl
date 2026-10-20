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
% package org.allbinary.game.terrain
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('TerrainEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, basicTerrainInfo}, get({'BasicTerrainInfo', 'NULL_BASIC_TERRAIN_INFO'})),
    ok.


new(BasicTerrainInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicTerrainInfo),
    This.

'$init'(This, BasicTerrainInfo) ->
        'AllBinaryEventObject':'$init'(This, BasicTerrainInfo),
        init_fields(This),
        (get({This, '$class'})):setBasicTerrainInfo(This, get({This, basicTerrainInfo})).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "TerrainEvent: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "LayerInterface: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, basicTerrainInfo}), '$class'})):toString(get({This, basicTerrainInfo}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getBasicTerrainInfo(This) ->
        get({This, basicTerrainInfo}).

setBasicTerrainInfo(This, BasicTerrainInfo) ->
        put({This, basicTerrainInfo}, BasicTerrainInfo).

setBasicTerrainInfoForCircularStaticPool(This, BasicTerrainInfo) ->
        put({This, basicTerrainInfo}, BasicTerrainInfo).

