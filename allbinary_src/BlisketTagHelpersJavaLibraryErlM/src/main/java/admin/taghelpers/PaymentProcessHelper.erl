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
% package admin.taghelpers
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpFactory
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import views.admin.payment.PaymentProcessorComponent

-module('PaymentProcessHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, paymentProcessorComponent}, undefined),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PropertiesHashMap, PageContext),
    This.

'$init'(This, PropertiesHashMap, PageContext) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        TransformInfoInterface = 'TransformInfoHttpFactory':getInstance(PropertiesHashMap, PageContext),
        put({This, paymentProcessorComponent}, 'PaymentProcessorComponent':new(TransformInfoInterface)).

% throws Exception
process(This) ->
        (get({get({This, paymentProcessorComponent}), '$class'})):view(get({This, paymentProcessorComponent})).

