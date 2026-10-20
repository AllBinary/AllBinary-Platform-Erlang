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
% package org.allbinary.globals

-module('GLOBALS2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'GETCURRENTLOCATION'}, "Get Current Location"),
    put({?MODULE, 'GETCURRENTHOMELOCATION'}, "Get Current Home Location"),
    put({?MODULE, 'GENERATEALLSTORES'}, "Generate All Stores"),
    put({?MODULE, 'LICENSEAGREEMENT'}, "License Agreement"),
    put({?MODULE, 'CREATEDATABASES'}, "Create Databases"),
    put({?MODULE, 'VIEWNAME'}, "VIEW_NAME"),
    put({?MODULE, 'SETSHIPPINGTYPE'}, "Set Shipping Type"),
    put({?MODULE, 'VIEWSUMMARY'}, "View Summary"),
    put({?MODULE, 'SET'}, "Set"),
    put({?MODULE, 'SELECT'}, "Select"),
    put({?MODULE, 'SELECTNEW'}, "Select New"),
    put({?MODULE, 'SELECTEXISTING'}, "Select Existing"),
    put({?MODULE, 'PROCESS'}, "Process"),
    put({?MODULE, 'LOGINSUCCESS'}, "Login Successful"),
    put({?MODULE, 'LOGINFAILED'}, "Login Failed"),
    put({?MODULE, 'NONE'}, "None"),
    put({?MODULE, 'TOP'}, "Top"),
    put({?MODULE, 'LEFT'}, "Left"),
    put({?MODULE, 'RIGHT'}, "Right"),
    put({?MODULE, 'BACK'}, "Back"),
    put({?MODULE, 'BOTTOM'}, "Bottom"),
    put({?MODULE, 'FRONT'}, "Front"),
    put({?MODULE, 'AUTHORIZE'}, "Authorize"),
    put({?MODULE, 'AUTHORIZEANDEVALBODY'}, "Authorize AND EVAL BODY"),
    put({?MODULE, 'AUTHORIZEANDEVALBODYONERROR'}, "Authorize AND EVAL BODY On Error"),
    put({?MODULE, 'AUTHORIZEORDEREVALBODYONERROR'}, "Authorize Order Eval On Error"),
    put({?MODULE, 'AUTHORIZEFORMEVALBODYONERROR'}, "Authorize Form Eval On Error"),
    put({?MODULE, 'AUTHORIZEORDERANDSKIPBODY'}, "Authorize Order Skip"),
    put({?MODULE, 'AUTHORIZEORDERANDEVALBODY'}, "Authorize Order Eval"),
    put({?MODULE, 'EDITPRICING'}, "Edit Pricing"),
    put({?MODULE, 'UPDATEPRICING'}, "Update Pricing"),
    put({?MODULE, 'SETPAYMENTMETHOD'}, "Set Payment Method"),
    put({?MODULE, 'BACKUP'}, "Backup"),
    put({?MODULE, 'RESTORE'}, "Restore"),
    put({?MODULE, 'SUMMARY'}, "Summary"),
    put({?MODULE, 'DESCRIPTION'}, "Description"),
    put({?MODULE, 'IMG'}, "img"),
    put({?MODULE, 'HREF'}, "href"),
    put({?MODULE, 'KEYWORD'}, "keyword"),
    put({?MODULE, 'TYPE'}, "TYPE"),
    put({?MODULE, 'DATA'}, "DATA"),
    put({?MODULE, 'NUM'}, "NUM"),
    put({?MODULE, 'PRICE'}, "PRICE"),
    put({?MODULE, 'REGISTER'}, "Register"),
    put({?MODULE, 'CHECKOUT'}, "Checkout"),
    put({?MODULE, 'ADMINCOMMAND'}, "AdminCommand"),
    put({?MODULE, 'PROCESSBODYIFNOTAUTHENTICATED'}, "Not Authenticated"),
    put({?MODULE, 'PROCESSBODYIFAUTHENTICATED'}, "Authenticated"),
    put({?MODULE, 'PROCESSTRANSACTION'}, "Process Transaction"),
    put({?MODULE, 'NEWPASSWORD'}, "New Password"),
    put({?MODULE, 'CHANGEPASSWORD'}, "Change Password"),
    put({?MODULE, 'JDBCDRIVER'}, "Jdbc Driver"),
    put({?MODULE, 'WEBAPPPATH'}, "Webapp Path"),
    put({?MODULE, 'AMOUNTVALUE'}, "Amount Value"),
    put({?MODULE, 'GETORDERIDFROMSESSION'}, "Get Order Id From Session"),
    put({?MODULE, 'SETUPPAYMENTMETHODS'}, "Setup Payment Methods"),
    put({?MODULE, 'CANCELSTOREFRONT'}, "Cancel Store Front"),
    put({?MODULE, 'ADJUST'}, "Adjust"),
    put({?MODULE, 'ISASUBSET'}, "Is a Subset"),
    put({?MODULE, 'NOTASUBSET'}, "Not a Subset"),
    put({?MODULE, 'GENERATE'}, "Generate"),
    put({?MODULE, 'VIEW'}, "View"),
    put({?MODULE, 'EDIT'}, "Edit"),
    put({?MODULE, 'NEW'}, "New"),
    put({?MODULE, 'SEARCH'}, "Search"),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


