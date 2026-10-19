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
% package org.allbinary.logic.visual.dhtml.html.head.meta

-module('HtmlMetaAttributeDataFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HtmlMetaAttributeDataFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NAME'}, 'HtmlMetaAttributeData':new(0, "HTMLMETA_ATTRIBUTE_NAME")),
    put({This, 'HTTP_EQUIV'}, 'HtmlMetaAttributeData':new(1, "HTMLMETA_ATTRIBUTE_HTTPEQUIV")),
    put({This, 'CONTENT'}, 'HtmlMetaAttributeData':new(2, "HTMLMETA_ATTRIBUTE_CONTENT")),
    ok.


getInstance() ->
        get({'HtmlMetaAttributeDataFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

