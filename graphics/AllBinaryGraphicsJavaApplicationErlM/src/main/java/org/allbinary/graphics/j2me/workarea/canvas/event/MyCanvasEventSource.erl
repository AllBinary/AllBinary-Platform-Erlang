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

-module('MyCanvasEventSource').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, command}, undefined),
    put({This, treeNode}, undefined),
    put({This, angle}, 0.0),
    ok.


new(Command, TreeNode) when (is_list(Command) orelse Command =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Command, TreeNode),
    This.

init(This, Command, TreeNode) when (is_list(Command) orelse Command =:= undefined) ->
    init_fields(This),
        put({This, command}, Command),
        put({This, treeNode}, TreeNode).

new(Command, Angle, TreeNode) when (is_list(Command) orelse Command =:= undefined), is_number(Angle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Command, Angle, TreeNode),
    This.

init(This, Command, Angle, TreeNode) when (is_list(Command) orelse Command =:= undefined), is_number(Angle) ->
    init_fields(This),
        put({This, command}, Command),
        put({This, treeNode}, TreeNode),
        (get({This, '$class'})):setAngle(This, Angle).

getCommand(This) ->
        get({This, command}).

getTreeNode(This) ->
        get({This, treeNode}).

getAngle(This) ->
        get({This, angle}).

setAngle(This, Angle) when is_number(Angle) ->
        put({This, angle}, Angle).

