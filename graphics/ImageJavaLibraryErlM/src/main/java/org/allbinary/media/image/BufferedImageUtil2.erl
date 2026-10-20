% Generated Code Do Not Modify
% package org.allbinary.media.image
% import java.awt
% import java.awt.image.BufferedImage

-module('BufferedImageUtil2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BufferedImageUtil2':new()),
    ok.

init_fields(This) ->
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BufferedImageUtil2', instance}).

createSpriteImage(This, BufferedImageArray) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined) ->
        put({local, columns}, array:size(BufferedImageArray)),
        Max = get({local, columns}),
        put({local, rows}, 0),
        case (array:size(BufferedImageArray) < get({local, columns})) of
            true ->
            put({local, columns}, array:size(BufferedImageArray));
            false -> ok
        end,
        put({local, rows}, ((array:size(BufferedImageArray) div get({local, columns})))),
        case ((array:size(BufferedImageArray) rem get({local, columns})) =/= 0) of
            true ->
            put({local, rows}, get({local, rows}) + 1);
            false -> ok
        end,
        BufferedImage = (get({get({This, imageUtil}), '$class'})):create(get({This, imageUtil}), ((fun(Target_N66114) -> (get({Target_N66114, '$class'})):getWidth(Target_N66114, undefined) end)(array:get(0, BufferedImageArray)) * get({local, columns})), ((fun(Target_N66157) -> (get({Target_N66157, '$class'})):getHeight(Target_N66157, undefined) end)(array:get(0, BufferedImageArray)) * get({local, rows}))),
        G = (get({BufferedImage, '$class'})):createGraphics(BufferedImage),
        put({local, columnIndex}, 0),
        put({local, rowIndex}, 0),
        lists:foreach(fun(Index) ->
            case (((Index div Max) =/= 0) andalso ((Index rem Max) =:= 0)) of
                true ->
                put({local, rowIndex}, get({local, rowIndex}) + 1),
                put({local, columnIndex}, 0);
                false -> ok
            end,
            (get({G, '$class'})):drawImage(G, array:get(Index, BufferedImageArray), ((fun(Target_N66481) -> (get({Target_N66481, '$class'})):getWidth(Target_N66481, undefined) end)(array:get(Index, BufferedImageArray)) * get({local, columnIndex})), ((fun(Target_N66528) -> (get({Target_N66528, '$class'})):getHeight(Target_N66528, undefined) end)(array:get(Index, BufferedImageArray)) * get({local, rowIndex})), (fun(Target_N66571) -> (get({Target_N66571, '$class'})):getWidth(Target_N66571, undefined) end)(array:get(Index, BufferedImageArray)), (fun(Target_N66605) -> (get({Target_N66605, '$class'})):getHeight(Target_N66605, undefined) end)(array:get(Index, BufferedImageArray)), undefined),
            put({local, columnIndex}, get({local, columnIndex}) + 1)
        end, lists:seq(0, array:size(BufferedImageArray) - 1)),
        (get({G, '$class'})):dispose(G),
        BufferedImage.

