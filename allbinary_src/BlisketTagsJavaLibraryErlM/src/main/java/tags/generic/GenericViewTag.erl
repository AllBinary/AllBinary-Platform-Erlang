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
% package tags.generic
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.InputOutputTypeData
% import tags.TransformTag

-module('GenericViewTag').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformTag', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, output}, undefined),
    put({This, file}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'TransformTag':init(This),
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'JSPTAG'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

setOutput(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, output}, Value),
        (fun(Target_N66080) -> (get({Target_N66080, '$class'})):put(Target_N66080, get({'InputOutputTypeData':getInstance(), 'NAME'}), get({This, output})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

setFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, file}, Value),
        (fun(Target_N66214) -> (get({Target_N66214, '$class'})):put(Target_N66214, get({'InputOutputTypeData':getInstance(), 'FILE'}), get({This, file})) end)((get({This, '$class'})):getPropertiesHashMap(This)).

