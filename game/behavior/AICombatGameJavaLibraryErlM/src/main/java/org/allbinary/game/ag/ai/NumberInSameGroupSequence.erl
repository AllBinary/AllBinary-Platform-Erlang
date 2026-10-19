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
% import org.allbinary.logic.math.SmallIntegerSingletonFactory

-module('NumberInSameGroupSequence').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_ONE'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_TWO'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_THREE'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_SIX'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_NINE'}, undefined),
    put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE'}, undefined),
    ok.


getInstance() ->
        'NumberInSameGroupSequence':new().

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 100)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_ONE'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 101)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_TWO'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 102)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_THREE'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 103)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 104)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 105)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_SIX'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 106)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 107)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 108)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_NINE'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 109)),
        put({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE'}, array:from_list([get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_ONE'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_THREE'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_SIX'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT'}), get({This, 'NUMBER_ON_SAME_TEAM_SEQUENCE_NINE'})])).

