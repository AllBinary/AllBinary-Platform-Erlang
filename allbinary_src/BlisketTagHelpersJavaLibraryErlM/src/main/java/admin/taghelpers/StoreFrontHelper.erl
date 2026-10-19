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
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.string.CommonSeps

-module('StoreFrontHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, storeFrontInterface}, undefined),
    put({This, currentLocation}, undefined),
    put({This, currentHomeLocation}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap, PageContext),
    This.

init(This, HashMap, PageContext) ->
    'TagHelper':init(This),
    init_fields(This),
        StoreName = (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        case (StoreName =/= undefined) of
            true ->
            put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName)),
            put({This, currentLocation}, (fun(Target_N66326) -> (get({Target_N66326, '$class'})):all(Target_N66326, ((get({get({This, storeFrontInterface}), '$class'})):getCurrentHostName(get({This, storeFrontInterface})) + (get({get({This, storeFrontInterface}), '$class'})):getCurrentHostNamePath(get({This, storeFrontInterface})))) end)('Replace':new(get({'CommonSeps':getInstance(), 'SPACE'}), "%20"))),
            put({This, currentHomeLocation}, (fun(Target_N66443) -> (get({Target_N66443, '$class'})):all(Target_N66443, ((get({get({This, storeFrontInterface}), '$class'})):getCurrentHomeHostName(get({This, storeFrontInterface})) + (get({get({This, storeFrontInterface}), '$class'})):getCurrentHomeHostNamePath(get({This, storeFrontInterface})))) end)('Replace':new(get({'CommonSeps':getInstance(), 'SPACE'}), "%20")));
            false ->
            StringUtil = 'StringUtil':getInstance(),
            put({This, storeFrontInterface}, 'StoreFront':new()),
            put({This, currentLocation}, get({StringUtil, 'EMPTY_STRING'})),
            put({This, currentHomeLocation}, get({StringUtil, 'EMPTY_STRING'}))
        end.

getCurrentLocation(This) ->
        get({This, currentLocation}).

getCurrentHomeLocation(This) ->
        get({This, currentHomeLocation}).

