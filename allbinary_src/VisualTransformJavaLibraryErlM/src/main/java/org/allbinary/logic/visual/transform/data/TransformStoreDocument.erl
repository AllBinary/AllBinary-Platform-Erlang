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
% package org.allbinary.logic.visual.transform.data
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontViewFactory
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchRequest

-module('TransformStoreDocument').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformHttpRequestDocument', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(PageContext, WeblisketSession) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PageContext, WeblisketSession),
    This.

init(This, PageContext, WeblisketSession) ->
        'TransformHttpRequestDocument':init(This, PageContext, WeblisketSession),
        init_fields(This),
        try
            StoreName = (get({WeblisketSession, '$class'})):getStoreName(WeblisketSession),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Using Session StoreName: ", StoreName]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
                false -> ok
            end,
            (fun(Target_N66232) -> (get({Target_N66232, '$class'})):appendChild(Target_N66232, (fun(Target_N66252) -> (get({Target_N66252, '$class'})):toXmlNode(Target_N66252, (get({This, '$class'})):getDoc(This)) end)('StoreFrontViewFactory':getInstance(StoreName))) end)((get({This, '$class'})):getBaseNode(This)),
            (fun(Target_N66311) -> (get({Target_N66311, '$class'})):appendChild(Target_N66311, (fun(Target_N66331) -> (get({Target_N66331, '$class'})):toXmlNode(Target_N66331, (get({This, '$class'})):getDoc(This)) end)('RequestParams':new((get({PageContext, '$class'})):getRequest(PageContext)))) end)((get({This, '$class'})):getBaseNode(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

new(SearchRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SearchRequest),
    This.

init(This, SearchRequest) ->
        'TransformHttpRequestDocument':init(This, SearchRequest),
        init_fields(This),
        try
            (fun(Target_N66791) -> (get({Target_N66791, '$class'})):appendChild(Target_N66791, (fun(Target_N66811) -> (get({Target_N66811, '$class'})):toXmlNode(Target_N66811, (get({This, '$class'})):getDoc(This)) end)('StoreFrontViewFactory':getInstance((fun(Target_N66835) -> (get({Target_N66835, '$class'})):getName(Target_N66835) end)((get({SearchRequest, '$class'})):getStoreFront(SearchRequest))))) end)((get({This, '$class'})):getBaseNode(This)),
            (fun(Target_N66886) -> (get({Target_N66886, '$class'})):appendChild(Target_N66886, (fun(Target_N66906) -> (get({Target_N66906, '$class'})):getParamsNode(Target_N66906, (get({This, '$class'})):getDoc(This)) end)((get({SearchRequest, '$class'})):getParams(SearchRequest))) end)((get({This, '$class'})):getBaseNode(This))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

