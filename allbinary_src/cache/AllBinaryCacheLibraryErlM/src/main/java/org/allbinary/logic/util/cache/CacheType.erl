% 
% AllBinary Open License Version 1 
% Copyright (c) 2007 AllBinary 
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
% import org.allbinary.logic.string.StringMaker

-module('CacheType').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, vendor}, undefined),
    put({This, type}, undefined),
    ok.


new(Vendor, Type) when (is_list(Vendor) orelse Vendor =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Vendor, Type),
    This.

init(This, Vendor, Type) when (is_list(Vendor) orelse Vendor =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    init_fields(This),
        put({This, vendor}, Vendor),
        put({This, type}, Type).

getVendor(This) ->
        get({This, vendor}).

getType(This) ->
        get({This, type}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "CacheType: Vendor: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getVendor(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Type: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getType(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

