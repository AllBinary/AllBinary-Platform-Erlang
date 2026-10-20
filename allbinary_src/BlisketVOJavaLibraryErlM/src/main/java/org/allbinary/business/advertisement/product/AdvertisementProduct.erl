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
% package org.allbinary.business.advertisement.product
% import org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface

-module('AdvertisementProduct').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementProductInterface

init_fields(This) ->
    put({This, type}, undefined),
    put({This, link}, undefined),
    put({This, number}, 0),
    put({This, constraint}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getType(This) ->
        get({This, type}).

getLink(This) ->
        get({This, link}).

getNumber(This) ->
        get({This, number}).

getTwoDimensionalConstraint(This) ->
        get({This, constraint}).

