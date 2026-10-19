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
% package org.allbinary.business.user.address
% import java.util.HashMap
% import java.util.Set
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('StreetAddress').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, id}, undefined),
    put({This, name}, undefined),
    put({This, street}, undefined),
    put({This, city}, undefined),
    put({This, state}, undefined),
    put({This, code}, undefined),
    put({This, country}, undefined),
    put({This, isDefault}, false),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(StreetAddress) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, StreetAddress),
    This;
new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Request),
    This;
new(Address) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Address),
    This.

init(This, Node) ->
    init_fields(This),
        NameNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, name}, 'DomNodeHelper':getTextNodeValue(NameNode)),
        StreetNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'STREET'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, street}, 'DomNodeHelper':getTextNodeValue(StreetNode)),
        CityNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'CITY'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, city}, 'DomNodeHelper':getTextNodeValue(CityNode)),
        StateNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'STATE'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, state}, 'DomNodeHelper':getTextNodeValue(StateNode)),
        CodeNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'CODE'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, code}, 'DomNodeHelper':getTextNodeValue(CodeNode)),
        CountryNode = 'DomSearchHelper':getNode(get({'StreetAddressData', 'COUNTRY'}), (get({Node, '$class'})):getChildNodes(Node)),
        put({This, country}, 'DomNodeHelper':getTextNodeValue(CountryNode)),
        (get({This, '$class'})):log(This);
init(This, StreetAddress) ->
    init_fields(This),
        put({This, id}, (get({StreetAddress, '$class'})):getId(StreetAddress)),
        put({This, name}, (get({StreetAddress, '$class'})):getName(StreetAddress)),
        put({This, street}, (get({StreetAddress, '$class'})):getStreet(StreetAddress)),
        put({This, city}, (get({StreetAddress, '$class'})):getCity(StreetAddress)),
        put({This, state}, (get({StreetAddress, '$class'})):getState(StreetAddress)),
        put({This, code}, (get({StreetAddress, '$class'})):getCode(StreetAddress)),
        put({This, country}, (get({StreetAddress, '$class'})):getCountry(StreetAddress)),
        put({This, isDefault}, (get({StreetAddress, '$class'})):isDefault(StreetAddress)),
        (get({This, '$class'})):log(This);
init(This, Request) ->
    init_fields(This),
        (get({This, '$class'})):setId(This, (get({Request, '$class'})):getParameter(Request, get({'StreetAddressData', 'ID'}))),
        (get({This, '$class'})):setName(This, (get({Request, '$class'})):getParameter(Request, get({'StreetAddressData', 'NAME'}))),
        (get({This, '$class'})):setStreet(This, (get({Request, '$class'})):getParameter(Request, get({'StreetAddressData', 'STREET'}))),
        (get({This, '$class'})):setCity(This, (get({Request, '$class'})):getParameter(Request, get({'StreetAddressData', 'CITY'}))),
        (get({This, '$class'})):setState(This, (get({Request, '$class'})):getParameter(Request, get({'StreetAddressData', 'STATE'}))),
        (get({This, '$class'})):setCode(This, (get({Request, '$class'})):getParameter(Request, get({'StreetAddressData', 'CODE'}))),
        (get({This, '$class'})):setCountry(This, (get({Request, '$class'})):getParameter(Request, get({'StreetAddressData', 'COUNTRY'}))),
        (get({This, '$class'})):log(This);
init(This, Address) ->
    init_fields(This),
        put({This, id}, (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'ID'}))),
        put({This, name}, (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'NAME'}))),
        put({This, street}, (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'STREET'}))),
        put({This, city}, (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'CITY'}))),
        put({This, state}, (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'STATE'}))),
        put({This, code}, (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'CODE'}))),
        put({This, country}, (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'COUNTRY'}))),
        Def = (get({Address, '$class'})):get(Address, get({'StreetAddressData', 'DEFAULT'})),
        case ((Def =/= undefined) andalso ((get({Def, '$class'})):compareTo(Def, get({'StreetAddressData', 'DEFAULT'})) =:= 0)) of
            true ->
            put({This, isDefault}, true);
            false ->
            put({This, isDefault}, false)
        end,
        (get({This, '$class'})):log(This).



