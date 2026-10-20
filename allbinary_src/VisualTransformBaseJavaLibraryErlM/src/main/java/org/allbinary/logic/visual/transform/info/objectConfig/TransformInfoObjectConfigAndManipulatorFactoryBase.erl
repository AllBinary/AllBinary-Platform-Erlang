% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.logic.visual.transform.info.objectConfig
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document

-module('TransformInfoObjectConfigAndManipulatorFactoryBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInfoObjectConfigAndManipulatorFactoryInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface, ObjectConfigFileAbPath) ->
        erlang:error({'RuntimeException'});
% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface, Document) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getInstance(This, AbeClientInformation, TransformInfoInterface) ->
        erlang:error({'RuntimeException'}).


