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
% package org.allbinary.layer
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps

-module('LayerManagerLogging').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerManagerLoggingBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'LayerManagerLogging':new()),
    put({?MODULE, removeFailed}, false),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, stringBuilder}, 'StringMaker':new()),
    put({This, 'APPEND'}, "append"),
    put({This, 'APPEND_'}, " append: "),
    put({This, '_AT_'}, " at: "),
    put({This, 'ATTEMPT_REMOVE_'}, " Remove Attempt: "),
    put({This, 'REMOVE_'}, " Remove: "),
    put({This, 'REMOVE'}, "remove"),
    put({This, 'DID_NOT_REMOVE'}, " Did not remove: "),
    put({This, 'CLEAR'}, " Clear List"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'LayerManagerLoggingBase':init(This),
    init_fields(This).


getInstance() ->
        get({'LayerManagerLogging', instance}).

% throws Exception
append(This, LayerInterface) ->
        (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66355) -> (get({Target_N66355, '$class'})):toString(Target_N66355) end)((fun(Target_N66362) -> (get({Target_N66362, '$class'})):append(Target_N66362, (get({LayerInterface, '$class'})):getName(LayerInterface)) end)((fun(Target_N66369) -> (get({Target_N66369, '$class'})):append(Target_N66369, get({This, 'APPEND_'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N66396) -> (get({Target_N66396, '$class'})):hashCode(Target_N66396, This) end)('TsUtil':getInstance())))))), This, get({This, 'APPEND'})).

appendAt(This, LayerInterface, Index) when is_integer(Index) ->
        (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66627) -> (get({Target_N66627, '$class'})):toString(Target_N66627) end)((fun(Target_N66634) -> (get({Target_N66634, '$class'})):appendint(Target_N66634, Index) end)((fun(Target_N66641) -> (get({Target_N66641, '$class'})):append(Target_N66641, get({This, '_AT_'})) end)((fun(Target_N66648) -> (get({Target_N66648, '$class'})):append(Target_N66648, (get({LayerInterface, '$class'})):getName(LayerInterface)) end)((fun(Target_N66655) -> (get({Target_N66655, '$class'})):append(Target_N66655, get({This, 'APPEND_'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N66682) -> (get({Target_N66682, '$class'})):hashCode(Target_N66682, This) end)('TsUtil':getInstance())))))))), This, get({This, 'APPEND'})).

remove(This, LayerInterface) ->
        case (LayerInterface =:= undefined) of
            true ->
            (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67178) -> (get({Target_N67178, '$class'})):toString(Target_N67178) end)((fun(Target_N67185) -> (get({Target_N67185, '$class'})):append(Target_N67185, (fun(Target_N67268) -> (get({Target_N67268, '$class'})):toString(Target_N67268, LayerInterface) end)('StringUtil':getInstance())) end)((fun(Target_N67192) -> (get({Target_N67192, '$class'})):append(Target_N67192, get({This, 'ATTEMPT_REMOVE_'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N67219) -> (get({Target_N67219, '$class'})):hashCode(Target_N67219, This) end)('TsUtil':getInstance())))))), This, get({This, 'REMOVE'}));
            false ->
            (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66973) -> (get({Target_N66973, '$class'})):toString(Target_N66973) end)((fun(Target_N66980) -> (get({Target_N66980, '$class'})):append(Target_N66980, (get({LayerInterface, '$class'})):getName(LayerInterface)) end)((fun(Target_N66987) -> (get({Target_N66987, '$class'})):append(Target_N66987, get({This, 'ATTEMPT_REMOVE_'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N67014) -> (get({Target_N67014, '$class'})):hashCode(Target_N67014, This) end)('TsUtil':getInstance())))))), This, get({This, 'REMOVE'}))
        end.

