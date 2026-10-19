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
% package org.allbinary.input.media.image.capture
% import java.awt.image.BufferedImage
% import org.allbinary.logic.util.event.AllBinaryEventObject

-module('CapturedImageWorkerResultsEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, frame}, undefined),
    put({This, bufferedImage}, undefined),
    ok.


new(AnyType, Frame, BufferedImage) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnyType, Frame, BufferedImage),
    This.

init(This, AnyType, Frame, BufferedImage) ->
        'AllBinaryEventObject':init(This, AnyType),
        init_fields(This),
        put({This, frame}, Frame),
        (get({This, '$class'})):setBufferedImage(This, BufferedImage).

getBufferedImage(This) ->
        get({This, bufferedImage}).

setBufferedImage(This, BufferedImage) ->
        put({This, bufferedImage}, BufferedImage).

getFrame(This) ->
        get({This, frame}).

