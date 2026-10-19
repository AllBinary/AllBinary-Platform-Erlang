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
% package org.allbinary.game.combat.destroy.event
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.displayable.canvas.NullGameCanvas
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('DestroyedEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, allBinaryGameCanvas}, 'NullGameCanvas':getInstance()),
    put({This, allBinaryLayerInterface}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    ok.


new(CombatGameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CombatGameCanvas),
    This.

init(This, CombatGameCanvas) ->
        'AllBinaryEventObject':init(This, 'DestroyedEventHandler':getInstance()),
        init_fields(This),
        (get({This, '$class'})):setAllBinaryGameCanvas(This, CombatGameCanvas).

getAllBinaryGameCanvas(This) ->
        get({This, allBinaryGameCanvas}).

getLayerInterface(This) ->
        get({This, allBinaryLayerInterface}).

setAllBinaryGameCanvas(This, AllBinaryGameCanvas) ->
        put({This, allBinaryGameCanvas}, AllBinaryGameCanvas).

setLayerInterfaceForCircularStaticPool(This, AllBinaryLayerInterface) ->
        put({This, allBinaryLayerInterface}, AllBinaryLayerInterface).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "DestroyedEvent: \n"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "AllBinaryLayerInterface: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, allBinaryLayerInterface}), '$class'})):toString(get({This, allBinaryLayerInterface}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, "\nAllBinaryGameCanvas: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66432) -> (get({Target_N66432, '$class'})):toString(Target_N66432, (get({This, '$class'})):getAllBinaryGameCanvas(This)) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

