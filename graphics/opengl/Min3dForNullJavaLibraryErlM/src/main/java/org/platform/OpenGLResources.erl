% Generated Code Do Not Modify
% package org.platform
% import java.io.InputStream

-module('OpenGLResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OpenGLResources':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'OpenGLResources', instance}).

init(This) ->
        ok.

isExcluded(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        erlang:error({'RuntimeException'}).

getIdentifier(This, Name, DefType, DefPackage) when (is_list(Name) orelse Name =:= undefined), (is_list(DefType) orelse DefType =:= undefined), (is_list(DefPackage) orelse DefPackage =:= undefined) ->
        erlang:error({'RuntimeException'}).

% throws Exception
openRawResource(This, Id) when is_integer(Id) ->
        erlang:error({'RuntimeException'}).

% throws Exception
openRawResourceFromName(This, ResourceName) when (is_list(ResourceName) orelse ResourceName =:= undefined) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getResourceAsStream(This, ResourceName) when (is_list(ResourceName) orelse ResourceName =:= undefined) ->
        erlang:error({'RuntimeException'}).

getPackageName(This) ->
        erlang:error({'RuntimeException'}).

