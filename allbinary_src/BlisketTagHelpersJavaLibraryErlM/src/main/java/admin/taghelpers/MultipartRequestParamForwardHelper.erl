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
% package admin.taghelpers
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.jsp.PageContext
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.communication.http.request.RequestMapInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import tags.HelperTag

-module('MultipartRequestParamForwardHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, pageContext}, undefined),
    put({This, requestMapInterface}, undefined),
    put({This, page}, undefined),
    put({This, command}, undefined),
    put({This, paramVector}, undefined),
    ok.


new(ParentHelperTag, Page, Command, ParamVector, PageContext) when (is_list(Page) orelse Page =:= undefined), (is_list(Command) orelse Command =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ParentHelperTag, Page, Command, ParamVector, PageContext),
    This.

'$init'(This, ParentHelperTag, Page, Command, ParamVector, PageContext) when (is_list(Page) orelse Page =:= undefined), (is_list(Command) orelse Command =:= undefined) ->
    init_fields(This),
        put({This, pageContext}, PageContext),
        put({This, page}, Page),
        put({This, command}, Command),
        put({This, paramVector}, ParamVector),
        put({This, requestMapInterface}, (fun(Target_N66251) -> (get({Target_N66251, '$class'})):getRequestMapInterface(Target_N66251, ParentHelperTag) end)('InventoryItemViewParentTagHelper':getInstance())).

% throws Exception
forward(This) ->
        try
            case (get({This, '$class'})):shouldForward(This) of
                true ->
                Params = (get({This, '$class'})):getParams(This),
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, page})),
                (get({StringBuffer, '$class'})):append(StringBuffer, Params),
                (get({get({This, pageContext}), '$class'})):forward(get({This, pageContext}), (get({StringBuffer, '$class'})):toString(StringBuffer));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "forward()", E);
                false -> ok
            end
        end.

getParams(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        AMP = get({CommonSeps, 'AMPERSAND'}),
        QUESTION = get({CommonSeps, 'QUESTION'}),
        EQUALS = get({CommonSeps, 'EQUALS'}),
        HashMap = (get({get({This, requestMapInterface}), '$class'})):getRequestHashMap(get({This, requestMapInterface})),
        StringBuffer = 'StringMaker':new(),
        Size = (get({get({This, paramVector}), '$class'})):size(get({This, paramVector})),
        lists:foreach(fun(Index) ->
            Key = (get({get({This, paramVector}), '$class'})):get(get({This, paramVector}), Index),
            Value = (get({HashMap, '$class'})):get(HashMap, Key),
            case (Index =/= 0) of
                true ->
                (get({StringBuffer, '$class'})):append(StringBuffer, AMP);
                false ->
                (get({StringBuffer, '$class'})):append(StringBuffer, QUESTION)
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, Key),
            (get({StringBuffer, '$class'})):append(StringBuffer, EQUALS),
            (get({StringBuffer, '$class'})):append(StringBuffer, Value)
        end, lists:seq(0, Size - 1)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

shouldForward(This) ->
        try
        HashMap = (get({get({This, requestMapInterface}), '$class'})):getRequestHashMap(get({This, requestMapInterface})),
        RequestCommand = (get({HashMap, '$class'})):get(HashMap, get({get({'MultipartRequestParamForwardHelper', 'GLOBALS2'}), 'ADMINCOMMAND'})),
        case ((fun(Target_N67895) -> (get({Target_N67895, '$class'})):isEmpty(Target_N67895, get({This, command})) end)('StringValidationUtil':getInstance()) orelse (((not (fun(Target_N67944) -> (get({Target_N67944, '$class'})):isEmpty(Target_N67944, RequestCommand) end)('StringValidationUtil':getInstance())) andalso ((get({get({This, command}), '$class'})):compareTo(get({This, command}), RequestCommand) =:= 0)))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

