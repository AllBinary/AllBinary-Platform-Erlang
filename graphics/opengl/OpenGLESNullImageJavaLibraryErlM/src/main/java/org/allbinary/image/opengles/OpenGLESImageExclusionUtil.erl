% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.image.opengles
% import javax.microedition.lcdui.Image
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('OpenGLESImageExclusionUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLESImageExclusionUtil':new()),
    ok.

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


getInstance() ->
        get({'OpenGLESImageExclusionUtil', instance}).

isCustomScaling(This, Image) ->
        false.

