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
% package org.allbinary.view
% import org.allbinary.graphics.displayable.DisplayInfoSingleton

-module('CenterStaticViewPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getInstance(This, Z) when is_integer(Z) ->
        DisplayInfoSingleton = 'DisplayInfoSingleton':getInstance(),
        'StaticViewPosition':new((((get({DisplayInfoSingleton, '$class'})):getLastWidth(DisplayInfoSingleton) bsr 1)), (((get({DisplayInfoSingleton, '$class'})):getLastHeight(DisplayInfoSingleton) bsr 1)), Z).

