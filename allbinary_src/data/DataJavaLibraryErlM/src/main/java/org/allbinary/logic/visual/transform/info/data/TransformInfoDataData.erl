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
% package org.allbinary.logic.visual.transform.info.data
% import org.allbinary.logic.io.file.CommonDataFileStrings

-module('TransformInfoDataData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformInfoDataData':new()),
    ok.

init_fields(This) ->
    put({This, 'UNCRYPTED_EXTENSION'}, get({'CommonDataFileStrings':getInstance(), 'UNCRYPTED_EXTENSION'})),
    put({This, 'ENCRYPTED_EXTENSION'}, get({'CommonDataFileStrings':getInstance(), 'ENCRYPTED_EXTENSION'})),
    ok.


getInstance() ->
        get({'TransformInfoDataData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

