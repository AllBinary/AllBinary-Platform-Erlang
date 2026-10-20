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
% package tags
% import admin.taghelpers.TagHelperFactoryInterface
% import org.allbinary.logic.communication.log.LogUtil

-module('HelperTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PropertiesTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tagHelperFactoryInterface}, undefined),
    put({This, anyType}, undefined),
    ok.


new(TagHelperFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TagHelperFactoryInterface),
    This.

'$init'(This, TagHelperFactoryInterface) ->
    'PropertiesTag':'$init'(This),
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        put({This, tagHelperFactoryInterface}, TagHelperFactoryInterface).

% throws Exception
setHelper(This) ->
        case (get({This, anyType}) =:= undefined) of
            true ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Creating TagHelper with: \n", (fun(Target_N66303) -> (get({Target_N66303, '$class'})):toString(Target_N66303) end)((get({This, '$class'})):getPropertiesHashMap(This))]), This, "doStartTag");
                false -> ok
            end,
            put({This, anyType}, (get({get({This, tagHelperFactoryInterface}), '$class'})):getInstance(get({This, tagHelperFactoryInterface}), (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})));
            false -> ok
        end.

getHelper(This) ->
        get({This, anyType}).

doEndTag(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Tag Ended", This, "doEndTag");
            false -> ok
        end,
        put({This, anyType}, undefined),
        'PropertiesTag':doEndTag(This).

