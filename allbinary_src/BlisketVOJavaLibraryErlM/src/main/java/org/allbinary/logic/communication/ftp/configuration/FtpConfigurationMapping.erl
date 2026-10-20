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
% package org.allbinary.logic.communication.ftp.configuration
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.StdUtil

-module('FtpConfigurationMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableMappingInterface

init_fields(This) ->
    put({This, ftpConfigurationInterface}, undefined),
    ok.


new(FtpConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FtpConfigurationInterface),
    This.

'$init'(This, FtpConfigurationInterface) ->
    init_fields(This),
        put({This, ftpConfigurationInterface}, FtpConfigurationInterface).

toHashMap(This) ->
        HashMap = (fun(Target_N65848) -> (get({Target_N65848, '$class'})):createHashMap(Target_N65848) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'FtpConfigurationData', 'SERVER'}), (get({get({This, ftpConfigurationInterface}), '$class'})):getServer(get({This, ftpConfigurationInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({'FtpConfigurationData', 'USERNAME'}), (get({get({This, ftpConfigurationInterface}), '$class'})):getUserName(get({This, ftpConfigurationInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({'FtpConfigurationData', 'PASSWORD'}), (get({get({This, ftpConfigurationInterface}), '$class'})):getPassword(get({This, ftpConfigurationInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({'FtpConfigurationData', 'PATH'}), (get({get({This, ftpConfigurationInterface}), '$class'})):getPath(get({This, ftpConfigurationInterface}))),
        HashMap.

% throws Exception
getKey(This) ->
        get({'FtpConfigurationData', 'NAME'}).

% throws Exception
toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, (get({get({This, ftpConfigurationInterface}), '$class'})):getServer(get({This, ftpConfigurationInterface}))),
        (get({Vector, '$class'})):add(Vector, (get({get({This, ftpConfigurationInterface}), '$class'})):getUserName(get({This, ftpConfigurationInterface}))),
        (get({Vector, '$class'})):add(Vector, (get({get({This, ftpConfigurationInterface}), '$class'})):getPassword(get({This, ftpConfigurationInterface}))),
        (get({Vector, '$class'})):add(Vector, (get({get({This, ftpConfigurationInterface}), '$class'})):getPath(get({This, ftpConfigurationInterface}))),
        Vector.

