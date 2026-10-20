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
% package org.allbinary.logic.java.characters

-module('CharacterSetData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CharacterSetData':new()),
    ok.

init_fields(This) ->
    put({This, 'US_ASCII'}, "US-ASCII"),
    put({This, 'ISO_8859_1'}, "ISO-8859-1"),
    put({This, 'UTF_8'}, "UTF-8"),
    put({This, 'UTF_16'}, "UTF-16"),
    put({This, 'UTF_16BE'}, "UTF-16BE"),
    put({This, 'UTF_16LE'}, "UTF-16LE"),
    ok.


getInstance() ->
        get({'CharacterSetData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

