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
% package org.allbinary.logic
% import jsinterop.annotations.JsType

-module('NullUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'NullUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'NULL_OBJECT'}, 'Any':new()),
    put({This, 'NULL_CLASS'}, get({get({This, 'NULL_OBJECT'}), '$class'})),
    put({This, 'NULL_OBJECT_ARRAY'}, array:new(0, {default, undefined})),
    put({This, 'NULL_CHAR_ARRAY'}, array:new(0, {default, 0})),
    put({This, 'NULL_BYTE_ARRAY'}, array:new(0, {default, 0})),
    put({This, 'NULL_SHORT_ARRAY_ARRAY'}, array:new(0, {default, array:new(0, {default, 0})})),
    put({This, 'NULL_INT_ARRAY'}, array:new(0, {default, 0})),
    put({This, 'NULL_INT_ARRAY_ARRAY'}, array:new(0, {default, array:new(0, {default, 0})})),
    put({This, 'NULL_INT_ARRAY_ARRAY_ARRAY'}, ok % Otherwise - newArray - 3
),
    put({This, 'NULL_FLOAT_ARRAY'}, array:new(0, {default, 0.0})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'NullUtil', instance}).

