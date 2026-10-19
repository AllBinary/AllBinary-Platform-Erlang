% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.logic.string.StringUtil

-module('NoSound').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Sound', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'NoSound':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'NoSound', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'Sound':init(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (get({This, '$class'})):setPlayerP(This, get({'NoPlayer', 'NO_PLAYER'})).

