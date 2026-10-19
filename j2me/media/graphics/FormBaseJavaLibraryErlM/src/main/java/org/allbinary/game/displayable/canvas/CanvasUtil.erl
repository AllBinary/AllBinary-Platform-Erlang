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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Canvas
% import org.allbinary.string.CommonPhoneStrings

-module('CanvasUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getKeyName(Key) when is_integer(Key) ->
        try
        CommonPhoneStrings = 'CommonPhoneStrings':getInstance(),
        case (Key =:= get({'Canvas', 'UP'})) of
            true ->
            throw({'$return', get({CommonPhoneStrings, 'UP'})});
            false ->
            case (Key =:= get({'Canvas', 'DOWN'})) of
            true ->
            throw({'$return', get({CommonPhoneStrings, 'DOWN'})});
            false ->
            case (Key =:= get({'Canvas', 'RIGHT'})) of
            true ->
            throw({'$return', get({CommonPhoneStrings, 'RIGHT'})});
            false ->
            case (Key =:= get({'Canvas', 'LEFT'})) of
            true ->
            throw({'$return', get({CommonPhoneStrings, 'LEFT'})});
            false ->
            case (Key =:= get({'Canvas', 'FIRE'})) of
            true ->
            throw({'$return', get({CommonPhoneStrings, 'FIRE'})});
            false -> ok
        end
        end
        end
        end
        end,
        "UNKNOWN KEY"
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

