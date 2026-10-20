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
% package org.allbinary.logic.io
% import java.io.DataOutputStream
% import java.io.OutputStream

-module('AbDataOutputStream').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DataOutputStream', Function, Arguments).

init_fields(This) ->
    ok.


new(Out) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Out),
    This.

'$init'(This, Out) ->
        'DataOutputStream':'$init'(This, Out).

