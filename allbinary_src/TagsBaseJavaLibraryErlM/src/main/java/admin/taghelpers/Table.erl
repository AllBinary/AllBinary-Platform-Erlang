% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package admin.taghelpers
% import org.allbinary.string.CommonStrings

-module('Table').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
drop(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
create(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
restore(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
backup(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
insert(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
delete(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
update(This) ->
        erlang:error({'RuntimeException'}).

