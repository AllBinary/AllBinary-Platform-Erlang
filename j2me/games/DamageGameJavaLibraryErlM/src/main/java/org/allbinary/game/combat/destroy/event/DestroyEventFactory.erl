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
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface

-module('DestroyEventFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AllBinaryEventObjectFactoryInterface

init_fields(This) ->
    put({This, combatGameCanvas}, undefined),
    ok.


new(CombatGameCanvas) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CombatGameCanvas),
    This.

init(This, CombatGameCanvas) ->
    init_fields(This),
        put({This, combatGameCanvas}, CombatGameCanvas).

getInstance(This) ->
        'DestroyedEvent':new(get({This, combatGameCanvas})).

