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
% package org.allbinary.logic.math
% import org.allbinary.logic.string.StringMaker

-module('Orientation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NONE'}, 'Orientation':new(0, 0, 0)),
    put({?MODULE, 'SINGLETON'}, 'Orientation':new(0, 0, 0)),
    ok.

init_fields(This) ->
    put({This, yaw}, 'BasicDecimal':new(0)),
    put({This, pitch}, 'BasicDecimal':new(0)),
    put({This, roll}, 'BasicDecimal':new(0)),
    ok.


getInstance(Yaw, Pitch, Roll) when is_integer(Yaw), is_integer(Pitch), is_integer(Roll) ->
        (get({get({get({'Orientation', 'SINGLETON'}), yaw}), '$class'})):setint(get({get({'Orientation', 'SINGLETON'}), yaw}), Yaw),
        (get({get({get({'Orientation', 'SINGLETON'}), pitch}), '$class'})):setint(get({get({'Orientation', 'SINGLETON'}), pitch}), Pitch),
        (get({get({get({'Orientation', 'SINGLETON'}), roll}), '$class'})):setint(get({get({'Orientation', 'SINGLETON'}), roll}), Roll),
        get({'Orientation', 'SINGLETON'}).

new(Yaw, Pitch, Roll) when is_integer(Yaw), is_integer(Pitch), is_integer(Roll) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Yaw, Pitch, Roll),
    This.

init(This, Yaw, Pitch, Roll) when is_integer(Yaw), is_integer(Pitch), is_integer(Roll) ->
    init_fields(This),
        (get({get({This, yaw}), '$class'})):setint(get({This, yaw}), Yaw),
        (get({get({This, pitch}), '$class'})):setint(get({This, pitch}), Pitch),
        (get({get({This, roll}), '$class'})):setint(get({This, roll}), Roll).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Y: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, yaw}), '$class'})):toString(get({This, yaw}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " P: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, pitch}), '$class'})):toString(get({This, pitch}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " R: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, roll}), '$class'})):toString(get({This, roll}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

