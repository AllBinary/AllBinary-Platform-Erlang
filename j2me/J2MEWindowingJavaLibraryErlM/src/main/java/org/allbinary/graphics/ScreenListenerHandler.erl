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
% package org.allbinary.graphics

-module('ScreenListenerHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ScreenListenerHandler':new()),
    ok.

init_fields(This) ->
    put({This, screenListenerInterface}, 'ScreenEmptyListener':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ScreenListenerHandler', instance}).

setListener(This, ScreenListenerInterface) ->
        put({This, screenListenerInterface}, ScreenListenerInterface).

fireWithState(This, IsFullScreen) when is_boolean(IsFullScreen) ->
        (get({get({This, screenListenerInterface}), '$class'})):onFullScreen(get({This, screenListenerInterface}), IsFullScreen).

fire(This) ->
        (get({get({This, screenListenerInterface}), '$class'})):onFullScreenDisplay(get({This, screenListenerInterface})).

