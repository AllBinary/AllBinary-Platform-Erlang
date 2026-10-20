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
% package org.allbinary.image
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.lcdui.ChoiceGroupImageFactory
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.game.configuration.feature.Features

-module('ChoiceGroupImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ChoiceGroupImageUtil':new()),
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


getInstance() ->
        get({'ChoiceGroupImageUtil', instance}).

init(This) ->
        Features = 'Features':getInstance(),
        ChoiceGroupFactory = 'ChoiceGroupImageFactory':getInstance(),
        ImageArray = (get({ChoiceGroupFactory, '$class'})):getImageArray(ChoiceGroupFactory),
        case (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) of
            true ->
            PreResourceImageUtil = 'PreResourceImageUtil':getInstance(),
            Size = array:size(ImageArray),
            lists:foreach(fun(Index) ->
                array:set(Index, (get({PreResourceImageUtil, '$class'})):encapsulate(PreResourceImageUtil, array:get(Index, ImageArray)), ImageArray)
            end, lists:seq(0, Size - 1)),
            (get({ChoiceGroupFactory, '$class'})):init(ChoiceGroupFactory, ImageArray);
            false -> ok
        end.

update(This, Gl) ->
        Features = 'Features':getInstance(),
        ChoiceGroupFactory = 'ChoiceGroupImageFactory':getInstance(),
        ImageArray = (get({ChoiceGroupFactory, '$class'})):getImageArray(ChoiceGroupFactory),
        case (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) of
            true ->
            PreResourceImageUtil = 'PreResourceImageUtil':getInstance(),
            Size = array:size(ImageArray),
            lists:foreach(fun(Index) ->
                (get({PreResourceImageUtil, '$class'})):updateGL(PreResourceImageUtil, Gl, array:get(Index, ImageArray))
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        (get({ChoiceGroupFactory, '$class'})):init(ChoiceGroupFactory, ImageArray);
update(This, Graphics) ->
        Features = 'Features':getInstance(),
        ChoiceGroupFactory = 'ChoiceGroupImageFactory':getInstance(),
        ImageArray = (get({ChoiceGroupFactory, '$class'})):getImageArray(ChoiceGroupFactory),
        case (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) of
            true ->
            PreResourceImageUtil = 'PreResourceImageUtil':getInstance(),
            Size = array:size(ImageArray),
            lists:foreach(fun(Index) ->
                (get({PreResourceImageUtil, '$class'})):update(PreResourceImageUtil, Graphics, array:get(Index, ImageArray))
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        (get({ChoiceGroupFactory, '$class'})):init(ChoiceGroupFactory, ImageArray).


