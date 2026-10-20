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
% package org.allbinary.business.context.modules.storefronts
% import java.util.HashMap
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.UserData
% import org.allbinary.logic.string.tokens.Tokenizer
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicStoreFront').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BasicStoreFrontInterface

init_fields(This) ->
    put({This, name}, undefined),
    put({This, userName}, undefined),
    put({This, basketName}, undefined),
    put({This, homeHostName}, undefined),
    put({This, homeHostNamePath}, undefined),
    put({This, hostName}, undefined),
    put({This, hostNamePath}, undefined),
    put({This, testHomeHostName}, undefined),
    put({This, testHomeHostNamePath}, undefined),
    put({This, testHostName}, undefined),
    put({This, testHostNamePath}, undefined),
    put({This, imagePath}, undefined),
    put({This, staticPath}, undefined),
    put({This, categoryPath}, undefined),
    put({This, inventoryControl}, undefined),
    put({This, subStores}, undefined),
    put({This, tagLocation}, undefined),
    put({This, packageLocation}, undefined),
    put({This, ftp}, undefined),
    put({This, ftpPath}, undefined),
    put({This, ftpUserName}, undefined),
    put({This, ftpPassword}, undefined),
    put({This, testFtp}, undefined),
    put({This, testFtpPath}, undefined),
    put({This, testFtpUserName}, undefined),
    put({This, testFtpPassword}, undefined),
    put({This, timeCreated}, undefined),
    put({This, lastModified}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

new(StoreHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreHashMap),
    This.

'$init'(This, StoreHashMap) ->
    init_fields(This),
        StoreFrontData = 'StoreFrontData':getInstance(),
        put({This, name}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'NAME'}))),
        put({This, userName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({'UserData', 'USERNAME'}))),
        put({This, basketName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'NAME'}))),
        put({This, homeHostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'HOMEHOSTNAME'}))),
        put({This, homeHostNamePath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'HOMEHOSTNAMEPATH'}))),
        put({This, hostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'HOSTNAME'}))),
        put({This, hostNamePath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'HOSTNAMEPATH'}))),
        put({This, testHomeHostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTHOMEHOSTNAME'}))),
        put({This, testHomeHostNamePath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTHOMEHOSTNAMEPATH'}))),
        put({This, testHostName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTHOSTNAME'}))),
        put({This, testHostNamePath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTHOSTNAMEPATH'}))),
        put({This, imagePath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'IMAGEPATH'}))),
        put({This, staticPath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'STATICPATH'}))),
        put({This, categoryPath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'CATEGORYPATH'}))),
        put({This, inventoryControl}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'INVENTORYCONTROL'}))),
        put({This, subStores}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'SUBSTORES'}))),
        put({This, tagLocation}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TAGLOCATION'}))),
        put({This, packageLocation}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'PACKAGELOCATION'}))),
        put({This, ftp}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'FTP'}))),
        put({This, ftpPath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'FTPPATH'}))),
        put({This, ftpUserName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'FTPUSERNAME'}))),
        put({This, ftpPassword}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'FTPPASSWORD'}))),
        put({This, testFtp}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTFTP'}))),
        put({This, testFtpPath}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTFTPPATH'}))),
        put({This, testFtpUserName}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTFTPUSERNAME'}))),
        put({This, testFtpPassword}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({StoreFrontData, 'TESTFTPPASSWORD'}))),
        put({This, timeCreated}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({'EntryData':getInstance(), 'TIMECREATED'}))),
        put({This, lastModified}, (get({StoreHashMap, '$class'})):get(StoreHashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'}))).

getTestHtmlPath(This) ->
        ((get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):getTestHtmlPath(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) + (get({This, '$class'})):getCurrentHostNamePath(This)).

getCurrentHostName(This) ->
        put({local, location}, undefined),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHostName(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHostName(This))
        end,
        get({local, location}).

getCurrentHostNamePath(This) ->
        put({local, location}, undefined),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHostNamePath(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHostNamePath(This))
        end,
        get({local, location}).

getCurrentHomeHostName(This) ->
        put({local, location}, undefined),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHomeHostName(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHomeHostName(This))
        end,
        get({local, location}).

getCurrentHomeHostNamePath(This) ->
        put({local, location}, undefined),
        case (get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):isTestingMode(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) of
            true ->
            put({local, location}, (get({This, '$class'})):getTestHomeHostNamePath(This));
            false ->
            put({local, location}, (get({This, '$class'})):getHomeHostNamePath(This))
        end,
        get({local, location}).

getName(This) ->
        get({This, name}).

getUserName(This) ->
        get({This, userName}).

getBasketName(This) ->
        get({This, basketName}).

getHomeHostName(This) ->
        get({This, homeHostName}).

getHomeHostNamePath(This) ->
        get({This, homeHostNamePath}).

getHostName(This) ->
        get({This, hostName}).

getHostNamePath(This) ->
        get({This, hostNamePath}).

getTestHomeHostName(This) ->
        get({This, testHomeHostName}).

getTestHomeHostNamePath(This) ->
        get({This, testHomeHostNamePath}).

getTestHostName(This) ->
        get({This, testHostName}).

getTestHostNamePath(This) ->
        get({This, testHostNamePath}).

getStaticPath(This) ->
        get({This, staticPath}).

getCategoryPath(This) ->
        get({This, categoryPath}).

getInventoryControl(This) ->
        get({This, inventoryControl}).

% throws Exception
getSubStores(This) ->
        try
            Tokenizer = 'Tokenizer':new(get({'CommonSeps':getInstance(), 'SEMICOLON'})),
            SubStoreVector = (get({Tokenizer, '$class'})):getTokensFromString(Tokenizer, get({This, subStores}), 'BasicArrayListD':new()),
            SubStoreVector
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

getTagLocation(This) ->
        get({This, tagLocation}).

getPackageLocation(This) ->
        get({This, packageLocation}).

getFtp(This) ->
        get({This, ftp}).

getFtpUserName(This) ->
        get({This, ftpUserName}).

getFtpPassword(This) ->
        get({This, ftpPassword}).

getTestFtp(This) ->
        get({This, testFtp}).

getTestFtpUserName(This) ->
        get({This, testFtpUserName}).

getTestFtpPassword(This) ->
        get({This, testFtpPassword}).

getFtpPath(This) ->
        get({This, ftpPath}).

getTestFtpPath(This) ->
        get({This, testFtpPath}).

getTimeCreated(This) ->
        get({This, timeCreated}).

getLastModified(This) ->
        get({This, lastModified}).

