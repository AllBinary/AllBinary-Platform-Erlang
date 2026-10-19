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
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigNoManipulationFactory

-module('TransformInfoHttpStoreNoManipulation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoHttpStore', Function, Arguments).

init_fields(This) ->
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PropertiesHashMap, PageContext),
    This.

init(This, PropertiesHashMap, PageContext) ->
        'TransformInfoHttpStore':init(This, PropertiesHashMap, PageContext).

% throws Exception
setObjectConfigFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        (get({This, '$class'})):setObjectConfigFileName(This, Value),
        (get({This, '$class'})):setObjectConfigInterface(This, (fun(Target_N65845) -> (get({Target_N65845, '$class'})):getInstance(Target_N65845, This, (get({This, '$class'})):getObjectConfigFilePath(This)) end)('TransformInfoObjectConfigNoManipulationFactory':getInstance())).

% throws Exception
setObjectConfig(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        erlang:error({'Exception', "Should not set from config"}).

