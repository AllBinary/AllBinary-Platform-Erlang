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
% package org.allbinary.logic.system.os.android
% import android.content.Context
% import android.os.Build
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('AndroidSystemProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'AndroidSystemProperties':new((fun(Target_N65762) -> (get({Target_N65762, '$class'})):getContext(Target_N65762) end)('ResourceUtil':getInstance()))),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


getInstance() ->
        get({'AndroidSystemProperties', 'SINGLETON'}).

new(Context) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Context),
    This.

'$init'(This, Context) ->
    init_fields(This),
        ok.

getDeviceId(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

getDeviceSoftwareVersion(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getLine1Number(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getNetworkCountryIso(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getNetworkOperator(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getNetworkOperatorName(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getSimCountryIso(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getSimOperator(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getSimOperatorName(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getSimSerialNumber(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getSubscriberId(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getVoiceMailAlphaTag(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getVoiceMailNumber(This) ->
        get({get({This, commonStrings}), 'DISABLE'}).

getNetworkType(This) ->
        (-1).

getPhoneType(This) ->
        (-1).

getBoard(This) ->
        get({'Build', 'BOARD'}).

getBrand(This) ->
        get({'Build', 'BRAND'}).

getDevice(This) ->
        get({'Build', 'DEVICE'}).

getFingerprint(This) ->
        get({'Build', 'FINGERPRINT'}).

getHost(This) ->
        get({'Build', 'HOST'}).

getId(This) ->
        get({'Build', 'ID'}).

getModel(This) ->
        get({'Build', 'MODEL'}).

getProduct(This) ->
        get({'Build', 'PRODUCT'}).

getTags(This) ->
        get({'Build', 'TAGS'}).

getTime(This) ->
        get({'Build', 'TIME'}).

getType(This) ->
        get({'Build', 'TYPE'}).

getUser(This) ->
        get({'Build', 'USER'}).

