% 
% To change this license header, choose License Headers in Project Properties. 
% To change this template file, choose Tools | Templates 
% and open the template in the editor.  
% Generated Code Do Not Modify
% package org.allbinary.input.motion.button

-module('TouchButtonResource').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'RESOURCE'}, undefined),
    put({This, 'HINT'}, undefined),
    ok.


new(Resource, Hint) when (is_list(Resource) orelse Resource =:= undefined), (is_list(Hint) orelse Hint =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Resource, Hint),
    This.

'$init'(This, Resource, Hint) when (is_list(Resource) orelse Resource =:= undefined), (is_list(Hint) orelse Hint =:= undefined) ->
    init_fields(This),
        put({This, 'RESOURCE'}, Resource),
        put({This, 'HINT'}, Hint).

