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
% package org.allbinary.logic.communication.smtp.info
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('EmailInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicEmailInfo}, undefined),
    put({This, htmlAttachment}, undefined),
    put({This, contentBase}, undefined),
    ok.


new(BasicEmailInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicEmailInfo),
    This.

'$init'(This, BasicEmailInfo) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):init(This, BasicEmailInfo, undefined, undefined).

new(BasicEmailInfo, HtmlAttachment, ContentBase) when (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicEmailInfo, HtmlAttachment, ContentBase),
    This.

'$init'(This, BasicEmailInfo, HtmlAttachment, ContentBase) when (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):init(This, BasicEmailInfo, undefined, undefined).

init(This, BasicEmailInfo, HtmlAttachment, ContentBase) when (is_list(HtmlAttachment) orelse HtmlAttachment =:= undefined), (is_list(ContentBase) orelse ContentBase =:= undefined) ->
        put({This, basicEmailInfo}, BasicEmailInfo),
        put({This, htmlAttachment}, HtmlAttachment),
        put({This, contentBase}, ContentBase).

getBasicEmailInfo(This) ->
        get({This, basicEmailInfo}).

getHtmlAttachment(This) ->
        get({This, htmlAttachment}).

getContentBase(This) ->
        get({This, contentBase}).

toString(This) ->
        lists:concat(["Email Info: \n ", (fun(Target_N66884) -> (get({Target_N66884, '$class'})):toString(Target_N66884) end)((get({This, '$class'})):getBasicEmailInfo(This))]).

