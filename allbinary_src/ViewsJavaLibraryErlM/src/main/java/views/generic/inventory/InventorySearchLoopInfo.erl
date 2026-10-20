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
% package views.generic.inventory
% import org.allbinary.logic.string.StringMaker

-module('InventorySearchLoopInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, lastPage}, (-1)),
    put({This, currentPage}, (-1)),
    put({This, numberOfResultsOnCurrentPage}, 0),
    put({This, numberOfResults}, 0),
    put({This, 'CURRENT'}, "current: "),
    put({This, 'NUM'}, " num: "),
    put({This, 'LAST'}, " last: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'CURRENT'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, currentPage})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'NUM'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, numberOfResults})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LAST'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, lastPage})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

