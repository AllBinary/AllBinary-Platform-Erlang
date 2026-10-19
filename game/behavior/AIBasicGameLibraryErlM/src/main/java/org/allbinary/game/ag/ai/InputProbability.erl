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
% package org.allbinary.game.ag.ai
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.ABHashtable

-module('InputProbability').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'INPUT_PROBABILITY'}, (fun(Target_N65712) -> (get({Target_N65712, '$class'})):getAt(Target_N65712, 0) end)('SmallIntegerSingletonFactory':getInstance())),
    ok.

init_fields(This) ->
    put({This, likelyhoodIntegerArray}, undefined),
    put({This, repeatLikelyhoodIntegerArray}, undefined),
    put({This, max}, 0),
    put({This, timeDelayHelper}, undefined),
    ok.


new(LikelyhoodIntegerArray, RepeatLikelyhoodIntegerArray, Max, TimeDelayHelper) when (is_tuple(LikelyhoodIntegerArray) orelse LikelyhoodIntegerArray =:= undefined), (is_tuple(RepeatLikelyhoodIntegerArray) orelse RepeatLikelyhoodIntegerArray =:= undefined), is_integer(Max) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LikelyhoodIntegerArray, RepeatLikelyhoodIntegerArray, Max, TimeDelayHelper),
    This.

init(This, LikelyhoodIntegerArray, RepeatLikelyhoodIntegerArray, Max, TimeDelayHelper) when (is_tuple(LikelyhoodIntegerArray) orelse LikelyhoodIntegerArray =:= undefined), (is_tuple(RepeatLikelyhoodIntegerArray) orelse RepeatLikelyhoodIntegerArray =:= undefined), is_integer(Max) ->
    init_fields(This),
        put({This, likelyhoodIntegerArray}, LikelyhoodIntegerArray),
        put({This, repeatLikelyhoodIntegerArray}, RepeatLikelyhoodIntegerArray),
        put({This, max}, Max),
        put({This, timeDelayHelper}, TimeDelayHelper).

getLikelyhoodIntegerArray(This) ->
        get({This, likelyhoodIntegerArray}).

getRepeatLikelyhoodIntegerArray(This) ->
        get({This, repeatLikelyhoodIntegerArray}).

getMax(This) ->
        get({This, max}).

getTimeDelayHelper(This) ->
        get({This, timeDelayHelper}).

toHashtable(This) ->
        Hashtable = (fun(Target_N66331) -> (get({Target_N66331, '$class'})):createHashtable(Target_N66331) end)('StdUtil':getInstance()),
        (get({Hashtable, '$class'})):put(Hashtable, get({'InputProbability', 'INPUT_PROBABILITY'}), This),
        Hashtable.

