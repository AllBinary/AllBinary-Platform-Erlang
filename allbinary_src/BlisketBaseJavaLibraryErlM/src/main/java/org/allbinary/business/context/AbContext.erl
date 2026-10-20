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
% package org.allbinary.business.context
% import java.util.HashMap
% import javax.servlet.jsp.PageContext
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('AbContext').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, propertiesHashMap}, undefined),
    put({This, pageContext}, undefined),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PropertiesHashMap, PageContext),
    This.

'$init'(This, PropertiesHashMap, PageContext) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Properties HashMap: ", (get({PropertiesHashMap, '$class'})):toString(PropertiesHashMap)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        put({This, propertiesHashMap}, PropertiesHashMap),
        put({This, pageContext}, PageContext).

getWeblisketSession(This) ->
        'WeblisketSession':new(get({This, propertiesHashMap}), get({This, pageContext})).

getPageContext(This) ->
        get({This, pageContext}).

getPropertiesHashMap(This) ->
        get({This, propertiesHashMap}).

