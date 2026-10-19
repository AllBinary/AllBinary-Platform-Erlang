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
% package org.allbinary.logic.control.validate
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil
% import org.allbinary.util.ABHashtable

-module('ValidatorBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements ValidatorBaseInterface

static_init() ->
    put({?MODULE, instance}, 'ValidatorBase':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ValidatorBase', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

isValid(This) ->
        get({'BooleanFactory':getInstance(), 'TRUE'}).

validationInfo(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

toHashtable(This) ->
        get({'StdUtil':getInstance(), 'NULL_TABLE'}).

toList(This) ->
        (fun(Target_N66135) -> (get({Target_N66135, '$class'})):getImmutableInstance(Target_N66135) end)('BasicArrayListUtil':getInstance()).