new(Name, Street, City, State, Code, Country) when (is_list(Name) orelse Name =:= undefined), (is_list(Street) orelse Street =:= undefined), (is_list(City) orelse City =:= undefined), (is_list(State) orelse State =:= undefined), (is_list(Code) orelse Code =:= undefined), (is_list(Country) orelse Country =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Street, City, State, Code, Country),
    This.

init(This, Name, Street, City, State, Code, Country) when (is_list(Name) orelse Name =:= undefined), (is_list(Street) orelse Street =:= undefined), (is_list(City) orelse City =:= undefined), (is_list(State) orelse State =:= undefined), (is_list(Code) orelse Code =:= undefined), (is_list(Country) orelse Country =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, street}, Street),
        put({This, city}, City),
        put({This, state}, State),
        put({This, code}, Code),
        put({This, country}, Country),
        (get({This, '$class'})):log(This).


log(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Created Address: \n", (get({This, '$class'})):toHashMap(This)]), This, "log");
            false -> ok
        end.

setId(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
        put({This, id}, Id).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

setStreet(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, street}, Value).

setCity(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, city}, Value).

setState(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, state}, Value).

setCode(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, code}, Value).

setCountry(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, country}, Value).

getName(This) ->
        get({This, name}).

getStreet(This) ->
        get({This, street}).

getCity(This) ->
        get({This, city}).

getState(This) ->
        get({This, state}).

getCode(This) ->
        get({This, code}).

getCountry(This) ->
        get({This, country}).

getId(This) ->
        get({This, id}).

isDefault(This) ->
        get({This, isDefault}).

