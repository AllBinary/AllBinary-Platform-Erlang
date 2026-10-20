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
% package org.allbinary.graphics.form.item.validation
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.util.visitor.Visitor

-module('TextItemVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Visitor', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Visitor':'$init'(This),
    init_fields(This),
        ok.

visit(This, AnyType) ->
        try
        Value = AnyType,
        case (string:length(Value) < 2) of
            true ->
            throw({'$return', get({'BooleanFactory':getInstance(), 'TRUE'})});
            false ->
            throw({'$return', get({'BooleanFactory':getInstance(), 'FALSE'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

