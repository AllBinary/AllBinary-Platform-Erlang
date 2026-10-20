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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('TextFieldItemValidator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ValidatorBase', Function, Arguments).

init_fields(This) ->
    put({This, textFieldItem}, undefined),
    put({This, min}, 0),
    put({This, max}, 0),
    put({This, allowOnEmpty}, false),
    ok.


new(TextFieldItem, Min, Max, AllowOnEmpty) when is_integer(Min), is_integer(Max), is_boolean(AllowOnEmpty) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TextFieldItem, Min, Max, AllowOnEmpty),
    This.

'$init'(This, TextFieldItem, Min, Max, AllowOnEmpty) when is_integer(Min), is_integer(Max), is_boolean(AllowOnEmpty) ->
    'ValidatorBase':'$init'(This),
    init_fields(This),
        put({This, textFieldItem}, TextFieldItem),
        put({This, min}, Min),
        put({This, max}, Max),
        put({This, allowOnEmpty}, AllowOnEmpty).

isValid(This) ->
        BooleanFactory = 'BooleanFactory':getInstance(),
        put({local, result}, get({BooleanFactory, 'TRUE'})),
        String = (get({get({This, textFieldItem}), '$class'})):getString(get({This, textFieldItem})),
        TextLength = string:length(String),
        case ((((TextLength =:= 0) andalso get({This, allowOnEmpty}))) orelse ((TextLength > get({This, min})) andalso (TextLength < get({This, max})))) of
            true ->
            ok;
            false ->
            case (TextLength < get({This, min})) of
                true ->
                put({local, result}, get({BooleanFactory, 'FALSE'}));
                false ->
                case (TextLength > get({This, max})) of
                true ->
                put({local, result}, get({BooleanFactory, 'FALSE'}));
                false -> ok
            end
            end
        end,
        get({local, result}).

toList(This) ->
        List = 'BasicArrayListD':new(),
        String = (get({get({This, textFieldItem}), '$class'})):getString(get({This, textFieldItem})),
        TextLength = string:length(String),
        case ((TextLength > get({This, min})) andalso (TextLength < get({This, max}))) of
            true ->
            ok;
            false ->
            Label = (get({get({This, textFieldItem}), '$class'})):getLabel(get({This, textFieldItem})),
            Name = string:slice(Label, 0, ((string:length(Label) - 2)) - (0)),
            case (TextLength < get({This, min})) of
                true ->
                (get({List, '$class'})):add(List, (fun(Target_N67080) -> (get({Target_N67080, '$class'})):toString(Target_N67080) end)((fun(Target_N67087) -> (get({Target_N67087, '$class'})):append(Target_N67087, " is to short") end)((fun(Target_N67094) -> (get({Target_N67094, '$class'})):append(Target_N67094, Name) end)('StringMaker':new()))));
                false ->
                case (TextLength > get({This, max})) of
                true ->
                (get({List, '$class'})):add(List, (fun(Target_N66995) -> (get({Target_N66995, '$class'})):toString(Target_N66995) end)((fun(Target_N67002) -> (get({Target_N67002, '$class'})):append(Target_N67002, " is to long") end)((fun(Target_N67009) -> (get({Target_N67009, '$class'})):append(Target_N67009, Name) end)('StringMaker':new()))));
                false -> ok
            end
            end
        end,
        List.

