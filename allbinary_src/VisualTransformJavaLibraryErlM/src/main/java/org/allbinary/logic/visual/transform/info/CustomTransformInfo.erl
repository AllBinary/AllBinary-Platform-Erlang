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

-module('CustomTransformInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInfoInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfo', Function, Arguments).

init_fields(This) ->
    ok.


new(OutputTypeName, InputOutputTypeName, InputOutputTypeFile, Name, ObjectFileName, ObjectConfigFileName, TemplateFileName, DataFileName) when (is_list(OutputTypeName) orelse OutputTypeName =:= undefined), (is_list(InputOutputTypeName) orelse InputOutputTypeName =:= undefined), (is_list(InputOutputTypeFile) orelse InputOutputTypeFile =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(ObjectFileName) orelse ObjectFileName =:= undefined), (is_list(ObjectConfigFileName) orelse ObjectConfigFileName =:= undefined), (is_list(TemplateFileName) orelse TemplateFileName =:= undefined), (is_list(DataFileName) orelse DataFileName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OutputTypeName, InputOutputTypeName, InputOutputTypeFile, Name, ObjectFileName, ObjectConfigFileName, TemplateFileName, DataFileName),
    This.

init(This, OutputTypeName, InputOutputTypeName, InputOutputTypeFile, Name, ObjectFileName, ObjectConfigFileName, TemplateFileName, DataFileName) when (is_list(OutputTypeName) orelse OutputTypeName =:= undefined), (is_list(InputOutputTypeName) orelse InputOutputTypeName =:= undefined), (is_list(InputOutputTypeFile) orelse InputOutputTypeFile =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(ObjectFileName) orelse ObjectFileName =:= undefined), (is_list(ObjectConfigFileName) orelse ObjectConfigFileName =:= undefined), (is_list(TemplateFileName) orelse TemplateFileName =:= undefined), (is_list(DataFileName) orelse DataFileName =:= undefined) ->
    'TransformInfo':init(This),
    init_fields(This),
        ok.

