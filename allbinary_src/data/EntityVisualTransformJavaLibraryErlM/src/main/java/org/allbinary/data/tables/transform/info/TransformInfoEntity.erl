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
% package org.allbinary.data.tables.transform.info
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.control.crypt.Encoder
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import org.allbinary.logic.visual.transform.info.TransformInfoFactoryInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase
% import org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactoryInterface

-module('TransformInfoEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransformInfoEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "transforminfo"),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, transformInfoFactoryInterface}, undefined),
    put({This, transformInfoObjectConfigAndManipulatorFactoryInterface}, undefined),
    put({This, transformInfoObjectConfigGeneratorFactoryInterface}, undefined),
    ok.


new(TransformInfoObjectConfigGeneratorFactoryInterface, TransformInfoObjectConfigAndManipulatorFactoryInterface, TransformInfoFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoObjectConfigGeneratorFactoryInterface, TransformInfoObjectConfigAndManipulatorFactoryInterface, TransformInfoFactoryInterface),
    This.

'$init'(This, TransformInfoObjectConfigGeneratorFactoryInterface, TransformInfoObjectConfigAndManipulatorFactoryInterface, TransformInfoFactoryInterface) ->
        'AbSqlBean':'$init'(This, 'UserDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})),
        put({This, transformInfoObjectConfigGeneratorFactoryInterface}, TransformInfoObjectConfigGeneratorFactoryInterface),
        put({This, transformInfoObjectConfigAndManipulatorFactoryInterface}, TransformInfoObjectConfigAndManipulatorFactoryInterface),
        put({This, transformInfoFactoryInterface}, TransformInfoFactoryInterface).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'TransformInfoEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'TransformInfoEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

delete(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
            'AbSqlBean':deleteWhere(This, get({'TransformInfoData':getInstance(), 'NAME'}), Value),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({get({This, commonStrings}), delete}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), delete}), E);
                false -> ok
            end
        end.

% throws Exception
get(This, Name, PropertiesHashMap, PageContext) when (is_list(Name) orelse Name =:= undefined) ->
        try
        TransformInfoData = 'TransformInfoData':getInstance(),
        KeysAndValues = (fun(Target_N68029) -> (get({Target_N68029, '$class'})):createHashMap(Target_N68029) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({TransformInfoData, 'NAME'}), Name),
        HashMap = 'AbSqlBean':getRow(This, KeysAndValues),
        case (HashMap =/= undefined) of
            true ->
            AnyType = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'OBJECTCONFIG'})),
            case (AnyType =/= undefined) of
                true ->
                put({local, string}, AnyType),
                (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'OBJECTCONFIG'}), allbinary_java:to_string('Encoder':decode(get({local, string}))));
                false -> ok
            end,
            ObjectData = (get({HashMap, '$class'})):get(HashMap, get({TransformInfoData, 'DATA'})),
            case (ObjectData =/= undefined) of
                true ->
                put({local, string}, ObjectData),
                (get({HashMap, '$class'})):put(HashMap, get({TransformInfoData, 'DATA'}), allbinary_java:to_string('Encoder':decode(get({local, string}))));
                false -> ok
            end,
            throw({'$return', (get({get({This, transformInfoFactoryInterface}), '$class'})):getInstance(get({This, transformInfoFactoryInterface}), HashMap, PropertiesHashMap, PageContext)});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getObjectConfigs(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        ObjectConfigVector = 'BasicArrayListD':new(),
        ObjectConfigColumnVector = (get({This, '$class'})):getColumnWhere(This, get({'TransformInfoData':getInstance(), 'OBJECTCONFIG'}), get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        Size = (get({ObjectConfigColumnVector, '$class'})):size(ObjectConfigColumnVector),
        lists:foreach(fun(I) ->
            put({local, objectConfigString}, (get({ObjectConfigColumnVector, '$class'})):get(ObjectConfigColumnVector, I)),
            put({local, objectConfigString}, allbinary_java:to_string('Encoder':decode(get({local, objectConfigString})))),
            (get({ObjectConfigVector, '$class'})):add(ObjectConfigVector, (get({get({This, transformInfoObjectConfigAndManipulatorFactoryInterface}), '$class'})):getInstance(get({This, transformInfoObjectConfigAndManipulatorFactoryInterface}), get({This, abeClientInformation}), This, 'DomDocumentHelper':create(get({local, objectConfigString}))))
        end, lists:seq(0, Size - 1)),
        ObjectConfigVector.

% throws Exception
getNames(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        ViewNameVector = 'BasicArrayListD':new(),
        ColumnVector = (get({This, '$class'})):getColumnWhere(This, get({'TransformInfoData':getInstance(), 'NAME'}), get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        Size = (get({ColumnVector, '$class'})):size(ColumnVector),
        lists:foreach(fun(I) ->
            ViewNameString = (get({ColumnVector, '$class'})):get(ColumnVector, I),
            (get({ViewNameVector, '$class'})):add(ViewNameVector, ViewNameString)
        end, lists:seq(0, Size - 1)),
        ViewNameVector.

createTableStatement(This) ->
        TransformInfoData = 'TransformInfoData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'START'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'StoreFrontData':getInstance(), 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'OBJECTFILENAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'OBJECT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'OBJECTCONFIGFILENAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'OBJECTCONFIG'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'TEMPLATEFILENAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'TEMPLATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'DATAFILENAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'DATA'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'LASTMODIFIED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'TIMECREATED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'PRIMARY_KEY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({TransformInfoData, 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'END'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({'TransformInfoData':getInstance(), 'NAME'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'TransformInfoData':getInstance(), 'NAME'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

