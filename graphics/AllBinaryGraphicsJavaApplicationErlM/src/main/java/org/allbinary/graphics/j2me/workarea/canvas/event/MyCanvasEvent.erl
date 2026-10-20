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
% package org.allbinary.graphics.j2me.workarea.canvas.event
% import javax.swing.tree.MutableTreeNode

-module('MyCanvasEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('EventObject', Function, Arguments).

init_fields(This) ->
    ok.


new(Source) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Source),
    This.

'$init'(This, Source) ->
        'EventObject':'$init'(This, Source).

getSource(This) ->
        'EventObject':getSource(This).

toString(This) ->
        'EventObject':toString(This).

getCommand(This) ->
        MyEventSource = (get({This, '$class'})):getSource(This),
        (get({MyEventSource, '$class'})):getCommand(MyEventSource).

getTreeNode(This) ->
        MyEventSource = (get({This, '$class'})):getSource(This),
        (get({MyEventSource, '$class'})):getTreeNode(MyEventSource).

getAngle(This) ->
        MyEventSource = (get({This, '$class'})):getSource(This),
        (get({MyEventSource, '$class'})):getAngle(MyEventSource).

