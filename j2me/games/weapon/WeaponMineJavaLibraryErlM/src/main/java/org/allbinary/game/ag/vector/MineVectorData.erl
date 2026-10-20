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
% package org.allbinary.game.ag.vector

-module('MineVectorData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, points}, array:from_list([array:from_list([array:from_list([10, 5]), array:from_list([2, 6]), array:from_list([1000, 1000]), array:from_list([2, 2]), array:from_list([10, 9]), array:from_list([1000, 1000]), array:from_list([10, 2]), array:from_list([2, 9]), array:from_list([1000, 1000]), array:from_list([2, 5]), array:from_list([10, 6]), array:from_list([1000, 1000]), array:from_list([7, 9]), array:from_list([5, 2]), array:from_list([1000, 1000]), array:from_list([7, 2]), array:from_list([5, 9]), array:from_list([1000, 1000])])])),
    ok.

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

