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
% package org.allbinary.content
% import javax.microedition.lcdui.Command
% import android.content.Intent
% import android.net.Uri
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('CommandUriAction').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'CommandUriAction':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, hashtable}, (fun(Target_N65952) -> (get({Target_N65952, '$class'})):createHashtable(Target_N65952) end)('StdUtil':getInstance())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'CommandUriAction', instance}).

add(This, Command, Url) when (is_list(Url) orelse Url =:= undefined) ->
        (get({get({This, hashtable}), '$class'})):put(get({This, hashtable}), Command, Url).

process(This, Command) ->
        try
            Intent = (get({This, '$class'})):getIntent(This, Command),
            (fun(Target_N66186) -> (get({Target_N66186, '$class'})):startActivity(Target_N66186, Intent) end)((fun(Target_N66193) -> (get({Target_N66193, '$class'})):getContext(Target_N66193) end)('ResourceUtil':getInstance()))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'PROCESS'}), E)
        end.

getIntent(This, Command) ->
        Url = (get({get({This, hashtable}), '$class'})):get(get({This, hashtable}), Command),
        Uri = 'Uri':parse(Url),
        Intent = 'Intent':new(get({'Intent', 'ACTION_VIEW'}), Uri),
        Intent.

