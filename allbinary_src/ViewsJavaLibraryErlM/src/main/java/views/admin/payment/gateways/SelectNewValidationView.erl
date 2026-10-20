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
% package views.admin.payment.gateways
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('SelectNewValidationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface).

isValid(This) ->
        true.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
validationInfo(This) ->
        erlang:error({'Exception', "validationInfo"}).

toXmlDoc(This) ->
        undefined.

toXmlNode(This, Document) ->
        undefined.

% throws Exception
view(This) ->
        (fun(Target_N66147) -> (get({Target_N66147, '$class'})):view(Target_N66147) end)('SelectNewView':new((get({This, '$class'})):getTransformInfoInterface(This))).

