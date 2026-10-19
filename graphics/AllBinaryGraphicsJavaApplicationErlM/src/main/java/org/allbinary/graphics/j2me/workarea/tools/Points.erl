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
% package org.allbinary.graphics.j2me.workarea.tools
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('Points').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PointsInterface

init_fields(This) ->
    put({This, pointVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, pointVector}, 'BasicArrayListD':new()).

init(This) ->
        (get({get({This, pointVector}), '$class'})):clear(get({This, pointVector})).

getPoints(This) ->
        get({This, pointVector}).

addPoints(This, Vector) ->
        (get({get({This, pointVector}), '$class'})):addAll2(get({This, pointVector}), Vector).

isValid(This) ->
        try
        case ((get({get({This, pointVector}), '$class'})):size(get({This, pointVector})) > 1) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getSize(This) ->
        (get({get({This, pointVector}), '$class'})):size(get({This, pointVector})).

