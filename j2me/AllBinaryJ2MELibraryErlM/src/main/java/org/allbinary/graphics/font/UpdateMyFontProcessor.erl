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
% package org.allbinary.graphics.font
% import javax.microedition.lcdui.Graphics

-module('UpdateMyFontProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MyFontProcessor', Function, Arguments).

init_fields(This) ->
    put({This, updateMeasurementProcessor}, undefined),
    ok.


new(KeyValueDrawCharArray) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, KeyValueDrawCharArray),
    This.

init(This, KeyValueDrawCharArray) ->
    'MyFontProcessor':init(This),
    init_fields(This),
        put({This, updateMeasurementProcessor}, KeyValueDrawCharArray).

process(This, Graphics) ->
        (get({get({This, updateMeasurementProcessor}), '$class'})):updateMeasurement(get({This, updateMeasurementProcessor}), Graphics).

