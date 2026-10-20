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
% package org.allbinary.business.context.modules.storefront

-module('StoreFrontData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StoreFrontData':new()),
    ok.

init_fields(This) ->
    put({This, 'CANCEL'}, "Cancel Store Front"),
    put({This, 'SELECT'}, "Select Store Front"),
    put({This, 'INSTALL'}, "Install Store Front"),
    put({This, 'INSTALL_COMPLETE'}, "Install Store Front Complete"),
    put({This, 'NAME'}, "STOREFRONT_NAME"),
    put({This, 'CURRENTHOSTNAME'}, "STOREFRONT_CURRENTHOSTNAME"),
    put({This, 'CURRENTHOSTNAMEPATH'}, "STOREFRONT_CURRENTHOSTNAMEPATH"),
    put({This, 'CURRENTHOMEHOSTNAME'}, "STOREFRONT_CURRENTHOMEHOSTNAME"),
    put({This, 'CURRENTHOMEHOSTNAMEPATH'}, "STOREFRONT_CURRENTHOMEHOSTNAMEPATH"),
    put({This, 'HOMEHOSTNAME'}, "STOREFRONT_HOMEHOSTNAME"),
    put({This, 'HOMEHOSTNAMEPATH'}, "STOREFRONT_HOMEHOSTNAMEPATH"),
    put({This, 'HOSTNAME'}, "STOREFRONT_HOSTNAME"),
    put({This, 'HOSTNAMEPATH'}, "STOREFRONT_HOSTNAMEPATH"),
    put({This, 'TESTHOMEHOSTNAME'}, "STOREFRONT_TESTHOMEHOSTNAME"),
    put({This, 'TESTHOMEHOSTNAMEPATH'}, "STOREFRONT_TESTHOMEHOSTNAMEPATH"),
    put({This, 'TESTHOSTNAME'}, "STOREFRONT_TESTHOSTNAME"),
    put({This, 'TESTHOSTNAMEPATH'}, "STOREFRONT_TESTHOSTNAMEPATH"),
    put({This, 'IMAGEPATH'}, "STOREFRONT_IMAGEPATH"),
    put({This, 'STATICPATH'}, "STOREFRONT_STATICPATH"),
    put({This, 'CATEGORYPATH'}, "STOREFRONT_CATEGORYPATH"),
    put({This, 'INVENTORYCONTROL'}, "STOREFRONT_INVENTORYCONTROL"),
    put({This, 'CONFIGURATION'}, "STOREFRONT_CONFIGURATION"),
    put({This, 'SUBSTORES'}, "STOREFRONT_SUBSTORES"),
    put({This, 'TAGLOCATION'}, "STOREFRONT_TAGLOCATION"),
    put({This, 'PACKAGELOCATION'}, "STOREFRONT_PACKAGELOCATION"),
    put({This, 'FTP'}, "STOREFRONT_FTP"),
    put({This, 'FTPPATH'}, "STOREFRONT_FTPPATH"),
    put({This, 'FTPUSERNAME'}, "STOREFRONT_FTPUSERNAME"),
    put({This, 'FTPPASSWORD'}, "STOREFRONT_FTPPASSWORD"),
    put({This, 'TESTFTP'}, "STOREFRONT_TESTFTP"),
    put({This, 'TESTFTPPATH'}, "STOREFRONT_TESTFTPPATH"),
    put({This, 'TESTFTPUSERNAME'}, "STOREFRONT_TESTFTPUSERNAME"),
    put({This, 'TESTFTPPASSWORD'}, "STOREFRONT_TESTFTPPASSWORD"),
    put({This, 'SELECTSTORENAME'}, "STOREFRONT_SELECTSTORENAME"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'StoreFrontData', instance}).

