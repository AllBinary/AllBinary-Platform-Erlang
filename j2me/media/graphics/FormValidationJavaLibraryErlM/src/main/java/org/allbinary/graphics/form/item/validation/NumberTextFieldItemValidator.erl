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
% import org.allbinary.graphics.form.item.ABTextFieldItem
% import org.allbinary.logic.control.validate.ValidatorBase
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('NumberTextFieldItemValidator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ValidatorBase', Function, Arguments).

init_fields(This) ->
    put({This, textFieldItem}, undefined),
    put({This, min}, 0),
    put({This, max}, 0),
    put({This, maxChars}, 0),
    ok.


new(TextFieldItem, MaxChars, Min, Max) when is_integer(MaxChars), is_integer(Min), is_integer(Max) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TextFieldItem, MaxChars, Min, Max),
    This.

'$init'(This, TextFieldItem, MaxChars, Min, Max) when is_integer(MaxChars), is_integer(Min), is_integer(Max) ->
    'ValidatorBase':'$init'(This),
    init_fields(This),
        put({This, textFieldItem}, TextFieldItem),
        put({This, min}, Min),
        put({This, max}, Max),
        put({This, maxChars}, MaxChars).

isNumberValid(This, Value) ->
        get({'BooleanFactory':getInstance(), 'TRUE'}).

toNumberVector(This, Value) ->
        'BasicArrayListD':new().

isValid(This) ->
        put({local, result}, get({'BooleanFactory':getInstance(), 'TRUE'})),
        String = (get({get({This, textFieldItem}), '$class'})):getString(get({This, textFieldItem})),
        TextLength = string:length(String),
        case ((TextLength > 0) andalso (TextLength < get({This, maxChars}))) of
            true ->
            try
                list_to_integer((get({get({This, textFieldItem}), '$class'})):getString(get({This, textFieldItem})))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                put({local, result}, get({'BooleanFactory':getInstance(), 'FALSE'}))
            end;
            false ->
            case (TextLength < 1) of
                true ->
                put({local, result}, get({'BooleanFactory':getInstance(), 'FALSE'}));
                false ->
                case (TextLength > get({This, maxChars})) of
                true ->
                put({local, result}, get({'BooleanFactory':getInstance(), 'FALSE'}));
                false -> ok
            end
            end
        end,
        get({local, result}).

toList(This) ->
        List = 'BasicArrayListD':new(),
        String = (get({get({This, textFieldItem}), '$class'})):getString(get({This, textFieldItem})),
        TextLength = string:length(String),
        Label = (get({get({This, textFieldItem}), '$class'})):getLabel(get({This, textFieldItem})),
        Name = string:slice(Label, 0, ((string:length(Label) - 2)) - (0)),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        StringMaker = 'StringMaker':new(),
        case ((TextLength > 0) andalso (TextLength < get({This, maxChars}))) of
            true ->
            try
                Number = (get({SmallIntegerSingletonFactory, '$class'})):createInstance(SmallIntegerSingletonFactory, list_to_integer((get({get({This, textFieldItem}), '$class'})):getString(get({This, textFieldItem})))),
                case ((get({Number, '$class'})):intValue(Number) > get({This, min})) of
                    true ->
                    (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                    (get({List, '$class'})):add(List, (fun(Target_N67909) -> (get({Target_N67909, '$class'})):toString(Target_N67909) end)((fun(Target_N67916) -> (get({Target_N67916, '$class'})):append(Target_N67916, " is to small") end)((get({StringMaker, '$class'})):append(StringMaker, Name))));
                    false ->
                    case ((get({Number, '$class'})):intValue(Number) > get({This, max})) of
                    true ->
                    (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                    (get({List, '$class'})):add(List, (fun(Target_N67785) -> (get({Target_N67785, '$class'})):toString(Target_N67785) end)((fun(Target_N67792) -> (get({Target_N67792, '$class'})):append(Target_N67792, " is to large") end)((get({StringMaker, '$class'})):append(StringMaker, Name))));
                    false -> ok
                end
                end
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                (get({List, '$class'})):add(List, (fun(Target_N68044) -> (get({Target_N68044, '$class'})):toString(Target_N68044) end)((fun(Target_N68051) -> (get({Target_N68051, '$class'})):append(Target_N68051, " is not a number") end)((get({StringMaker, '$class'})):append(StringMaker, Name))))
            end;
            false ->
            case (TextLength < 1) of
                true ->
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                (get({List, '$class'})):add(List, (fun(Target_N67492) -> (get({Target_N67492, '$class'})):toString(Target_N67492) end)((fun(Target_N67499) -> (get({Target_N67499, '$class'})):append(Target_N67499, " is to short") end)((get({StringMaker, '$class'})):append(StringMaker, Name))));
                false ->
                case (TextLength > get({This, maxChars})) of
                true ->
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                (get({List, '$class'})):add(List, (fun(Target_N67368) -> (get({Target_N67368, '$class'})):toString(Target_N67368) end)((fun(Target_N67375) -> (get({Target_N67375, '$class'})):append(Target_N67375, " is to long") end)((get({StringMaker, '$class'})):append(StringMaker, Name))));
                false -> ok
            end
            end
        end,
        List.

