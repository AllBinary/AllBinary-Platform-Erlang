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
% package bundle.input.automation
% import java.util.Collection
% import java.util.Map
% import java.util.Set
% import org.osgi.framework.ServiceReference
% import org.allbinary.logic.string.StringMaker

-module('ServiceReferenceMap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Map

init_fields(This) ->
    put({This, serviceReference}, undefined),
    ok.


new(ServiceReference) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ServiceReference),
    This.

'$init'(This, ServiceReference) ->
    init_fields(This),
        put({This, serviceReference}, ServiceReference).

size(This) ->
        (-1).

isEmpty(This) ->
        false.

containsKey(This, Key) ->
        false.

containsValue(This, Value) ->
        false.

get(This, Key) ->
        (get({get({This, serviceReference}), '$class'})):getProperty(get({This, serviceReference}), Key).

put(This, Key, Value) ->
        undefined.

remove(This, Key) ->
        undefined.

putAll(This, M) ->
        ok.

clear(This) ->
        ok.

keySet(This) ->
        KeyStringArray = (get({get({This, serviceReference}), '$class'})):getPropertyKeys(get({This, serviceReference})),
        undefined.

values(This) ->
        undefined.

entrySet(This) ->
        undefined.

toString(Map) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

