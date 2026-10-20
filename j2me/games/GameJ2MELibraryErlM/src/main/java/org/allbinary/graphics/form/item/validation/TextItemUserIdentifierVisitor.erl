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
% import org.allbinary.game.input.TextNotificationUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.string.CommonStrings

-module('TextItemUserIdentifierVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Visitor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
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
            CharValue = lists:nth((0) + 1, Value),
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case (get({StringValidationUtil, '$class'})):isNumber(StringValidationUtil, Value) of
                true ->
                throw({'$return', get({'BooleanFactory':getInstance(), 'TRUE'})});
                false ->
                case (get({This, '$class'})):isLetter(This, CharValue) of
                true ->
                throw({'$return', get({'BooleanFactory':getInstance(), 'TRUE'})});
                false ->
                try
                    (fun(Target_N66156) -> (get({Target_N66156, '$class'})):fireError(Target_N66156, "Only Letters & Numbers Allowed") end)('TextNotificationUtil':getInstance())
                catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                    CommonStrings = 'CommonStrings':getInstance(),
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'VISIT'}), E)
                end,
                throw({'$return', get({'BooleanFactory':getInstance(), 'FALSE'})})
            end
            end;
            false ->
            throw({'$return', get({'BooleanFactory':getInstance(), 'FALSE'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isLetter(This, CharValue) when is_integer(CharValue) ->
        Value = CharValue,
        ((((Value > 64) andalso (Value < 91))) orelse (((Value > 96) andalso (Value < 123)))).

