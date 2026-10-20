% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package javax.microedition.lcdui

-module('ChoiceGroupImageFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ChoiceGroupImageFactory':new()),
    ok.

init_fields(This) ->
    put({This, multiOff}, array:from_list([(-119), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 10, 0, 0, 0, 11, 2, 3, 0, 0, 0, 59, 0, (-12), (-117), 0, 0, 0, 6, 80, 76, 84, 69, (-1), (-1), (-1), (-69), (-69), (-69), (-57), 75, (-33), (-8), 0, 0, 0, 30, 73, 68, 65, 84, 120, (-38), 99, 96, 96, 96, 96, 12, 101, (-8), (-51), (-32), (-64), 32, (-64), (-60), (-64), (-64), (-128), 11, 51, (-122), 50, (-4), 6, 0, 63, 116, 3, 1, 53, (-108), 39, (-26), 0, 0, 0, 0, 73, 69, 78, 68, (-82), 66, 96, (-126)])),
    put({This, multiOn}, array:from_list([(-119), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 10, 0, 0, 0, 11, 2, 3, 0, 0, 0, 59, 0, (-12), (-117), 0, 0, 0, 12, 80, 76, 84, 69, (-1), (-1), (-1), (-69), (-69), (-69), 106, 106, 106, 2, 2, 2, 106, (-103), 14, (-47), 0, 0, 0, 53, 73, 68, 65, 84, 120, (-38), 99, 96, 96, 124, (-64), (-16), (-1), (-77), 3, (-45), 65, (-111), 15, 76, 12, 108, 12, 76, 12, (-4), 12, 76, 12, 18, 12, 76, (-68), 127, 24, (-104), 126, 45, 96, 96, (-7), (-11), (-109), (-127), (-23), (-65), 3, 3, (-29), 127, (-122), (-113), 0, 5, 37, 12, (-34), 1, (-99), (-83), 100, 0, 0, 0, 0, 73, 69, 78, 68, (-82), 66, 96, (-126)])),
    put({This, radioOff}, array:from_list([(-119), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 11, 0, 0, 0, 11, 2, 3, 0, 0, 0, (-44), (-62), (-97), (-75), 0, 0, 0, 9, 80, 76, 84, 69, (-1), (-1), (-1), (-69), (-69), (-69), 106, 106, 106, (-44), 13, (-1), (-24), 0, 0, 0, 42, 73, 68, 65, 84, 120, (-38), 99, 96, 90, (-59), (-64), 32, (-63), 48, (-127), 65, (-127), 65, (-127), 41, (-127), (-31), 5, 19, 3, 3, 3, 50, 102, 80, 96, 80, 96, (-6), (-63), 80, (-64), (-64), (-76), (-118), 1, 0, 113, 24, 5, 61, 73, (-68), (-100), 98, 0, 0, 0, 0, 73, 69, 78, 68, (-82), 66, 96, (-126)])),
    put({This, radioOn}, array:from_list([(-119), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 11, 0, 0, 0, 11, 2, 3, 0, 0, 0, (-44), (-62), (-97), (-75), 0, 0, 0, 12, 80, 76, 84, 69, (-1), (-1), (-1), (-69), (-69), (-69), 106, 106, 106, 2, 2, 2, 106, (-103), 14, (-47), 0, 0, 0, 50, 73, 68, 65, 84, 120, (-38), 5, (-63), 65, 13, 0, 32, 12, 4, (-63), (-19), (-11), (-117), 1, 18, 68, (-100), 10, 52, 19, 94, 72, 64, 17, 101, (-122), 44, (-44), (-29), 98, (-52), 89, 77, (-102), 40, 2, 85, (-95), (-73), (-63), (-104), (-63), 37, (-117), 15, (-40), 119, 10, 41, 78, 26, (-79), 59, 0, 0, 0, 0, 73, 69, 78, 68, (-82), 66, 96, (-126)])),
    put({This, imgMultiOffO}, 'Image':createImage(get({This, multiOff}), 0, array:size(get({This, multiOff})))),
    put({This, imgMultiOnO}, 'Image':createImage(get({This, multiOn}), 0, array:size(get({This, multiOn})))),
    put({This, imgRadioOffO}, 'Image':createImage(get({This, radioOff}), 0, array:size(get({This, radioOff})))),
    put({This, imgRadioOnO}, 'Image':createImage(get({This, radioOn}), 0, array:size(get({This, radioOn})))),
    put({This, imgMultiOff}, get({This, imgMultiOffO})),
    put({This, imgMultiOn}, get({This, imgMultiOnO})),
    put({This, imgRadioOff}, get({This, imgRadioOffO})),
    put({This, imgRadioOn}, get({This, imgRadioOnO})),
    put({This, imageArray}, array:from_list([get({This, imgMultiOff}), get({This, imgMultiOn}), get({This, imgRadioOff}), get({This, imgRadioOn})])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ChoiceGroupImageFactory', instance}).

getImageArray(This) ->
        get({This, imageArray}).

init(This, ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        put({This, imgMultiOff}, array:get(0, ImageArray)),
        put({This, imageArray}, array:set(0, get({This, imgMultiOff}), get({This, imageArray}))),
        put({This, imgMultiOn}, array:get(1, ImageArray)),
        put({This, imageArray}, array:set(1, get({This, imgMultiOn}), get({This, imageArray}))),
        put({This, imgRadioOff}, array:get(2, ImageArray)),
        put({This, imageArray}, array:set(2, get({This, imgRadioOff}), get({This, imageArray}))),
        put({This, imgRadioOn}, array:get(3, ImageArray)),
        put({This, imageArray}, array:set(3, get({This, imgRadioOn}), get({This, imageArray}))).

