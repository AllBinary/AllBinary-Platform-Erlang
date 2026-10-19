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

-module('HtmlMetaAttributeData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, id}, 0),
    put({This, name}, undefined),
    ok.


new(Id, Value) when is_integer(Id), (is_list(Value) orelse Value =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Id, Value),
    This.

init(This, Id, Value) when is_integer(Id), (is_list(Value) orelse Value =:= undefined) ->
    init_fields(This),
        put({This, name}, Value),
        put({This, id}, Id).

equals(This, HtmlMetaAttributeData) ->
        try
        case (get({HtmlMetaAttributeData, id}) =:= get({This, id})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        get({This, name}).

