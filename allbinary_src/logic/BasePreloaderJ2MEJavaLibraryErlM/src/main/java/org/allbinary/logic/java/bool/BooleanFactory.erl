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
% package org.allbinary.logic.java.bool

-module('BooleanFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BooleanFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'TRUE'}, true),
    put({This, 'FALSE'}, false),
    put({This, 'TRUE_STRING'}, (get({get({This, 'TRUE'}), '$class'})):toString(get({This, 'TRUE'}))),
    put({This, 'FALSE_STRING'}, (get({get({This, 'FALSE'}), '$class'})):toString(get({This, 'FALSE'}))),
    put({This, 'YES'}, "yes"),
    put({This, 'NO'}, "no"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'BooleanFactory', instance}).

toStringb(This, Bool) when is_boolean(Bool) ->
        try
        case Bool of
            true ->
            throw({'$return', get({This, 'TRUE_STRING'})});
            false ->
            throw({'$return', get({This, 'FALSE_STRING'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

