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
% package org.allbinary.graphics.opengles
% import javax.microedition.lcdui.Displayable
% import org.allbinary.J2MEUtil
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
% import org.allbinary.game.displayable.canvas.DemoCanvas
% import org.allbinary.game.displayable.canvas.GameInputMappingCanvas
% import org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas
% import org.allbinary.game.displayable.canvas.GameRunnable
% import org.allbinary.game.displayable.canvas.NullDisplayable
% import org.allbinary.game.displayable.canvas.NullWaitGameRunnable
% import org.allbinary.game.layer.SWTUtil
% import org.allbinary.game.score.displayable.HighScoresCanvas
% import org.allbinary.graphics.GraphicsStrings
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.thread.NullRunnable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('CurrentDisplayableFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CurrentDisplayableFactory':new()),
    ok.

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, canvasStrings}, 'CanvasStrings':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, 'SET_DISPLAYABLE'}, "setDisplayable"),
    put({This, 'SET_RUNNABLE'}, "setRunnable"),
    put({This, 'CLEAR_RUNNABLE'}, "clearRunnable"),
    put({This, 'SET_USED_RUNNABLE'}, "setUsedRunnable"),
    put({This, 'RUNNABLE'}, "Runnable: "),
    put({This, 'RUNNABLE_WAS_ALREADY_IN_USE'}, "Runnable was already in use: "),
    put({This, 'DEFAULT_CHILD_NAME_LIST'}, 'BasicArrayListD':new()),
    put({This, displayable}, 'NullDisplayable':getInstance()),
    put({This, openGlReadydisplayable}, 'NullDisplayable':getInstance()),
    put({This, runnable}, 'NullWaitGameRunnable':getInstance()),
    put({This, usedRunnable}, 'NullWaitGameRunnable':getInstance()),
    ok.


getInstance() ->
        get({'CurrentDisplayableFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({get({This, 'DEFAULT_CHILD_NAME_LIST'}), '$class'})):add(get({This, 'DEFAULT_CHILD_NAME_LIST'}), get({get({This, canvasStrings}), 'ABOUT'})),
        (get({get({This, 'DEFAULT_CHILD_NAME_LIST'}), '$class'})):add(get({This, 'DEFAULT_CHILD_NAME_LIST'}), get({get({This, canvasStrings}), 'OPTIONS'})),
        (get({get({This, 'DEFAULT_CHILD_NAME_LIST'}), '$class'})):add(get({This, 'DEFAULT_CHILD_NAME_LIST'}), get({'GameInputMappingCanvas', 'NAME'})),
        (get({get({This, 'DEFAULT_CHILD_NAME_LIST'}), '$class'})):add(get({This, 'DEFAULT_CHILD_NAME_LIST'}), get({'GameInputMappingInstructionsCanvas', 'NAME'})),
        (get({get({This, 'DEFAULT_CHILD_NAME_LIST'}), '$class'})):add(get({This, 'DEFAULT_CHILD_NAME_LIST'}), get({'HighScoresCanvas', 'NAME'})).

setMyCanvas(This, Displayable) ->
        try
        case allbinary_java:instance_of(get({This, displayable}), 'MyCanvas') of
            true ->
            case (get({Displayable, '$class'})):hasChild(Displayable, get({This, displayable})) of
                true ->
                'PreLogUtil':put((fun(Target_N67345) -> (get({Target_N67345, '$class'})):toString(Target_N67345) end)((fun(Target_N67352) -> (get({Target_N67352, '$class'})):append(Target_N67352, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Displayable)) end)((fun(Target_N67359) -> (get({Target_N67359, '$class'})):append(Target_N67359, "Child Displayable is already set for: ") end)('StringMaker':new()))), This, get({This, 'SET_DISPLAYABLE'})),
                throw({'$return', ok});
                false -> ok
            end;
            false -> ok
        end,
        (get({This, '$class'})):setDisplayable(This, Displayable)
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setDisplayable(This, Displayable) ->
        put({This, displayable}, Displayable),
        (get({This, '$class'})):setOpenGlReadydisplayable(This, Displayable).

setOpenGlReadydisplayable(This, OpenGlReadydisplayable) ->
        put({This, openGlReadydisplayable}, OpenGlReadydisplayable),
        (get({This, '$class'})):update(This).

getOpenGlReadydisplayable(This) ->
        get({This, openGlReadydisplayable}).

setRunnable(This, Runnable) ->
        'PreLogUtil':put((fun(Target_N67799) -> (get({Target_N67799, '$class'})):toString(Target_N67799) end)((fun(Target_N67806) -> (get({Target_N67806, '$class'})):append(Target_N67806, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Runnable)) end)((fun(Target_N67813) -> (get({Target_N67813, '$class'})):append(Target_N67813, get({This, 'RUNNABLE'})) end)('StringMaker':new()))), This, get({This, 'SET_RUNNABLE'})),
        put({This, runnable}, Runnable),
        case (get({This, usedRunnable}) =/= get({This, runnable})) of
            true ->
            (get({This, '$class'})):update(This);
            false ->
            'PreLogUtil':put((fun(Target_N67982) -> (get({Target_N67982, '$class'})):toString(Target_N67982) end)((fun(Target_N67989) -> (get({Target_N67989, '$class'})):append(Target_N67989, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), Runnable)) end)((fun(Target_N67996) -> (get({Target_N67996, '$class'})):append(Target_N67996, get({This, 'RUNNABLE_WAS_ALREADY_IN_USE'})) end)('StringMaker':new()))), This, get({This, 'SET_RUNNABLE'}))
        end.

