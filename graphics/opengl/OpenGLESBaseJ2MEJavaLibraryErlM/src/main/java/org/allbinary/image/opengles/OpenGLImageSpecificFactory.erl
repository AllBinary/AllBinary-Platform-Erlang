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
% package org.allbinary.image.opengles
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('OpenGLImageSpecificFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLImageSpecificFactory':new()),
    ok.

init_fields(This) ->
    put({This, imageFactory}, get({'OpenGLImageFactory', 'NULL_OPENGL_IMAGE_FACTORY'})),
    put({This, updating}, false),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLImageSpecificFactory', instance}).

setImageFactory(This, ImageFactory) ->
        put({This, imageFactory}, ImageFactory),
        'PreLogUtil':put((fun(Target_N65918) -> (get({Target_N65918, '$class'})):toString(Target_N65918) end)((fun(Target_N65925) -> (get({Target_N65925, '$class'})):append(Target_N65925, (fun(Target_N65961) -> (get({Target_N65961, '$class'})):toString(Target_N65961, get({This, imageFactory})) end)('StringUtil':getInstance())) end)((fun(Target_N65932) -> (get({Target_N65932, '$class'})):append(Target_N65932, "Selected Image Factory: ") end)('StringMaker':new()))), This, "setImageFactory").

getImageFactory(This) ->
        get({This, imageFactory}).

