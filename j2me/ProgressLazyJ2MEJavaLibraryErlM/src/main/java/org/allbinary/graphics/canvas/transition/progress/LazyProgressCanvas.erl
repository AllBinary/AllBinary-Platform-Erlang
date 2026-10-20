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
% package org.allbinary.graphics.canvas.transition.progress
% import org.allbinary.canvas.Processor
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.image.ImageCacheFactory

-module('LazyProgressCanvas').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProgressCanvas', Function, Arguments).

init_fields(This) ->
    ok.


new(Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Title, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Title, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'ProgressCanvas':'$init'(This, Title, BackgroundBasicColor, ForegroundBasicColor).

start(This) ->
        'ProgressCanvas':start(This),
        put({This, hasPainted}, false).

'end'(This) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'})),
            (get({This, '$class'})):endActual(This),
            put({This, paintable}, get({This, 'GAUGE_PAINTABLE'})),
            (fun(Target_N66054) -> (get({Target_N66054, '$class'})):runTask(Target_N66054) end)('ImageCacheFactory':getInstance()),
            (fun(Target_N66082) -> (get({Target_N66082, '$class'})):progressEnded(Target_N66082) end)('ImageCacheFactory':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'END_METHOD_NAME'}))
        end.

inGame(This) ->
        put({This, inGameProcessor}, 'Processor':getInstance()).

endFromInitialLazyLoadingComplete(This) ->
        'ProgressCanvas':endFromInitialLazyLoadingComplete(This),
        put({This, paintable}, 'NullPaintable':getInstance()).

endIfPaintedSinceStart(This) ->
        case ((get({This, paintable}) =:= get({This, 'GAUGE_PAINTABLE'})) andalso get({This, hasPainted})) of
            true ->
            (get({This, '$class'})):endFromInitialLazyLoadingComplete(This);
            false -> ok
        end.

