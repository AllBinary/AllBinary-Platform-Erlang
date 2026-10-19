% Generated Code Do Not Modify
% package org.osgi.framework
% import org.allbinary.logic.string.StringUtil

-module('Constants').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% Java interface

static_init() ->
    put({?MODULE, 'BUNDLE_SYMBOLICNAME'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    ok.


