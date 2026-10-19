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
% package org.allbinary.input.automation.module.game
% import java.awt.image.BufferedImage
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('MagicGameObject').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements MagicGameObjectInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MeteredGameObject', Function, Arguments).

init_fields(This) ->
    put({This, 'MP_LABEL'}, "MP:"),
    ok.


new(BufferedImage, MinX, MaxX, Y) when (is_tuple(BufferedImage) orelse BufferedImage =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BufferedImage, MinX, MaxX, Y),
    This.

init(This, BufferedImage, MinX, MaxX, Y) when (is_tuple(BufferedImage) orelse BufferedImage =:= undefined) ->
        'MeteredGameObject':init(This, BufferedImage, MinX, MaxX, Y),
        init_fields(This).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'MP_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'MeteredGameObject':toString(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