removeResult(This, LayerManager, LayerInterface, Result) when is_boolean(Result) ->
        case (LayerInterface =:= undefined) of
            true ->
            (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67971) -> (get({Target_N67971, '$class'})):toString(Target_N67971) end)((fun(Target_N67978) -> (get({Target_N67978, '$class'})):append(Target_N67978, (fun(Target_N68061) -> (get({Target_N68061, '$class'})):toString(Target_N68061, LayerInterface) end)('StringUtil':getInstance())) end)((fun(Target_N67985) -> (get({Target_N67985, '$class'})):append(Target_N67985, get({This, 'REMOVE_'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N68012) -> (get({Target_N68012, '$class'})):hashCode(Target_N68012, This) end)('TsUtil':getInstance())))))), This, get({This, 'REMOVE'}));
            false ->
            case Result of
            true ->
            case get({'LayerManagerLogging', removeFailed}) of
                true ->
                (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67762) -> (get({Target_N67762, '$class'})):toString(Target_N67762) end)((fun(Target_N67769) -> (get({Target_N67769, '$class'})):append(Target_N67769, (get({LayerInterface, '$class'})):getName(LayerInterface)) end)((fun(Target_N67776) -> (get({Target_N67776, '$class'})):append(Target_N67776, get({This, 'REMOVE_'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N67803) -> (get({Target_N67803, '$class'})):hashCode(Target_N67803, This) end)('TsUtil':getInstance())))))), This, get({This, 'REMOVE'}));
                false -> ok
            end;
            false ->
            (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67496) -> (get({Target_N67496, '$class'})):toString(Target_N67496) end)((fun(Target_N67503) -> (get({Target_N67503, '$class'})):append(Target_N67503, (get({LayerInterface, '$class'})):getName(LayerInterface)) end)((fun(Target_N67510) -> (get({Target_N67510, '$class'})):append(Target_N67510, get({This, 'DID_NOT_REMOVE'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N67537) -> (get({Target_N67537, '$class'})):hashCode(Target_N67537, This) end)('TsUtil':getInstance())))))), This, get({This, 'REMOVE'})),
            put({'LayerManagerLogging', removeFailed}, true)
        end
        end.

log(This, LayerManager) ->
        (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
        Size = (get({LayerManager, '$class'})):getSize(LayerManager),
        CommonSeps = 'CommonSeps':getInstance(),
        (fun(Target_N68374) -> (get({Target_N68374, '$class'})):append(Target_N68374, get({CommonSeps, 'COLON_SEP'})) end)((get({get({This, stringBuilder}), '$class'})):append(get({This, stringBuilder}), integer_to_list((fun(Target_N68418) -> (get({Target_N68418, '$class'})):hashCode(Target_N68418, LayerManager) end)('TsUtil':getInstance()), 16))),
        (fun(Target_N68481) -> (get({Target_N68481, '$class'})):append(Target_N68481, get({CommonSeps, 'COLON_SEP'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), Size)),
        put({local, allBinaryLayer}, undefined),
        lists:foreach(fun(Index) ->
            put({local, allBinaryLayer}, ((get({LayerManager, '$class'})):getLayerAt(LayerManager, Index))),
            (fun(Target_N68637) -> (get({Target_N68637, '$class'})):append(Target_N68637, get({CommonSeps, 'COMMA'})) end)((get({get({This, stringBuilder}), '$class'})):append(get({This, stringBuilder}), (get({get({local, allBinaryLayer}), '$class'})):getName(get({local, allBinaryLayer}))))
        end, lists:seq(0, Size - 1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({This, stringBuilder}), '$class'})):toString(get({This, stringBuilder})), This, get({This, 'REMOVE'})).

clear(This) ->
        (get({get({This, stringBuilder}), '$class'})):delete(get({This, stringBuilder}), 0, (get({get({This, stringBuilder}), '$class'})):length(get({This, stringBuilder}))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68952) -> (get({Target_N68952, '$class'})):toString(Target_N68952) end)((fun(Target_N68959) -> (get({Target_N68959, '$class'})):append(Target_N68959, get({This, 'CLEAR'})) end)((get({get({This, stringBuilder}), '$class'})):appendint(get({This, stringBuilder}), trunc((fun(Target_N68986) -> (get({Target_N68986, '$class'})):hashCode(Target_N68986, This) end)('TsUtil':getInstance()))))), This, get({This, 'CLEAR'})).

