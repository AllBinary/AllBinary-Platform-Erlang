% Generated Code Do Not Modify
% package org.allbinary.time
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.ThreadObjectUtil

-module('StupidTimer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, nullUtil}, 'NullUtil':getInstance()),
    put({This, threadObjectUtil}, 'ThreadObjectUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


visitBool(This, VisitorInterface) ->
        Result = (get({VisitorInterface, '$class'})):visit(VisitorInterface, get({get({This, nullUtil}), 'NULL_OBJECT'})),
        Result2 = (get({Result, '$class'})):booleanValue(Result),
        Result2.

% throws Exception
visit(This, VisitorInterface, TimeDelayHelper) ->
        put({local, tookTooLong}, false),
        WAITING_FOR = "Waiting for: ",
        'PreLogUtil':put((fun(Target_N66302) -> (get({Target_N66302, '$class'})):toString(Target_N66302) end)((fun(Target_N66309) -> (get({Target_N66309, '$class'})):append(Target_N66309, (fun(Target_N66349) -> (get({Target_N66349, '$class'})):toString(Target_N66349, VisitorInterface) end)('StringUtil':getInstance())) end)((fun(Target_N66316) -> (get({Target_N66316, '$class'})):append(Target_N66316, WAITING_FOR) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'VISIT'})),
        put({local, index}, 0),
        (fun Loop() -> case (get({This, '$class'})):visitBool(This, VisitorInterface) of true ->
            case ((get({local, index}) rem 10) =:= 0) of
                true ->
                'PreLogUtil':put((fun(Target_N66505) -> (get({Target_N66505, '$class'})):toString(Target_N66505) end)((fun(Target_N66512) -> (get({Target_N66512, '$class'})):appendint(Target_N66512, get({local, index})) end)((fun(Target_N66519) -> (get({Target_N66519, '$class'})):append(Target_N66519, WAITING_FOR) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'VISIT'}));
                false -> ok
            end,
            put({local, index}, get({local, index}) + 1),
            begin % synchronized
                (get({get({This, threadObjectUtil}), '$class'})):waitObjectFor(get({This, threadObjectUtil}), This, 1800)
            end,
            case (get({TimeDelayHelper, '$class'})):isTimeTNT(TimeDelayHelper) of
                true ->
                put({local, tookTooLong}, true),
                throw('$break');
                false -> ok
            end,
            Loop();
        false -> ok end end)(),
        case get({local, tookTooLong}) of
            true ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'VISIT'}), {'Exception', (fun(Target_N66892) -> (get({Target_N66892, '$class'})):toString(Target_N66892) end)((fun(Target_N66899) -> (get({Target_N66899, '$class'})):append(Target_N66899, (fun(Target_N66935) -> (get({Target_N66935, '$class'})):toString(Target_N66935, VisitorInterface) end)('StringUtil':getInstance())) end)((fun(Target_N66906) -> (get({Target_N66906, '$class'})):append(Target_N66906, "Took Too Long: ") end)('StringMaker':new())))});
            false ->
            'PreLogUtil':put((get({TimeDelayHelper, '$class'})):toString(TimeDelayHelper), This, get({get({This, commonStrings}), 'VISIT'}))
        end.

% throws Exception
stopWaiting(This) ->
        begin % synchronized
            (get({get({This, threadObjectUtil}), '$class'})):notifyObject(get({This, threadObjectUtil}), This)
        end.

