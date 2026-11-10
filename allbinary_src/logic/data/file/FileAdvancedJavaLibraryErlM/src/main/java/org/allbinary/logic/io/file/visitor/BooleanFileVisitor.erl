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
% package org.allbinary.logic.io.file.visitor
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.util.visitor.VisitorInterface
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('BooleanFileVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements VisitorInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, filterStringBasicArrayList}, undefined),
    ok.


new(FilterStringBasicArrayList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, FilterStringBasicArrayList),
    This.

'$init'(This, FilterStringBasicArrayList) ->
    init_fields(This),
        (get({This, '$class'})):setFilterStringBasicArrayList(This, FilterStringBasicArrayList),
        'PreLogUtil':put(lists:concat(["Filter BasicArrayList: ", (fun(Target_N65905) -> (get({Target_N65905, '$class'})):toString(Target_N65905) end)((get({This, '$class'})):getFilterStringBasicArrayList(This))]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

visit(This, AnyType) ->
        (get({This, '$class'})):visit(This, AnyType)
% unreachable Java overload visit(AbFile file) has the same guards as an earlier clause
.


getFilterStringBasicArrayList(This) ->
        get({This, filterStringBasicArrayList}).

setFilterStringBasicArrayList(This, FilterStringBasicArrayList) ->
        put({This, filterStringBasicArrayList}, FilterStringBasicArrayList).

visit(This, File, FileNameString) when (is_list(FileNameString) orelse FileNameString =:= undefined) ->
        false.

