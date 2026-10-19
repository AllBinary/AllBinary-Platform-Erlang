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
% package org.allbinary.logic.java.help
% import java.net.URL
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.help.HelpSet

-module('JavaHelpSetNotifier').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, vector}, 'BasicArrayListD':new()),
    ok.

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

get() ->
        get({'JavaHelpSetNotifier', vector}).

isNotified(HelpSet) ->
        put({local, isNotified}, false),
        Url = (get({HelpSet, '$class'})):getHelpSetURL(HelpSet),
        Size = (get({get({'JavaHelpSetNotifier', vector}), '$class'})):size(get({'JavaHelpSetNotifier', vector})),
        UrlArray = (get({get({'JavaHelpSetNotifier', vector}), '$class'})):toArray(get({'JavaHelpSetNotifier', vector})),
        lists:foreach(fun(I) ->
            NextURL = array:get(I, UrlArray),
            case ((fun(Target_N66051) -> (get({Target_N66051, '$class'})):compareTo(Target_N66051, (get({NextURL, '$class'})):toString(NextURL)) end)((get({Url, '$class'})):toString(Url)) =:= 0) of
                true ->
                put({local, isNotified}, true);
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({get({'JavaHelpSetNotifier', vector}), '$class'})):add(get({'JavaHelpSetNotifier', vector}), Url),
        get({local, isNotified}).

