% Generated Code Do Not Modify
% package org.apache.xmlrpc
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('XmlRpcHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


% throws Exception
execute(This, Method, Params) when (is_list(Method) orelse Method =:= undefined) ->
    erlang:error({abstract_method, execute}).

