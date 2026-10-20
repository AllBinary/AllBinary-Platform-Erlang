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
% package org.allbinary.game.resource
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('FeatureResourceInitializationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FeatureResourceInitializationUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'FeatureResourceInitializationUtil', instance}).

% throws Exception
init(This, Level) when is_integer(Level) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'INIT'})),
        FeaturedResourceFactory = 'FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance(),
        (get({FeaturedResourceFactory, '$class'})):init(FeaturedResourceFactory, Level),
        (fun(Target_N66018) -> (get({Target_N66018, '$class'})):init(Target_N66018, Level) end)('FeaturedResourceRelativeRelationshipFactory':getInstance()).

