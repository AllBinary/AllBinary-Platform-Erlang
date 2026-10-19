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
% package org.allbinary.data
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.string.tokens.Tokenizer
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CamelCaseUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CamelCaseUtil':new()),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CamelCaseUtil', instance}).

% throws Exception
getAsCamelCase(This, String, StringBuilder) when (is_list(String) orelse String =:= undefined) ->
        try
        case (String =:= undefined) of
            true ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})});
            false -> ok
        end,
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        (get({StringBuilder, '$class'})):delete(StringBuilder, 0, (get({StringBuilder, '$class'})):length(StringBuilder)),
        List = 'BasicArrayListD':new(),
        Tokenizer = 'Tokenizer':new(get({get({This, commonSeps}), 'UNDERSCORE'})),
        (get({Tokenizer, '$class'})):getTokensFromString(Tokenizer, String, List),
        Size = (get({List, '$class'})):size(List),
        put({local, word}, undefined),
        lists:foreach(fun(I) ->
            put({local, word}, (get({List, '$class'})):get(List, I)),
            put({local, word}, case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, word})) of true -> get({local, word}); false -> (fun(Target_N66439) -> (get({Target_N66439, '$class'})):toString(Target_N66439) end)((fun(Target_N66446) -> (get({Target_N66446, '$class'})):append(Target_N66446, string:lowercase(string:slice(get({local, word}), 1))) end)((fun(Target_N66453) -> (get({Target_N66453, '$class'})):appendchar(Target_N66453, 'Character':toUpperCase(lists:nth((0) + 1, get({local, word})))) end)('StringMaker':new()))) end),
            (get({StringBuilder, '$class'})):append(StringBuilder, get({local, word}))
        end, lists:seq(0, Size - 1)),
        (get({StringBuilder, '$class'})):toString(StringBuilder)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

