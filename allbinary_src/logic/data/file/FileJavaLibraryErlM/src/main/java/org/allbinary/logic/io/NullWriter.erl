% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import java.io.IOException
% import java.io.Writer

-module('NullWriter').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Writer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_WRITER'}, 'NullWriter':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Writer':'$init'(This),
    init_fields(This).


% throws IOException
write(This, C) when is_integer(C) ->
        ok;
% throws IOException
write(This, Str) when (is_list(Str) orelse Str =:= undefined) ->
        ok.

% throws IOException
write(This, Cbuf, Off, Len) when (is_tuple(Cbuf) orelse Cbuf =:= undefined), is_integer(Off), is_integer(Len) ->
        ok;
% throws IOException
write(This, Str, Off, Len) when (is_list(Str) orelse Str =:= undefined), is_integer(Off), is_integer(Len) ->
        ok.



% throws IOException
flush(This) ->
        ok.

% throws IOException
close(This) ->
        ok.

