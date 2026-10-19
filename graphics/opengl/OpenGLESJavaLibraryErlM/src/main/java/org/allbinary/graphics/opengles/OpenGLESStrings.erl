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
% package org.allbinary.graphics.opengles
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics

-module('OpenGLESStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
set(This, Gl) ->
        erlang:error({'RuntimeException'}).

initFont(This, Gl, Width, Height) when is_integer(Width), is_integer(Height) ->
        erlang:error({'RuntimeException'}).

% throws Exception
update(This, Gl, Width, Height) when is_integer(Width), is_integer(Height) ->
        erlang:error({'RuntimeException'}).

drawChar(This, Gl, Graphics, Character, X, Y, Anchor) when is_integer(Character), is_integer(X), is_integer(Y), is_integer(Anchor) ->
        erlang:error({'RuntimeException'}).

drawChars(This, Gl, Graphics, Data, Offset, Length, X, Y, Anchor) when (is_tuple(Data) orelse Data =:= undefined), is_integer(Offset), is_integer(Length), is_integer(X), is_integer(Y), is_integer(Anchor) ->
        erlang:error({'RuntimeException'}).

drawString(This, Gl, Graphics, String, X, Y, Anchor) when (is_list(String) orelse String =:= undefined), is_integer(X), is_integer(Y), is_integer(Anchor) ->
        erlang:error({'RuntimeException'}).

drawSubstring(This, Gl, Graphics, String, Offset, Len, X, Y, Anchor) when (is_list(String) orelse String =:= undefined), is_integer(Offset), is_integer(Len), is_integer(X), is_integer(Y), is_integer(Anchor) ->
        erlang:error({'RuntimeException'}).

charWidth(This, Ch) when is_integer(Ch) ->
        erlang:error({'RuntimeException'}).

charsWidth(This, Ch, Offset, Length) when (is_tuple(Ch) orelse Ch =:= undefined), is_integer(Offset), is_integer(Length) ->
        erlang:error({'RuntimeException'}).

stringWidth(This, String) when (is_list(String) orelse String =:= undefined) ->
        erlang:error({'RuntimeException'}).

stringWidth(This, String, Offset, Len) when (is_list(String) orelse String =:= undefined), is_integer(Offset), is_integer(Len) ->
        erlang:error({'RuntimeException'}).

