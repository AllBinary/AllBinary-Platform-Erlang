% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.media.audio

-module('SoundStrings').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SoundStrings':new()),
    ok.

init_fields(This) ->
    put({This, 'STOP_ALL'}, "stopAll"),
    put({This, 'CLOSE_ALL'}, "closeAll"),
    put({This, 'SOUND'}, " Sound: "),
    put({This, 'INIT_SOUND'}, "Initializing Sound: "),
    put({This, 'STOPPING_SOUND'}, "Stopping Sound: "),
    put({This, 'CLOSING_SOUND'}, "Closing Sound: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'SoundStrings', instance}).

