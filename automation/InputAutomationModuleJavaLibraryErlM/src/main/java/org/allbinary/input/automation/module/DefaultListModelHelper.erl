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
% package org.allbinary.input.automation.module
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.swing
% import org.allbinary.logic.StdUtil

-module('DefaultListModelHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, defaultListModel}, undefined),
    put({This, vector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, vector}, 'BasicArrayListD':new()),
        put({This, defaultListModel}, 'DefaultListModel':new()).

initDefaultModelList(This) ->
        put({This, defaultListModel}, 'DefaultListModel':new()),
        Size = (get({get({This, vector}), '$class'})):size(get({This, vector})),
        lists:foreach(fun(Index) ->
            ModuleName = (get({get({This, vector}), '$class'})):get(get({This, vector}), Index),
            (get({get({This, defaultListModel}), '$class'})):addElement(get({This, defaultListModel}), ModuleName)
        end, lists:seq(0, Size - 1)).

getListModel(This) ->
        get({This, defaultListModel}).

add(This, String) when (is_list(String) orelse String =:= undefined) ->
        (get({get({This, vector}), '$class'})):add(get({This, vector}), String).

remove(This, String) when (is_list(String) orelse String =:= undefined) ->
        (get({get({This, vector}), '$class'})):remove(get({This, vector}), String).

