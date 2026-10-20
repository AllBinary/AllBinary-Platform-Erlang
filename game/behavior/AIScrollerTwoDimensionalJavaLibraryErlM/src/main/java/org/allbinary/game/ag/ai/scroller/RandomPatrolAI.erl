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
% package org.allbinary.game.ag.ai.scroller
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.util.ABHashtable

-module('RandomPatrolAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasePatrolAI', Function, Arguments).

init_fields(This) ->
    put({This, changedDirection}, true),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'BasePatrolAI':'$init'(This, Hashtable, OwnerLayerInterface, GameInput),
        init_fields(This),
        (get({This, '$class'})):updateRandomDistance(This).

updateRandomDistance(This) ->
        put({This, currentDistance}, (fun(Target_N65994) -> (get({Target_N65994, '$class'})):getAbsoluteNextInt(Target_N65994, (get({get({This, maxDistance}), '$class'})):intValue(get({This, maxDistance}))) end)('MyRandomFactory':getInstance())).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        'BasePatrolAI':update(This),
        'BasePatrolAI':processKeyAI(This, get({This, keyDirection})),
        case get({This, changedDirection}) of
            true ->
            'BasePatrolAI':processKeyAI(This, get({'Canvas', 'KEY_NUM1'})),
            (get({This, '$class'})):updateRandomDistance(This),
            put({This, changedDirection}, false);
            false -> ok
        end.

nextDirection(This) ->
        'BasePatrolAI':nextDirection(This),
        put({This, changedDirection}, true).

