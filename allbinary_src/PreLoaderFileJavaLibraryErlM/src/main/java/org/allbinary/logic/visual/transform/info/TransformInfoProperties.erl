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

-module('TransformInfoProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, name}, undefined),
    put({This, label}, undefined),
    put({This, description}, undefined),
    put({This, objectFileName}, undefined),
    put({This, objectConfigFileName}, undefined),
    put({This, templateFileName}, undefined),
    ok.


new(Name, Label, Description, ObjectFileName, ObjectConfigFileName, TemplateFileName) when (is_list(Name) orelse Name =:= undefined), (is_list(Label) orelse Label =:= undefined), (is_list(Description) orelse Description =:= undefined), (is_list(ObjectFileName) orelse ObjectFileName =:= undefined), (is_list(ObjectConfigFileName) orelse ObjectConfigFileName =:= undefined), (is_list(TemplateFileName) orelse TemplateFileName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, Label, Description, ObjectFileName, ObjectConfigFileName, TemplateFileName),
    This.

'$init'(This, Name, Label, Description, ObjectFileName, ObjectConfigFileName, TemplateFileName) when (is_list(Name) orelse Name =:= undefined), (is_list(Label) orelse Label =:= undefined), (is_list(Description) orelse Description =:= undefined), (is_list(ObjectFileName) orelse ObjectFileName =:= undefined), (is_list(ObjectConfigFileName) orelse ObjectConfigFileName =:= undefined), (is_list(TemplateFileName) orelse TemplateFileName =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, label}, Label),
        put({This, description}, Description),
        put({This, objectFileName}, ObjectFileName),
        put({This, templateFileName}, TemplateFileName),
        put({This, objectConfigFileName}, ObjectConfigFileName).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value).

setDescription(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, description}, Value).

setViewFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectFileName}, Value).

setTemplateFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, templateFileName}, Value).

setObjectConfigFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, objectConfigFileName}, Value).

getName(This) ->
        get({This, name}).

getLabel(This) ->
        get({This, label}).

getDescription(This) ->
        get({This, description}).

getViewFile(This) ->
        get({This, objectFileName}).

getTemplateFile(This) ->
        get({This, templateFileName}).

getObjectConfigFile(This) ->
        get({This, objectConfigFileName}).

