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
% package org.allbinary.logic.io.file
% import java.io.FilenameFilter
% import java.io.IOException
% import java.net.URI

-module('AbFileInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


canRead(This) ->
    erlang:error({abstract_method, canRead}).

canWrite(This) ->
    erlang:error({abstract_method, canWrite}).

% throws IOException
createNewFile(This) ->
    erlang:error({abstract_method, createNewFile}).

% throws IOException
delete(This) ->
    erlang:error({abstract_method, delete}).

deleteOnExit(This) ->
    erlang:error({abstract_method, deleteOnExit}).

exists(This) ->
    erlang:error({abstract_method, exists}).

getAbsolutePath(This) ->
    erlang:error({abstract_method, getAbsolutePath}).

% throws IOException
getCanonicalPath(This) ->
    erlang:error({abstract_method, getCanonicalPath}).

getParent(This) ->
    erlang:error({abstract_method, getParent}).

getPath(This) ->
    erlang:error({abstract_method, getPath}).

isAbsolute(This) ->
    erlang:error({abstract_method, isAbsolute}).

isDirectory(This) ->
    erlang:error({abstract_method, isDirectory}).

isFile(This) ->
    erlang:error({abstract_method, isFile}).

isHidden(This) ->
    erlang:error({abstract_method, isHidden}).

lastModified(This) ->
    erlang:error({abstract_method, lastModified}).

length(This) ->
    erlang:error({abstract_method, length}).

list(This) ->
    erlang:error({abstract_method, list}).

listWithFilter(This, Filter) ->
    erlang:error({abstract_method, listWithFilter}).

mkdir(This) ->
    erlang:error({abstract_method, mkdir}).

mkdirs(This) ->
    erlang:error({abstract_method, mkdirs}).

setLastModified(This, Time) when is_integer(Time) ->
    erlang:error({abstract_method, setLastModified}).

setReadOnly(This) ->
    erlang:error({abstract_method, setReadOnly}).

toString(This) ->
    erlang:error({abstract_method, toString}).

toURI(This) ->
    erlang:error({abstract_method, toURI}).

