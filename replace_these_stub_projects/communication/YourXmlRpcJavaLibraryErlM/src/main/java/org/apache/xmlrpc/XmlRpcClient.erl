% Generated Code Do Not Modify
% package org.apache.xmlrpc
% import java.io.IOException
% import java.net.MalformedURLException
% import java.net.URL
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.init.crypt.jcehelper.CryptInterface
% import org.allbinary.logic.NullUtil

-module('XmlRpcClient').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements XmlRpcHandler

init_fields(This) ->
    put({This, url}, undefined),
    ok.


new(Url) when (is_list(Url) orelse Url =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Url),
    This.

init(This, Url) when (is_list(Url) orelse Url =:= undefined) ->
    init_fields(This),
        put({This, url}, 'URL':new(Url)).

getURL(This) ->
        get({This, url}).

setBasicAuthentication(This, User, Password) when (is_list(User) orelse User =:= undefined), (is_list(Password) orelse Password =:= undefined) ->
        ok.

% throws XmlRpcException, IOException
execute(This, Method, Params) when (is_list(Method) orelse Method =:= undefined) ->
        get({'NullUtil':getInstance(), 'NULL_OBJECT'}).

% throws XmlRpcException, IOException
execute(This, Method, Params, CryptInterface) when (is_list(Method) orelse Method =:= undefined) ->
        get({'NullUtil':getInstance(), 'NULL_OBJECT'}).

