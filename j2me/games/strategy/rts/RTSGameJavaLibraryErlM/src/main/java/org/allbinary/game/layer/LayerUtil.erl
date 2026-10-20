% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.PositionStrings
% import org.allbinary.util.ABHashtable

-module('LayerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'HASHTABLE'}, "Hashtable: "),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


toString(Hashtable, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        CommonSeps = 'CommonSeps':getInstance(),
        PositionStrings = 'PositionStrings':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'LayerUtil', 'HASHTABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N65973) -> (get({Target_N65973, '$class'})):toString(Target_N65973, Hashtable) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'X_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, X),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Y_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Y),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Z_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Z),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

