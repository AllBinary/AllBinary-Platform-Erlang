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
% package org.allbinary.logic.visual.transform.info

-module('TransformInfosData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformInfosData':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, "TRANSFORM_INFOS_NAME"),
    put({This, 'GROUP'}, "TRANSFORM_INFOS_GROUP"),
    put({This, 'ALL'}, "TRANSFORM_INFOS_ALL"),
    put({This, 'PREVIEW'}, "TRANSFORM_INFOS_PREVIEW"),
    put({This, 'SMALL_PREVIEW'}, "TRANSFORM_INFOS_SMALL_PREVIEW"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance() ->
        get({'TransformInfosData', instance}).

