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
% package org.allbinary.layer
% import org.allbinary.graphics.Rectangle
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.view.ViewPosition

-module('AllBinaryLayerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AllBinaryLayerFactoryInterface

init_fields(This) ->
    put({This, rectangle}, undefined),
    ok.


new(Rectangle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Rectangle),
    This.

'$init'(This, Rectangle) ->
    init_fields(This),
        put({This, rectangle}, Rectangle).

getInstance(This) ->
        'AllBinaryLayer':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({This, rectangle}), 'ViewPosition':getInstanceD()).

