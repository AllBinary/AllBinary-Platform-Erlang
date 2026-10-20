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
% package org.allbinary.graphics.displayable.screen
% import javax.microedition.lcdui.Displayable
% import org.allbinary.canvas.Processor

-module('ScreenRepaintProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Processor', Function, Arguments).

init_fields(This) ->
    put({This, displayable}, undefined),
    ok.


new(Displayable) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Displayable),
    This.

'$init'(This, Displayable) ->
    'Processor':'$init'(This),
    init_fields(This),
        put({This, displayable}, Displayable).

% throws Exception
process(This) ->
        'ScreenRepaintUtil':repaint(get({This, displayable})).

