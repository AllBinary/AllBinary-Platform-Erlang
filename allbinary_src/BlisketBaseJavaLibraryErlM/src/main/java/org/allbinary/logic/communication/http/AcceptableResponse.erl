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
% package org.allbinary.logic.communication.http
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('AcceptableResponse').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new(Candidate, TagName, Index) when (is_list(Candidate) orelse Candidate =:= undefined), (is_list(TagName) orelse TagName =:= undefined), is_integer(Index) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Candidate, TagName, Index),
    This.

init(This, Candidate, TagName, Index) when (is_list(Candidate) orelse Candidate =:= undefined), (is_list(TagName) orelse TagName =:= undefined), is_integer(Index) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), TagName, This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        AcceptableResponseUtil = 'AcceptableResponseUtil':getInstance(),
        (get({get({AcceptableResponseUtil, candidateVector}), '$class'})):addAt(get({AcceptableResponseUtil, candidateVector}), Index, Candidate),
        (get({get({AcceptableResponseUtil, tagNameVector}), '$class'})):addAt(get({AcceptableResponseUtil, tagNameVector}), Index, TagName).

