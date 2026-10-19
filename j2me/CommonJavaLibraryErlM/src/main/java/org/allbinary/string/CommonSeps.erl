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
% package org.allbinary.string
% import jsinterop.annotations.JsType
% import org.allbinary.logic.string.StringMaker
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('CommonSeps').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommonSeps':new()),
    ok.

init_fields(This) ->
    put({This, 'NEW_LINE'}, "\n"),
    put({This, 'SEMICOLON'}, ";"),
    put({This, 'EQUALS'}, "="),
    put({This, 'SPACE'}, " "),
    put({This, 'COMMA'}, ","),
    put({This, 'COLON'}, ":"),
    put({This, 'PERIOD'}, "."),
    put({This, 'UNDERSCORE'}, "_"),
    put({This, 'COLON_SEP'}, (fun(Target_N66194) -> (get({Target_N66194, '$class'})):toString(Target_N66194) end)((fun(Target_N66201) -> (get({Target_N66201, '$class'})):append(Target_N66201, get({This, 'SPACE'})) end)((fun(Target_N66208) -> (get({Target_N66208, '$class'})):append(Target_N66208, get({This, 'COLON'})) end)('StringMaker':new())))),
    put({This, 'COMMA_SEP'}, (fun(Target_N66303) -> (get({Target_N66303, '$class'})):toString(Target_N66303) end)((fun(Target_N66310) -> (get({Target_N66310, '$class'})):append(Target_N66310, get({This, 'SPACE'})) end)((fun(Target_N66317) -> (get({Target_N66317, '$class'})):append(Target_N66317, get({This, 'COMMA'})) end)('StringMaker':new())))),
    put({This, 'PARENTHESIS_OPEN'}, "("),
    put({This, 'PARENTHESIS_CLOSE'}, ")"),
    put({This, 'BRACE_OPEN'}, "{"),
    put({This, 'BRACE_CLOSE'}, "}"),
    put({This, 'BRACKET_OPEN'}, "["),
    put({This, 'BRACKET_CLOSE'}, "]"),
    put({This, 'DASH'}, "-"),
    put({This, 'PERCENT'}, "%"),
    put({This, 'AMPERSAND'}, "&"),
    put({This, 'FORWARD_SLASH'}, "/"),
    put({This, 'BACK_SLASH'}, "\\"),
    put({This, 'QUESTION'}, "?"),
    put({This, 'QUOTE'}, "\""),
    put({This, 'QUOTE_END'}, "\","),
    put({This, 'COMMENT'}, "//"),
    put({This, 'INDENT'}, "    "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CommonSeps', instance}).

