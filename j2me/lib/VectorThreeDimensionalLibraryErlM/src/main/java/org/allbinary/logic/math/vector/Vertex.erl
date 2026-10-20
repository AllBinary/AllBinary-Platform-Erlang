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
% package org.allbinary.logic.math.vector
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonSeps

-module('Vertex').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, x}, 'BasicDecimal':new(0)),
    put({This, y}, 'BasicDecimal':new(0)),
    put({This, z}, 'BasicDecimal':new(0)),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        PositionStrings = 'PositionStrings':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'X_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, x}), '$class'})):toString(get({This, x}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Y_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, y}), '$class'})):toString(get({This, y}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Z_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, z}), '$class'})):toString(get({This, z}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

