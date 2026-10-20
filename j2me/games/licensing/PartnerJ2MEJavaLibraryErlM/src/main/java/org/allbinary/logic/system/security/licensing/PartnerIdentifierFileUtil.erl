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
% package org.allbinary.logic.system.security.licensing
% import java.io.InputStream
% import java.io.InputStreamReader
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('PartnerIdentifierFileUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PartnerIdentifierFileUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'FILE_NAME'}, "partner.txt"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'PartnerIdentifierFileUtil', instance}).

get(This) ->
        try
            ResourceUtil = 'ResourceUtil':getInstance(),
            InputStream = (get({ResourceUtil, '$class'})):getResourceAsStream(ResourceUtil, get({This, 'FILE_NAME'})),
            InputStreamReader = 'InputStreamReader':new(InputStream),
            Chars = array:new(30, {default, 0}),
            Size = (get({InputStreamReader, '$class'})):read(InputStreamReader, Chars),
            put({local, partnerString}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (Size > 0) of
                true ->
                put({local, partnerString}, allbinary_java:to_string(Chars, 0, Size));
                false -> ok
            end,
            (get({InputStreamReader, '$class'})):close(InputStreamReader),
            get({local, partnerString})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET'}), E),
            get({'StringUtil':getInstance(), 'NULL_STRING'})
        end.

