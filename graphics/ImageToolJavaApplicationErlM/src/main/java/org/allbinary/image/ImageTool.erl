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
% import org.allbinary.thread.ARunnable
% import org.allbinary.image.gui.ImageToolJFrame
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('ImageTool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        (get({get({get({'java', awt}), 'EventQueue'}), '$class'})):invokeLater(get({get({'java', awt}), 'EventQueue'}), 'ARunnable':new() % Java anonymous class body: implement it as a module
%             ok % run
).

