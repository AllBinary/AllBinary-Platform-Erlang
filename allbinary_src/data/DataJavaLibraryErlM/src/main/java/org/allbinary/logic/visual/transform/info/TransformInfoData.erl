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

-module('TransformInfoData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TransformInfoData':new()),
    ok.

init_fields(This) ->
    put({This, 'PARENT'}, "TRANSFORM_INFO_PARENT"),
    put({This, 'MAPPED'}, "TRANSFORM_INFO_MAPPED"),
    put({This, 'NAME'}, "TRANSFORM_INFO_NAME"),
    put({This, 'DESCRIPTION'}, "TRANSFORM_INFO_DESCRIPTION"),
    put({This, 'CATEGORY'}, "TRANSFORM_INFO_CATEGORY"),
    put({This, 'OBJECTFILENAME'}, "TRANSFORM_INFO_OBJECTFILENAME"),
    put({This, 'OBJECT'}, "TRANSFORM_INFO_OBJECT"),
    put({This, 'OBJECTCONFIGFILENAME'}, "TRANSFORM_INFO_OBJECTCONFIGFILENAME"),
    put({This, 'OBJECTCONFIG'}, "TRANSFORM_INFO_OBJECTCONFIG"),
    put({This, 'TEMPLATEFILENAME'}, "TRANSFORM_INFO_TEMPLATEFILENAME"),
    put({This, 'TEMPLATE'}, "TRANSFORM_INFO_TEMPLATE"),
    put({This, 'DATAFILENAME'}, "TRANSFORM_INFO_DATAFILENAME"),
    put({This, 'DATA'}, "TRANSFORM_INFO_DATA"),
    put({This, 'LABEL'}, "TRANSFORM_INFO_LABEL"),
    put({This, 'OWNER'}, lists:concat(["OWNER_", get({This, 'NAME'})])),
    put({This, 'PARTIAL'}, lists:concat(["PARTIAL_", get({This, 'NAME'})])),
    ok.


getInstance() ->
        get({'TransformInfoData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

