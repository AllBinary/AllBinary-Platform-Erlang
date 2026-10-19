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
% package org.allbinary.logic.visual.dhtml.style.css
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.w3c.dom.Node

-module('CssElementsValidationFactory').
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

% throws Exception
getInstance(CssElementStyleNodeList) ->
        Styles = 'BasicArrayListD':new(),
        Size = (get({CssElementStyleNodeList, '$class'})):size(CssElementStyleNodeList),
        put({local, cssElementStyleNode}, undefined),
        put({local, cssValidationInterface}, undefined),
        lists:foreach(fun(Index) ->
            put({local, cssElementStyleNode}, (get({CssElementStyleNodeList, '$class'})):get(CssElementStyleNodeList, Index)),
            put({local, cssValidationInterface}, 'CssElementValidationFactory':getInstance(get({local, cssElementStyleNode}))),
            (get({Styles, '$class'})):add(Styles, get({local, cssValidationInterface}))
        end, lists:seq(0, Size - 1)),
        Styles;
getInstance(HashMap) ->
        Styles = 'BasicArrayListD':new(),
        Styles.


