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
% package org.allbinary.game.input
% import org.allbinary.game.input.mapping.InputToGameKeyMapping

-module('LaptopGameInputMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PCGameInputMapping', Function, Arguments).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'PCGameInputMapping':'$init'(This),
    init_fields(This).


getDefault(This) ->
        (fun(Target_N65640) -> (get({Target_N65640, '$class'})):getInputMapping(Target_N65640) end)('LaptopDefaultGameInputMapping':new()).

