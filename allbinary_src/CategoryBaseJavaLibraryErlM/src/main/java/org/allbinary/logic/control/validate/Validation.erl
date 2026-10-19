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
% package org.allbinary.logic.control.validate
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('Validation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
isValid(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
toValidationInfoNode(This, Document) ->
        erlang:error({'RuntimeException'}).

% throws Exception
toValidationInfoDoc(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
validationInfo(This) ->
        erlang:error({'RuntimeException'}).

