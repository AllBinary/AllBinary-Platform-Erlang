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
% package org.allbinary.graphics.j2me.workarea.tools
% import org.allbinary.string.CommonSeps

-module('MouseStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MouseStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'MOUSE_PRESSED'}, "mousePressed"),
    put({This, 'MOUSE_RELEASED'}, "mouseReleased"),
    put({This, 'MOUSE_CLICKED'}, "mouseClicked"),
    put({This, 'MOUSE_DRAGGED'}, "mouseDragged"),
    put({This, 'MOUSE_MOVED'}, "mouseMoved"),
    put({This, 'MOUSE_PRESSED_LABEL'}, lists:concat(["MousePressed", get({'CommonSeps':getInstance(), 'COLON_SEP'})])),
    put({This, 'MOUSE_RELEASED_LABEL'}, lists:concat(["MouseReleased", get({'CommonSeps':getInstance(), 'COLON_SEP'})])),
    put({This, 'MOUSE_CLICKED_LABEL'}, lists:concat(["MouseClicked", get({'CommonSeps':getInstance(), 'COLON_SEP'})])),
    put({This, 'MOUSE_DRAGGED_LABEL'}, lists:concat(["MouseDragged", get({'CommonSeps':getInstance(), 'COLON_SEP'})])),
    put({This, 'MOUSE_MOVED_LABEL'}, lists:concat(["MouseMoved", get({'CommonSeps':getInstance(), 'COLON_SEP'})])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'MouseStrings', instance}).

