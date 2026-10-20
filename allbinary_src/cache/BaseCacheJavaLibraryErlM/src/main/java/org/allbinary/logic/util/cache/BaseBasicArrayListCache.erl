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
% package org.allbinary.logic.util.cache
% import jsinterop.annotations.JsType
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsProperty

-module('BaseBasicArrayListCache').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


log(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "S: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({get({This, list}), '$class'})):size(get({This, list}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

