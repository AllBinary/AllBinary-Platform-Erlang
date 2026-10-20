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
% package org.allbinary.game
% import org.allbinary.business.advertisement.GameAdStateBase
% import org.allbinary.business.advertisement.AdConfiguration
% import org.allbinary.input.event.VirtualKeyboardEvent
% import org.allbinary.input.event.VirtualKeyboardEventHandler
% import org.allbinary.input.event.VirtualKeyboardEventListenerInterface

-module('GameAdState').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements VirtualKeyboardEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameAdStateBase', Function, Arguments).

init_fields(This) ->
    ok.


new(AdConfiguration) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AdConfiguration),
    This.

'$init'(This, AdConfiguration) ->
        'GameAdStateBase':'$init'(This, AdConfiguration),
        (fun(Target_N65777) -> (get({Target_N65777, '$class'})):addListenerInterface(Target_N65777, This) end)('VirtualKeyboardEventHandler':getInstance()).

% throws Exception
onVirtualKeyboardEvent(This, VirtualKeyboardEvent) ->
        ok.