isEmpty(This) ->
        try
        EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        case (((((((((((((get({This, '$class'})):getName(This) =:= undefined) andalso ((fun(Target_N70294) -> (get({Target_N70294, '$class'})):compareTo(Target_N70294, EMPTY_STRING) end)((get({This, '$class'})):getName(This)) =:= 0)) andalso ((get({This, '$class'})):getStreet(This) =:= undefined)) andalso ((fun(Target_N70354) -> (get({Target_N70354, '$class'})):compareTo(Target_N70354, EMPTY_STRING) end)((get({This, '$class'})):getStreet(This)) =:= 0)) andalso ((get({This, '$class'})):getCity(This) =:= undefined)) andalso ((fun(Target_N70414) -> (get({Target_N70414, '$class'})):compareTo(Target_N70414, EMPTY_STRING) end)((get({This, '$class'})):getCity(This)) =:= 0)) andalso ((get({This, '$class'})):getState(This) =:= undefined)) andalso ((fun(Target_N70474) -> (get({Target_N70474, '$class'})):compareTo(Target_N70474, EMPTY_STRING) end)((get({This, '$class'})):getState(This)) =:= 0)) andalso ((get({This, '$class'})):getCode(This) =:= undefined)) andalso ((fun(Target_N70534) -> (get({Target_N70534, '$class'})):compareTo(Target_N70534, EMPTY_STRING) end)((get({This, '$class'})):getCode(This)) =:= 0)) andalso ((get({This, '$class'})):getCountry(This) =:= undefined)) andalso ((fun(Target_N70594) -> (get({Target_N70594, '$class'})):compareTo(Target_N70594, EMPTY_STRING) end)((get({This, '$class'})):getCountry(This)) =:= 0)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValid(This) ->
        try
        EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
        case (((((((((((((get({This, '$class'})):getName(This) =:= undefined) orelse ((fun(Target_N70836) -> (get({Target_N70836, '$class'})):compareTo(Target_N70836, EMPTY_STRING) end)((get({This, '$class'})):getName(This)) =:= 0)) orelse ((get({This, '$class'})):getStreet(This) =:= undefined)) orelse ((fun(Target_N70896) -> (get({Target_N70896, '$class'})):compareTo(Target_N70896, EMPTY_STRING) end)((get({This, '$class'})):getStreet(This)) =:= 0)) orelse ((get({This, '$class'})):getCity(This) =:= undefined)) orelse ((fun(Target_N70956) -> (get({Target_N70956, '$class'})):compareTo(Target_N70956, EMPTY_STRING) end)((get({This, '$class'})):getCity(This)) =:= 0)) orelse ((get({This, '$class'})):getState(This) =:= undefined)) orelse ((fun(Target_N71016) -> (get({Target_N71016, '$class'})):compareTo(Target_N71016, EMPTY_STRING) end)((get({This, '$class'})):getState(This)) =:= 0)) orelse ((get({This, '$class'})):getCode(This) =:= undefined)) orelse ((fun(Target_N71076) -> (get({Target_N71076, '$class'})):compareTo(Target_N71076, EMPTY_STRING) end)((get({This, '$class'})):getCode(This)) =:= 0)) orelse ((get({This, '$class'})):getCountry(This) =:= undefined)) orelse ((fun(Target_N71136) -> (get({Target_N71136, '$class'})):compareTo(Target_N71136, EMPTY_STRING) end)((get({This, '$class'})):getCountry(This)) =:= 0)) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

validationInfo(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Address Failed To Validate - All fields must contain data.<br></br>"),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({This, '$class'})):getName(This), get({'StreetAddressData', 'MIN'}), get({'StreetAddressData', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid name"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "<br></br>");
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({This, '$class'})):getStreet(This), get({'StreetAddressData', 'MIN'}), get({'StreetAddressData', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid street"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "<br></br>");
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({This, '$class'})):getCity(This), get({'StreetAddressData', 'MIN'}), get({'StreetAddressData', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid city"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "<br></br>");
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({This, '$class'})):getState(This), get({'StreetAddressData', 'MIN'}), get({'StreetAddressData', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid state"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "<br></br>");
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({This, '$class'})):getCode(This), get({'StreetAddressData', 'MIN'}), get({'StreetAddressData', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid zipcode"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "<br></br>");
            false -> ok
        end,
        case (not (get({StringValidationUtil, '$class'})):isValidRequired(StringValidationUtil, (get({This, '$class'})):getCountry(This), get({'StreetAddressData', 'MIN'}), get({'StreetAddressData', 'MAX'}))) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, "Please enter a valid country"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "<br></br>");
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        try
            Node = (get({Document, '$class'})):createElement(Document, get({'StreetAddressData', 'FORM'})),
            (get({Node, '$class'})):appendChild(Node, (get({This, '$class'})):toXmlNode(This, Document)),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "toValidationInfoNode", E);
                false -> ok
            end,
            undefined
        end.

toHashMap(This) ->
        HashMap = (fun(Target_N72759) -> (get({Target_N72759, '$class'})):createHashMap(Target_N72759) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'StreetAddressData', 'ID'}), get({This, id})),
        (get({HashMap, '$class'})):put(HashMap, get({'StreetAddressData', 'NAME'}), get({This, name})),
        (get({HashMap, '$class'})):put(HashMap, get({'StreetAddressData', 'STREET'}), get({This, street})),
        (get({HashMap, '$class'})):put(HashMap, get({'StreetAddressData', 'CITY'}), get({This, city})),
        (get({HashMap, '$class'})):put(HashMap, get({'StreetAddressData', 'STATE'}), get({This, state})),
        (get({HashMap, '$class'})):put(HashMap, get({'StreetAddressData', 'CODE'}), get({This, code})),
        (get({HashMap, '$class'})):put(HashMap, get({'StreetAddressData', 'COUNTRY'}), get({This, country})),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        StringUtil = 'StringUtil':getInstance(),
        HashMap = (get({This, '$class'})):toHashMap(This),
        KeySet = (get({HashMap, '$class'})):keySet(HashMap),
        KeyArray = (get({KeySet, '$class'})):toArray(KeySet),
        Size = array:size(KeyArray),
        Node = (get({Document, '$class'})):createElement(Document, get({'StreetAddressData', 'ADDRESS'})),
        lists:foreach(fun(I) ->
            Name = array:get(I, KeyArray),
            Value = (get({StringUtil, '$class'})):getNonNull(StringUtil, (get({HashMap, '$class'})):get(HashMap, Name)),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, Name, Value))
        end, lists:seq(0, Size - 1)),
        Node.

