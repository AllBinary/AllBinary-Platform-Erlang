%
% AllBinary Open License Version 1
% Copyright (c) 2009 AllBinary
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
% package org.allbinary.android.input.motion

-module('GameInputMotionInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'MAX_API'}, 0),
    put({This, 'MAX_POINTERS'}, 0),
    ok.


new(MaxApi, MaxPointers) when is_integer(MaxApi), is_integer(MaxPointers) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, MaxApi, MaxPointers),
    This.

init(This, MaxApi, MaxPointers) when is_integer(MaxApi), is_integer(MaxPointers) ->
    init_fields(This),
        put({This, 'MAX_API'}, MaxApi),
        put({This, 'MAX_POINTERS'}, MaxPointers).

