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
% package org.allbinary.logic.visual.dhtml.html
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.logic.StdUtil

-module('HtmlTags').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, htmlTagVector}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, htmlTagVector}, 'BasicArrayListD':new()).

get(This, Index) when is_integer(Index) ->
        (get({get({This, htmlTagVector}), '$class'})):get(get({This, htmlTagVector}), Index).

add(This, HtmlTag) ->
        (get({get({This, htmlTagVector}), '$class'})):add(get({This, htmlTagVector}), HtmlTag).

size(This) ->
        (get({get({This, htmlTagVector}), '$class'})):size(get({This, htmlTagVector})).

