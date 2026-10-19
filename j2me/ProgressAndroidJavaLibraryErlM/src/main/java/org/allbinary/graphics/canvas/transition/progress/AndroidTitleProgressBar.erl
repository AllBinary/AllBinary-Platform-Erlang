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
% package org.allbinary.graphics.canvas.transition.progress
% import javax.microedition.lcdui.Graphics
% import org.allbinary.android.activity.NullProgressActivity
% import org.allbinary.android.activity.ProgressActivityInterface
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('AndroidTitleProgressBar').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProgressCanvas', Function, Arguments).

init_fields(This) ->
    put({This, showTitleProgressBarRunnable}, 'ShowTitleProgressBarRunnable':new(This)),
    put({This, dismissTitleProgressBarRunnable}, 'DismissTitleProgressBarRunnable':new(This)),
    put({This, progressDialogPortionSetProgressRunnable}, 'TitleProgressBarPortionSetProgressRunnable':new(This)),
    put({This, progressDialogSetProgressRunnable}, 'TitleProgressBarSetProgressRunnable':new(This)),
    put({This, progressActivity}, get({'NullProgressActivity', 'NULL_PROGRESS_ACTIVITY'})),
    put({This, portion}, 0),
    ok.


new(Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Title, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'ProgressCanvas':init(This, Title, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This).

init(This, Activity) ->
        put({This, progressActivity}, Activity).

isInitialized(This) ->
        try
        case (get({This, progressActivity}) =/= get({'NullProgressActivity', 'NULL_PROGRESS_ACTIVITY'})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

start(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'START_METHOD_NAME'})),
            'ProgressCanvas':start(This),
            (get({get({This, progressActivity}), '$class'})):runOnUiThread(get({This, progressActivity}), get({This, showTitleProgressBarRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'START_METHOD_NAME'}), E)
        end.

'end'(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'})),
            (get({get({This, progressActivity}), '$class'})):runOnUiThread(get({This, progressActivity}), get({This, dismissTitleProgressBarRunnable})),
            'ProgressCanvas':'end'(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'}), E)
        end.

addPortion(This, Value, Text, Index) when is_integer(Value), (is_list(Text) orelse Text =:= undefined), is_integer(Index) ->
        try
            'ProgressCanvas':addPortion(This, Value, Text, Index),
            put({This, portion}, Value),
            (get({get({This, progressActivity}), '$class'})):runOnUiThread(get({This, progressActivity}), get({This, progressDialogPortionSetProgressRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'ADD_PORTION'}), E)
        end.

addNormalPortion(This, Value, Text) when is_integer(Value), (is_list(Text) orelse Text =:= undefined) ->
        try
            'ProgressCanvas':addNormalPortion(This, Value, Text),
            put({This, portion}, Value),
            (get({get({This, progressActivity}), '$class'})):runOnUiThread(get({This, progressActivity}), get({This, progressDialogPortionSetProgressRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'ADD_PORTION'}), E)
        end.

setValue(This, Value) when is_integer(Value) ->
        try
            'ProgressCanvas':setValue(This, Value),
            (get({get({This, progressActivity}), '$class'})):runOnUiThread(get({This, progressActivity}), get({This, progressDialogSetProgressRunnable}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setValue", E)
        end.

waitUntilDisplayed(This) ->
        ok.

paint(This, Graphics) ->
        ok.
% Java nested class TitleProgressBarSetProgressRunnable: move it to its own module 'TitleProgressBarSetProgressRunnable'
% Java nested class TitleProgressBarPortionSetProgressRunnable: move it to its own module 'TitleProgressBarPortionSetProgressRunnable'
% Java nested class ShowTitleProgressBarRunnable: move it to its own module 'ShowTitleProgressBarRunnable'
% Java nested class DismissTitleProgressBarRunnable: move it to its own module 'DismissTitleProgressBarRunnable'

