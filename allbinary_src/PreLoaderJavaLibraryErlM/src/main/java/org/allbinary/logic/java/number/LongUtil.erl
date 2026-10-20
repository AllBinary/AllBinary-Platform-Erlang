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
% package org.allbinary.logic.java.number
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonPhoneStrings

-module('LongUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

fillIn(End) when (is_list(End) orelse End =:= undefined) ->
        FrameStringBuffer = 'StringMaker':new(),
        case ((get({FrameStringBuffer, '$class'})):length(FrameStringBuffer) < get({'LongData', 'MAX_LONG_LENGTH'})) of
            true ->
            CommonPhoneStrings = 'CommonPhoneStrings':getInstance(),
            Size = (get({'LongData', 'MAX_LONG_LENGTH'}) - (get({FrameStringBuffer, '$class'})):length(FrameStringBuffer)),
            lists:foreach(fun(Index) ->
                (get({FrameStringBuffer, '$class'})):append(FrameStringBuffer, get({CommonPhoneStrings, 'ZERO'}))
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        (get({FrameStringBuffer, '$class'})):append(FrameStringBuffer, End),
        (get({FrameStringBuffer, '$class'})):toString(FrameStringBuffer).

