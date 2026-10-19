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
% package org.allbinary.game.configuration.event
% import org.allbinary.game.resource.ResourceLoadingLevel
% import org.allbinary.game.resource.ResourceLoadingLevelFactory
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('GameInitializedEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, resourceLoadingLevel}, get({'ResourceLoadingLevelFactory':getInstance(), 'LEVEL'})),
    put({This, level}, 0),
    ok.


new(AnyType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnyType),
    This.

init(This, AnyType) ->
        'AllBinaryEventObject':init(This, AnyType),
        init_fields(This).

setLevel(This, Level) when is_integer(Level) ->
        put({This, level}, Level),
        put({This, resourceLoadingLevel}, get({'ResourceLoadingLevelFactory':getInstance(), 'LEVEL'})).

getLevel(This) ->
        get({This, level}).

setResourceLoadingLevel(This, ResourceLoadingLevel) ->
        put({This, resourceLoadingLevel}, ResourceLoadingLevel),
        put({This, level}, (get({get({This, resourceLoadingLevel}), '$class'})):getLevel(get({This, resourceLoadingLevel}))).

getResourceLoadingLevel(This) ->
        get({This, resourceLoadingLevel}).