clearRunnable(This) ->
        'PreLogUtil':put((fun(Target_N68183) -> (get({Target_N68183, '$class'})):toString(Target_N68183) end)((fun(Target_N68190) -> (get({Target_N68190, '$class'})):append(Target_N68190, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), 'NullRunnable':getInstance())) end)((fun(Target_N68197) -> (get({Target_N68197, '$class'})):append(Target_N68197, get({This, 'RUNNABLE'})) end)('StringMaker':new()))), This, get({This, 'CLEAR_RUNNABLE'})),
        (get({This, '$class'})):setUsedRunnable(This, 'NullWaitGameRunnable':getInstance()).

update(This) ->
        begin % synchronized
            CommonSeps = 'CommonSeps':getInstance(),
            Features = 'Features':getInstance(),
            StringMaker = 'StringMaker':new(),
            (get({StringMaker, '$class'})):append(StringMaker, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, openGlReadydisplayable}))),
            case (get({'SWTUtil', isSWT}) andalso (not (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})))) of
                true ->
                'PreLogUtil':put((fun(Target_N69465) -> (get({Target_N69465, '$class'})):toString(Target_N69465) end)((fun(Target_N69472) -> (get({Target_N69472, '$class'})):append(Target_N69472, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), 'NullRunnable':getInstance())) end)((fun(Target_N69479) -> (get({Target_N69479, '$class'})):append(Target_N69479, get({This, 'RUNNABLE'})) end)((fun(Target_N69486) -> (get({Target_N69486, '$class'})):append(Target_N69486, get({CommonSeps, 'SPACE'})) end)((fun(Target_N69493) -> (get({Target_N69493, '$class'})):append(Target_N69493, get({'SWTUtil', 'SWT'})) end)((get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'SPACE'}))))))), This, get({get({This, commonStrings}), 'UPDATE'})),
                (get({This, '$class'})):setUsedRunnable(This, 'NullWaitGameRunnable':getInstance());
                false ->
                case 'J2MEUtil':isHTML() of
                true ->
                'PreLogUtil':put((fun(Target_N69212) -> (get({Target_N69212, '$class'})):toString(Target_N69212) end)((fun(Target_N69219) -> (get({Target_N69219, '$class'})):append(Target_N69219, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, runnable}))) end)((fun(Target_N69226) -> (get({Target_N69226, '$class'})):append(Target_N69226, get({This, 'RUNNABLE'})) end)((fun(Target_N69233) -> (get({Target_N69233, '$class'})):append(Target_N69233, get({CommonSeps, 'SPACE'})) end)((fun(Target_N69240) -> (get({Target_N69240, '$class'})):append(Target_N69240, get({'GraphicsStrings':getInstance(), 'HTML'})) end)((get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'SPACE'}))))))), This, get({get({This, commonStrings}), 'UPDATE'})),
                (get({This, '$class'})):setUsedRunnable(This, get({This, runnable}));
                false ->
                case ((allbinary_java:instance_of(get({This, openGlReadydisplayable}), 'DemoCanvas') orelse allbinary_java:instance_of(get({This, openGlReadydisplayable}), 'AllBinaryGameCanvas')) orelse (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'}))) of
                true ->
                'PreLogUtil':put((fun(Target_N68951) -> (get({Target_N68951, '$class'})):toString(Target_N68951) end)((fun(Target_N68958) -> (get({Target_N68958, '$class'})):append(Target_N68958, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, runnable}))) end)((fun(Target_N68965) -> (get({Target_N68965, '$class'})):append(Target_N68965, get({This, 'RUNNABLE'})) end)((fun(Target_N68972) -> (get({Target_N68972, '$class'})):append(Target_N68972, get({CommonSeps, 'SPACE'})) end)((fun(Target_N68979) -> (get({Target_N68979, '$class'})):append(Target_N68979, (fun(Target_N69023) -> (get({Target_N69023, '$class'})):toString(Target_N69023) end)(get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'}))) end)((get({StringMaker, '$class'})):append(StringMaker, get({CommonSeps, 'SPACE'}))))))), This, get({get({This, commonStrings}), 'UPDATE'})),
                (get({This, '$class'})):setUsedRunnable(This, get({This, runnable}));
                false ->
                'PreLogUtil':put((fun(Target_N68778) -> (get({Target_N68778, '$class'})):toString(Target_N68778) end)((fun(Target_N68785) -> (get({Target_N68785, '$class'})):append(Target_N68785, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), 'NullRunnable':getInstance())) end)((get({StringMaker, '$class'})):append(StringMaker, get({This, 'RUNNABLE'})))), This, get({get({This, commonStrings}), 'UPDATE'})),
                (get({This, '$class'})):setUsedRunnable(This, 'NullWaitGameRunnable':getInstance())
            end
            end
            end
        end.

getDisplayable(This) ->
        get({This, displayable}).

getUsedRunnable(This) ->
        get({This, usedRunnable}).

setUsedRunnable(This, UsedRunnable) ->
        'PreLogUtil':put((fun(Target_N69840) -> (get({Target_N69840, '$class'})):toString(Target_N69840) end)((fun(Target_N69847) -> (get({Target_N69847, '$class'})):append(Target_N69847, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), UsedRunnable)) end)((fun(Target_N69854) -> (get({Target_N69854, '$class'})):append(Target_N69854, get({'CommonSeps':getInstance(), 'COLON_SEP'})) end)((fun(Target_N69861) -> (get({Target_N69861, '$class'})):append(Target_N69861, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), get({This, runnable}))) end)((fun(Target_N69868) -> (get({Target_N69868, '$class'})):append(Target_N69868, get({This, 'RUNNABLE'})) end)('StringMaker':new()))))), This, get({This, 'SET_USED_RUNNABLE'})),
        put({This, usedRunnable}, UsedRunnable).

