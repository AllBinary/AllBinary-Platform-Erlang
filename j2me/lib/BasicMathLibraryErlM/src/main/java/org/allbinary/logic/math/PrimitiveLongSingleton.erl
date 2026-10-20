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
% package org.allbinary.logic.math
% import org.allbinary.logic.string.StringMaker

-module('PrimitiveLongSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PrimitiveLongSingleton':new()),
    ok.

init_fields(This) ->
    put({This, 'UNK'}, array:from_list([$U, $n, $k])),
    put({This, 'NUMBER_ARRAY'}, array:from_list([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])),
    put({This, 'NUMBER_CHAR_ARRAY'}, array:from_list([$0, $1, $2, $3, $4, $5, $6, $7, $8, $9])),
    put({This, 'NUMBER_CHAR_ARRAYS'}, array:from_list([array:from_list([$0]), array:from_list([$1]), array:from_list([$2]), array:from_list([$3]), array:from_list([$4]), array:from_list([$5]), array:from_list([$6]), array:from_list([$7]), array:from_list([$8]), array:from_list([$9])])),
    put({This, 'ZERO'}, array:from_list([array:get(0, get({This, 'NUMBER_CHAR_ARRAY'}))])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PrimitiveLongSingleton', instance}).

% throws Exception
getNumberFromChar(This, NumberAsChar) when is_integer(NumberAsChar) ->
        try
        Size = array:size(get({This, 'NUMBER_CHAR_ARRAY'})),
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, 'NUMBER_CHAR_ARRAY'})) =:= NumberAsChar) of
                true ->
                throw({'$return', array:get(Index, get({This, 'NUMBER_ARRAY'}))});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', (fun(Target_N66392) -> (get({Target_N66392, '$class'})):toString(Target_N66392) end)((fun(Target_N66399) -> (get({Target_N66399, '$class'})):appendchar(Target_N66399, NumberAsChar) end)((fun(Target_N66406) -> (get({Target_N66406, '$class'})):append(Target_N66406, "numberAsChar was not in array: ") end)('StringMaker':new())))})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

