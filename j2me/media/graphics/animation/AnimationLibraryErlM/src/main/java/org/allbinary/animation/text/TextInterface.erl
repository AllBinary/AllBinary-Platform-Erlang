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
% package org.allbinary.animation.text

-module('TextInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


setTextWithOnMeasure(This, Text, TextChangeListener) when (is_list(Text) orelse Text =:= undefined) ->
    erlang:error({abstract_method, setTextWithOnMeasure}).

getText(This) ->
    erlang:error({abstract_method, getText}).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
    erlang:error({abstract_method, setText}).

getFontHeight(This) ->
    erlang:error({abstract_method, getFontHeight}).

getWidth(This) ->
    erlang:error({abstract_method, getWidth}).

