% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.logic.communication.log.config.type
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.string.CommonStrings

-module('LogConfigTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LogConfigTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NO_DESCRIPTION'}, "No Description"),
    put({This, 'AUTHENTICATION'}, 'LogConfigType':new("Authentication", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'AUTHENTICATIONERROR'}, 'LogConfigType':new("Authentication Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'CATEGORY'}, 'LogConfigType':new("Category", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'CATEGORYERROR'}, 'LogConfigType':new("Category Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'CRYPT'}, 'LogConfigType':new("Crypt", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'CRYPTERROR'}, 'LogConfigType':new("Crypt Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'EMAILLOGGING'}, 'LogConfigType':new("Email", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'EMAILLOGGINGERROR'}, 'LogConfigType':new("Email Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'ENTITYFACTORYERROR'}, 'LogConfigType':new("Entity Factory Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'NETBEANS_MODULE'}, 'LogConfigType':new("NetBeans Module", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'NETBEANS_MODULE_ERROR'}, 'LogConfigType':new("NetBeans Module Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'FACTORYERROR'}, 'LogConfigType':new("General Factory Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'FILE'}, 'LogConfigType':new("File", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'FILEERROR'}, 'LogConfigType':new("File Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'HTTP'}, 'LogConfigType':new("HTTP", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'HTTPERROR'}, 'LogConfigType':new("HTTP Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'HTTPREQUEST'}, 'LogConfigType':new("Http Request", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'HTTPREQUESTERROR'}, 'LogConfigType':new("Http Request Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'IDLOGGING'}, 'LogConfigType':new("ID Logging", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'JSPEXTRAOUTPUT'}, 'LogConfigType':new("JSP Extra Output", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'JSPTAGEXTRAOUTPUT'}, 'LogConfigType':new("JSP Tag Extra Output", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'JSPTAG'}, 'LogConfigType':new("JSP Tag", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'JSPTAGERROR'}, 'LogConfigType':new("JSP Tag Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'LICENSING'}, 'LogConfigType':new("Licensing", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'LICENSINGERROR'}, 'LogConfigType':new("Licensing Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'LOADER'}, 'LogConfigType':new("Loader", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'LOADERERROR'}, 'LogConfigType':new("Loader Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'OS'}, 'LogConfigType':new("OS", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'OSERROR'}, 'LogConfigType':new("OS Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'PAYMENT'}, 'LogConfigType':new("Payment", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'PAYMENTERROR'}, 'LogConfigType':new("Payment Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'PRELOADER'}, 'LogConfigType':new("PreLoader", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'PRELOADERERROR'}, 'LogConfigType':new("PreLoader Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'PRODUCTSEARCHLOGGING'}, 'LogConfigType':new("Product Search Logging", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'PRODUCTSEARCHLOGGINGERROR'}, 'LogConfigType':new("Product Search Logging Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SERVLET'}, 'LogConfigType':new("Servlet", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SERVLETERROR'}, 'LogConfigType':new("Servlet Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SHIPPINGERROR'}, 'LogConfigType':new("Shipping Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SQLLOGGINGERROR'}, 'LogConfigType':new("SQL Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SQLLOGGING'}, 'LogConfigType':new("SQL Logging", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SQLTAGS'}, 'LogConfigType':new("SQL Tag Logging", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SQLTAGSERROR'}, 'LogConfigType':new("SQL Tag Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'STYLE'}, 'LogConfigType':new("Style", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'STYLEERROR'}, 'LogConfigType':new("Style Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'TAGHELPER'}, 'LogConfigType':new("Tag Helper", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'TAGHELPERERROR'}, 'LogConfigType':new("Tag Helper Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'TAGHELPERFACTORY'}, 'LogConfigType':new("Tag Helper Factory", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'TAGHELPERFACTORYERROR'}, 'LogConfigType':new("Tag Helper Factory Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'TAX'}, 'LogConfigType':new("Tax", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'TAXERROR'}, 'LogConfigType':new("Tax Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'VALIDATION'}, 'LogConfigType':new("Validation", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'VALIDATIONERROR'}, 'LogConfigType':new("Validation Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'VIEW'}, 'LogConfigType':new("View", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'VIEWERROR'}, 'LogConfigType':new("View Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'VIEWFACTORYERROR'}, 'LogConfigType':new("View Factory Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'WORKFLOW'}, 'LogConfigType':new("Workflow", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'WORKFLOWERROR'}, 'LogConfigType':new("Workflow Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'XMLLOGGING'}, 'LogConfigType':new("XML Logging", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'XMLLOGGINGERROR'}, 'LogConfigType':new("XML Logging Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'XSLLOGGING'}, 'LogConfigType':new("XSL Logging", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'XSLLOGGINGERROR'}, 'LogConfigType':new("XSL Logging Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'REPLACE'}, 'LogConfigType':new("Replace", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'REPLACE_INFO'}, 'LogConfigType':new("Replace Info", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'REPLACEERROR'}, 'LogConfigType':new("Replace Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SQLLOGGINGPOOL'}, 'LogConfigType':new("SQL Pool", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'SQLLOGGINGPOOLERROR'}, 'LogConfigType':new("SQL Pool Error", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'STATICPAGEGENERATIONLOGGING'}, 'LogConfigType':new("Static Page Generation Logging", get({This, 'NO_DESCRIPTION'}))),
    put({This, 'STATICPAGEGENERATIONLOGGINGERROR'}, 'LogConfigType':new("Static Page Generation Logging Error", get({This, 'NO_DESCRIPTION'}))),
    ok.


getInstance() ->
        get({'LogConfigTypeFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        'PreLogUtil':put("FreeBlisket", This, get({'CommonStrings':getInstance(), 'CONSTRUCTOR'})).

