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
% package org.allbinary.game.ag.layer.weapon.mine
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerFactoryInterface
% import org.allbinary.view.ViewPositionFactoryInterface

-module('MineLayerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AllBinaryLayerFactoryInterface

init_fields(This) ->
    put({This, viewPositionFactoryInterface}, undefined),
    ok.


new(ViewPositionFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ViewPositionFactoryInterface),
    This.

init(This, ViewPositionFactoryInterface) ->
    init_fields(This),
        put({This, viewPositionFactoryInterface}, ViewPositionFactoryInterface).

% throws Exception
getInstance(This) ->
        'MineLayer':new((get({get({This, viewPositionFactoryInterface}), '$class'})):getInstance(get({This, viewPositionFactoryInterface}))).

