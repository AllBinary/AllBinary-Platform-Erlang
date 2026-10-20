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
%   
% Generated Code Do Not Modify
% package org.allbinary.game.layer.capital
% import org.allbinary.game.ag.layer.hud.basic.NumberStringHud

-module('HudCapital').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Capital', Function, Arguments).

init_fields(This) ->
    put({This, capitalGraphic}, undefined),
    ok.


new(MoneyGraphic) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, MoneyGraphic),
    This.

'$init'(This, MoneyGraphic) ->
    'Capital':'$init'(This),
    init_fields(This),
        put({This, capitalGraphic}, MoneyGraphic).

removeMoney(This, Points) when is_integer(Points) ->
        'Capital':removeMoney(This, Points),
        (get({get({This, capitalGraphic}), '$class'})):reduce(get({This, capitalGraphic}), Points).

getTotalMoney(This) ->
        (get({get({This, capitalGraphic}), '$class'})):get(get({This, capitalGraphic})).

addMoney(This, Points) when is_integer(Points) ->
        'Capital':addMoney(This, Points),
        (get({get({This, capitalGraphic}), '$class'})):add(get({This, capitalGraphic}), Points).

