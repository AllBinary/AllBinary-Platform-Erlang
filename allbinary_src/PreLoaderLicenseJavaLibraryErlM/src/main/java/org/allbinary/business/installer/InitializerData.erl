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
% package org.allbinary.business.installer
% import org.allbinary.logic.string.StringMaker

-module('InitializerData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InitializerData':new()),
    ok.

init_fields(This) ->
    put({This, 'DBUSER'}, "DBUSER"),
    put({This, 'DBPASSWORD'}, "DBPASSWORD"),
    put({This, 'ADMINJDBCDRIVER'}, "ADMIN_JDBCDRIVER"),
    put({This, 'ADMINSCHEMA'}, "ADMINSCHEMA"),
    put({This, 'ADMINSERVER'}, "ADMINSERVER"),
    put({This, 'ADMINPORT'}, "ADMINPORT"),
    put({This, 'CUSTOMERJDBCDRIVER'}, "CUSTOMER_JDBCDRIVER"),
    put({This, 'CUSTOMERNAME'}, "CUSTOMERNAME"),
    put({This, 'CUSTOMERUSERNAME'}, "CUSTOMERUSERNAME"),
    put({This, 'CUSTOMERPASSWORD'}, "CUSTOMERPASSWORD"),
    put({This, 'CUSTOMERSCHEMA'}, "CUSTOMERSCHEMA"),
    put({This, 'CUSTOMERSERVER'}, "CUSTOMERSERVER"),
    put({This, 'CUSTOMERPORT'}, "CUSTOMERPORT"),
    put({This, 'HISTORYJDBCDRIVER'}, "HISTORY_JDBCDRIVER"),
    put({This, 'HISTORYNAME'}, "HISTORYNAME"),
    put({This, 'HISTORYUSERNAME'}, "HISTORYUSERNAME"),
    put({This, 'HISTORYPASSWORD'}, "HISTORYPASSWORD"),
    put({This, 'HISTORYSCHEMA'}, "HISTORYSCHEMA"),
    put({This, 'HISTORYSERVER'}, "HISTORYSERVER"),
    put({This, 'HISTORYPORT'}, "HISTORYPORT"),
    put({This, 'LOGJDBCDRIVER'}, "LOG_JDBCDRIVER"),
    put({This, 'LOGNAME'}, "LOGNAME"),
    put({This, 'LOGUSERNAME'}, "LOGUSERNAME"),
    put({This, 'LOGPASSWORD'}, "LOGPASSWORD"),
    put({This, 'LOGSCHEMA'}, "LOGSCHEMA"),
    put({This, 'LOGSERVER'}, "LOGSERVER"),
    put({This, 'LOGPORT'}, "LOGPORT"),
    put({This, 'INVENTORYJDBCDRIVER'}, "INVENTORY_JDBCDRIVER"),
    put({This, 'INVENTORYNAME'}, "INVENTORYNAME"),
    put({This, 'INVENTORYUSERNAME'}, "INVENTORYUSERNAME"),
    put({This, 'INVENTORYPASSWORD'}, "INVENTORYPASSWORD"),
    put({This, 'INVENTORYSCHEMA'}, "INVENTORYSCHEMA"),
    put({This, 'INVENTORYSERVER'}, "INVENTORYSERVER"),
    put({This, 'INVENTORYPORT'}, "INVENTORYPORT"),
    put({This, 'STATICPAGESJDBCDRIVER'}, "STATICPAGES_JDBCDRIVER"),
    put({This, 'STATICPAGESNAME'}, "STATICPAGESNAME"),
    put({This, 'STATICPAGESUSERNAME'}, "STATICPAGESUSERNAME"),
    put({This, 'STATICPAGESPASSWORD'}, "STATICPAGESPASSWORD"),
    put({This, 'STATICPAGESSCHEMA'}, "STATICPAGESSCHEMA"),
    put({This, 'STATICPAGESSERVER'}, "STATICPAGESSERVER"),
    put({This, 'STATICPAGESPORT'}, "STATICPAGESPORT"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'InitializerData', instance}).

getJdbcDriverSolutionInfo(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "The following describes the possible problems and solutions regarding the Jdbc Driver error(s):<p/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "1. A JDBC driver you specified is not in your classpath.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution 1: Move the JDBC driver into any directory specified in the existing classpath. <br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution 2: Add the directory that contains the JDBC driver to the classpath.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution 3: Add the JDBC driver to the WEB-INF/lib directory where you installed this webapp.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "2. The JDBC driver you specified does not exit.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution: Get a JDBC driver. <br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "3. The JDBC driver you specified is not valid.<br/>"),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Solution: Use a valid JDBC driver.<p/>"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

