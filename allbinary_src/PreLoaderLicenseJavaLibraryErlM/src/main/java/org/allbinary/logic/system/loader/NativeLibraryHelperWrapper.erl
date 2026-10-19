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
% package org.allbinary.logic.system.loader
% import java.lang.reflect.Constructor
% import java.lang.reflect.Method
% import org.allbinary.string.CommonStrings

-module('NativeLibraryHelperWrapper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, libraryName}, undefined),
    put({This, loader}, undefined),
    put({This, anyType}, undefined),
    ok.


new(LibraryName) when (is_list(LibraryName) orelse LibraryName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LibraryName),
    This.

init(This, LibraryName) when (is_list(LibraryName) orelse LibraryName =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setLibraryName(This, LibraryName).

% throws Exception
load(This) ->
        Params = array:new(1, {default, undefined}),
        array:set(0, (get({This, '$class'})):getLibraryName(This), Params),
        Classes = array:new(1, {default, undefined}),
        array:set(0, get({(get({This, '$class'})):getLibraryName(This), '$class'}), Classes),
        put({This, loader}, 'NativeLibraryClassLoader':new((get({get({This, '$class'}), '$class'})):getClassLoader(get({This, '$class'})))),
        MyClass = (get({get({This, loader}), '$class'})):loadClass(get({This, loader}), "dynamic.NativeLibraryHelper"),
        Constructor = (get({MyClass, '$class'})):getConstructor(MyClass, Classes),
        put({This, anyType}, (get({Constructor, '$class'})):newInstance(Constructor, Params)),
        CommonStrings = 'CommonStrings':getInstance(),
        Method = (get({get({get({This, anyType}), '$class'}), '$class'})):getMethod(get({get({This, anyType}), '$class'}), get({CommonStrings, 'LOAD'}), undefined),
        (get({Method, '$class'})):invoke(Method, get({This, anyType}), undefined).

unload(This) ->
        put({This, anyType}, undefined),
        put({This, loader}, undefined),
        erlang:garbage_collect(),
        erlang:garbage_collect().

toString(This) ->
        lists:concat(["Library: ", (get({This, '$class'})):getLibraryName(This)]).

getLibraryName(This) ->
        get({This, libraryName}).

setLibraryName(This, LibraryName) when (is_list(LibraryName) orelse LibraryName =:= undefined) ->
        put({This, libraryName}, LibraryName).

