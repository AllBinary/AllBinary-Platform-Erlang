% Generated Code Do Not Modify
% package org.allbinary.configuration
% import org.allbinary.game.configuration.feature.Feature
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.MainFeatureFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('ApplicationConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, fullscreen}, true),
    put({This, showTitleBar}, false),
    put({This, progressBarView}, false),
    ok.


getInstance() ->
        case (get({'ApplicationConfiguration', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'ApplicationConfiguration', instance}, 'ApplicationConfiguration':new());
            false -> ok
        end,
        get({'ApplicationConfiguration', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        try
            (get({This, '$class'})):read(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end.

% throws Exception
read(This) ->
        (get({This, '$class'})):setFullscreen(This, true),
        (get({This, '$class'})):setProgressBarView(This, false),
        (get({This, '$class'})):setShowTitleBar(This, false),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Read Configuration: ", (get({This, '$class'})):toString(This)]), This, "read").

% throws Exception
write(This) ->
        ok.

% throws Exception
update(This, GameFeature) ->
        case (GameFeature =:= get({'MainFeatureFactory':getInstance(), 'FULL_SCREEN'})) of
            true ->
            Features = 'Features':getInstance(),
            case (get({Features, '$class'})):isFeature(Features, GameFeature) of
                true ->
                case (not (get({This, '$class'})):isFullscreen(This)) of
                    true ->
                    (get({This, '$class'})):setFullscreen(This, true),
                    (get({This, '$class'})):write(This);
                    false -> ok
                end;
                false ->
                case (get({This, '$class'})):isFullscreen(This) of
                    true ->
                    (get({This, '$class'})):setFullscreen(This, false),
                    (get({This, '$class'})):write(This);
                    false -> ok
                end
            end;
            false -> ok
        end.

setFullscreen(This, Fullscreen) when is_boolean(Fullscreen) ->
        put({This, fullscreen}, Fullscreen).

isFullscreen(This) ->
        get({This, fullscreen}).

setShowTitleBar(This, ShowTitleBar) when is_boolean(ShowTitleBar) ->
        put({This, showTitleBar}, ShowTitleBar).

isShowTitleBar(This) ->
        get({This, showTitleBar}).

setProgressBarView(This, ProgressBarView) when is_boolean(ProgressBarView) ->
        put({This, progressBarView}, ProgressBarView).

isProgressBarView(This) ->
        get({This, progressBarView}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "isFullscreen: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isFullscreen(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isProgressBarView: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isProgressBarView(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isShowTitleBar: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isShowTitleBar(This)),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

