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
% package org.allbinary.business.user.commerce.money.payment.types

-module('AuthorizationTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AuthorizationTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NONE'}, 'AuthorizationType':new("None")),
    put({This, 'VOICE'}, 'AuthorizationType':new("Voice")),
    put({This, 'RETINAL'}, 'AuthorizationType':new("Retinal")),
    put({This, 'IMAGE'}, 'AuthorizationType':new("Image")),
    put({This, 'DNA'}, 'AuthorizationType':new("DNA")),
    put({This, 'PRINT'}, 'AuthorizationType':new("Print")),
    put({This, 'CHIP'}, 'AuthorizationType':new("Chip")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AuthorizationTypeFactory', instance}).

