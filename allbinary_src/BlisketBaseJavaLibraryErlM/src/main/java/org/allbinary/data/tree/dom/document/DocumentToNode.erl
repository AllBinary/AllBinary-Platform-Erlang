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
% package org.allbinary.data.tree.dom.document
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.regex.replace.Replace

-module('DocumentToNode').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'XMLROOT'}, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"),
    put({?MODULE, 'XMLROOTSTART'}, "<?xml"),
    put({?MODULE, 'XMLROOTEND'}, "?>"),
    put({?MODULE, 'XMLJSPROOTSTART'}, "<jsp:root"),
    put({?MODULE, 'XMLEND'}, ">"),
    put({?MODULE, 'XMLJSPROOTENDSTART'}, "</jsp:root"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
convertDocumentToNodeString(DocumentString) when (is_list(DocumentString) orelse DocumentString =:= undefined) ->
        put({local, documentString}, DocumentString),
        put({local, documentString}, 'DocumentToNode':remove(get({local, documentString}), get({'DocumentToNode', 'XMLJSPROOTSTART'}), get({'DocumentToNode', 'XMLEND'}))),
        put({local, documentString}, 'DocumentToNode':remove(get({local, documentString}), get({'DocumentToNode', 'XMLJSPROOTENDSTART'}), get({'DocumentToNode', 'XMLEND'}))),
        ReplaceXmlRoot = 'Replace':new(get({'DocumentToNode', 'XMLROOT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (get({ReplaceXmlRoot, '$class'})):all(ReplaceXmlRoot, get({local, documentString})).

removeXmlDefinitionFromDocumentString(DocumentString) when (is_list(DocumentString) orelse DocumentString =:= undefined) ->
        'DocumentToNode':remove(DocumentString, get({'DocumentToNode', 'XMLROOTSTART'}), get({'DocumentToNode', 'XMLROOTEND'})).

remove(DocumentString, Start, End) when (is_list(DocumentString) orelse DocumentString =:= undefined), (is_list(Start) orelse Start =:= undefined), (is_list(End) orelse End =:= undefined) ->
        try
        put({local, startIndex}, 0),
        (fun Loop() -> case ((begin put({local, startIndex}, allbinary_java:index_of(DocumentString, Start)), get({local, startIndex}) end) =/= (-1)) of true ->
            case (get({local, startIndex}) >= 0) of
                true ->
                EndIndex = (get({DocumentString, '$class'})):indexOf(DocumentString, End, get({local, startIndex})),
                case (EndIndex >= 0) of
                    true ->
                    StartString = string:slice(DocumentString, 0, (get({local, startIndex})) - (0)),
                    ResultString = string:slice(DocumentString, (EndIndex + 1)),
                    throw({'$return', lists:concat([StartString, ResultString])});
                    false -> ok
                end;
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        DocumentString
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

