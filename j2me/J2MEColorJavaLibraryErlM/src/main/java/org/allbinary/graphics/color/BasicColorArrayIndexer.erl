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
% package org.allbinary.graphics.color
% import jsinterop.annotations.JsType
% import org.allbinary.util.CircularIndexUtil
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

-module('BasicColorArrayIndexer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, basicColorArray}, undefined),
    put({This, circularIndexUtil}, undefined),
    ok.


new(BasicColorArray) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BasicColorArray),
    This.

init(This, BasicColorArray) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined) ->
    init_fields(This),
        put({This, basicColorArray}, BasicColorArray),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(array:size(get({This, basicColorArray})))).

next(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})).

get(This) ->
        array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, basicColorArray})).

getBasicColorArray(This) ->
        get({This, basicColorArray}).

