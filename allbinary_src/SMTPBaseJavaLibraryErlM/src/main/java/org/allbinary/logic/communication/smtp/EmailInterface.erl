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
% package org.allbinary.logic.communication.smtp
% import javax.mail.internet.MimeMessage
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface

-module('EmailInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('DomNodeInterface', Function, Arguments).


getDebugInfo(This) ->
    erlang:error({abstract_method, getDebugInfo}).

getMimeMessage(This) ->
    erlang:error({abstract_method, getMimeMessage}).

% throws Exception
log(This) ->
    erlang:error({abstract_method, log}).

