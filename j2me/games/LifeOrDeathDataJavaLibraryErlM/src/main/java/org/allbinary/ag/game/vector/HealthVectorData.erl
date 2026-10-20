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
% package org.allbinary.ag.game.vector

-module('HealthVectorData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, points}, array:from_list([array:from_list([array:from_list([2, 1]), array:from_list([3, 2]), array:from_list([3, 2]), array:from_list([4, 1]), array:from_list([4, 1]), array:from_list([5, 1]), array:from_list([5, 1]), array:from_list([6, 2]), array:from_list([6, 2]), array:from_list([6, 3]), array:from_list([6, 3]), array:from_list([3, 6]), array:from_list([3, 6]), array:from_list([0, 3]), array:from_list([0, 3]), array:from_list([0, 2]), array:from_list([0, 2]), array:from_list([1, 1]), array:from_list([1, 1]), array:from_list([2, 1]), array:from_list([1000, 1000])])])),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


