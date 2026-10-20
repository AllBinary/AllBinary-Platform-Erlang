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
% package org.allbinary.media.audio
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('PlayerQueue').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'TOTAL'}, "Sounds In Queue: "),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, max}, 0),
    ok.


new(Max) when is_integer(Max) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Max),
    This.

'$init'(This, Max) when is_integer(Max) ->
    init_fields(This),
        put({This, max}, Max).

add(This, Sound) ->
        try
            case (not (get({get({This, list}), '$class'})):contains(get({This, list}), Sound)) of
                true ->
                (get({get({This, list}), '$class'})):add(get({This, list}), Sound);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':put(get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'ADD'}))
        end.

process(This) ->
        put({local, sound}, 'NoSound':getInstance()),
        try
            put({local, played}, false),
            case ((get({get({This, list}), '$class'})):size(get({This, list})) > 0) of
                true ->
                put({local, sound}, (get({get({This, list}), '$class'})):removeAt(get({This, list}), 0)),
                case (get({local, sound}) =/= undefined) of
                    true ->
                    (fun(Target_N66419) -> (get({Target_N66419, '$class'})):start(Target_N66419) end)((get({get({local, sound}), '$class'})):getPlayerP(get({local, sound})));
                    false -> ok
                end,
                (fun Loop() -> case ((get({get({This, list}), '$class'})):size(get({This, list})) > get({This, max})) of true ->
                    (get({get({This, list}), '$class'})):removeAt(get({This, list}), 0),
                    Loop();
                false -> ok end end)(),
                put({local, played}, true);
                false -> ok
            end,
            get({local, played})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, resource}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (get({local, sound}) =/= undefined) of
                true ->
                put({local, resource}, (get({get({local, sound}), '$class'})):getResource(get({local, sound})));
                false -> ok
            end,
            'PreLogUtil':put((fun(Target_N66710) -> (get({Target_N66710, '$class'})):toString(Target_N66710) end)((fun(Target_N66717) -> (get({Target_N66717, '$class'})):append(Target_N66717, get({local, resource})) end)((fun(Target_N66724) -> (get({Target_N66724, '$class'})):append(Target_N66724, get({get({This, commonStrings}), 'EXCEPTION_LABEL'})) end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'PROCESS'})),
            false
        end.

clear(This) ->
        (get({get({This, list}), '$class'})):clear(get({This, list})).

toString(This) ->
        (fun(Target_N66915) -> (get({Target_N66915, '$class'})):toString(Target_N66915) end)((fun(Target_N66922) -> (get({Target_N66922, '$class'})):appendint(Target_N66922, (get({get({This, list}), '$class'})):size(get({This, list}))) end)((fun(Target_N66929) -> (get({Target_N66929, '$class'})):append(Target_N66929, get({'PlayerQueue', 'TOTAL'})) end)('StringMaker':new()))).

