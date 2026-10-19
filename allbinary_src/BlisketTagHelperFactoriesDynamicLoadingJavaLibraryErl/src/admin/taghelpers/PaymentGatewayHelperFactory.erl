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
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('PaymentGatewayHelperFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements TagHelperFactoryInterface

static_init() ->
    put({?MODULE, 'CLASSNAME'}, "admin.taghelpers.PaymentGatewayHelper"),
    put({?MODULE, 'FACTORYNAME'}, "PaymentGatewayFactory"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws LicensingException
getInstance(This, HashMap, PageContext) ->
        'HelperFactory':getInstance(get({'PaymentGatewayHelperFactory', 'FACTORYNAME'}), get({'PaymentGatewayHelperFactory', 'CLASSNAME'}), HashMap, PageContext).

