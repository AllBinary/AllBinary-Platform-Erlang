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
% package admin.tags
% import java.lang.reflect.Method
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.JspTagException
% import admin.taghelpers.TagHelperFactoryInterface
% import org.allbinary.logic.communication.http.request.AbResponseHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.SqlStrings
% import org.allbinary.logic.java.bool.BooleanUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.system.security.licensing.LicensingException
% import tags.PropertiesTag

-module('TableTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PropertiesTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, enabled}, undefined),
    put({This, tagHelperFactoryInterface}, undefined),
    put({This, tagRequestHelperFactoryInterface}, undefined),
    put({This, requestObject}, undefined),
    put({This, current}, undefined),
    put({This, total}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'PropertiesTag':init(This),
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

setIsSelected(This, Enabled) when (is_list(Enabled) orelse Enabled =:= undefined) ->
        put({This, enabled}, Enabled).

% throws Exception
isEnabled(This) ->
        try
        case (not (fun(Target_N66524) -> (get({Target_N66524, '$class'})):isEmpty(Target_N66524, get({This, enabled})) end)('StringValidationUtil':getInstance())) of
            true ->
            case ((fun(Target_N66575) -> (get({Target_N66575, '$class'})):getFromString(Target_N66575, get({This, enabled})) end)('BooleanUtil':getInstance()) orelse ((get({get({This, enabled}), '$class'})):compareTo(get({This, enabled}), "on") =:= 0)) of
                true ->
                throw({'$return', true});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setTagHelperFactory(This, TagHelperFactoryInterface) ->
        put({This, tagHelperFactoryInterface}, TagHelperFactoryInterface).

getTagHelperFactoryInterface(This) ->
        get({This, tagHelperFactoryInterface}).

setTagRequestHelperFactory(This, TagHelperFactoryInterface) ->
        put({This, tagRequestHelperFactoryInterface}, TagHelperFactoryInterface).

getTagRequestHelperFactoryInterface(This) ->
        get({This, tagRequestHelperFactoryInterface}).

setCurrent(This, Current) ->
        put({This, current}, Current).

getCurrent(This) ->
        get({This, current}).

setTotal(This, Total) ->
        put({This, total}, Total).

getTotal(This) ->
        get({This, total}).

% throws LicensingException
drop(This) ->
        try
            AnyType = (fun(Target_N67215) -> (get({Target_N67215, '$class'})):getInstance(Target_N67215, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagHelperFactoryInterface(This)),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "drop", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to drop table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'DROP'}), E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
create(This) ->
        try
            AnyType = (fun(Target_N67842) -> (get({Target_N67842, '$class'})):getInstance(Target_N67842, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagHelperFactoryInterface(This)),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "create", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to create table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "create()", E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
restore(This) ->
        try
            AnyType = (fun(Target_N68454) -> (get({Target_N68454, '$class'})):getInstance(Target_N68454, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagHelperFactoryInterface(This)),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "restore", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to restore backup",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "restore()", E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
backup(This) ->
        try
            AnyType = (fun(Target_N69066) -> (get({Target_N69066, '$class'})):getInstance(Target_N69066, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagHelperFactoryInterface(This)),
            AddressHelperClass = get({AnyType, '$class'}),
            Method = (get({AddressHelperClass, '$class'})):getMethod(AddressHelperClass, "backup", undefined),
            Result = (get({Method, '$class'})):invoke(Method, AnyType, undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to make backup",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "backup()", E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
insert(This) ->
        try
            HelperClass = get({get({This, requestObject}), '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "insert", undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, requestObject}), undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to insert",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "insert()", E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
delete(This) ->
        try
            HelperClass = get({get({This, requestObject}), '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, get({get({This, commonStrings}), delete}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, requestObject}), undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to delete",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "delete()", E);
                false -> ok
            end,
            Error
        end.

% throws LicensingException
update(This) ->
        try
            HelperClass = get({get({This, requestObject}), '$class'}),
            Method = (get({HelperClass, '$class'})):getMethod(HelperClass, "update", undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, requestObject}), undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to update",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "update()", E);
                false -> ok
            end,
            Error
        end.

% throws JspTagException
doStartTag(This) ->
        try
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                true ->
                Request = (get({get({This, pageContext}), '$class'})):getRequest(get({This, pageContext})),
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, "TableTag Helper: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({(get({This, '$class'})):getTagHelperFactoryInterface(This), '$class'}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Request URI: "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({Request, '$class'})):getRequestURI(Request)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                false -> ok
            end,
            case ((get({This, '$class'})):getTagRequestHelperFactoryInterface(This) =/= undefined) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TableTag RequestHelper: ", atom_to_list(get({(get({This, '$class'})):getTagRequestHelperFactoryInterface(This), '$class'}))]), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                    false -> ok
                end;
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "TableTag RequestHelper: null", This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                    false -> ok
                end
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["TableTag this.getCommand(): ", (get({This, '$class'})):getCommand(This)]), This, get({get({This, tagStrings}), 'DO_START_TAG'}));
                false -> ok
            end,
            case (get({This, '$class'})):isEnabled(This) of
                true ->
                case ((get({This, '$class'})):getCommand(This) =/= undefined) of
                    true ->
                    case ((((((fun(Target_N72612) -> (get({Target_N72612, '$class'})):compareTo(Target_N72612, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) orelse ((fun(Target_N72662) -> (get({Target_N72662, '$class'})):compareTo(Target_N72662, get({'SqlStrings':getInstance(), 'INSERT_INTO'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) orelse ((fun(Target_N72718) -> (get({Target_N72718, '$class'})):compareTo(Target_N72718, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) orelse ((fun(Target_N72766) -> (get({Target_N72766, '$class'})):compareTo(Target_N72766, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) orelse ((fun(Target_N72814) -> (get({Target_N72814, '$class'})):compareTo(Target_N72814, get({'SqlStrings':getInstance(), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) of
                        true ->
                        put({This, requestObject}, (fun(Target_N72889) -> (get({Target_N72889, '$class'})):getInstance(Target_N72889, (get({This, '$class'})):getPropertiesHashMap(This), get({This, pageContext})) end)((get({This, '$class'})):getTagRequestHelperFactoryInterface(This)));
                        false -> ok
                    end,
                    case (((fun(Target_N72950) -> (get({Target_N72950, '$class'})):compareTo(Target_N72950, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) orelse ((fun(Target_N73000) -> (get({Target_N73000, '$class'})):compareTo(Target_N73000, get({'SqlStrings':getInstance(), 'INSERT_INTO'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) of
                        true ->
                        (get({This, '$class'})):insert(This);
                        false ->
                        case ((fun(Target_N73059) -> (get({Target_N73059, '$class'})):compareTo(Target_N73059, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (get({This, '$class'})):delete(This);
                        false ->
                        case (((fun(Target_N73113) -> (get({Target_N73113, '$class'})):compareTo(Target_N73113, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) orelse ((fun(Target_N73160) -> (get({Target_N73160, '$class'})):compareTo(Target_N73160, get({'SqlStrings':getInstance(), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0)) of
                        true ->
                        (get({This, '$class'})):update(This);
                        false -> ok
                    end
                    end
                    end,
                    case ((fun(Target_N73288) -> (get({Target_N73288, '$class'})):compareTo(Target_N73288, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'BACKUP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):backup(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N75640) -> (get({Target_N75640, '$class'})):print(Target_N75640, lists:concat([get({local, output}), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end,
                        throw({'$return', get({'TableTag', 'SKIP_BODY'})});
                        false ->
                        case ((fun(Target_N73362) -> (get({Target_N73362, '$class'})):compareTo(Target_N73362, get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'RESTORE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        (fun(Target_N75066) -> (get({Target_N75066, '$class'})):put(Target_N75066, "current", (get({This, '$class'})):getCurrent(This)) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                        (fun(Target_N75107) -> (get({Target_N75107, '$class'})):put(Target_N75107, "total", (get({This, '$class'})):getTotal(This)) end)((get({This, '$class'})):getPropertiesHashMap(This)),
                        put({local, output}, (get({This, '$class'})):restore(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N75357) -> (get({Target_N75357, '$class'})):print(Target_N75357, lists:concat([get({local, output}), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end,
                        throw({'$return', get({'TableTag', 'SKIP_BODY'})});
                        false ->
                        case ((fun(Target_N73436) -> (get({Target_N73436, '$class'})):compareTo(Target_N73436, get({get({This, commonStrings}), 'DROP'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):drop(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N74992) -> (get({Target_N74992, '$class'})):print(Target_N74992, lists:concat([get({local, output}), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end,
                        throw({'$return', get({'TableTag', 'SKIP_BODY'})});
                        false ->
                        case ((fun(Target_N73486) -> (get({Target_N73486, '$class'})):compareTo(Target_N73486, get({get({This, commonStrings}), 'CREATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):create(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N74709) -> (get({Target_N74709, '$class'})):print(Target_N74709, lists:concat([get({local, output}), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end,
                        throw({'$return', get({'TableTag', 'SKIP_BODY'})});
                        false ->
                        case ((fun(Target_N73536) -> (get({Target_N73536, '$class'})):compareTo(Target_N73536, get({get({This, commonStrings}), 'INSERT'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):insert(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N74438) -> (get({Target_N74438, '$class'})):print(Target_N74438, lists:concat([get({local, output}), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end;
                        false ->
                        case ((fun(Target_N73586) -> (get({Target_N73586, '$class'})):compareTo(Target_N73586, get({get({This, commonStrings}), 'DELETE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):delete(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N74167) -> (get({Target_N74167, '$class'})):print(Target_N74167, lists:concat([get({local, output}), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end;
                        false ->
                        case ((fun(Target_N73636) -> (get({Target_N73636, '$class'})):compareTo(Target_N73636, get({get({This, commonStrings}), 'UPDATE'})) end)((get({This, '$class'})):getCommand(This)) =:= 0) of
                        true ->
                        put({local, output}, (get({This, '$class'})):update(This)),
                        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAGEXTRAOUTPUT'})) of
                            true ->
                            (fun(Target_N73896) -> (get({Target_N73896, '$class'})):print(Target_N73896, lists:concat([get({local, output}), "<br />"])) end)((get({get({This, pageContext}), '$class'})):getOut(get({This, pageContext})));
                            false -> ok
                        end;
                        false -> ok
                    end
                    end
                    end
                    end
                    end
                    end
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            get({'TableTag', 'EVAL_BODY_INCLUDE'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'AbResponseHandler':sendJspTagLicensingRedirect(get({This, pageContext}), E),
            get({'TableTag', 'SKIP_BODY'})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

