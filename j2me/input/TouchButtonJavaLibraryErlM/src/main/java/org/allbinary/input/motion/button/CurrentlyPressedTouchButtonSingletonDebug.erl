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
% package org.allbinary.input.motion.button
% import org.allbinary.graphics.GPoint
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps

-module('CurrentlyPressedTouchButtonSingletonDebug').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CurrentlyPressedTouchButtonSingleton', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'CurrentlyPressedTouchButtonSingletonDebug':new()),
    ok.

init_fields(This) ->
    put({This, string}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, listString}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, append}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, 'PRESSED_AND_FIRED'}, "pressed & fired"),
    put({This, 'PRESSED_AND_NOT_FIRED'}, "pressed in button but not fired"),
    put({This, 'ASSOCIATED_RELEASED_AND_FIRED'}, "assoc. rel & fired"),
    put({This, 'RELEASED_AND_FIRED'}, "rel & fired 1"),
    put({This, 'RELEASED_AND_FIRED_2'}, "rel & fired 2"),
    put({This, 'RELEASED_AND_NOT_FIRED'}, "rel & not fired"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'CurrentlyPressedTouchButtonSingleton':init(This),
    init_fields(This).


getInstance() ->
        get({'CurrentlyPressedTouchButtonSingletonDebug', instanceC}).

appendTouchButtonInput(This, Append, TouchButtonInput) when (is_list(Append) orelse Append =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({TouchButtonInput, '$class'})):toString(TouchButtonInput)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Append),
        put({This, append}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
        put({This, string}, (fun(Target_N66421) -> (get({Target_N66421, '$class'})):toString(Target_N66421) end)((fun(Target_N66428) -> (get({Target_N66428, '$class'})):append(Target_N66428, get({This, append})) end)((fun(Target_N66435) -> (get({Target_N66435, '$class'})):append(Target_N66435, get({This, listString})) end)('StringMaker':new())))).

append(This, Append) when (is_list(Append) orelse Append =:= undefined) ->
        put({This, append}, (fun(Target_N66567) -> (get({Target_N66567, '$class'})):toString(Target_N66567) end)((fun(Target_N66574) -> (get({Target_N66574, '$class'})):append(Target_N66574, Append) end)((fun(Target_N66581) -> (get({Target_N66581, '$class'})):append(Target_N66581, get({This, append})) end)('StringMaker':new())))),
        put({This, string}, (fun(Target_N66648) -> (get({Target_N66648, '$class'})):toString(Target_N66648) end)((fun(Target_N66655) -> (get({Target_N66655, '$class'})):append(Target_N66655, get({This, append})) end)((fun(Target_N66662) -> (get({Target_N66662, '$class'})):append(Target_N66662, get({This, listString})) end)('StringMaker':new())))).

clearLog(This, X, Y) when is_integer(X), is_integer(Y) ->
        put({This, append}, (fun(Target_N66777) -> (get({Target_N66777, '$class'})):toString(Target_N66777) end)((fun(Target_N66784) -> (get({Target_N66784, '$class'})):append(Target_N66784, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N66791) -> (get({Target_N66791, '$class'})):append(Target_N66791, 'GPoint':toStringStatic(X, Y, 0)) end)('StringMaker':new())))),
        put({This, string}, (fun(Target_N66902) -> (get({Target_N66902, '$class'})):toString(Target_N66902) end)((fun(Target_N66909) -> (get({Target_N66909, '$class'})):append(Target_N66909, get({This, append})) end)((fun(Target_N66916) -> (get({Target_N66916, '$class'})):append(Target_N66916, get({This, listString})) end)('StringMaker':new())))).

releaseAndNotFired(This) ->
        (get({This, '$class'})):append(This, get({This, 'RELEASED_AND_NOT_FIRED'})).

releaseAndFired(This, TouchButtonInput) ->
        (get({This, '$class'})):appendTouchButtonInput(This, get({This, 'RELEASED_AND_FIRED'}), TouchButtonInput).

releaseAndFired2(This, TouchButtonInput) ->
        (get({This, '$class'})):appendTouchButtonInput(This, get({This, 'RELEASED_AND_FIRED_2'}), TouchButtonInput).

releaseAndFiredAssociated(This, TouchButtonInput) ->
        (get({This, '$class'})):appendTouchButtonInput(This, get({This, 'ASSOCIATED_RELEASED_AND_FIRED'}), TouchButtonInput).

pressedAndFired(This, TouchButtonInput) ->
        (get({This, '$class'})):appendTouchButtonInput(This, get({This, 'PRESSED_AND_FIRED'}), TouchButtonInput).

pressedAndNotFired(This, TouchButtonInput) ->
        (get({This, '$class'})):appendTouchButtonInput(This, get({This, 'PRESSED_AND_NOT_FIRED'}), TouchButtonInput).

removeAt(This, Index) when is_integer(Index) ->
        TouchButtonInput = 'CurrentlyPressedTouchButtonSingleton':removeAt(This, Index),
        put({This, listString}, (get({get({This, list}), '$class'})):toString(get({This, list}))),
        put({This, string}, (fun(Target_N67592) -> (get({Target_N67592, '$class'})):toString(Target_N67592) end)((fun(Target_N67599) -> (get({Target_N67599, '$class'})):append(Target_N67599, get({This, append})) end)((fun(Target_N67606) -> (get({Target_N67606, '$class'})):append(Target_N67606, get({This, listString})) end)('StringMaker':new())))),
        TouchButtonInput.

remove(This, TouchButtonInput) ->
        IsRemoved = 'CurrentlyPressedTouchButtonSingleton':remove(This, TouchButtonInput),
        put({This, listString}, (get({get({This, list}), '$class'})):toString(get({This, list}))),
        put({This, string}, (fun(Target_N67829) -> (get({Target_N67829, '$class'})):toString(Target_N67829) end)((fun(Target_N67836) -> (get({Target_N67836, '$class'})):append(Target_N67836, get({This, append})) end)((fun(Target_N67843) -> (get({Target_N67843, '$class'})):append(Target_N67843, get({This, listString})) end)('StringMaker':new())))),
        IsRemoved.

add(This, TouchButtonInput) ->
        'CurrentlyPressedTouchButtonSingleton':add(This, TouchButtonInput),
        put({This, listString}, (get({get({This, list}), '$class'})):toString(get({This, list}))),
        put({This, string}, (fun(Target_N68047) -> (get({Target_N68047, '$class'})):toString(Target_N68047) end)((fun(Target_N68054) -> (get({Target_N68054, '$class'})):append(Target_N68054, get({This, append})) end)((fun(Target_N68061) -> (get({Target_N68061, '$class'})):append(Target_N68061, get({This, listString})) end)('StringMaker':new())))).

toString(This) ->
        get({This, string}).

