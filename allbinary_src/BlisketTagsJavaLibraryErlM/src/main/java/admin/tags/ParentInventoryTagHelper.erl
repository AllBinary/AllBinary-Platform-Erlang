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
% package admin.tags
% import javax.servlet.jsp.tagext.Tag
% import org.allbinary.logic.string.StringMaker

-module('ParentInventoryTagHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ParentInventoryTagHelper':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ParentInventoryTagHelper', instance}).

% throws Exception
isValid(This, TagClass, ParentTag) ->
        case (ParentTag =:= undefined) of
            true ->
            erlang:error({'Exception', "Must have parent tag."});
            false ->
            case (not (allbinary_java:instance_of(ParentTag, 'HelperTag'))) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Must have at least a "),
            (get({StringBuffer, '$class'})):append(StringBuffer, "tags.HelperTag"),
            (get({StringBuffer, '$class'})):append(StringBuffer, " as parent"),
            (get({StringBuffer, '$class'})):append(StringBuffer, "and not: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, atom_to_list(get({ParentTag, '$class'}))),
            erlang:error({'Exception', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false -> ok
        end
        end.

